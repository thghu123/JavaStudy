<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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


<link type="text/css" rel="stylesheet" 
href="css/common.css"/>
<link type="text/css" rel="stylesheet" 
href="css/login2.css"/>
</head>
<body>
<div id="wrap">
	<!-- 상단 영역 -->

	<jsp:include page = "header.jsp"/>
	<!-- 변수를 공유하고 싶으면 지시자를 쓰는 게 좋다. 어디서든 쓸 수 있다. -->
	
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
						<input type = "hidden" name = "type" value = "search"/>
						
						<select id="searchType" name="searchType">
							<option value="0">글쓴이</option>
							<option value="1">내용</option>
							<option value="2">날짜</option>
						</select>
						<input type="text" id="searchValue" name="searchValue"/>
						<input type="button" value="검색" onclick = "search(this.form)"/>
					</form>
				</td>
				<td colspan="1">
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


	<c:if test="${list ne null}"> <!-- 같이 않다!= 고로 not equal == ne -->
			<c:forEach items="${list}" var = "mvo" > <!-- 반복문 돌리자 , 변수는 그냥 임시 변수니 달라브레이스 없이-->
				<!-- 달라브레이스를 달면 현문서에서 해당 변수를 찾고 없으면 request에서 아니면 session에서 찾고 없으면 에러 -->
				<tr>  <!-- vo대로 진행한다. -->
					<td>${mvo.idx}</td>
					<td><a href="">${mvo.content}</a></td>	
					<td>${mvo.writer}</td>
					<td>${mvo.reg_date}</td>
				</tr>
			</c:forEach>
	</c:if>

	<c:if test = "${list eq null}">	
			<tr>
				<td colspan="4" class ="h70">등록된 내용가 없습니다.</td>
			
			</tr>
	</c:if>
	
			<form action="delmemo.jsp" method="post">
				<input type="text" id="delnum" name="delnum"/>
				<div>
					<input type="button" value="삭제" id="del_btn" onclick="doDel(this.form)">
				</div> 
			</form>
		</tbody>	
	</table>
	</div>
	<!-- 콘텐츠 영역 끝-->
	<!-- 하단 영역 -->
	<jsp:include page = "footer.jsp"/>
	<!-- 하단 영역 끝 -->
</div>

<script>
	function search(frm){
		
		
		//유효성 검사 생략
		
		frm.submit();
		
		
	} 

</script>

</body>
</html>