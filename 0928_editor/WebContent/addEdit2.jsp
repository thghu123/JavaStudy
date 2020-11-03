<%@page import="mybatic.dao.editDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
    	request.setCharacterEncoding("utf-8");
        %>
    <jsp:usebean id = "vo" class = "mybatis.vo.EditVO" scope = "page"/>
	<jsp:setProperty property = "*" name = "vo"/>
    
    <%
    
     %><jsp:getProperty property = "vo" name = "content"/>
    <% //80몇개 말고 이렇게 하면 쉽게 가져올 수 있다.
     
     %>
     
