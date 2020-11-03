<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>사원 추가</h1>

	<article>
	
		<form action="ex4_add.jsp" method = "post">
		<label for = "s_no"> 사번:</label>
		<input type = "text" id = "s_no" name = "s_no"><br/>
		
		<label for = "s_name"> 이름:</label>
		<input type = "text" id = "s_name" name = "s_name"><br/>
		
		<label for = "s_job"> 직종:</label>
		<input type = "text" id = "s_job" name = "s_job"><br/>
		
		<label for = "s_sal"> 급여:</label>
		<input type = "text" id = "s_sal" name = "s_sal"><br/>
		
		<input type = "button" value = "추가" onclick = "exe(this.form)"/>
		
		
		
		</form>
	</article>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	//아래의 코드는 var no = document.getElementById("s_no");
	//위에는 id로 접근했기에 가장 좋은 방법이다. 환경따라 구동안될 수 있기에 jquery사용한다.
	//css에서 #s_no 이렇게 id 객체 들어간다
	function exe(f) {
		//사번은 유효성 검사를 하자
		//var no = f.s_no;
		var no = $("#s_no"); //j쿼리는 $붙이고 그 안에 "" 로 아이디 부른다.
		//css의 선택자와 j쿼리가 동일하다. 한칸 띄우는 건 자손, >는 자식 이런것도 된다. id가 없어도 선택이 가능하다.
		//테이블이나 그 부분을 바꿀 수도 있다. 일부분만
		
		var name = $("#s_name");
		var job = $("#s_job");
		var sal = $("#s_sal");
		
		//if(!no.value || no.value.trim().length == 0){
		if(no.val().trim().length == 0){
			alert("사번을 입력하세요");
			no.val(""); //no.value = ""; j쿼리를 썻기에 이부분은 적용되지 않는다. no 가 $구문으로 정의되었기 때문
			//값을 지정. 가져올 때는 no.val()을 의미한다.
			no.focus(); //위 내용을 순수한 j쿼리 문법으로 수정한 것. focus는 똑같다.
			return;
		}
		if(name.val().trim().length == 0&& job.val().trim().length == 0&& sal.val().trim().length == 0)
			{
			alert("수정을 원하시면 값을 입력하세요");
			name.val("");
			name.focus();
			return;
			}
			
		
		f.submit();
		//jsp 하나더 만들고 dao에서 하나만 더 추가하면 끝
	}
	
	</script>



</body>
</html>