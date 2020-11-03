<%@page import="java.io.File"%>
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
	
	
	String fname = request.getParameter("f_name");
	String path2 = cpath +"/"+ fname;

	File mkfolder = new File(path2);
	boolean suc = mkfolder.delete();
	
	if(suc){
	response.sendRedirect("myDisk.jsp?cPath="+nowfolder);
	}
	else{
	response.sendRedirect("myDisk.jsp?cPath="+nowfolder);	
	}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>