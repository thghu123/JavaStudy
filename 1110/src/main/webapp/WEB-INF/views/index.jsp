<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	div#box{
		width : 300px;
		height : 150px;
		border : 1px solid black;
	}

</style>

</head>
<body>

	<h1>
	FLASK 호출 연습
	</h1>
	<input type = "button" value = "플라스크 호출 " id = "req_bt"/>
	<input type = "button" value = "전기차 충전소 현황 " id = "req_bt2"/>
	
	
	
	<div id="box"></div> <!-- flask에서 전달해오는 값을 출력하는 곳 -->
	
	<ol id = "ol">
<!-- 		<li id = "li"></li>
		<li id = "li2"></li> -->
	</ol>
	

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script>
		$(function(){ //j쿼리 수행
			//버튼에 이벤츠 걸기
			$("#req_bt").bind("click",function(){
				//req_bt라는 아이디를 클릭할 때마다 비동기식 통신하는 곳. 계속하는 건 아니다
				$.ajax({
					url: "http://localhost:5000",
					type : 'get' //get 만드시 ''로 감싸준다.
					
					//플라스크에는 /만 줬기에 뒤에는 아무것도 안해도 연결된다.
				}).done(function(data){//요청이 성공했을 때,
					//return jsonify(code=str) == {"code" : "<h1>hello..</h1>"}
					
					//고로 code 값이 data에 안착한다. data.code라고 하면 value가 나온다.
					
					$("#box").html(data.code);
					//완전 출력 tag 형태로 만들어서 통으로 이렇게 넣어도 되겠다.
					
				});
			});
		
			$("#req_bt2").bind("click",function(){
				//req_bt라는 아이디를 클릭할 때마다 비동기식 통신하는 곳. 계속하는 건 아니다
				$.ajax({
					url: "http://localhost:5000/evCar",
					type : 'post' ,//get 만드시 ''로 감싸준다.
					dataType: 'json' //json으로 넘겨주었기 때문
					//플라스크에는 /만 줬기에 뒤에는 아무것도 안해도 연결된다.
				}).done(function(data){//요청이 성공했을 때,
					//return jsonify(code=str) == {"code" : "<h1>hello..</h1>"}
					
					//고로 code 값이 data에 안착한다. data.code라고 하면 value가 나온다.
					var str = "";
					for(var i = 0; i<data.length; i++)
						str += "<li>"+data[i].addr+"</li>";
					
					$("ol").html(str);
					//$("#li").html(data);
					//완전 출력 tag 형태로 만들어서 통으로 이렇게 넣어도 되겠다.
					
				});
			});
		
		
		});
	
	</script>
	
</body>
</html>
