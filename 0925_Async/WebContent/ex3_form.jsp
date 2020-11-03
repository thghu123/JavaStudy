<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	.success{
	color: #00f;
	}
	.fail{
	color: #f00;
	}
	
	
	
</style>

</head>
<body>

	<h1>비동기식 통신으로 아이디 체크</h1>
<article>
	<form>
	
	<label for = "u_id">아이디:</label>
	<input type = "text" id = "u_id"/>
	<span id = "str">사용 불가</span>
	</form>
</article>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function(){
		//글씨를 뗄 때 글씨가 찍힌다
		$("#u_id").on("keyup", function(){
			//키를 누를 때마다 이벤트가 발생한다 input안에 text를 적을 때마다
			var id = $("#u_id").val(); //$("this").val();도 된다. 동일한 영역이기 때문이다.
			//console.log(id); 
			//키를 누를 때가 키다운인데 이때 안써진다. 완전히 도달해야 써진다.
			//keydown이 아닌 up으로 해야한다. 그래야 꾹누르고 뗄때 다 써지므로 up으로 해야 단위로 보낸다
			//4자가 되기 전까지는 서버로 보내면안된다.
			
			if(id.length>2){
				
				//서버로 보낸다.
				$.ajax({
					url: "ex3_idCheck.jsp",
					data: "m_id="+id,
					type: "post",
					dataType: "json"
						
				}).done(function(data){
					//요청 성공시
					
					//받은 정보를 현재 문서에서 id가 str인 곳에 표현하면 됩니다.
					
					$("#str").text(data.res);
				
				//아이디가 사용가능하다면 success아님 fail적용	
					
				if(data.status == 1){
					$("#str").removeClass("fail");//적용되지 말아야할 부분이 적용되어있을 수 있다
					//클래스는 여러개 지정이 가능하다.
					$("#str").addClass("success");
				}else {
					
					$("#str").removeClass("success");
					$("#str").addClass("fail");
					//sucess와 fail class를 적용 시켰는데 , 이걸 여기에 추가시칸다.
					//class 는 여러개 지정할 수 있다.
				}
					
					
				})
				
			}else{//백스페이스 도 누르는 것이다. 만약에 백스페이스를 눌러서 길이가 0이 됐을 때는
				//사용가능 str를 지워주는 게 좋을 것 같다. 불가능에서 -> 1누르면 -> 가능 -> 백스페이스 -> 가능으로 남는 문제가 예제
				//이러면 test 통과 다시 못 통과하고 돌아온다. 
				$("#str").text("");
					
				
			}
			
			
			
			
			
		})
		
		
	});//j쿼리 도입부는 반드시 적어준다. main과도 같다
	
	
	

</script>


</body>
</html>