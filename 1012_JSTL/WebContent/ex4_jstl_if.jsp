<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> jstl if test</h1>
	<form action = "ex4_res.jsp" method = "post">
		<label for = "s_name">이름</label>
		<input id = "s_name" name = "u_name"/>
		<input type = "button" value = "보내기" onclick = "exe(this.form)"/>
		
	</form>
	
	<script>
	
	function exe(frm){
		frm.submit();
	}
	
	</script>
	
</body>
</html>