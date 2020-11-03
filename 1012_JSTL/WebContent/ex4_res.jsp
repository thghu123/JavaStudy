<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	//파라미터로 u_name이 admin일때만 관리자님 환영합니다 메세지를 출력
	//나머지는 ~님 환영합니다 로 출력하자.
	
	
%>
	<c:if test = "${param.u_name == '어드민' }">
	<h2>${param.u_name} 관리자님 환영합니다</h2>
	</c:if>

	<c:if test = "${param.u_name ne '어드민' }">
	<h2>${param.u_name}님 환영합니다</h2>
	</c:if>
</body>
</html>