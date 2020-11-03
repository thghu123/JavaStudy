<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width: 350px;
		border-collapse: collapse;

	}
	table th, table td{
	border: 1px solid black;
	}
</style>

</head>
<body>
	<h1>마이바티스-스프링과 비동기식 통신 연습</h1>
	
	<table id = "t1">
		<colgroup>
			<col width = "15%">
			<col width = "20%">
			<col width = "*">
			
		</colgroup>
		
		
		<thead>
			<tr>
				<td colspan = "3">
					<input type = "button" value = "전체 " id = "total_btn"/>
				</td>
			</tr>
		
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
			</tr>

		</thead>
	
		
		
		
		<tbody>
		</tbody>
		
	</table>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
	<script>
	
	$(function(){
	//total_btn을 클릭했을 때의 이벤트를 여기서 부여
	$("#total_btn").bind("click",function(){
		//onclick 말고 bind는 언바인드를 써서 클릭이라는 걸 빼서올 수도있따. 클릭이 안됐으면 좋겠다 할때는
		//unbind를 써서 클릭을 수거해올 수도 있다. 
		//여기는 클라이언트 화면이다. jsp는 클라이언트인데 DB간다는 건 말도 안되는 이야기
		//백엔드 단을 가야한다. 이때 어떻게 보내느냐의 의미. 그걸 고민할 필요가 없다. 
		//비동기식 통신을 써서 controller를 호출하는 것 => 그래야 DAO를 활용해서 DB 접속을 시도한다.
			$.ajax({
				url :"total",
				type : "post",
				/* data: , 지금은 필요없다 total을 전달받는다.*/
				dataType : "json" 
				/* success: 예전에는 이렇게 썼지만 요즘은 뒤에 .done으로 한다*/
				//data와 dataType은 파라미터 데이터를 받는 경우를 의미. 받는 데이터를 제이슨으로 받겠습니다. 90%쓰는 내용
				//어떤 언어에서도 json을 쓰기 때문, 파이썬 자바 등 다 호환 가능하다
			
			}).done(function(data){//data가 정당적으로 들어왔다. 400번대는 경로오류, 500대는 nullpoint 프로그래머 신텍스 오류
				//400번대가 경로를 다 파악해야하니 어렵다. 200번대는 정상적으로 수행됐을 떄, 서버오류나도 통신이 정상적으로 됐으면 200대, 이를 전부 done으로 한다
				console.log(data);
			//자바 스크립트니까 스프링 버퍼는 못 쓰고 스트링을 써야한다.
				
			
/* 			var str = "";
			for(var i = 0; i<data.list.length;i++){
				str =+ "<tr><td>"+(i+1)+"</td><td>"+data.list[i].m_id+"</td><td>"
				+data.list[i].m_name+"</td><tr>";
			}//for의 끝				
			
			//id가 t1이라는 테이블의 넣어야한다
			$("#t1 tbody").html(str); //tbody는 하나 만들어준다.
			 */
			 //위는 내 코드 아래는 샘코드 아래는 된다. 뭐가 틀린거야??
			var str = "";
			for(var i=0; i<data.list.length; i++){
				str += "<tr><td>"+(i+1)+"</td><td>"+data.list[i].m_id+"</td><td>"+
						data.list[i].m_name+"</td></tr>";
			}//for의 끝
			$("#t1 tbody").html(str);	
			
			
				
			});//ajax만 알고있으면 된다. 가장 최근에 모든 통신법을 정리되어 표준화된 것 달러.post 포괄한한 type에만 쓰면된다
			
		
		});
	});
	
	
	
	
	</script>
	
	
</body>
</html>