<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>검색할 번호</h1>
	<article>
	
	
	
	
	
		<form action = "ex1_res.jsp" method = "post">
			<label for = "s_no">사원번호:</label>		
			<input id = "s_no" name = "s_no"/>
			
			<input type = "button" value = "검색" onclick = "exe(this.form)"/>
		</form>
	
	
	
	
	
	
	</article>
	
	<script>
		function exe(f){
			var s_no = f.s_no;
			if(s_no.value.trim().length<1){
				alert("검색할 이름을 입력하세요");
				s_no.value = "";
				s_no.focus();
				return;
				
				
			}
			f.submit();
			//단 한자라도 넣었으니 경로로 보낸다.
			
			
			
		}
		
		
	
	</script>
	
</body>
</html>