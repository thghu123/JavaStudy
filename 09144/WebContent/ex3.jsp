<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<!-- 맨위에 %@가 있으면 지시자 태그로 page 써있으니 page 지시자, 현 페이지가 어떤거에요
라고 얘기해주는 하나의 선언구 , 언어가 자바 기반이다. 응답시 한글처리가 자동으로 되어있다. -->
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

 <!-- html 주석 -->
 <%-- jsp 주석, f11 소스보기를 하면 jsp 주석은 보이지 않는다. 
 	기본 문법
 	스크립트 요소 , 스크립트릿/출력/선언문
 	1) 스크립트릿 : 자바코드를 정의 할 때 사용 (지역 변수선언, 제어문, 등...)
 		<% String msg = "TEST";
 		if(msg.equals("ABC"))...;
 		%>이런거 할 때
 		
 	2) 출력문 : 서블릿의 out.print를 쓰려고할때
 		<%= msg%> ---> out.println(msg);
 	
 	3) 선언문 : 멤버변수를 선언하거나, 멤버 메서드를 선언할 때 사용
 		<%! String msg;
 		private void test(){
 			System.out.println(msg);
 		}
 		%>
 	
 	
 --%>
 
 
 <%!
 	int cnt = 100;//멤버변수 선언
 %>
 
 <h1>script factor Practice</h1>
 
 	<article>
 	<table border = "1" style = "width:260px">
 		<colgroup>
 			<col width = "80px"/>
 			<col width = "180px"/>
 		</colgroup>
 		
 		<thead>
 			<tr>
 				<th>번호</th>
 				<th>항목</th>
 			</tr>
 		
 		</thead>
 		<tbody>
 		<%
 		for(int i=0; i<cnt; i++){
 		%>
 		<!-- for문 안에 존재하는 html 영역 -->
 			<tr>
 				<td><%=i+1%></td>
 				<td>항목<%=100-i%></td>
 			</tr>
 		<%	
 		}
 		%>
 		</tbody>
 		
 	</table>
 	</article>
 
 
</body>
</html>