<%@page import="mybatis.vo.EditVO"%>
<%@page import="mybatic.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	//get parameter for login, u_id pw
        request.setCharacterEncoding("utf-8");
        
        String u_id = request.getParameter("u_id");
        String u_pw = request.getParameter("u_pw");
        
        //memberDAO를 통해 login을 검증한다. select id and pw 조건 반환
        
    	EditVO vo = MemberDAO.login(u_id, u_pw);
        
        //vo가 null 이 아니라면 id와 비밀번호를 잘 입력한 경우이다
        
        if(vo != null){
        	//이때 uvo를 세션에 저장
        	session.setAttribute("uvo", vo);	//pw빼고 다있다
        	response.sendRedirect("left.jsp");
        }else{
       /*   System.out.print("로그인 실패");  */
    	 out.println("<script>alert('로그인실패'); location.href='left.jsp';</script>");
       	 
        }
        
        
        //제대로 입력했다면 left,jsp 에서 get uvo가 있다. 아니라면 null값이 넘어간다.
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