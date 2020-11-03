<%@page import="mybatis.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        
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
    
    <jsp:include page = "nav.jsp"/>
        <table width="600" border="1" align="center" 
        style="border-collapse:collapse;font-size:8pt" cellspacing="0" 
               cellpadding="4">
               
               
               <thead>
               <tr>
                   <td colspan="6">:: 장바구니 내용</td>
               </tr>
               <tr bgcolor="#dedede">
                   <th>제품번호</th>
                   <th width="25%">제품명</th>
                   <th>단가</th>
                   <th>수량</th>
                   <th>금액</th>
                   <th>삭제</th>
               </tr>
				</thead>
				
		<tbody>
		
			<jsp:useBean id="cart" class = "shop.bean.Cart" scope = "session"></jsp:useBean>
		<%
			int total = 0;//총 결제 금액
			
			//카트에 저장된 모든 제품들을 배열로 얻어낸다.
			ProductVO[] ar = cart.getList(); //카트안에 getList가 존재한다
			//비어있을 수도 있다
			if(ar != null){
			for(ProductVO pvo : ar){
		%>
		
            <tr align="center">
                <td><%=pvo.getP_num() %></td>
                <td><%=pvo.getP_name() %></td>
                <td>
                    정가:<%=pvo.getP_price() %><br>
                    <font color="red">
                        세일가격:<%=pvo.getP_saleprice() %>
                    </font>
                </td>
                <td>
                    <!-- 수량 조정 폼 -->
                    <%-- <%=pvo.getQuant() %> --%>
                    <form action = "changeCount.jsp" method = "post">
                    	<input type = "hidden" name = "p_num" value ="<%=pvo.getP_num()%>">
                    	<input value = "<%=pvo.getQuant()%>" name = "count" size = "2"/><!-- size는 박스의 대략의 크기를 의미, 이게 없으면 너무 크다. -->
                    	<input type = "submit" value ="변경"/>
                    </form>
                    <!------------------>
                </td>
                <td><%=pvo.getTotalPrice()%>원</td>
                <td>
                    <input type="button" value="삭제" 
                    style="border:1 solid black;cursor:pointer" 
					onclick="javascript:location.href='delProduct.jsp?p_num=<%=pvo.getP_num()%>'">
                </td>
            </tr>
	
		<%
		//반복문이 끝나기 전에 결제 금액 누적을 시켜야한다. 한번 돌때마다
		 total += pvo.getTotalPrice();//이래야 아래에 잘 출력된다.
		
			}
			}else{
		
		
		%>
		
		
            <tr align="center">
                <td colspan="6">
                    <b>장바구니가 비었습니다.</b>
                </td>
            </tr>
        <%
			}
        %>
            <tr>
            
                <td colspan="5" align="right">총 결재액 : <%=total%>원</td> <!-- 맨위에있는 total이라는 걸 쓰자 -->
                <td></td>
            </tr>
            

           	</tbody> 
        </table>
        
    </body>
</html>







