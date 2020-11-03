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
	//파라미터를 받기 전 요청 시 한글 처리는 무조건 해야한다.
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");
	//jsp에서 request는 내장 객체이다. 이미 준비되어있는 객체이다. responce도 마찬가지
	//request, response, out(여기선 내장 객체, printWriter),session(httpsession)...이미 존재
	
	//파라미터 받는 것을 스트립트 릿에서 실행 중
	String[] names = request.getParameterValues("s_name");
	
/* 	for(int i =0; i<names.length;i++){ */
	for(String n : names){ //우측에 배열 혹은 리스트 구조
		
		//out.println("<h2>"+n+"<h2>"); //내장 객체들은 close 안해도된다 비권장 사항이다.
		%>
		 <h2><%=n %></h2>
		<% 
		
	} //for문 끝

%>

</body>
</html>