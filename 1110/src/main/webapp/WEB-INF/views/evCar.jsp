<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#chart_div{
		width : 900px;
		height: 300px;
	}
	
</style>
</head>
<body>

	<h1>전기충전소 위치</h1>
	<div id = "chart_div">
	</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<script type="text/javascript">
	$(function(){ //amchart에서는 am4core.ready로 시작하지만 j쿼리 쓰기에 이렇게 시작만 하자
		
		
		$.ajax({
			url : "http://127.0.0.1:5000/evCar",
			type : "POST",
			dataType : "json"
			
		}).done(function(data){
			viewChart(data); //json 아래 함수에 던진다
		});

	});
	
	//함수 분할한다.
	function viewChart(json_data){//json을 던질 걸 가지고 차트로 뿌려주는 역할을 한다. 

		am4core.useTheme(am4themes_animated);
		
	//차트 생성
	var chart = am4core.create("chart_div",am4charts.XYChart); 
			//어디에 이 차트를 만들 것인가??기본적으로 id값을 넣는다
			//두번째 인자는 무슨 차트를 만드냐이다.
			
			chart.data = json_data/* [{
				"city":"서울특별시",
				"score":"80"
			},{
				"city":"서울특별시",
				"score":"80"
			},{
				"city":"서울특별시",
				"score":"80"
			}]; */
			//차트를 그릴 정보를 줘야한다. []안에 json표기법으로 표현할 정보를 준다.
	
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