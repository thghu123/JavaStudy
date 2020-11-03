<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link type="text/css" rel="stylesheet" 
href="css/goData.css"/>  -->
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
		<h1 style="font-size: 30px; color: #000; margin-bottom: 20px;">SKT와 사회공헌</h1>
		<div class="bbs_area" id="bbs">
			<table summary="게시판 목록">
				<caption>내용</caption>				
				<tbody>
					<tr>
						<td>제목: ${vo.title }</td>
					</tr>
					<tr>
						<td><img src = "${vo.firstimage }"/></td>
					</tr>
						
					<tr><td>x좌표: ${vo.mapx }</td></tr>
					<tr><td>y좌표: ${vo.mapy }</td></tr>
					<tr><td>연락처: ${vo.tel }</td></tr>
					<tr><td>주소1: ${vo.addr1 }</td></tr>
					<tr><td>주소2: ${vo.addr2 }</td></tr>				
					<tr>
						<td>
							<div id="map" style="width:800px;height:400px;"></div>
							
						</td>
					</tr>				
					
				</tbody>
			</table>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=365d7701f7740996ffbc53aff17bebd5"></script>


<script>

	$(function(){
		//================kakaomap======================
			//어디를 들어가도 본사 주소가 나온다. 아래의 위도 경도부를 수정할 수 있다.
			//문서를 보면 mapx가 경도 mapy 위도 
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(${vo.mapy}, ${vo.mapx}),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${vo.mapy}, ${vo.mapx}); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		

		var iwContent = '<div style="padding:5px;">${vo.title} <br><a href="https://map.kakao.com/link/map/${vo.title},33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${vo.title},33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(${vo.mapy}, ${vo.mapx}); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
		
		
		
		
		//===============================================
		
		
		
		$("#write_btn").bind("click", function(){
			console.log("DGDGDGDGDG");
			$.ajax({
				url: "write",
				dataType: "json"
			}).done(function(data){
				// data 안에  chk라는 변수가 0이면 로그인이 필요한 상황이다.
				if(data.chk == "0"){
					alert("로그인이 필요합니다.");
				}else if(data.chk == "1"){
					//  글쓰기 화면으로 이동!
					location.href=data.url;
				}
			});
		});
	});
	
</script>
</body>
</html>










