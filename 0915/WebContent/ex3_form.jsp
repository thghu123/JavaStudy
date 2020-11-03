<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<h1>검색할 이름</h1>
	<article>
	
	
		<form action = "ex3_searchName.jsp" method = "post">
			<label for = "s_name">이름:</label>		
			<input id = "s_name" name = "s_name"/>
			
			<input type = "button" value = "검색" onclick = "exe(this.form)"/>
		</form>
	
	
	</article>
	
	<script>
		function exe(f){
			var name = f.s_name;
			if(name.value.trim().length<1){
				alert("검색할 이름을 입력하세요");
				name.value = "";
				name.focus();
				return;
				
				
			}
			f.submit();
			//단 한자라도 넣었으니 경로로 보낸다.
			
			
			
		}
		
		
	
	</script>
	

</body>
</html>