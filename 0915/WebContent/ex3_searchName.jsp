<%@page import="pm.dao.EmpDAO"%>
<%@page import="pm.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>사원이름검색 결과</h1>
	<article>
		<table border = "1" style = "width : 250px">
			<colgroup>
				<col width = "80px"/>
				<col width = "*"/>
			</colgroup>
			
			<thead>
			
				<th>사번</th>
				<th>이름</th>
			</thead>	
			<tbody>
				<%
				
				//요청시 한글처리
				/* request.setCharacterEncoding("utfr-8"); */
				String name = request.getParameter("s_name");
				
				
				
				//empDAO를 통하여 표현할 정보를 list<EmpVO>를 받아낸다.
				List<EmpVO> list = EmpDAO.getSearchName(name);//static이니까 생성할 필요는 없다
				 if(list != null)
				 {
					 for(EmpVO vo : list){
				%>
						<tr>
							<td><%=vo.getEmpno() %></td>
							<td><%=vo.getEname() %></td>
						
						</tr>
						 
				<%
					 }//for끝
					 
					 
				 }//if끝
				 %>


			</tbody>	
			
			
		</table>
	</article>
</body>
</html>