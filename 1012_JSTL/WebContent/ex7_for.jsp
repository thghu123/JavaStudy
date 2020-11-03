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
	String[] ar = {"자바", "스피링", "파이썬", "럼복"};


%>
	<c:set var= "ar" value = "<%=ar%>"/>

	<h1>jstl practice</h1>
	
	<ul>
		<c:forEach items = "${ar}" var = "view" varStatus="st">
			<li>
				${view}
				${st.index}
			</li>
		</c:forEach>
	</ul>
	
<!-- 위는 오전에 배운 것으로 지금부터는 새로 배운 것으로-->

<%
	request.setAttribute("arr", ar);//페이지 이동하면 없어지니까 지역 변수처럼 쓸 수가 있다.
%>
	
	<ul>
		<c:forEach items = "${arr}" var = "view" varStatus="st">
			<li>
				${view}
				${st.index}
			</li>
		</c:forEach>
	</ul>
	


</body>
</html>