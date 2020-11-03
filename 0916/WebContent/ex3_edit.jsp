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


	<h1>사번 수정 결과</h1>
	
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
		String s_no = request.getParameter("s_no");
		String s_name = request.getParameter("s_name");
		String s_job = request.getParameter("s_job");
		String s_sal = request.getParameter("s_sal");
		//type = "text"들은 요소를 입력하지 않아도 ""공백이 들어온다.
		//input type = "text" 숨겨진 value = ""이 들어온다.
		out.println(s_no+", "+s_name+", "+s_job+", "+s_sal);
		
		//전달 받아온 걸 확인해보자
		
		/* out.println(value+", "+type); 파라미터 잘 넘어온지 확인*/
		//out 내장 객체 
		
		
		
	/* 	List<EmpVO> list = EmpDAO.search("0",s_no); */
		//정상적으로 처리가 되면 검색 결과가 없으면 list는 null을 가지지 않으므로 list.size()로 비교한다
		
		if(((EmpDAO.search("0",s_no)).size())>0){
			//list != null &&
					
			boolean ch = EmpDAO.updat(s_no, s_name, s_job, s_sal); //update를 하는 파트
			//공백이 그대로 들어간다.
			
			if(ch){
				out.println("수정완료");
			}else{
				out.println("수정실패");
			}
			
			//다시 받고 그 결과를 출력화면으로 나타낼 것
			List<EmpVO> list = EmpDAO.search("0",s_no);
			
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
				<td colspan = "3">그러한 사원은 없습니다.</td>
			</tr>
			<%
		}
		
		
		
		%>
		
		
		</tbody>		
				
	</table>
	
	</article>




</body>
</html>