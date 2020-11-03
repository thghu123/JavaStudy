<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    JSTL jsp standard tag library
    	자바 기반의 퉵 환경에서 지원하는 확장된 tag를 
    	사용할 수 있도록 제공되는 라이브러리 tag로 제어문 지원
	라이브러리를 lib에 넣고
     --%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--jstl 변수 선언--%>

	<!-- set은 변수 선언 var은 변수명 , value는 값, int idx = 100;-->
	<!-- jstl도 script를 쓸 때가 있다. 
	스크립트 요소에서 정의한 변수를 jstl에서는 바로 사용하지 못한다.
	아래에서는 스크립트 변수를 못쓰기에 jstl 변수로 선언을 해야한다.
	 -->
	 
	 <%int value = 9; %>
	 <c:set var = "idx" value ="100"/>
	 <c:set var = "value" value = "<%=value%>"/>
	 <%--이럴때 스크립트 요소니까 <%=써줘야한다. --%>
	 
	 <c:if test = "${value > 10}"> <%--idx이건되는 데 value는 안된다. --%>
	 
	 	<h2>value값이 10 이상이에요</h2>
	 
	 </c:if>
	 
	 <c:if test = "${value  < 10}">
	 	
	 	<h2>value값이 10 미만이에요</h2>
	 
	 </c:if>
</body>
</html>