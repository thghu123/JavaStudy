<%@page import="mybatic.dao.MemberDAO"%>
<%@page import="mybatis.vo.EditVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
        	String id = request.getParameter("m_id");
                EditVO vo = MemberDAO.searchId(id);

            	if(vo == null){
        %>
    			{"res":"사용가능","status":"1"}
    		<%		
    			}else{
    				//사용할 수 없는 id
    		%>
    			{"res":"사용불가능","status":"0"}
    		<%		
    			}
    		%>    
