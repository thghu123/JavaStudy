<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>사원 수정</h1>

	<article>
	
		<form action="ex3_edit.jsp" method = "post">
		<label for = "s_no">검색할 사번:</label>
		<input type = "text" id = "s_no" name = "s_no"><br/>
		
		<label for = "s_name">수정할 이름:</label>
		<input type = "text" id = "s_name" name = "s_name"><br/>
		
		<label for = "s_job">수정할 직종:</label>
		<input type = "text" id = "s_job" name = "s_job"><br/>
		
		<label for = "s_sal">수정할 급여:</label>
		<input type = "text" id = "s_sal" name = "s_sal"><br/>
		
		<input type = "button" value = "수정" onclick = "exe(this.form)"/>
		
		
		
		</form>
	</article>

	<script type="text/javascript">
	
	function exe(f) {
		//사번은 유효성 검사를 하자
		var no = f.s_no;
		if(no.value.trim().length == 0){
			alert("사번을 입력하세요");
			no.value = "";
			no.focus();
			return;
		}
		
		f.submit();
		//jsp 하나더 만들고 dao에서 하나만 더 추가하면 끝
	}
	
	</script>



</body>
</html>