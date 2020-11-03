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

	<h2>도서 목록 페이지</h2>
	
	<!-- 그냥 리스트를 다 띄워주자 , 그리고 이게 되면 String 하나를 넘겨줘서 한명의 멤버만 검색되도록하자-->
		
	<form action = "Controller?type=search">
	
	<input type="button" value = "리스트 검색하기" onclick = "exe(this.form)"/>
	
	</form>
	


	<script type="text/javascript">
	
	function exe(frm){
		frm.submit();
	}
	
	
	</script>

</body>
</html>