<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h2>비동기식 통신</h2>
	
	<article>
	
		<table border = "1", id = "table">
		<colgroup>
			<col width = "70px;">
			<col width = "120px;"> <!-- 이름 -->
			<col width = "120px;"> <!-- 직무 약 300정도의 너비 -->
		</colgroup>	
		<thead>
	
		<tr>
		
			<td colspan = "3">
				<input type="button" id = "btn" value = "가져오기"/>
			</td>
		
		</tr>

		<tr>
		
		<th>사번</th>
		<th>이름</th>
		<th>직무</th>
		
		</tr>
		
		</thead>
		
		<tbody>
		</tbody>
		
		</table>
	</article>
	
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	//아이디가 btn 인 쇼소를 클릭할 때 수행하는 이벤트를 해보자
	
	
	$(function(){
		
	$("#btn").click(function(){
		
		$.ajax({ //ajax 비동기식 통신의 옵션을 지정해준다. data는 보내고자하는 파라미터/* data : "" */  //지금은 보낼 것이 없다
			url: "ex2_ok.jsp",
			type: "post", //전송시 요청 방식
			dataType : "json" //ex2_ok.jps에서 반환하는 형태 ok.jsp에서 제이슨으로 주며 응답한다.
			
		}).done(function(res){ //통신 성공 시 수행한다. 뭐라도 받고 싶으면 아무 거나 받는다. 이름 상관없다
			//여기서 받은 것을 tbody에 넣고 싶다.
			//1개가 아니라 자원이 3개가된다. 배열이라서 반복문 돌릴 수 있다.
			var code = "";//각 자원(일지매 이지매 삼지매 등등)들을 tr로 만들어서 누적시키는 변수
			
			/* 			
			console.log(res.length);//3이 나와야한다.
			console.log("연결성공");
			console.log(res[0].ename); //일지매
			 */
			for(var i = 0; i<res.length; i++){
				code += "<tr><td>" + res[i].empno +"</td><td>"+res[i].ename+
				"</td><td>"+res[i].job+"</td><tr>";
				//기존에 있는 걸 안지우고 누적되게 들어가는 게 +=를 의미한다
				
				
				
			}
			
			//tr 태그 3개가 code에 누적되었다. 이제 code의 내용을 id가 table인 태그에 있는 tbody안에 html로 넣자
			//문자열이면 해석되지 않는다.
			
 		//	 $("#table>tbody").text(code); //이러면 그대로 나타난다 이건 에러
			 $("#table>tbody").html(code); //
			 
			 
			}).fail(function(err){//서버에서 오류가 나면
			console.log(err);
			
			
		});
		
		
		
	})
	})

	</script>
	
	
</body>
</html>