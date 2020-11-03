<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/style.css"/>


</head>
<body>

	<header>
	<jsp:include page="ex1_nav.jsp"></jsp:include> <!-- 사이에 아무것도 없으면 그냥 닫자 -->
	<!-- include 액션 요소는 포함된 jsp 문서가 컴파일된 결과만 포함한다
		즉 html결과만 포함시키기 때문에 안에서 사용되는 변수들을 현재 페이지에서 사용할 수 없음
		include 지시자를 쓰면 그게 가능하다.

	 -->
	<!-- 동일 경로라면 이름만 적어주면된다 -->
	</header>
	<article>
		<h1>첫번째 페이지</h1>
		<!-- 상단 바에는 다 메뉴있어야하는 데 이렇게 다 코딩해둘 순 없다 action태그로 연결을 한다 ==> 관리가 편하다-->
		
	</article>
</body>
</html>