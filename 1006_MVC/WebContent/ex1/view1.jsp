<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		//mvc 환경은 뷰페이지로 이동시 포워드 되므로
		//request에 저장한 값들을 이용할 수 있다
		//session.setAtribute()은 세션 저장, request.setAtibute()
		//저장한다는 의미는 객체를 의미. request에는 객체를 다 저장할 수 있다. 그래서 Obj 파일로 빼내는 것
		Object obj = request.getAttribute("msg");

		String msg = null;
		//obj가 null이 아닐때 String 으로 형변환을 시킨다.
		if(obj != null){
			msg = (String)obj; //강제현변환
		}
%>
<h1><%=msg%></h1>
</body>
</html>