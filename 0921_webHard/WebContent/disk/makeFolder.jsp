<%@page import="java.io.File"%>
<%@page import="mybatis.vo.EditVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* 힌글처리
경로 2개 받고 cpath 랑 앞의 경로
request
전체 경로
file 객체 생성
mkdirs()생성
sendredi
form 에 값이 잘 들어가는 지 확인하자

 */
 
 	request.setCharacterEncoding("utf-8"); 
	String cpath = request.getParameter("cPath");
	String nowfolder = request.getParameter("nowfolder"); //히든으로 숨겨서 받는다.
	int idx = cpath.lastIndexOf("/");
/* 	
	cpath에 내가 한것처럼 전체 경로 말고 올바른 현제 경로 dir만 받고
	path = application.getRealPath("/members/"+cpath+"/"+fname);
	 */
	
	String fname = request.getParameter("f_name");
	String path2 = cpath +"/"+ fname;

	File mkfolder = new File(path2);
	mkfolder.mkdirs();
	
	
	//response.sendRedirect("myDisk.jsp?cPath="+nowfolder);
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload = "exe()"> <!-- 바디 태그를 전부 읽고 나면이라는 뜻 == 다 준비되었다면-->


<form action = "myDisk.jsp" method ="post" name = "f1">
	<input type = "hidden" name = "cPath" value="<%=nowfolder%>">
	
	
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