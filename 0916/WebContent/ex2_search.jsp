<%@page import="am.dao.EmpDAO"%>
<%@page import="am.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>


	<h1>결과</h1>
	
	<article>
	<table border = "1" style = "width:250px">
	
		<colgroup>
			<col width = "80px"/>
			<col width = "*"/>
			<col width = "100px"/>
		</colgroup>
		
		<thead>
			<th>사번</th>
			<th>이름</th>
			<th>직종</th>
		</thead>
		
		<tbody>
		<%
		request.setCharacterEncoding("utf-8"); //요청시 한글처리
		//전달해오는 파라미터 받기
		String value = request.getParameter("searchValue");
		String type = request.getParameter("searchType");
		
		//전달 받아온 걸 확인해보자
		
		/* out.println(value+", "+type); 파라미터 잘 넘어온지 확인*/
		//out 내장 객체 
		
		
		
		List<EmpVO> list = EmpDAO.search(type,value);
		//정상적으로 처리가 되면 검색 결과가 없으면 list는 null을 가지지 않으므로 list.size()로 비교한다
		
		if(list.size()>0){//list != null && 
			for(EmpVO vo : list){
			%>
			<tr>
				<td><%=vo.getEmpno() %></td>
				<td><%=vo.getEname() %></td>
				<td><%=vo.getJob() %></td>
			</tr>
			<%
			}
		}else{
			%>
			<tr>
				<td colspan = "3">검색결과가 없습니다.</td>
			</tr>
			<%
		}
		
		
		
		%>
		
		
		</tbody>		
				
	</table>
	
	</article>

</body>
</html>