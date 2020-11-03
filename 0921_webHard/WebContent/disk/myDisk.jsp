<%@page import="mybatis.vo.EditVO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!-- 용량을 계산해주는 기능이 필요 
    폴더안의 폴더안에 있을 수 있기에 재귀호출로 계산해야한다.
    
    -->
    <%!//선언문 멤버 변수 또는 멤버메서드를 정의할 때 사용한다.
    
    //개인이 사용한 용량을 측정하는 메서드
    //file은 파일만 용량을 얻을 수 있으며, 폴더는 용량을 구하지 못합니다.
    //그안에 존재하는 파일들의 용량을 모두 더해서 표현한다. 재귀호출을 사용한다
    public int useSize(File f){
    	//인자로 전달된 f는 폴더여야한다. 이 폴더의 하위요소들의 파일 용량을 모두 더해서 반환하도록한다
    	
    	//폴더안의 모든 하위요소들을 얻어낸다.
    	//f.list() string[]로 파일의 이름을 뱉어낸다
    	File[] list = f.listFiles(); //반환형은 파일타입의 배열이다. 그 값을 이용하려면 이를 이용한다
    	int size = 0;
    	
    	//하위요소들 중 파일이 아닌 것들은 폴더라는 의미 -> useSize를 다시 호출하자
    	for(File sf : list){
    		if(sf.isFile()){ //isdirectory도 있다.
    			//list() 파일 객체는 안에있는 파일의 이름을 모두 담아서 반환한다., 단 파일은 null값이 나온다. is direc하고 사용하자
    			//listfiles 안에 있는 것들을 파일객체로 만들어서 준다.
    			size += sf.length();//파일일 경우 용량을 size에 누적시킨다.
    		}
    		else
    			size += useSize(sf);//폴더일경우 재귀호출 
    		
    	}
    	return size;
    	
    	
    	
    }
    
    //여기가 선언문의 끝이다. 이건 한번만 수행한다. init와 동격%>
    

    
    <%
            	int totalSize = 1024*1024*10; //10MByte; 1024하면 giga byte
                int useSize = 0;
                
                //현재 페이지는 무조건 로그인이 되어있어야 사용할 수 있는 페이지입니다.
                //로그인 여부를 확인해야한다.
                
                Object obj = session.getAttribute("uvo");
                if(obj != null){
                	//로그인이 되어있다. html 끝까지 실행
                	
                	
            	request.setCharacterEncoding("utf-8");
                	
                	//현재 위치값 cPath를 받는다.
                	String dir = request.getParameter("cPath"); //만약에 이런 파라미터가 없다면 test/t1들어가야한다.
                	//null 값이 아니고 있다면 사용자가 있었던 위치값이 넘어온다. /test1/ 선택한 파일값은 fname에서 받는다.
                	
                	//처음 들어왔을 때는 cpath가 null이였다. 그래서 아래에서 if로 id값을 부여
                	//지금은 else를 이용해서 null이 아니니까 폴더 위치를 직접 지정해주자.
                	
                	//만약에 이런 파라미터가 없다면?? dir에는 null값이 저장된다.
                	//사용자가 폴더를 선택할 경우라면 f_name이라는 파라미터도 들어온다
                	String fname = request.getParameter("f_name"); //눌렀다면 t1들어올 것이다
                	
                	//로그인한 회원의 아이디를 얻어오기 위해서 obj를 memVO로 형변환시킨다
                	EditVO mvo = (EditVO)obj;
                	
                	//절대 경로를 하나 만들어야하는데, 로그인한 회원의 id로 된 폴더를 절대 경로화시켜서 저장할 곳
                	String path = null; //==홈디렉토리를 저장할 곳
                	
                	if(dir == null){
                		path = application.getRealPath("/members/"+mvo.getM_id());//절대경로 얻어냄
                		//이걸로 파일 객체를 만들어야한다. 위의 내용은 폴더이다.
                		useSize = useSize(new File(path));
                		//사용용량 측정
                		
                		//현재 위치를 사용자의 id로 설정하고 싶다.
                		dir = mvo.getM_id();
                		
                		
                		
                	}
                	else{
                		//사용자가 특정 폴더를 클릭했을 때 수행하는 부분
                		//(3)절대 경로를 가져오고 출력한다. 파일 객체를 만들어야한다.
                		if(fname != null && fname.trim().length() > 0){
                			dir = dir + "/" +fname; //test1/t1 이런 형식으로 된다.
                		}
                		
                		path = application.getRealPath("/members/"+dir);
                		
                		    		
                	}
                	
                	
                	session.setAttribute("cPath", dir);
            %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 600px;
		border: 1px solid #27a;
		border-collapse: collapse;
	}
	table th, table td{
		border: 1px solid #27a;
		padding: 4px;
	}
	table th{ background-color: #bcbcbc; }
	.title { background-color: #bcbcbc; width: 25%; }
	
	.btn{
		display: inline-block;
		width: 70px;
		height: 20px;
		text-align: center;
		padding:0px;	
		margin-right: 20px;	
	}
	.btn a{
		display: block;
		width: 100%;
		padding: 4px;
		height: 20px;
		line-height: 20px;
		background: #27a;
		color: #fff;
		border-radius: 3px;
		text-decoration: none;
		font-size: 12px;
		font-weight: bold;
	}
	.btn a:hover{
		background: #fff;
		color: #27a;
		border: 1px solid #27a;
	}
	
	#f_win{
		width: 220px;
		height: 80px;
		padding: 20px;
		border: 1px solid #27a;
		border-radius: 8px;
		background-color: #efefef;
		text-align: center;
		position: absolute;
		top: 150px;
		left: 250px;
		display: none;
	}
	#f_windel{
		width: 220px;
		height: 80px;
		padding: 20px;
		border: 1px solid #27a;
		border-radius: 8px;
		background-color: #efefef;
		text-align: center;
		position: absolute;
		top: 150px;
		left: 250px;
		display: none;
	}
	#f_win2{
		width: 300px;
		height: 80px;
		padding: 20px;
		border: 1px solid #27a;
		border-radius: 8px;
		background-color: #efefef;
		text-align: center;
		position: absolute;
		top: 150px;
		left: 250px;
		display: none;
	}
</style>
</head>
<body>
	<h1>My Disk service</h1>
	
	<hr/><%=mvo.getM_name() %>
	(<span class="m_id"><%=mvo.getM_id()%></span>)님의 디스크
	&nbsp;[<a href="javascript:home()">Home</a>]
	<hr/>
	
	<table summary="사용량을 표시하는 테이블">
		<tbody>
			<tr>
				<th class="title">전체용량</th>
				<td><%=totalSize/1024 %>KB</td>
			</tr>
			<tr>
				<th class="title">사용량</th>
				<td><%=useSize/1024 %>KB</td>
			</tr>
			<tr>
				<th class="title">남은용량</th>
				<td><%=(totalSize-useSize)/1024%>KB</td>
			</tr>
		</tbody>
	</table>
	<hr/>
		<div id="btn_area">
			<p class="btn">
				<a href="javascript:selectFile()">
					파일올리기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:makeFolder()">
				
					폴더생성
				</a>
			</p>
			<p class="btn">
				<a href="javascript:exe()">
					파일생성
				</a>
			</p>
			<p class="btn">
				<a href="javascript:del2Folder()">
					폴더삭제
				</a>
			</p>
		</div>		
	<hr/>
	
	<label for="dir">현재위치:</label>
	<span id="dir"><%=dir %></span>
	
	<table summary="폴더의 내용을 표현하는 테이블">
		<colgroup>
			<col width="50px"/>
			<col width="*"/>
			<col width="80px"/>
		</colgroup>
		<thead>
			<tr>
				<th>구분</th>
				<th>폴더 및 파일명</th>
				<th>삭제여부</th>
			</tr>
		</thead>
		<tbody>
	
					<%
						
					/* 	int index = dir.lastIndexOf("/");
						String up_path = dir.substring(0,index); */
					
						if(!dir.equals(mvo.getM_id())){ //다르다면 적용하자.
							//(0923)(4)dir 값과 현 사용자 id가 다를 경우만 상위로를 주세요
							//ID: test1 , dir : test1/t1/abc 다를 수 밖에 없다.
							
							//dir에 마지막에 존재하는 /의 위치값을 찾아내어
							//맨 앞에서부터 찾아낸 / 전까지만 잘라낸다. 그러니까 +1하지말자
							int idx = dir.lastIndexOf("/"); //if 통과했으면 무조건 하위폴더니까 반드시 조냊한다.
							/* if(idx != -1){ *///dir에 /가 없으면 -1이 나오고 0~ -1로 자르니 에러가난다.
							String up_path = dir.substring(0,idx); //test1/t1이렇게 얻어진다. 뒤에가 잘린다.
							/* } *///이 에러가 mydist.jsp.java->서블릿으로 변경되니까 356줄이 나오는 데 매칭이 안되니 에러 못잡는다 이걸 해결하자
							//경로를 찾아간다. work- meta-플러그인 - server.core - tmp1 - work - calrina == 톰캣을 의미 - 계속들어가면 java파일이 나오고 이게 서블릿
							//여기서 위의 에러내용을 찾아가서 잡는다.
							
					%>
		
			<tr>
				<td>↑</td>
				<td colspan="2">
				
					<a href="javascript:goUp('<%=up_path%>')"> <%-- <%=up_path%> --%>
					
					<!-- 0923(1)	상위로... : 현재 위치가 그사람의 폴더가 아닐때만 나와주면 된다 	 
					여기서 다시 돌아가려면 test1/test일때 /문자열을 찾아서 뒤를 다 잘라서 c_path를 만들어서
					함수를 호출한다 go up(c_path)이든 뭐든 , 그리고 다시 jsp 를 다시 호출한다.
					함수내용 : ff에 cpath라는 얘의 발류를 c_path로하고
					jsp 옮기고 , 서브밋하면 재호출이 될 것이다
					-->
					상위로
					</a>
				</td>
				
			</tr>
			<%} 
			//0923(2) 1현재위치 dir을 가지고 절대 경로를 얻어낸다. 현재 위치는 폴더이다.
			
			// 1. 파일 객체 만들자. 절대경로 /까지가 Wencontetns이다.
			String c_path = application.getRealPath("/members/"+dir); //현재폴더 dir
			//위에거는 안해도된다 그냥 dir 써도 되는 것이었다 , 폴더 클릭시 어떻게 보낼 것인가?
			
					//파일과 폴더를 객체화시킬  수 있는  File객체, isfile? directory?, 파일 용량, 디렉토리는 용량 불가
					//폴더는 안의 하위요소를 모두 얻어낼 수 있다. 그다음은 inputstream,output
			
			//2그걸 파일 객체로 얻어내서 그안에 있는 하위 파일과 폴더를 얻어내려고한다.
			File s_file = new File(c_path);
			
					//File 객체로 받으면 directory인지를 판단하여 하위 내용을 모두 가져올 수 있다.
			//3 하위요소들을 얻어내어 출력한다. 이름만 원한다면 String 형 배열
			//String[] names = s_file.list();//이름이 쭉나온다, 파일/폴더 구분 불가.
					
			File[] sub_list = s_file.listFiles();
			
			for(File f : sub_list){ //표로 표현하자
			%>

			<tr>
				<td>
						<!-- 폴더인지 파일인지 구분하자 -->
						<% if(f.isFile()){ %>
						<img src="../images/file.png"/>
						<% }else{ //아니면 폴더%> 
						<img src="../images/folder.png"/>
						<%} %>
				</td>
				<td>
					<% if(f.isDirectory()){ //0923(3)클릭시 현재 위치 바뀌고 t1의 내용이 보여야한다. %>
					
					<!-- 사용자가 폴더명을 클릭할 때마다 폴더명을 gogo라는 함수를 호풀하면서 인자로 전달 -->
					<a href="javascript: gogo('<%=f.getName()%>')"> 
					<!-- 't1'이러면 폴더 이름으로 넣었는 데 프로그램은 변수라고 느낀다. 
					위처럼 해야 각 폴더명이 gogo라는 함수로 전달된다.
					함수 기능 : 변경된 dir을 가지고 현재 jsp를 다시 호출하는 것
					
					사용자가 클릭한 폴더명은 f_name에 현 폴더는 cpath에 이를 가지고 재호출
					재호출되면 이 변수가 dir에 들어가고 fname에 들어간다. 이 둘을 더하면 원하는 위치가 된다
					dir != 일때를 위를 더해서 처리한다. 그리고 path를 바꾼다. -> C:/.../webcon/mem/asd/asd1
					이제 이걸가지고 파일객체를 만들 것이다.
					-->
					
						<%=f.getName()%><!-- //폴더든 파일이든 이름을 가져와라 -->
					</a>
					<% }else{ //파일일 경우네는 다운로드 기능을 지원한다. %>
					<a href="javascript:down('<%=f.getName()%>')">
					<!-- 파일일 경우에만 다운로드할 수 있도록 -->
						<%=f.getName()%>
					</a>
					<% } %>
				</td>
				<td></td>
			</tr>
			
			<%} %>

		</tbody>
	</table>
	
	<form name="ff" method="post">
		<input type="hidden" name="f_name"/>
		<input type="hidden" name="cPath" value="<%=dir%>"/> <!-- fname은 gogo함수에서 대입함 -->
	</form>
	
	
	<div id="f_win">
		<form action="makeFolder.jsp" method="post" name="frm">
			<input type = "hidden" name ="nowfolder" value = <%=dir%>/>
			<input type="hidden" name="cPath" value = "<%=path%>"/> <%-- value="<%= %>" --%>
			<!-- 폴더 이름을 줘서 전체경로랑 합치고 만들자
			파일 객체에 전체경로를 넣고 해당 폴더를 만들자. 
			 -->
			<label for="f_name">폴더명:</label>
			<input type="text" id="f_name" name="f_name"/><br/>
			<p class="btn">
				<a href="javascript:newFolder()">
					만들기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:closeWin()">
					닫 기
				</a>
			</p>
		</form>
	</div>
	
	<div id="f_windel">
		<form action="delFolder.jsp" method="post" name="frmdel">
			<input type = "hidden" name ="nowfolder" value = <%=dir%>/>
			<input type="hidden" name="cPath" value = "<%=path%>"/> <%-- value="<%= %>" --%>
			<!-- 폴더 이름을 줘서 전체경로랑 합치고 만들자
			파일 객체에 전체경로를 넣고 해당 폴더를 만들자. 
			 -->
			<label for="f_name">폴더명:</label>
			<input type="text" id="f_name" name="f_name"/><br/>
			<p class="btn">
				<a href="javascript:delFolder()">
					삭제하기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:closeWindel()">
					닫 기
				</a>
			</p>
		</form>
	</div>
	
	
	
	
	

	<div id="f_win2">
	<!-- (4)form 안에 enctype이 있다. 웹상에서 파일을 첨부되는 form은 부조건 enctype...를 넣어줘야한다. 
		안넣으면 파일이 안올라간다.
		받을 때는 request.getpara로는 못받는다.
		MultipartRequest로만 받아야한다. 실무에서는 라이브러리를 사용합니다.
		servlets.com
		왼쪽에 COS File Upload Library
		class MultipartRequest
		있는 지 확인하고
		cos-20.08.zip 다운로드 압축풀기
		
		
	 -->
	
		<form action="upload.jsp" method="post" name="frm2"
		enctype="multipart/form-data">
		
			<input type="hidden" name = "dir" value = "<%=dir%>"/> <!-- 0924(2)업로드에서 이걸 동시에 못받지만 안되는 걸 확인해보자 
			멀티파트 데이터로만 받을 수 있다(파일이름같은). 위에 있는 정보만 받을 수 있다.-->
			<label for="selectFile">첨부파일:</label>
			
			<input type="file" id="selectFile" 
				name="upload"/><br/>
				
			<p class="btn">
				<a href="javascript:upload()">
					보내기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:closeWin2()">
					닫 기
				</a>
			</p>
		</form>
	</div>
	
	<script type="text/javascript">
		function home(){
			parent.location.href="../main.jsp";
		}
		
		function gogo(fname){
			//현재 문서(document)에
			// 이름이 ff인 form객체를 검색한다. name 이 ff인, hidden name이 존재한다
			//여기가서 해주자 line 322
			// 검색된 form객체 안에 이름이 fname인 요소 로출
			//action으로 이동한다. myDisk.jsp로 fname과  cPath = dir넘어간다
			//값으로 인자로 받은 폴더명을 넣어준다. 
		/* 	alert(fname); */
			document.ff.f_name.value = fname;
			document.ff.action = "myDisk.jsp";
			document.ff.submit();
			
		}
		
		function goUp(upPath){
		/* 	alert(upPath); */
			document.ff.cPath.value = upPath;
		//넘어온 uppath를 cpath에 넘겨준다. 
		//에러 발생 코드 ff.f_name.value으로 하니 에러가 났다. 
		//goup에서는 fname에서 값을 안넣다. null이다. 
		//input type="hidden" name="cPath" value==dir" 이렇게 들어가있는 곳에 dir 경로를 바꿔야 바뀐다.
		//그러면 f_name? 에 값을 안줬으니 null이 가고 없으니 바로 dir의 주소를 realpath 와 합쳐 path에 저장한다.
		//dir은 현재 위치 dir은 가 넘겨준 값 <dir>출력해주었다. 현재위치
		//dir을 가지고 전체 경로 path를 가지고 File객체를 생성했었다.
		//dir이 현재 위치기 때문에 그안의 내용을 표현하려고 dir도 같이 가져가야한다. 
		//sub_list 로 File객체의 하위 얻기
				
		//에러 : f_name에 넣었으면 값이 있으니까 dir에 다시 f_name의 값을 dir에 더할 것이다
		//현재는 /asd/asd1인데 여기세 + / + "asd1"이니까 /asd/asd1/asd1 이경로가 없으니까 file 없다는 에러가 나오는 것
	
		
		
			document.ff.action = "myDisk.jsp";
			document.ff.submit();
			
			/*전체 순서도
			1) cPath 라는 파라미터 받기 상위 폴더거나 거기서 부터의 경로
			2) f_nmae 얻기
			3) dir이 null인지? 그러면 m_id를 dir에 넣어준다
			4) dir 가지고 절대 경로화 path 만들기
			5) File 객체 생성(dir도 가지고)
			6) File 객체의 하위 얻기 sub_list -> listfile()
			7) sublist 출력
			
			gogo(t1)
			1) document.ff.f_name.value = t1;
			hidden 처리된 f_name에 t1 넣었다.(f_name null 판별 있으면 dir에 붙인다 없으면, 안붙인다
					그렇게 가공된 dir이 다시 cpath로 들어간다. goup에서는 null이다. dir만 값을 받는다.) , 
			cPath -> 여기는 이미 <퍼센트=dir>이라고 넣어져있다. 그안에는 현재 폴더 test1이라고 써져있다. 
			dir null 판별을 받은 값으로 request (cPath) 로 받고 널값이 아니면 폴더 위의 경로를 붙여준다
			goup에서는 받은 값이 있으니 이 값을 넣어준다. fname을 받아 하위로 내려가준다.
			
			2) 재호출 3) 제출
			
			
			
			*/
		}
		
		function makeFolder(){
			document.getElementById("f_win").style.display = "block";
			//f_win을 찾아주세요 . 그걸 보여주세요
		}
		function closeWin(){
			document.getElementById("f_win").style.display = "none";
		}
		function closeWindel(){
				document.getElementById("f_windel").style.display = "none";
		}
		
		function newFolder(){
			//사용자가 새로 만들 폴더명을 입력했는지 판단하자!
			var str = document.frm.f_name.value;
			
			//정규표현식을 이용한 공백제거 작업
			
			if(str.trim().length < 1){
				alert("폴더명을 입력하세요");
				document.frm.f_name.focus();
				return;
			}
			
			document.frm.submit();//서버로 보낸다.(makeFolder.jsp)
		}
		
			function del2Folder(){
						document.getElementById("f_windel").style.display = "block";
						//f_win을 찾아주세요 . 그걸 보여주세요
			}
			function delFolder(){
				//사용자가 새로 만들 폴더명을 입력했는지 판단하자!
				var str = document.frmdel.f_name.value;
				
				//정규표현식을 이용한 공백제거 작업
				
				if(str.trim().length < 1){
					alert("삭제할 폴더명을 입력하세요");
					document.frmdel.f_name.focus();
					return;
				}
				
				document.frmdel.submit();//서버로 보낸다.(makeFolder.jsp)
			}
		
		
		
		function selectFile(){			
			//숨겨져 있던 div를 보여준다.
			document.getElementById("f_win2").style.display = "block";
		}
		
		function upload(){
			//선택된 파일의 값을 가져오자!
			var select_f = document.frm2.upload.value;
			//document.frm2.upload.value = "test.txt";
			//위는 input type="file" 에서는 절대 허용되지 않는다.
			//이유는 보안문제에 걸려 브라우저에서 막아뒀다.
			
			//alert(select_f);
			if(select_f.trim().length < 1){
				alert("파일을 선택하세요!");
				return;
			}
			document.frm2.submit();
		}
		function closeWin2(){
			document.getElementById("f_win2").style.display = "none";
		}
		
		function down(fname){ //588line
			//인자로 넘어온 파일명을 현재문서(document)에
			//"ff"라는 폼안에 f_name이라는 이름을 가진 요소의
			//value값으로 지정해야 한다.
			document.ff.f_name.value = fname;
			// cPath도 같이 있는 폼의 action을 변경하자!
			document.ff.action = "download.jsp";
			
			document.ff.submit();
			
			document.ff.f_name.value = "";//돌아올 때 파일명이 있어서, 혹시 몰라서 공백 지정
					//오류가 발생할 수 있어서 삭제함!
		}
		
		function exe(){
			//현재 문서에 이름이 ff인 폼객체의 action을
			// newFile.jsp로 변경하자!
			document.ff.action = "newFile.jsp";
			document.ff.submit();
		}
	</script>
</body>
</html>

<%
}else{
%>
<script>
	top.location.href = "../index.jsp" //지금 폴더가 disk에 있기 때문에 
	//http://localhost:8080/0921_webHard/disk/myDisk.jsp
	//창에 로그인하지 않고 이렇게 쓰면 이렇게 된다.
</script>
<%
}
%>





    