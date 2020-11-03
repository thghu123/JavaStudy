<%@page import="am.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%  
	//처리만 하는 ok jsp
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");
	//각 파라미터 받기
	
	String  id = request.getParameter("id");
	String  pw = request.getParameter("pw");
	
	
	
	//DB 검증... 생략
	//세션 처리 HttpSession session = request.getSession이 내장 객체로 있으니 할 필요없다.
	
	/* 	
	session.setAttribute("mem_id", id);
	session.setAttribute("mem_pw", pw);
	session.setAttribute("mem_name", "마루치");
	 */
	
	 //서버에서 가져와야하는 데 일단 있다고 생각
	//똑같은 사람의 정보를 여러 Code로 작성하고, mem_name도 매번 바꿔야한다. ==> 문제
	//이럴 땐 ArrayList 이용, 자바의 모든 객체는 인식이 된다.
	
	//이럴때 쓰는 게 VO , 자바니까 자바리소스
	
	MemVO vo = new MemVO();
	vo.setId(id);
	vo.setName("마루치");
	vo.setEmail("maru@naver.com");
	//한사람의 정보를 memvo에 모두 저장했다. vo 객체를 세션에 저장한다
	
	session.setAttribute("uvo", vo);
	
	
	response.sendRedirect("ex1_login.jsp");
	
	//이제 다시 login.jsp로 넘어가게된다.
	
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>