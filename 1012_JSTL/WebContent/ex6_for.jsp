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
	
	<c:set var = "cnt" value = "20"/>
	<!-- int cnt = 20 -->
	
	<ul>
		<c:forEach begin="1" end="10" step = "1" var = "v1">
			<li>
				번호 : ${v1} <!-- 속성이기에 출력을 할 수는 없다 -->
			</li>
		</c:forEach>
	</ul>
	
	<hr/>
	<!-- 위는 변수 , 아래는 움직이는 상태를 객체에 저장, 둘다 같다. -->
	<ul>
		<c:forEach begin = "0" end = "${cnt}" step = "1" varStatus="st"> <!-- 현 상태값을 어디에 저장하겠니 라는 의미 -->
			<!-- st 안에 반복되는 index값이 저장된다 -->
			<li>
			<!-- ${st} 스테이터스 객체의 이름값을 가지고 있다-->
			${st.index}
			</li>
		</c:forEach>
	
	</ul>
	
	

</body>
</html>