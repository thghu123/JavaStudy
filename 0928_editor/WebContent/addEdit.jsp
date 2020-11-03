<%@page import="mybatic.dao.editDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	request.setCharacterEncoding("utf-8");
        
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        if(title == null){
    %><jsp:forward page = "ex1_form.jsp"/><%
    	}else{
        	
        	boolean cnt = editDAO.addEdit(title, content);
        	
        	if(cnt){System.out.print("입력성공");}else{System.out.print("입력실패");}
    %><jsp:forward page = "ex1_form.jsp"/><%
    }
    
    
    %>
    