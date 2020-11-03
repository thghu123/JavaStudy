<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 외부CSS파일 연결 -->
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/main.css"/>


</head>
<body>
	<div id="wrap">
		<!-- 상단 영역 -->
		<div id="header">
			<div class="txt_right">
			<c:if test="${sessionScope.mvo == null }">
				<span><a href="login">로그인</a></span>
			</c:if>
			<c:if test="${sessionScope.mvo != null }">
				<span><a href="javascript:logout()">로그아웃</a></span>
			</c:if>
			</div>
			<h1>SK Together</h1>
			<ul class="gnb">
				<li><a href=""><span class="menu m01">기브유</span></a></li>
				<li><a href="/goData"><span class="menu m02">위드유</span></a></li>
				<li><a href=""><span class="menu m03">스마트 전통시장</span></a></li>
				<li><a href=""><span class="menu m04">BRAVO!</span></a></li>
				<li><a href="bbs"><span class="menu m05">SKT와 사회공헌</span></a></li>
				<li class="end"></li>
			</ul>
		</div>
		<!-- 상단 영역 끝 -->
		<!-- 콘텐츠 영역 -->
		<div id="contents">
			<div class="main_img">
				<a href="">
					<img src="img/@img00.png"/>
				</a>
			</div>
			
			<div class="main_news"> <!-- 뉴스들(3개)을 하나로 묶어 놓는 영역 -->
				<div class="news_type01 fl">
					<p class="title">기브유 후원참여</p>
					<a href="" class="news_src">
						<span class="thum_img">
							<img src="img/@img01.png" alt="기사사진"/>
						</span>
						<span class="ellip subject">
							난청이지만 피아니스트가 되고픈
							한별이의 이야기 입니다.
						</span>
						<span class="writer">by ttogether</span>
						<span class="more_view">자세히보기</span>
						<span class="fclear"></span>
					</a>
				</div>
				
				<div class="news_type01 cen">
					<p class="title">기브유 후원금 쓰임현황</p>
					<a href="" class="news_src">
						<span class="thum_img">
							<img src="img/@img02.png" alt="기사사진"/>
						</span>
						<span class="ellip subject">
							레티하씨 가정에 희망의 집 선물
						</span>
						<span class="writer">by 한국해비타트</span>
						<span class="more_view">자세히보기</span>
						<span class="fclear"></span>
					</a>
				</div>
				
				<div class="news_type01 fr">
					<p class="title">기브유 나눔영상</p>
					<a href="" class="news_src">
						<span class="thum_img">
							<img src="img/@img03.png" alt="기사사진"/>
							<span class="btn_play" title="동영상 재생">
								<a href=""></a>
							</span>
						</span>
						<span class="ellip subject">
							1리터의 생명을 선물해주세요.
						</span>
						<span class="writer"><a href="">by hungersaver</a></span>
						<span class="more_view"><a href="">자세히보기</a></span>
						<span class="fclear"></span>
					</a>
				</div>
				
			</div>
			<!-- ======================================================================= -->
			<div class="main_board">
				<!-- 공지사항 -->
				<div class="board_type01 fl">
					<p class="title">공지사항</p>
					<span class="more_view"><a href="Controller?type=notice">더보기</a></span>
					<ul class="notice">
					<c:if test="${ar ne null }">
						<c:forEach items="${ar}" var="vo">
						<li>
							<a href="" class="ellip">${vo.content }</a>
							<span class="date">${fn:substring(vo.reg_date, 0, 10) }</span>
						</li>
						</c:forEach>
					</c:if>
					<c:if test="${ar eq null }">
						<li>등록된 공지가 없습니다.</li>
					</c:if>
					</ul>
				</div>
				<!-- 공지사항 끝-->
				<!-- 트위터 -->
				<div class="board_type01 cen">
					<p class="title">T-Together트위터</p>
					<span class="more_view"><a href="">더보기</a></span>
					<div class="article">
						<span class="thum_img">
							<img src="img/@img04.png"/>
						</span>
						<span class="src">
							[캠페인] 햇살이 따스한 가을날이 다가옵니다.
							그리고 여름이 지나갑니다.
						</span>
						<div class="fclear"></div>
					</div>
				</div>
				<!-- 트위터 끝-->
				<!-- 배너 -->
				<div class="board_type01 fr">
					<span class="banner b01">
						<a href="">
							T-Together와 함께할 기관/단체를 모십니다.
						</a>
					</span>
					<span class="banner b02">
						<a href="">
							T-Together이제는 모바일로 함께해요.
						</a>
					</span>
				</div>
				<!-- 배너 끝-->
			</div>
		</div>
		<!-- 콘텐츠 영역 끝 -->
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
	
	<form action="Controller" method="post" name="frm">
		<input type="hidden" name="type"/>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
	<script>
		function logout(){
			//현재 문서에서 이름이 frm인 폼을 알아내어 그 안에 있는 요소들 중
			// 이름이 type인 요소의 값(value)을 "logout"으로 지정한다.
			//document.frm.type.value = "logout";
			
			//document.frm.submit();
			
			$.ajax({
				url: "logout",
				dataType: "json",
			}).done(function(data){
				//요청에 성공했을 때만 수행
				//alert(data.res); // data.res의 값이 1이면 정상 로그인이 된 경우!
									// 0이면 아이디 및 비밀번호가 틀린경우!
				
				console.log("data.res:"+data.res);
				
				if(data.res == "0"){
					alert("정상적으로 로그아웃이 처리되었습니다.");
					location.href = "/";	
				}
				
			});
		}
	</script>
</body>
</html>






    