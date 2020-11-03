<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 외부 css 파일 연결 -->
<link type = "text/css" rel="stylesheet" href="css/common.css"/>
<link type = "text/css" rel="stylesheet" href="css/main.css"/>
<!-- <link type = "text/css" rel="stylesheet" href="resources/css/main.images"/> -->
<!-- 
실행시 드래그해서 선택이 되면 img 안되면 background로 올린 것
img는 우클릭해서 다른 이름으로 저장할 수 있다. -->
<link type = "text/css" rel="stylesheet" href="css/main.css"/>

<!-- 0826 이제 아래 배경과 함께 이미지를 잡을 계획 중단 메인부
	div가 편하니까 그걸로 3개의 이미지를 나눠보자
 -->



</head>
<body>

			<div id = "wrap">
					<!-- 상단영역 -->
					<div id = "header">
							<div class = "txt_right">
								<c:if test="${!login_chk}"> <!-- false일때 로그인이 떠야하므로/ if문은 불변 -->
									<span><a href="login">로그인</a></span>
								</c:if>	
								
								<c:if test = "${login_chk}">
									<span><a href="logout">로그아웃</a></span>
								</c:if>
							</div>
						
						<h1>SK Together</h1>
						<!-- **처리 :  h1태그만나면 back image url, text-indent -9999 -->
						<!--h1을 안넣어주면 청각이용자가 타이틀이라 생각안한다 img로 바로넣으면 -->
					
						<!-- 메뉴는 ul아니면 ol -->				
						<ul class = "gn">
							<li><a href = "">
							<span class = "menu m1 ">기브유</span>
							</a></li>
							<li><a href = "">
							<span class = "menu m2 ">위드유</span>
							</a></li>
							<li><a href = "">
							<span class = "menu m3 ">스마트 전통시장</span>
							</a></li>
							<li><a href = "">
							<span class = "menu m4 ">BRAVO</span>
							</a></li>
							<li><a href = "">
							<span class = "menu m5 ">SKT와 사회공헌</span>
							</a></li>
							<!-- 기존의 li 안에 a태그에 class 다는 게 아니라 span 태그 안에 지정 -->
							<!-- class를 여러개 지정할 수 있다. 다중 클래스, 2-3개는 기본-->
							<li class = "end"></li>
							
							
						
						
						</ul>
						
					
					</div>
					

					<!-- 상단영역 끝 -->
			<!-- contents 영역 -->
			<div id = "contents">
			
			
			
				<div class="main_img">
				
					<a href="">
						<img src = "img/@img00.png"/>	
						<!-- 딱 달라붙지 않으니까 main css 에서 처리한다. -->
					</a>
				</div>	
				
				
				<!-- 0826이미지 3개인데 다 묶어야하니까 -->
				<div class = "main_news"> <!-- 뉴스들을 하나로 묶어 놓는 영역 -->
				
					<div class = "news_type01 fl"> 
						<p class = "title">기브유 후원참여</p>
						<a href = "" class = "news_src">  
						<span class = "thum_img">
						<img src = "img/@img01.png" alt = "기사사진"/> <!-- 이미지 하나, alt는 이미지 설명 -->
						
						</span>
						<span class = "ellip subject">난청이지만 피아니스트가 되고픈 한별이의 이야기입니다.</span>
						<span class = "writer"><a href ="">bby ttogether</a></span>
					
						<span class = "more_view"><a href ="">자세히보기</a></span>
						<span class = "fclear"></span>
						<!-- 인라인레벨 : 한줄로 나열 -> css부여하자 class도 부여 -->
						</a> <!-- 혹시 링크 있을 수 있기에 -->
					</div>
					
					<div class = "news_type01 cen"> 
						<p class = "title">기브유 후원금 쓰임현황</p>
						<a href = "" class = "news_src">  
						<span class = "thum_img">
						<img src = "img/@img02.png" alt = "기사사진"/> <!-- 이미지 하나, alt는 이미지 설명 -->
						
						</span>
						<span class = "ellip subject">레티하씨 가정에 희망의 집 선물.</span>
						<span class = "writer"><a href ="">bby 한국해비타트</a></span>
				
						<span class = "more_view"><a href ="">자세히보기</a></span>
						<span class = "fclear"></span>
						<!-- 인라인레벨 : 한줄로 나열 -> css부여하자 class도 부여 -->
						</a> <!-- 혹시 링크 있을 수 있기에 -->
					</div>
					
					<div class = "news_type01 fr"> 
						<p class = "title">기브유 나눔영성</p>
						<a href = "" class = "news_src">  
						<span class = "thum_img">
						
							<img src = "img/@img03.png" alt = "기사사진"/> <!-- 이미지 하나, alt는 이미지 설명 -->

							<span class = "btn_play" title = "동영상 재생"> 
								<a href = "https://www.youtube.com"> </a> <!-- 유튜브 채널 경로 지정 -->
							</span>

						</span>
						<span class = "ellip subject">1리터의 생명을 선물해주세요.</span>
						<span class = "writer"><a href ="">by hungersaver</a></span>
						<!-- 플롯 클리어로 화면 안정화 -->
						<span class = "more_view"><a href ="">자세히보기</a></span>
						<span class = "fclear"></span> <!-- 해당부를 매번 float 에 쓰니까 한줄이 내려간다. -->
						<!-- 인라인레벨 : 한줄로 나열 -> css부여하자 class도 부여 -->
						</a> <!-- 혹시 링크 있을 수 있기에 -->
					</div>
					<!-- 자리 확인을 위해서 미리 복사해서 이미지 글만 수정하기. -->
				<!-- 타이틀을 변경 text- indent와 이미지를 넣자. -->
				</div>
				<!-- =================================== -->
				
				
				
				<!-- li tag나 table을 쓰든 상관없겠다 -->				
	<div class= "main_board"> <!-- 큰 감싸는 틀 -->
	
	<!-- 메인 보드를 너비를 지정하고 그안의 내용의 위치를 지정하자 -> main.css -->
				
				<!-- 공지사항 -->
				<div class= "board_type01 fl">
				
					<p class = "title"> 공지사항 </p> 
					<!-- 이미지가 알아서 들어온다. title을 넣었으니까, 공지사항이 나오려면 더 당기자 -->
					<span class = "more_view"> <a href = "Controller?type=notice" >더보기</a> </span> 
					<!-- 공지사항 너비만 지정되면 오른쪽으로간다 모 뷰가 오른쪽으로 이동시키니까 -->
					<!-- 이 밑을 테이블로 만드냐 리스트로 만드냐 -->
					
			<!-- ****************************************더보기뷰 추가***************************************** -->
					
					<ul class= "notice">
					
					<!-- 
					<c:if test="${list ne null}"> 
						<c:forEach items="${list}" var = "mvo" >
						
						<li>
						<a href = "" class = "ellip subject">${mvo.content}</a>
						<span class = "date">${mvo.reg_date}</span>
						</li>
						</c:forEach>
					</c:if>
					
					-->
					
					<!--  begin="1" end="3" 인덱스 1부터 시작 3까지 내보내자 0시작 --><!-- 같이 않다!= 고로 not equal == ne -->
					<!-- 강사님 풀이 -->
					
					
					<c:if test="${ar2 ne null}"> 
						<c:forEach items="${ar2}" var = "mvo2" >
						
						<li>
						<a href = "" class = "ellip subject">${mvo2.content}</a>
						<span class = "date">${fn:substring(mvo2.reg_date,0,10)}</span>
						</li>
						</c:forEach>
					</c:if>
				
					<!-- 같이 않다!= 고로 not equal == ne -->
					<!--  begin="1" end="3" 인덱스 1부터 시작 3까지 내보내자 0시작 -->
					
 					<c:if test = "${list eq null}">	
						<li>
							<span>등록된 내용이 없습니다.</span>
						</li>
					</c:if> 

					</ul>
					
			<!-- ***************************************************************************************** -->		

				</div>
					
				<!-- 공지 끝 -->
				
				<!-- 트위터 -->
				<div class= "board_type01 cen">
					<p class = "title"> T-Together 트위터 </p> 
					
					<span class = "more_view"> <a href = "" >더보기</a> </span> 
					<!-- 크게 아티클 잡고 이미지 내용 따로 생성해서 포진 -->
					
					<div class = "article"> 
						<span class = "thum_img">
							<img src ="img/@img04.png"/>
						</span>
						<span class = "src">
							[캠패인] 햇살이 따스한 가을날이 다가옵니다. 
							그리고 여름이 지나갑니다.
						</span>
						
						<div class = "fclear"></div>
						<!-- 예 덕분에 클리어가 되고 float은 다른 것에 영향을 안준다. -->
					</div> 
				
				
				</div>
				<!-- 트윗 끝 -->
				
				<!--  배너  -->
				<div class= "board_type01 fr">
					<span class = "banner b01">
						<a href = "">
						T-together 와 함께할 기관/단계를 모십니다.
						</a>
					</span>
					
					<span class = "banner b02">
						<a href = "">
						T-together 이제는 모바일로 함께해요.
						</a>
					</span>
				
				</div>
				<!-- 마우스를 클릭하면 이동이되는 배너 -->
				
				
				<!--  배너 끝 -->
				
				
				
				
				
				</div>
		
			</div>
			
			<!-- contents 끝 -->
			<!-- contents 사이즌 970이기에 이 이상은 설정 안된다
			그런데 foot 제일 하단은 이보다 크기에 다른 공간이다. -->
			
			<!-- 하단영역 -->
			<div id ="footer">
				<div class = "footer_area">
					<ul class="foot_guide"> <!-- 줄이 4줄이니까 ul 로 구현 -->
						<li><a href = "">개인정보 취급방침</a></li>
						<li><a href = "">회원 이용 약관</a></li>
						<li><a href = "">책임한계와 법적 고지</a></li>
						<li><a href = "">이메일 무단수집 거부</a></li>
					</ul>	
					<address>
					서울특별시 관악구 서울2길 100번지 101동 101호 
					대표이사 : 나루토
					고객상담 : 국번없이 004 혹은 02-1234-1234(평일 09:00~17:00)
					</address>
				
				
					<p class = "copyright">COPYRIGHT (c) 2020 SK Telecom. All rights reversed.</p>
				</div>
			</div>
			<!-- 매 페이지마다 존재하므로 main보다는 coommon.css에 넣는 게 좋다 -->
			<!-- 하단영역 끝 -->
			
	</div>
			
	<form action = "Controller" method = "post" name = "frm">
		<input type = "hidden" name = "type"/>
	</form> <!-- 이안에 logout을 집어 넣어주고 보내면 끝 -->

	<script type="text/javascript">
	
	function logout(){
		//현재 문서에 이름이 frm 인 폼을 찾아내 type에 logout 넣고 보낸다
		document.frm.type.value = "logout";
		//logout이 안으로 들어간다.
		document.frm.submit();
	}
	
	
	</script>

</body>
</html>