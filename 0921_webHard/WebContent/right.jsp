<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style >

	body {	
		margin : 0;
		padding : 0;
	}

	header {
		height : 4spx;
		margin : 0;
		background-color: #2e2e2e;
	


 }
 	ul#menu {
 		margin : 0;
 		padding : 0;
 		list-style : none;
 		margin-left : 50px;
 
 
 
 
 
 	}
 
 	ul#menu>li {
 
 		display : inline-block;
 		margin-right : 40px;
 		margin-left : 40px;
 		font-family: Arial;
 		font-size : 14px;
 
 	}
 
	 ul#menu>li>a{
 
	 	color : #aaaaaa;
	 	text-decoration: none;
	 	line-height:  44px;
	 	 text-align : center; 
	 	 
 		width:30px;
 		height:45px;
 
	 }
 
 	 ul#menu>li>a:hover{
 
	 	color : #fff;

 	}

 
	
	
	li#apple{
	  /* text-indent: -9999px;  */ 
	}
	
 	li#apple>a{
 	
 	background-image: url(images/apple.svg);
 	position: absolute;
 	background-repeat: no-repeat;
 	top: 0;
	background-size: 30px 40px;
	/*앞이 너비 옆이 높이*/
 	width : 44;
 	
 	background-position: center center;
	 margin-left : -24px; 
	}	
 

 
 
 
</style>

</head>
<body>
<%

	String msg = request.getParameter("msg");
	//msg는 자바의 변수이다. 이걸 바로 자바 스크립트에서 못쓴다. 반대로도 불가능하다.
	//html 영역에 msg 놓고, <%! <%=처럼 가능하다. input type = "hidden"에 value로 찍을 수 있다
	//hidden으로 처리된 곳에 여기 내용을 출력해준다. 이렇게 이용이 가능하다.
	//이걸 js에서 document.getelementById.value로 편법을 쓸 수 있다. 이걸 제이쿼리로 쓴다.
	
 %>
	<header>
		<ul id = "menu">
			<li id = "apple"><a href = " " >&nbsp;</a></li>
			<li><a href = "javascript:page()"> Mac </a></li>
			<li><a href = "javascript:page()"> ipad </a></li>
			<li><a href = "javascript:page()"> iphone </a></li>
			<li><a href = "javascript:page()"> Watch </a></li>
			<li><a href = "javascript:page()"> TV </a></li>
			<li><a href = "javascript:page()"> Music </a></li>
			<li><a href = "javascript:page()"> 고객지원 </a></li>
		
		</ul>
	
	
	</header>
<!-- 자바의 변수 msg의 값을 js에서 사용할 수 있도록  히든 처리된 요소의 값으로 출력시켜준다.-->
<input type = "hidden" id = "msg" value = "<%=msg%>"/>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script type="text/javascript">
 	function page(){
		parent.location.href = "index.jsp";
	}
	 

	//j쿼리 항상 $로 시작 , css와 같다. id면 # class면 ., value는 .val()
	//간단하기에 많이 사용한다.css만 알면 사용 가능하다.
	$(function(){
		//현재 문서가 준비완료 시에 무조건 수행하는 곳
		
		//현재문서에서 id가 msg인 요소의 값value를 얻어낸다.
		//그 값을 변수 res에 저장하자
		var res = $("#msg").val();
		
		if(res == '1'){
			alert("가입 완료");
			
		}
		else if(res == '0'){
			alert("저장 시 오류가 발생했습니다.");
		}//위작업을 index.jsp에도 해야함
		
		
		
	})

</script>







</body>




</html>