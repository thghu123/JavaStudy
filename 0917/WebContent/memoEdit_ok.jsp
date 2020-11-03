<%@page import="mybatic.dao.MemoDAO"%>
<%@page import="mybatis.vo.MemoVO"%>

<%@page import="java.util.List"%>

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
	List<MemoVO> mem = MemoDAO.getList();


	request.setCharacterEncoding("utf-8");
	response.setContentType("html/text; charat = utf-8");
	
	String ip= request.getParameter("ip");
	String content= request.getParameter("content");
	String writer= request.getParameter("writer");
	String idx = request.getParameter("w_idx");
	
	
	
	MemoDAO.updat(ip,content,writer,idx);
	
	
	response.sendRedirect("memoList.jsp");
	//response.sendRedirect("memoSearch.jsp");
%>

</body>
</html>