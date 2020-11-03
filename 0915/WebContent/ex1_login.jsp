<%@page import="am.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
	.box{
	width : 180px;
	border : 1px solid black;
	padding : 5px 3px;
	text-align: right;
	
	
	}
	
	#s_id,#s_pw{
	margin-bottom: 6px;
	padding : 4px;
	width : 90px;
	border : 1px solid #cdcdcd;
	
	
	
	}

	
	/* 로그인 했냐 안했냐 의 식별 jsp는 이미 session이있다.
	id와 pw가 맞다고 치고, session 에 UVO이름으로 VO가 저장되있다.
	uvo가 있다 없다로 판단할 수 있다. 넣어줘야할 곳에 넣어주면 된다.
	 */
	 <%--  실패 바디로 가자
	<%
	try{
	Object vo2 = request.getParameter("uvo");
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	
	if(!(vo2.equals(null))){
		
	%>
	
	.box:first-child{
		display:none;
	}
	
	<%

	}
	
	else{
		%>
		.box:last-child{
		display:none;
		}
		<%
	
	
	}

	
	%>
 --%>
	
	
</style>
</head>
<body>
	<% 
	//세션으로 부터 uvo라는 이름의 저장된 값을 얻어낸다. session에선 모든 객체 저장이 가능
	//고로 자바는 통칭해서(뭐가 나올 지 모르기 때문이다) 무조건 object로 반환한다.
	Object obj = session.getAttribute("uvo");
	
	/* MemVO vo = (MemVO)session.getAttribute("uvo"); 
	이코드는 어떤일이 있어도 세션에 uvo가 저장되어있을 때 쓰는 것이다. 
	속도가 너무 늦기에 casting을 안하는 게 좋다. instance 전체를 검색하기에 casting이 속도 저하에 주범
	그래서 제네릭 타입이 나온 것이다.
	*/
	if(obj == null){

	%>
	<div class = box>
		
		<form action="ex1_login_ok.jsp" method = "post">
		
		<label for = "s_id">ID: </label>
		<input id = "s_id" name = "id"/><br/>
		
		<label for = "s_pw">PW: </label>
		<input type = "password" id = "s_pw" name = "pw"/><br/>
		
		<input type = "button" value = "로그인" onclick="login(this.form)"/>		
		<!-- 실행하러갈때 현재 폼을 전달하면 한결 script function 쉬워진다. 
		this는 자기 자신으로 button 객체를 의미, .form은 button이 포함된 form을 의미
		-->
		</form>
	</div>
	
	<%}else{ %>
	
	<div class = "box">
		<% 
		
		 MemVO mvo = (MemVO)session.getAttribute("uvo");  
		//이건 지역변수있다.
		
		%>
		
		 <pre> <%= mvo.getId() %>야 책상이 더럽다</pre> 
		
		<!-- 확실히 있을 경우에는 casting으로 이를 찍어내자 
		형변환을 해야 memVo에 있는 getname을 호출해서 이름을 받아낸다.-->

		<input type = "button" value = "LOGOUT" onclick = "logout()"/>
		
	</div>
	<%
	}
	%>



	<script>
	function login(frm) { //자료형이 없어서 그냥 받는다. 해당폼이 들어온다
		//id와 pw를 입력했는 지 판단하는 유효성 검사
		/* 		
 		var id = document.getElementById("s_id");
		var pw = document.getElementById("s_pw"); //조금 뒤 j quary로 변경예정
		 */
		var id = frm.id; //권장하지 x
		var pw = frm.pw; //폼객체 아이들 중 이름 name이 pw인 걸 가져오는 것 == 간단
		
		
		if(!id.value || (id.value.trim().length<1)){ //value 없다면 
			//실전에서는 !id.value 쓰지 않는 데 input tag는 기본 "" value 존재하기에 
		alert("ID 입력하세요");
		id.value = "";//입력, 공백값 삭제
		id.focus();
		return;
		}

		if(!pw.value || pw.value.trim().length<1){ //value 없다면 , 공백만 치지는 않았는지
		alert("PW 입력하세요");
		pw.value = "";
		pw.focus();
		return;
		}
		
		frm.submit();
		
		
	}
	
	
	function logout(){
		 location.href = "logout.jsp"; 
		<%-- <%response.sendRedirect("ex1_logout.jsp");%> --%>
		
		
		
		
	}
	
	
	</script>


</body>
</html>