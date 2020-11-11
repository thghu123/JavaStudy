<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	#chart_div{
		width : 900px;
		height: 400px;
	}
	</style>
<link type="text/css" rel="stylesheet" 
href="css/common.css"/>
<link type="text/css" rel="stylesheet" 
href="css/login.css"/>

<link type="text/css" rel="stylesheet" 
href="css/bbs.css"/>


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
		<h1 style="font-size: 30px; color: #000; margin-bottom: 20px;">전기 자동차 충전소</h1>
		<div>
			<table summary="게시판 목록">
				<caption>지역별 전기자동차 충전소 위치</caption>
	
				<tbody>
			
					<div id = "chart_div"></div>
					<div id = "addr"></div>
					
					
			
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
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function(){ //amchart에서는 am4core.ready로 시작하지만 j쿼리 쓰기에 이렇게 시작만 하자
		
		
		$.ajax({
			url : "http://127.0.0.1:5000/evCar",
			type : "POST",
			dataType : "json"
			
		}).done(function(data){
			viewChart(data); //json 아래 함수에 던진다
/* 			var str = "";
			for(var i = 0; i<data.length; i++)
				str += "<div>"+data[i].addr+"</div>";
			
			$("#addr").html(str); */
		});
	
		

	});
	
	//함수 분할한다.
	function viewChart(json_data){//json을 던질 걸 가지고 차트로 뿌려주는 역할을 한다. 

		
		
		
		
		am4core.useTheme(am4themes_animated);
		
	//차트 생성
	var chart = am4core.create("chart_div",am4charts.XYChart); 
			//어디에 이 차트를 만들 것인가??기본적으로 id값을 넣는다
			//두번째 인자는 무슨 차트를 만드냐이다.
			//================================================================================
			chart.data = json_data;
	
			//x축 설정
			var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
			categoryAxis.dataFields.category = 'city';
			
			categoryAxis.renderer.labels.template.fontSize = 9;
			//폰트사이즈 지정
			categoryAxis.renderer.minGridDistance = 40; //이걸해야 빼곡하게 나온다.
			
			//y축 설정
			var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
			
			//시리즈 생성
			   var series = chart.series.push(new am4charts.ColumnSeries())
			    series.dataFields.valueY = 'counts'
			    // df3 = df2.city.value_counts().rename_axis('city').reset_index(name = 'counts') 
			    // 값을 json에서 name으로 count로 넣어줬다
			    series.dataFields.categoryX = 'city';
			    series.name = name
			    
			    series.columns.template.tooltipText = "[bold]{valueY}[/]" //그래프의 숫자 출력
		/* 	    
				series.events.on("hidden", arrangeColumns);
			    series.events.on("shown", arrangeColumns); 
			 	*/
			    series.columns.template.fill = am4core.color('#6e6eff');
			 	//색 지정
			    series.columns.template.fillOpacity = 0.6;//마우스 가르켰을 때 글씨나오는 데 불투명하게 나온다.
			    series.columns.template.stroke = am4core.color('#00ff00');
		
	}
	

</script>
</body>
</html>










