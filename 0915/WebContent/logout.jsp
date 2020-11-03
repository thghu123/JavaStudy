<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //session에서 이름이 uvo인 값을 삭제
    session.removeAttribute("uvo");
    //있으면 삭제 되고 아니면 그냥 아무일 안난다.
    response.sendRedirect("ex1_login.jsp");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>