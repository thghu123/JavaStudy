<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String age = request.getParameter("age");
	
	//현재 페이지를 정상적으로 호출한다면 위 3개 파라미터가 모두 들어오거나
	//모두 안들어오거나 둘 중 하나이다.
	
	//만약 둘중 하나라도 들어오지 않았다면 이름과 생년을 입력하도록한다
	
	if(name == null || year ==null || age ==null)
	{//이름과 생년을 입력하도록한다
%>
	<form action="ex3_forward2.jsp" method = "post">
	<label for ="name">이름</label>
	<input id = "name" name = "name"/> <br/>
	
	<label for ="year">생년</label>
	<input id = "year" name = "year"/> <br/>
	
	<input type="button" value = "보내기" id = "btn"/>
	
	
	</form>

<%
		
	}else{ //모두 들어온 상황
		
		%>
		
		<h2><%=name %>님은 <%=year %>생이므로 <%=age %>세입니다.</h2>
		
		<%
		
		
	}
	
	
	%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- 바디 끝나기 직전에 붙여주기 j쿼리 홈에서 오른쪽 learning center - event - basic
	$("p").click(function(){};); 익명함수를 명시했다 여기서만 쓰려고
	p는 css와 유사한데 . #이 없으므로 p는 p 태그이다. 함수를 익명 정의한다. == 가독성을 위해서
	클릭할 수 있고 없고를 컨트롤하려면 bind를 사용해야한다 unbind로 금지 시킬 수 있다.
	
	jquery 시작부를 반드시 설정해야 돌아간다.
-->


<script type="text/javascript">
//j쿼리 시작부
$(function(){//준비
	//여기가 시작부 메인 함수와 같다. 물론 없어도되지만 문법을 지키기 위해 사용하자

	//click()함수 첫인자로 실행해야할 함수를 입력한다.
	$("#btn").click(exe); //2개 방식으로 click 처리 하지만 바로 함수를 써주는 게 가독성이 좋다.
	
	$( "#btn" ).click(function() {
		
		//한문장에 자바script와 j쿼리 문장을 혼용해서 쓰면 안된다. 하지만 한줄씩 쓰는 건 괜찮다. 
		document.forms[0].submit();//val()을 붙이는 게 안된다는 의미이다.
		//j쿼리에서 진행했다. onclick이 아니라
	    console.log( "You clicked a paragraph!" );
	});
	
	
});

function exe(){
	console.log("^^");
}




</script>

















</body>
</html>













