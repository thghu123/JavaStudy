<%@page import="mybatis.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id = "sb" class = "shop.bean.ShopBean" scope = "session"></jsp:useBean>
 	<jsp:setProperty property = "p_num" name ="sb" param = "prod_num"/> 
 <% 
 //이번에는 이름이 다르니까 *쓰면 안된다 카테고리는 이름이 같아 들어간 것, 받아온 파라미터와 sb의 멤버변수명이 다르기 때문
 
 //sb가 아직 살아있다.
 //위의 코드가 소환하는 코드이다. 속성이 3개있는데 전부 값이 동일해야한다. sb를 만들겠습니다. shopbean으로 session에
 //하나라도 다르면 새로 만든것이 된다, 이미 있으면 호출한다.
 
 //이제 p_lis에 온전히 자료가 존재한다.
 
 //====해당 제품 받기

 
	/* ProductVO vo =  */
	ProductVO vo = sb.getProduct(); 

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


 <style>
	table{
	width : 600px;
	font-size: 12px;
	border-collapse: collapse;
	border : 1px solid black;
	padding : 4px;
	margin : 0 auto; /* //자동 정렬 */
	
	}
	
	table tbody tr{
		border: 1px solid black;
	}
	table td{
		padding: 4px;
	}
	
	
</style> 
</head>
<body>
	<jsp:include page ="nav.jsp"/> 
	<table>
		   	<colgroup>
		   		<col width="40%">
		   		<col width="60%">
		   	</colgroup>
			<tbody>
			    <tr>
			        <td>제품Category</td>
			        <td> <%=vo.getCategory()%> </td>
			    </tr>
			    <tr>
			        <td>제품번호</td>
			        <td><%=vo.getP_num()%></td>
			    </tr>
			    <tr>
			        <td>제품이름</td>
			        <td><%=vo.getP_name()%></td>
			    </tr>
			    <tr>
			        <td>제품 판매사</td>
			        <td><%=vo.getP_company()%></td>
			    </tr>
			    <tr>
			        <td>제품가격</td>
			        <td>(할인가 : <%=vo.getP_saleprice()%> 원)</td>
			    </tr>
			    <tr>
			        <td colspan="2">제품설명: <%=vo.getP_content()%></td>
			    </tr>
			    <tr>
			        <td colspan="2" align="center"><img src ="images/<%=vo.getP_image_l()%>" ></td>
			    </tr>
			    <tr>
			        <td colspan="2"></td>
			    </tr>
			    <tr>
			        <td colspan="2" align="center">
			            <input type="button" value="장바구니에 담기" 
			            onclick="javascript:location.href='addProduct.jsp?p_num=<%=vo.getP_num()%>'"/> <!-- 제품번호 넘기자 -->
			            <input type="button" value="장바구니 보기" 
			            onclick="javascript:location.href='cartList.jsp'"/>
			        </td>
			    </tr> 
		    </tbody>   
		</table>
</body>
</html>