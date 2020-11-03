<%@page import="mybatic.dao.MemberDAO"%>
<%@page import="mybatis.vo.EditVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
       	//id 한글 아니니까 한글처리는 안해도되고
          //아이디가 한글이 없으므로 요청시 한글 처리 생략
          //u_id 라는 파라미터 받기
          String u_id = request.getParameter("u_id");
          
          //받은 id를 인자로 전달하여 member_t에 존재하는 지 알아보자
          
          EditVO vo = MemberDAO.searchId(u_id);
          //이때 vo가 null이면 아이디가 없다는 의미 -> 고로 회원가입시 이용할 수 있다는 의미
          
          if(vo == null){//비동기 식은 jason표기법으로 전달한다. 아래의 형태가 제이슨 표기법
       %>
	   {"msg":"등록되지 않은 ID"}
	   
	   <%	   
   }else{
	   
	   %>
	   {"msg":"등록된 ID"}
	   <%
   }
   
   //밑에 html은 다 지워야만 한다.
   %>
   
   