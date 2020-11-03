<%@page import="mybatis.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page = "nav.jsp"/>

<style type="text/css">
.empty{
	height : 50px;
	line-height: 50px;
	font-size : 14px;
}

</style>

</head>
<body>

<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");
	

%>

<!-- 메뉴바를 가져오기 위해 배운 것을 쓰자 -->




	<jsp:useBean id = "sb" class = "shop.bean.ShopBean" scope = "session"></jsp:useBean>
	<!-- 
	여기서 객체를 생성해서 쓸거다를 의미한다. 유지 지속시간을 설정하고,shop.bean.shopbean도 만든다, 명령어 집합을 의미
	
	위는 객체를 생성하고 변수이름은 sb 이 객체를 사용할 수 있는 범위를 현페이지로 하겠다
	sb라는 객체는 현페이지를 벗어나면 사라진다. 범위 순 page, request(포워드하면 sb사용가능), session
	(접속 끊을 때까지), application(==서버 라는 의미로, 웹어플리케이션으로 응용프로그램 사이트 꺼지면 사라짐)  
	-->
	<jsp:setProperty property="*" name="sb"/> 
	<!-- 현 페이지로 넘어올 때 전달되는 파라미터가 카테고리 하나, 이것이 sb즉 shopBean의 카테고리라는
	멤버변수에 자동으로 들어갑니다. shopBean또한 연결되어있다. shopBean에 searchproduct로 배열받는다 -->
	
	<%
	//mybatis 환경을 이용해서 제품 진열대를 채운다
	sb.searchProduct();
	
	//채워진 진열대를 현재 페이지에서 표현하기위해 가져옵니다.
	ProductVO[] list = sb.getP_list();
	//위를 테이블로 채우면 된다
	
	
	%>
 	
	
	
<table align="center" width="600" border="1" 
 style="border-collapse:collapse;font-size:8pt" bordercolor="navy"  
 cellpadding="4" cellspacing="0">
  
  <thead>
    <tr bgcolor="#dedede">
        <th width="10%">제품번호</th>
        <th width="10%">이미지</th>
        <th width="35%">제품명</th>
        <th width="20%">제품가격</th>
        <th width="25%">비고</th>
    </tr>
</thead>


<tbody>
<%
	if(list != null && list.length>0){
		
		for(ProductVO n : list){
%>
    <tr align="center">
        <td><%=n.getP_num() %></td>
        <td><img src="images/<%=n.getP_image_s()%>" width="100" height="95"><%=n.getP_image_s()%></td>
        <td>
            <a href="product_content.jsp?prod_num=<%=n.getP_num()%>">
                <%=n.getP_name()%>
            </a>
        </td>
        <td>
            할인가 : <%=n.getP_saleprice() %>원<br>
            <font color="red">(할인율 : <%=n.getPersent() %>%)</font>
        </td>
        <td>
            시중 가격 : <%=n.getP_price()%>원
        </td>
    </tr>
 <%
		}
	}else{
%>  
	<tr align="center">
        <td colspan = '5' class = "empty">등록된 제품이 없습니다.</td>
    </tr>
<%
	}
%> 

    
 </tbody>
</table>




</body>
</html>


