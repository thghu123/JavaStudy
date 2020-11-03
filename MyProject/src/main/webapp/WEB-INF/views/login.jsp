<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" 
href="css/common.css"/>
<link type="text/css" rel="stylesheet" 
href="css/login.css"/>
</head>
<body>
<div id="wrap">
	<!-- 상단 영역 -->
	<div id="header">
		<h1>SK Together</h1>
		<ul class="gnb">
			<li><a href=""><span class="menu m01">기브유</span></a></li>
			<li><a href=""><span class="menu m02">위드유</span></a></li>
			<li><a href=""><span class="menu m03">스마트 전통시장</span></a></li>
			<li><a href=""><span class="menu m04">BRAVO!</span></a></li>
			<li><a href=""><span class="menu m05">SKT와 사회공헌</span></a></li>
		</ul>
	</div>
	<!-- 상단 영역 끝 -->
	<!-- 콘텐츠 영역 -->
	<div id="contents_sub">
		<h1 class="sub_title tit02">회원 로그인</h1>
		<div class="login_area">
		<!-- 일반개인회원 -->
			<div class="person_login">
				<h2 class="sub_title title01">일반 개인회원</h2>
				<div class="login">
				  <form action="login" method="post">
				  	<input type="hidden" name="type" value="login"/>
					<div class="input_area">
						<p>
						 <label for="s_id">아이디</label>
						 <input type="text" name="m_id" id="s_id"/>
						</p>
						<p>
						 <label for="s_pw">비밀번호</label>
						 <input type="password" name="m_pw" id="s_pw"/>
						</p>
					</div>
					<div class="btnArea_right">
						<span class="btn b_login">
						 <%-- <a href="javascript:exe()">로그인</a> --%>
						 <a id="login_btn">로그인</a>
						</span>
					</div>
					<div class="fclear"></div>
					<p class="login_search">
						<input type="checkbox" name="chk" 
						 id="ch01"/><label for="ch01">
						 아이디저장</label>
						<span class="btn b_search">
						  <a href="">아이디/비밀번호찾기</a>
						</span>
					</p>
				  </form>						
				</div>
			</div>
		<!-- 일반개인회원 끝-->
		<!-- 기관단체회원 -->
			<div class="group_login">
				<h2 class="sub_title title02">일반 개인회원</h2>
				<div class="login">
				  <form action="" method="post">
					<div class="input_area">
						<p>
						 <label for="s_id">아이디</label>
						 <input type="text" name="id" id="s_id2"/>
						</p>
						<p>
						 <label for="s_pw">비밀번호</label>
						 <input type="password" name="pw" id="s_pw2"/>
						</p>
					</div>
					<div class="btnArea_right">
						<span class="btn b_login">
						 <a href="">로그인</a>
						</span>
					</div>
					<div class="fclear"></div>
					<p class="login_search">
						<input type="checkbox" name="chk" 
						 id="ch01"/><label for="ch01">
						 아이디저장</label>
						<span class="btn b_search">
						  <a href="">아이디/비밀번호찾기</a>
						</span>
					</p>
				  </form>						
				</div>
			</div>
		<!-- 기관단체회원 끝-->
		</div>
	</div>
	<!-- 콘텐츠 영역 끝-->
	<!-- 하단영역 -->
	<div id="footer">
		<div class="footer_area">
			<ul class="foot_guide">
				<li><a href="">개인정보취급방침</a></li>
				<li><a href="">회원이용약관</a></li>
				<li><a href="">책임한계와 법적고지</a></li>
				<li><a href="">이메일 무단수집 거부</a></li>
			</ul>
			<address>
				서울특별시 무슨구 아무길 100번지
				대표이사: 마루치
				고객상담: 국번없이 004 혹은 02-1234-1234 (평일 09:30~17:00)
			</address>
			<p class="copyright">
				COPYRIGHT (c) 2020 SK Telecom. All rights reserved.
			</p>
		</div>
	</div>
	<!-- 하단영역 끝-->
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>

	$(function(){
		
		//  아이디가 login_btn인 요소에 클릭 이벤트 등록
		$("#login_btn").bind("click", function(){
			
			// 현재 문서에서 아이디가 s_id와 s_pw인 요소의 값을 얻어낸다.
			var id = $("#s_id").val();
			var pw = $("#s_pw").val();
			
			if(id.trim().length < 1){
				//하나도 입력하지 않은 경우! 또는 공백만 입력한 경우
				alert("아이디를 입력하세요");
				$("#s_id").val("");
				$("#s_id").focus();
				return;
			}
			
			if(pw.trim().length < 1){
				//하나도 입력하지 않은 경우! 또는 공백만 입력한 경우
				alert("비밀번호를 입력하세요");
				$("#s_pw").val("");
				$("#s_pw").focus();
				return;
			}
			
			//console.log(id+"/"+pw);
			
			//비동기식 통신 수행!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			$.ajax({
				url: "login",
				type: "post",
				data: "m_id="+encodeURIComponent(id)+"&m_pw="+encodeURIComponent(pw),
				dataType: "json",
			}).done(function(data){
				//요청에 성공했을 때만 수행
				//alert(data.res); // data.res의 값이 1이면 정상 로그인이 된 경우!
									// 0이면 아이디 및 비밀번호가 틀린경우!
				if(data.res == "1"){
					alert(data.mvo.m_name+"님 환영합니다. 처음화면으로 이동합니다.");
					location.href="/";
				}else{
					alert("아이디 또는 비밀번호가 다릅니다.");
				}
			});
		});
	});
	



	function exe(){
		//var id = document.forms[0].id.value;
		var id = document.getElementById("s_id").value;
		var pw = document.getElementById("s_pw").value;
		if(id.length < 4){
			alert("아이디를 정확하게 입력하세요!");
			return;
		}
		if(pw.length < 4){
			alert("비밀번호를 입력하세요!");
			return;
		}
		document.forms[0].submit();
	}
</script>
</body>
</html>










