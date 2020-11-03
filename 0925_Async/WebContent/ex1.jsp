<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비동기식 통신 연습 :액션과 메서드 지정안한다.</h1>
	<article>
		<form>
			<label for = "u_id">아이디 : </label>
			<input id = "u_id"/>
			<br/>
			<input type = "button" value ="보내기" id ="btn">
			
		</form>
	</article>

	<h1>동기식 통신 연습: 관습 </h1>
	<article>
		<form action = "ex1_res.jsp" method="post"><!-- 동기식할거다. -->
			<label for = "u_id2">아이디 : </label>
			<input id = "u_id2" name = "u_id2" />
			<br/>
			<input type = "button" value ="보내기" id ="btn2">
			
		</form>
	</article>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			//j쿼리 시작부, 통신은 res.jsp로 보내는 구나 요청은 포스트 방식이구나
			
			$.ajax({ //비동기식 통신하겠다는의미.
				url:"ex1_res.jsp", //비동기식 통신을 위한 서버 경로
				type : "post", //통신 방식은 post방식
				data : "u_id="+$("#u_id").val(),//사용자의 입력값을 u_id라는 파라미터에 담아 보낸다.
				dataType : "json" //마지막은 콤바 관계x , 결과를 받을 때 json형식으로 받는 다라는 의미 
				//에러 이걸 data_type이라고 했다.
				
			}).done(function(data){//통신 성공시 실행되는 곳 
				alert(data.msg);
			
			}).fail(function(error){
				alert("문제발생");
				
			}); 
			
			//비동기식 통신을 하게해주는 함수 여기에 값을 넣어줘야한다.
			//done은 비동기 통신을 수행하고 성공했을 때 라는 ㅡ이미이다.
			
			
		})
		
		
	})
	
	</script>
	
</body>
</html>

