<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>액션 요소 연습</h1>
	
	<article>
	 <form action = "ex2_action.jsp" method="post">
	 
	 <label for = "m_id">아이디</label>
	 <input id = "m_id" name = "m_id"/>
	 
	 <label for = "m_name">이름:</label>
	 <input id = "m_name" name = "m_name"/>
	 
	 <label for = "m_age">나이:</label>
	 <input id = "m_age" name = "age"/>

	 <label for = "m_phone">phone:</label>
	 	<select id = "m_phone" name = "phone">
	 		<option value = "010">010</option>
	 		<option value = "011">011</option>
	 		<option value = "012">012</option>
		</select>
		
	 <label for = "m_phone2">-</label>
	 	<input id = "m_phone2" name = "phone">
	 <label for = "m_phone3">-</label>
	 	<input id = "m_phone3" name = "phone"> </br>
	 	
	 	<input type="button" value ="보내기" onclick="exe()">
	 	
	
		
		
		
	 
	 </form>
	</article>
	
	<script type="text/javascript">
	function exe(){
		
		document.forms[0].submit();
		
		
		
	}
	
	
	</script>
	
</body>
</html>