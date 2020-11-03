<%@page import="mybatic.dao.MemoDAO"%>
<%@page import="mybatis.vo.MemoVO"%>
<%@page import="java.util.List"%>
<%@page import="mybatic.dao.MemoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("html/text; charat = utf-8");
	
	String idx= request.getParameter("delnum");

	
	MemoDAO.del(idx);
	
	
	response.sendRedirect("memoList.jsp");
	//response.sendRedirect("memoSearch.jsp");
%>

</body>
</html>