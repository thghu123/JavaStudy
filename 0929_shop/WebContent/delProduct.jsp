<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <jsp:useBean id="cart" class="shop.bean.Cart" scope = "session"></jsp:useBean>
     <%
     String pnum = request.getParameter("p_num");
     boolean chk = cart.delProduct(pnum);
     response.sendRedirect("cartList.jsp");
     
     %>

