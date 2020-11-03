<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 검색 결과가 나오는 곳 그런 회원은 없습니까 까지-->
<table>

	<tbody>
	<c:if test="${list ne null}">
			<c:forEach items="${list}" var = "mvo" > 
				<tr>  
					<td>${mvo.rent_mem}</td>
					<td><a href="">${mvo.b_name}</a></td>	
					<td>${mvo.rent_date}</td>
				</tr>
			</c:forEach>
	</c:if>
	</tbody>
	
	</table>
</body>
</html>