<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JDOM TEST</h1>
	<form action="add" method = "post">
	
	<label for = "name">이름:</label>
	<input type = "text" name = "name" id = "name"/><br/>
	
	<label for = "b_day">생일:</label>
	<input type = "text" name = "b_day" id = "b_day"/><br/>
	
	<label for = "phone">연락처:</label>
	<input type = "text" name = "phone" id = "phone"/><br/>
	
	<input type = "button" value = "보내기" onclick = "exe(this.form)"/>
	<!-- a tag일때는 this.form이 form이 인식하는 tag가 아니기에 사용 불가 -->
	
	
	</form>
	
</body>

<script type="text/javascript">

	function exe(frm){frm.submit();}
	
</script>

</html>