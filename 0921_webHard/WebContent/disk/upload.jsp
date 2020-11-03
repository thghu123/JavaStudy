<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <%
  
  String dir = (String)session.getAttribute("cPath");
  request.setCharacterEncoding("utf-8");//이건 적용된다.
  String path = application.getRealPath("/members/"+dir);//"members/asd"를 이렇게 바꾸면 항상 최상위에 저장되는 것을 방지할 수 있다.
  //멀티파트 리퀘스트는 넘어옴과 동시에 저장한다. 고로 이미 test1/t1의 값을 알 고 있어야한다.
  
  //단 2개가 동시에 넘어가면 동기적으로 안된다. 고로 dir과 file을 동시에 보내면 안된다.넘어감과 동시에 생성하기 때문이다 
  //dir은 아무 때나 세션에 저장해서 쓰면된다. mr 생성전 세션에서 dir을 얻어내면된다.
  //사용자가 저장위치를 바꾸기에 필요한 기능이다. 단 게시판은 고정위치에 고정하기에 dir 줄 필요가 없다.
  

  
  
//  new MultipartRequest(request,path,1024*1024*5,new DefaultFileRenamePolicy());
  
  MultipartRequest mr = new MultipartRequest(request,path,1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
  
  //1024*1024*5 용량 허용범위를 1024...로 지정해준다., DefaultFileRenamePolicy 저장하려는 파일명과 동일한 파일명이 있다면 이름을 알아서 바꿔준다.
  
  /* String epath = request.getParameter("dir"); *///안넘어왔는 데 넘어왔다고 생각한다. 멀티타입이기때문에
  String epath = mr.getParameter("dir"); //대신 mr이 받아왔기때문에 가져올 수 있다.
  System.out.print(epath); //이제야 콘솔에 출력된다. 
  //하지만 매번 mr생성 후 dir 선언 보다는 Httpsession에 현재 위치값을 저장해두는 이유이다. mydisk의 처음 dir 수정부에 작성 약 line70
  //upload. jsp에서 펄티파트리퀘스트가 생성되기 전에 파일을 저장할 현재 위치값을 파라미터로 받아서는 안된다. 파라미터로 받지않고 현재 위치값 얻는다.
  //이유는 mr로 받아도 mr 생성할 때 만들어지는 데 만들어지고 나서 dir을 받으면 아무 의미없다.
  
  //session.setAttribute("cPath", dir);을 103line에 추가한다.
  
/*   업로드 하고 싶으면 enttype~~~를 form에 적어줘야한다. mulrequest 있는 압축.zip 해제 하고 jar 파일 lib안에 넣었다.
	그 다음에는 객체만 생성을 했다.
	
	요청되서 업로드 페이지가 뜨면 이미 처리는 끝났다. path는 저장될 위치이다. 해당 패스를 2번째 인자로 준다
	어떤 파일을 저장해야할 지 알고, 어디에 저장해야할지도 안다.
	
	(1)첨부된 파일의 이름을 DB에 저장하려면 여기서 저장된 파일 명을 알아내야한다.-> 파일 객체 얻어낸다
	
*/
	//멀티 파트 리퀘스트가 파일을 저장했다. 그걸 가져오자
	File f = mr.getFile("upload"); //파일을 여러개도 올리는 데 어떤파일? 파일 선택하는 input tag가 보낼 때 선택한 파일을 준다. 파라미터 이름은 upload
  	//upload 라는 name으로 저장 시킨 파일의 정보를 준다
  	String new_name = f.getName(); //변경된 이름 나옴
  	
  	//첨부파일이 저장될 때는 이름이 바뀔 수 있다. 변경되기 전의 이름을 알아내야한다. 변경된 이름은 f가 알고있다
  	String ori_name = mr.getOriginalFileName("upload");
  	
  	if(f!=null){
  	System.out.println("현재파일명:"+new_name+"옛 파일명:"+ori_name);
  	}
  	
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload = "exe()"> <!-- 바디 태그를 전부 읽고 나면이라는 뜻 == 다 준비되었다면-->


<form action = "myDisk.jsp" method ="post" name = "f1">
<input type = "hidden" name = "cPath" value="<%=dir%>"/> <!-- asd 자기 이름이여야만 한다. -->
	
	
</form>
<script type="text/javascript">
function exe(){
	/* document.forms[0].submit(); */
	document.f1.submit();
	//클라이언트 단에서 먼저 움직이는 게 바람직하다
	//이제 업로드하자.
}

</script>


</body>
</html>