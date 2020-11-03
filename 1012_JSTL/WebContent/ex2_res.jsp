<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>${sessionScope.s_id }</h1>
<h1>param.pw:${param.pw }</h1><!-- 위아래 둘다되는데 위에걸 많이쓴다. -->
<h1>param["pw"]:${param["pw"] }</h1>
	<!-- 파라미터로 넘어오는 애가 아닌 이상, 앞에 param 써줄 필요없다.
	현페이지 - 리퀘스트 - 서버 다 찾는다. 
	 -->
<h1>${sessionScope.map.name }</h1> 
<h1>${sessionScope.map.id }</h1> 
	 
</body>
</html>