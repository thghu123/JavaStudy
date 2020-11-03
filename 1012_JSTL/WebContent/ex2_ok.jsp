<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Map"%>
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
	request.setCharacterEncoding("utf-8");
	String s_id = request.getParameter("s_id");
	session.setAttribute("s_id", s_id);
	
	Map<String,String> map = new Hashtable<String,String>();
	map.put("id", s_id);
	map.put("name", "홍길동");
	session.setAttribute("map", map);
	
	
	%>

	<h1>${param.s_id }</h1>
	<h1>${param.s_pw }</h1>
	<h1>${paramValues.s_phone[0] }-
	${paramValues.s_phone[1] }-
	${paramValues.s_phone[2] }</h1>
	
	
	<form action = "ex2_res.jsp" class = "frm">
	<input type = "button" value = "다음페이지" onclick = "submit(this.form)"/>
	<!-- 위에있는 건 다 날아가고 session에 들어간 값만 이동한다. -->
	</form>
	<input type = "button" value = "다음페이지2" onclick = "javascript:location.href='ex2_res.jsp?pw=${param.s_pw}'"/>
	<!-- 이렇게 쓰는 방법도 있다. -->	
	
	<script type="text/javascript">
	function submit(){
		frm.submit();
		//혹은 위의 폼을 없에고 이동만 하는 거면 location.href = "ex.res.jsp?s_pw=${param.s_pw}"
	}
	
	
	
	</script>
	
	
</body>
</html>