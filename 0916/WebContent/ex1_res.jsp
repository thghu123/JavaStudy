<%@page import="am.dao.EmpDAO"%>
<%@page import="am.vo.EmpVO"%>
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

	<h1>사원이름 검색 결과</h1>
<article>
		<table border = "1" style = "width : 250px">
			<colgroup>
				<col width = "80px"/>
				<col width = "*"/>
			</colgroup>
			
			<thead>
			
				<th>사번</th>
				<th>이름</th>
				<th>직종</th>
				
			</thead>	
			<tbody>
				<%
				
				//요청시 한글처리
				/* request.setCharacterEncoding("utfr-8"); */
				String no = request.getParameter("s_no");
				
				
				
				//empDAO를 통하여 표현할 정보를 list<EmpVO>를 받아낸다.
				List<EmpVO> list = EmpDAO.getSearchNo(no);//static이니까 생성할 필요는 없다
				
				if(list != null && list.size() != 0)
					//null이 안오고 공백이 올수도 있다. 단 EmpVO vo 는 null이 온다.
					//고로 list일때는 사이즈로 받을 것
				 {
					 for(EmpVO vo : list){
				%>
						<tr>
					
							<td><%=vo.getEmpno() %></td>
							<td><%=vo.getEname() %></td>
							<td><%=vo.getJob() %></td>
						</tr>
						 
				<%
					 }//for끝
					 
					 
				 }else{
					 
					 //if끝
				 
				 %>
				 			<tr>
									<td colspan = "3">그런 사람 없습니다.</td>	
							</tr>
				<%
				} 
				%> 


			</tbody>	
			
			
		</table>
	</article>


</body>
</html>