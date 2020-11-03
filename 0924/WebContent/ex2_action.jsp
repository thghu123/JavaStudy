<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//요청시 한글 처리
    request.setCharacterEncoding("utf-8");
    
    
    
    %>
    
    <jsp:useBean id = "vo" class = "pm.vo.DataVO">
    <!-- dataVO vo = new DataVO();를 한것을 의미한다. 객체 생성을 의미한다.-->
    </jsp:useBean>
    
    
<%--     <jsp:setProperty property = "m_id" name = "vo" param = "m_id"/> --%>
    <!-- 속성은 곧 변수를 의미한다. param은 이 페이지로 들어오는 parameter id의미-->
    <!-- setter과도 같다. form에서 받은 m_id를 vo 객체의 m_id에 넣어주라는 의미이다. -->
    
<%--     <jsp:setProperty property = "m_name" name = "vo"/> --%>
    <!-- param은 생략이 가능하다. 왜냐하면 property와 param의 이름이 같기 때문이다. 같은 경우메만 가능하다. -->
    
    <!-- 결과: 되긴하는 데 request로 받는 거나 이거나 뭐가 좋은 지 모르겠다. 일일히 지정도 해줘야하고
    
     -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty property = "*" name = "vo"/><!--  vo 에전부 매칭시키라는 의미이다. 배열 숫자도 다 들어가느냐 라는 의미이다!! 의미있다. int여서 연산도 가능한가
	한방에 80개 넘게도 그냥 받을 수 있다. 파일첨부를 하면 form multipart request 지정해야한다. 이건 그래서 파일 첨부를 하는 순간 이거는 사용 못한다.-->
 	<h1> <%=vo.getM_id()%> ,<%=vo.getM_name()%>, <%=vo.getPhone()[0]%>-<%=vo.getPhone()[1]%>-<%=vo.getPhone()[2]%>,<%=vo.getAge()+1 %> </h1> 
 	<!-- 잘된다. 훨씬 쉬워보인다.-->
</body>
</html>