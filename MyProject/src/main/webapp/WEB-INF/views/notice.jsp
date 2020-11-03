<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" 
href="css/common.css"/>
<link type="text/css" rel="stylesheet" 
href="css/login.css"/>

<style type="text/css">
	body{ font-size: 12px }
	table{
		border-collapse: collapse;
		width: 500px;
	}
	table th, table tbody td{
		border: 1px solid black;
		padding: 4px;
	}
	table thead tr:first-child{ line-height: 40px; }
	table thead td:last-child{ text-align: right; }
	table caption { text-indent: -9999px; height: 0; }
	
	.h70{
		height: 70px;
		line-height: 70px;
		text-align: center;
	}
</style>


</head>
<body>
<div id="wrap">
	<!-- 상단 영역 -->
	<jsp:include page="header.jsp"/>
	<!-- 상단 영역 끝 -->
	<!-- 콘텐츠 영역 -->
	<div id="contents_sub">
		<h1 class="sub_title tit02">공지사항</h1>
		<table>
		<caption>메모목록 보기</caption>
		<colgroup>
			<col width="60px"/> <!-- 번호 -->
			<col width="*"/> <!-- 내용 -->
			<col width="100px"/> <!-- 글쓴이 -->
			<col width="100px"/> <!-- 글쓴날짜 -->
		</colgroup>
		<thead>
			<tr>
				<td colspan="2">
					<form action="Controller" method="post">
						<input type="hidden" name="type" value="search"/>
						<select id="searchType" name="searchType">
							<option value="0">글쓴이</option>
							<option value="1">내용</option>
							<option value="2">날짜</option>
						</select>
						<input type="text" id="searchValue" name="searchValue"/>
						<input type="button" value="검색" onclick="search(this.form)"/>
					</form>
				</td>
				<td colspan="2">
					<input type="button" value="추가" id="add_btn" onclick="goAdd()">
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>글쓴이</th>
				<th>날짜</th> 
			</tr>
		</thead>
		<tbody>
	<c:if test="${list ne null }"> <%-- list가 null이 아닐 때 --%>
		<c:forEach items="${list }" var="mvo">
			<tr>
				<td>${mvo.idx }</td>
				<td><a href="">${mvo.content }</a></td>	
				<td>${mvo.writer }</td>
				<td>${mvo.reg_date }</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${list eq null }">
			<tr>
				<td colspan="4" class="h70">등록된 내용이 없습니다.</td>
			</tr>
	</c:if>	
		</tbody>	
	</table>
	</div>
	<!-- 콘텐츠 영역 끝-->
	<!-- 하단영역 -->
	<div id="footer">
		<div class="footer_area">
			<ul class="foot_guide">
				<li><a href="">개인정보취급방침</a></li>
				<li><a href="">회원이용약관</a></li>
				<li><a href="">책임한계와 법적고지</a></li>
				<li><a href="">이메일 무단수집 거부</a></li>
			</ul>
			<address>
				서울특별시 무슨구 아무길 100번지
				대표이사: 마루치
				고객상담: 국번없이 004 혹은 02-1234-1234 (평일 09:30~17:00)
			</address>
			<p class="copyright">
				COPYRIGHT (c) 2020 SK Telecom. All rights reserved.
			</p>
		</div>
	</div>
	<!-- 하단영역 끝-->
</div>


<script>
	function search(frm){
		//유효성 검사(생략...)
		
		frm.submit();
	}
</script>
</body>
</html>










