<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    
    String name  = request.getParameter("name");
    String year  = request.getParameter("year");
    
    if(name == null || year == null){
    	//강제 페이지 이동
    	//response.sendRedirect("ex3_forward.jsp");
    	//req res를 새로만들어서 이동한다
    	%>
    	
		<jsp:forward page = "ex3_forward.jsp"/>    	
		
    	<%//위는 애초에 name year 값이 있으니 실행안되는 부분이다.
    	//req,res는 계속해서 쓰레드로 사용자 들어오면 생성되는 데 중요하는 것은 req,res는 
    	//값이 들어갈 수 있다. session은 계속 유지되는 정보를 저장하고 login정보
    	//그외 반짝 쓰고 사라질 것들은 request, response에 넣는다. 매번 초기화되니까
    	//요청시마다 초기화된다.
    	
    	//다시 갔다가 왔을 때 또 초기화한다.
    	//sendredirect로 다시 갔다가 오면 req,res는 사라진다.
    	//포워드는 갔다가 오지않는다. 위와는 다르다. 다른 페이지로 이동하는 것 뿐이다.
    	//그래서 포워드는 req,res가 다시 만들어지지않는다. res,req 가지고 간다.
    	
    	//이게 sendredirect와 포워드의 차이이다.
    	//포워드는 req,res가 초기화가 되지 않는다.
    	
    	//그렇게 계속 포워드로 다른 페이지로 갔다가 sendredirect가 되면 초기화가된다.
    	
    	
    	
    }else{
    	//name와 year가 들어온 상태이다.
    	//나이구하기 = 현재 년도를 구한다
    	Calendar now = Calendar.getInstance();
    	int cYear = now.get(Calendar.YEAR);//2020
    	//MONTH는 구하고 +1 일자는 day of month로 구한다
    	
    	int bYear = Integer.parseInt(year); //생년
    	
    	int age = cYear - bYear;//나이 구함
    	%>
    	<jsp:forward page = "ex3_forward.jsp">
    		<jsp:param value = "<%=age%>" name = "age"/>
   		</jsp:forward>
    	
    	<%
    	
    	/* <!-- 해당값을 age로 전달해주라는 의미이다 --> */
    	//request.getpara(name)하면 어디 다른 데를 가도 사용이 가능하다.
    	//한번 파라가 저장이 되고 다른 페이지를 가도 포워드로 그대로 갔으니 쓸 수 있다.
    	//하지만 센드 리다이렉트는 전으로 돌아가고 간다. 고로 초기화된다
    
    	//그런데 지금가면 age없어서 에러가 나오므로 안에 값을 넣어주면 그것도 유지된다
		/* 이걸 받는 ex3_forward.jsp는 파라미터를 3개를 받는다 */
    	//전부 포워드로 이동하면 계속 쓸 수 있다.
    	
    	
    	//바로 앞의 페이지에서 잔달된 파라미터 name, year를 담은
    	//request가 그대로 유지되면서 age가 추가되어 ex3_forward.jsp로 다시 forward된다
    	//가게되면 파라미터 3개가 유지된다. 여러개의 파라미터를 이전으로 담아 줄 수 있다.
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>