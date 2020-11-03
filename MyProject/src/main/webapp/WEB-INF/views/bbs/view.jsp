<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" 
href="css/common.css"/>
<link type="text/css" rel="stylesheet" 
href="css/login.css"/>

<link type="text/css" rel="stylesheet" 
href="css/bbs.css"/>


</head>
<body>
<div id="wrap">
	<!-- 상단 영역 -->
	<div id="header">
		<h1>SK Together</h1>
		<ul class="gnb">
			<li><a href=""><span class="menu m01">기브유</span></a></li>
			<li><a href=""><span class="menu m02">위드유</span></a></li>
			<li><a href=""><span class="menu m03">스마트 전통시장</span></a></li>
			<li><a href=""><span class="menu m04">BRAVO!</span></a></li>
			<li><a href=""><span class="menu m05">SKT와 사회공헌</span></a></li>
		</ul>
	</div>
	<!-- 상단 영역 끝 -->
	<!-- 콘텐츠 영역 -->
	<div id="contents_sub">
		<h1 style="font-size: 30px; color: #000; margin-bottom: 20px;">사회공헌 보기</h1>
		<div class="bbs_area" id="bbs">
			<form method="post" name="frm">
				<input type="hidden" name="cPage" value="${param.cPage }"/>
				<table summary="게시판 글쓰기">
					<caption>게시판 글쓰기</caption>
					<tbody>
						<tr>
							<th>제목:</th>
							<td>${vo.subject }</td>
						</tr>
		
						<tr>
							<th>첨부파일:</th>
							<td>
							<c:if test="${vo.file_name ne null }">
								<a href="javascript:fDown('${vo.file_name }')">
									${vo.file_name }
								</a>
							</c:if>
							</td>
						</tr>
						
						<tr>
							<th>이름:</th>
							<td>${vo.writer }</td>
						</tr>
						<tr>
							<th>내용:</th>
							<td>${vo.content }</td>
						</tr>
						
						<tr>
							<td colspan="2">
							<c:if test="${vo.writer eq mvo.m_name }">
								<input type="button" value="수정" onclick="editBbs()"/>
								<input type="button" value="삭제" onclick="delBbs()"/>
							</c:if>
								<input type="button" value="목록" onclick="goBack()"/>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<form method="post" action="ans_write.jsp">
				이름:<input type="text" name="writer"/><br/>
				내용:<textarea rows="4" cols="55" name="comm"></textarea><br/>
				비밀번호:<input type="password" name="pwd"/><br/>
				
				
				<input type="hidden" name="b_idx" value="${vo.b_idx }">
				<input type="hidden" name="index" value=""/>
				<input type="submit" value="저장하기"/> 
			</form>
			
			댓글들<hr/>
			<c:forEach var="cvo" items="${vo.c_list }">
				<div>
					이름:${cvo.writer } &nbsp;&nbsp;
					날짜:${cvo.write_date }<br/>
					내용:${cvo.content }
				</div>
		
			</c:forEach>
		</div>
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	
	function goBack(){
		location.href="bbs?cPage=${param.cPage}"
	}
	
	function editBbs(){
		document.frm.action = "edit";
		document.frm.submit();
	}
	
	function fDown(fname){
		// FileDownload라는 서블릿 호출!
		location.href="FileDownload?dir=/resources/upload&filename="+encodeURIComponent(fname);
		
		// get방식 한글처리를 하기 위해서는 톰켓의 server.xml에서
		// <Connector port="8080" protocol="HTTP/1.1" ..... URIEncoding="UTF-8" 추가
		// <Connector port="8009" protocol="AJP/1.3" ..... URIEncoding="UTF-8" 추가
	}
</script>
</body>
</html>










