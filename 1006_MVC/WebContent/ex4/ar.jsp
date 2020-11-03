<%@page import="ex4.DataVO"%>
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
	Object obj = request.getAttribute("ar");
	if(obj != null){
		DataVO[] ar = (DataVO[])obj;
	
	for(DataVO vo : ar){
		%>
		
		<h2><%=vo.getName()%>,<%=vo.getAge()%></h2> <%-- ${ar.age} --%>
		
		
		<%
	}//for문 끝
	}
%>

<hr/> <!-- 구분선 -->
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 접두어는 아무거나 되지만 core라는 뜻에서 흔히 c라고 붙임 / 밑으로는 jstl사용-->

<h1>Jstl for문 연습</h1>
<c:forEach items="${ar}" var="vo"> 
<!-- 반복문 돌릴 아이템이 뭐니? 여기서 ar은 request에 저장되어있는 ar, vo는 변수지정 == DataVO vo : ar-->
	<h2>${vo.name }, ${vo.age }</h2>

</c:forEach>

</body>
</html>