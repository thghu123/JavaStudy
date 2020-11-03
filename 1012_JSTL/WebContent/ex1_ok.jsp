<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL</h1>
	<h2>map 구조 또는 list 구조 등의 컬렉션 접근을 유용하게 해주는 문법을 가진 표현언어</h2>
	<h2>
	표현언어가 가지는 기본 객체<br/>
		-param : 파라미터 값<br/>
		-requestScope : 요청 객체<br/>
		-sessionScope : http 세션 객체<br/>
	</h2>
	
	<h3> ${param.s_id} </h3>
	<h3> ${param.s_pw} </h3>
	<h3> ${param.cPage} </h3>
	<!-- 여기 있는 지부터  찾고 없으면 에러가 난다. 여기에는 없다를 명시, 어디에 있는 애다. -->
	<!-- 이름을 같이해서 넘겨, 배열로 받아야한다. 그런거는 어떻게 할까. -->
	
</body>
</html>