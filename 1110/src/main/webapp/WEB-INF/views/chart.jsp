<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#chart_div{
		width : 700px;
		height: 300px;
	}
	
</style>
</head>
<body>

	<h1>AMCHART TEST</h1>
	<div id = "chart_div">
	</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<script type="text/javascript">
	$(function(){ //amchart에서는 am4core.ready로 시작하지만 j쿼리 쓰기에 이렇게 시작만 하자
		am4core.useTheme(am4themes_animated);
		
	//차트 생성
	var chart = am4core.create("chart_div",am4charts.XYChart); 
			//어디에 이 차트를 만들 것인가??기본적으로 id값을 넣는다
			//두번째 인자는 무슨 차트를 만드냐이다.
			
			chart.data = [{
				"교과목":"java",
				"score":"10"
			},{
				"교과목":"spring",
				"score":"101"
			},{
				"교과목":"python",
				"score":"102"
			}];
			//차트를 그릴 정보를 줘야한다. []안에 json표기법으로 표현할 정보를 준다.
	
			//x축 설정
			var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
			categoryAxis.dataFields.category = '교과목';
			
			//y축 설정
			var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
			
			//시리즈 생성
			   var series = chart.series.push(new am4charts.ColumnSeries())
			    series.dataFields.valueY = 'score'
			    series.dataFields.categoryX = '교과목';
			    series.name = name
			    
			    series.columns.template.tooltipText = "[bold]{valueY}[/]" //그래프의 숫자 출력
		/* 	    
				series.events.on("hidden", arrangeColumns);
			    series.events.on("shown", arrangeColumns); 
			 	*/
	})

</script>


</body>
</html>