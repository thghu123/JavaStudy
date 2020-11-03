<%@page import="mybatis.vo.MemoVO"%>
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

<%-- <%!String idx = "1";%> --%>
<%
	request.setCharacterEncoding("utf-8");
response.setContentType("html/text; charat = utf-8");
/* 
	List<MemoVO> mem = MemoDAO.getList(); */
/* 	String idx_s = mem.get(0).getIdx(); */
/* 	int idx_n = Integer.parseInt(idx_s);
	 */
	//String idx = "1";
	
/* 	if(idx_n>1){
		
		idx = String.valueOf(idx_n+1);
	 	System.out.print(idx+","+idx_n); 
	}
	 */
	
	String ip= request.getParameter("ip");
	String content= request.getParameter("content");
	String writer= request.getParameter("writer");

	MemoDAO.add(content, writer, ip);
	
	
	
/*  	int i = Integer.parseInt(idx) + 1; */
	/* idx = String.valueOf(i); */ 

	response.sendRedirect("memoList.jsp");
%>

</body>
</html>