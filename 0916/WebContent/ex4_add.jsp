<%@page import="am.dao.EmpDAO"%>
<%@page import="am.vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");
	
	String s_no = request.getParameter("s_no");
	String s_sal = request.getParameter("s_sal");
	String s_name = request.getParameter("s_name");
	String s_job = request.getParameter("s_job");
	
	//넘어온 파라미터들을 저장할 VO객체를 생성한다
	
	EmpVO vo = new EmpVO();
	//각 파라미터 값들이 공백을 제거하고 길이가 0보다 큰 경우에만 저장합니다.
	
	if(s_no.trim().length()>0)
		vo.setEmpno(s_no);
	
	if(s_name.trim().length()>0)
		vo.setEname(s_name);
	
	if(s_job.trim().length()>0)
		vo.setJob(s_job);
		
	if(s_sal.trim().length()>0)
		vo.setSal(s_sal);
	
	//유효성 검사 DAO에서 한 작업을 jsp에서 한것
	
	boolean ch = EmpDAO.add(vo);
	
//	boolean ch = EmpDAO.addr(vo); //일단 만들어두고 밑줄 클릭하면 만들어줄까한다.
	
	if(ch){
		out.println("저장 완료");
	}else
		out.println("저장 실패");
		
	

	
	
%>


</body>
</html>