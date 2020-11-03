<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<h1>동적쿼리 연습</h1>

	<article>
	<form action ="ex2_search.jsp" method = "post">
		<select id = "searchType" name = "searchType">
			<option value = "0">사번</option>
			<option value = "1">이름</option>
			<option value = "2">직종</option>
			<!-- 사번은 표현되는 값일 뿐이지 실제로 가는 값은 value , searchType으로 받음 -->
			
			
		</select>
		<input type="text" id = "searchValue" name ="searchValue"/>
		<input type="button" value = "검색" onclick ="exe(this.form)"/>
		 
		 
	</form>
	
	</article>
	
	<script>
		function exe(f) {
			var v = f.searchValue;
			//text가 잘 들어갔는 지 유효성 검사
			if(!v.value || v.value.trim().length == 0){
				//입력하지 않은 경우
				alert("입력혀유");
				v.value = "";
				v.focus();
				return;
				
				
			}
			f.submit();//서치 타입, 발류만 전달, 버튼도 가지만 name없으니 못받음
			
			
			
		}
	
	</script>
</body>
</html>