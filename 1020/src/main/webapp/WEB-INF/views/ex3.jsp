<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>스프링 인자 전달 연습</h1>
	<form action = "ex3_1" mehtod = "post">
		<label for ="s_id">ID:</label> <!-- 모바일 환경에서 label은 의미 없기에 전부 삭제할 때 용이 -->
		<input type = "text" id = "s_id" name = "m_id"/><br/>
		<label for = "s_pw">
		PW:
		</label>
		<input type = "password" id = "s_pw" name = "m_pw"/> <br/>
		<input type = "button" value = "LOGIN" id = "btn" onclick = "login()"/>
		
		
	</form>
	
</body>
	<script>
	function login(){
		//유효성 검사 생략
		document.forms[0].submit();
		
	}
	
	</script>


</html>