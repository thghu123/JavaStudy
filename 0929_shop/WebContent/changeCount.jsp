<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cart" class="shop.bean.Cart" scope = "session"></jsp:useBean>
<% 
	/* int q, p_num만 있으면된다 */
	String p_num = request.getParameter("p_num");
	String q = request.getParameter("count");
	
	if(p_num != null && q!=null){
		int qnum = Integer.parseInt(q);
		cart.changeCount(p_num, qnum);
	}
	response.sendRedirect("cartList.jsp");
%>

    
    