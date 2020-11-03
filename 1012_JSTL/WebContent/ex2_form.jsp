<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>jstl 연습</h1>
	<form action = "ex2_ok.jsp" method = "post">
		<label for = "s_id">ID:</label>
		<input id = "s_id" name = "s_id"/> <br/>
		
		<label for = "s_pw">PW:</label>
		<input type = "password" id = "s_pw" name = "s_pw"/> <br/>
		
		<input type="hidden" name = "cPage" value = "2"/>
				<select id = "s_phone" name = "s_phone">
			<option value = "010">010</option>
			<option value = "011">011</option>
			<option value = "017">017</option>
		
		</select>
		
		<label for = "s_phone1">-</label>
		<input id ="s_phone1" name = "s_phone"/>
		
		<label for = "s_phone2">-</label>
		<input id ="s_phone2" name = "s_phone"/>
		
		
		<input type = "button" value = "로그인" onclick = "sendData(this.form)"/>
		<!-- a태그는 안되지만 인식되는 input태그는 this.form 가능하다. -->		
	</form>

	<script type="text/javascript">
	function sendData(frm){
		//유효성 검사 
		
		//사용자가 입력한 id값 가져오기
		var s_id = document.getElementById("s_id"); //아직 input tag가 온것에서 안의 value 들어가야함
		
		//var s_pw = document.getElementById("s_pw");
		var s_pw = frm.s_pw;
		//위처럼 접근하는 것은 name으로 접근하는 것
		
		//유효성검사
		if(s_id.value.trim().length == 0){//공백 잘라낸 내용이 공백과 같다면 의 의미. null일 수 없다
			 alert("아이디를 입력하세요");
			s_id.value = "";//초기화(청소)
			s_id.focus();
		}
		
		if(s_pw.value.trim().length == 0){//공백 잘라낸 내용이 공백과 같다면 의 의미. null일 수 없다
			 alert("비밀번호를 입력하세요");
			s_pw.value = "";//초기화(청소)
			s_pw.focus();
		}
		
		frm.submit();//서버로 파라미터값들을 보낸다.
		
		
		
	}
	
	
	
	</script>
</body>
</html>