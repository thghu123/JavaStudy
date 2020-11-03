<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String pnum = request.getParameter("p_num");

	//카트에 제품을 추가	
	//usebean을 해서 shopbean과 cart를 두랃 가져와야한다
	//cart의 add product만 부르면되는 데, pnum은 있고 shopbean만 있으면 된다
	//모두 이미 있으므로 중복 생성이다
	%>
	
	<jsp:useBean id="sb" class="shop.bean.ShopBean" scope = "session"></jsp:useBean>
	<jsp:useBean id="cart" class="shop.bean.Cart" scope = "session"></jsp:useBean>
	
	<%
	//카트의 addproduct를 부르고 인자 shopbean과 pnum을 넘겨주자
	cart.addProduct(sb, pnum);
	//이러면 장바구니에 담겨진다
	response.sendRedirect("product_content.jsp?prod_num="+pnum);
	//다시 돌아온다.

%>