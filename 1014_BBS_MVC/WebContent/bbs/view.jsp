<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
		
</style>

</head>
<body>
	<div id="bbs">
	<form method="post" >
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td>${vo.subject}</td>
				</tr>

				<tr>
					<th>첨부파일:</th>
					
					<td>
					
					<c:if test='${vo.file_name ne null }'>
					<a href="javascript:fDown('${vo.file_name}')"> <!-- 이렇게 주고 다운로드 할 수 있게 연결해주면됐다 예전에 했었다. -->
						${vo.file_name}
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
					<td colspan="2"> <!-- onclick 시 이벤트 발생시키면 되겠다 -->
						<input type="button" value="수정" onclick = "editBbs()"/>
						<input type="button" value="삭제" onclick = "delBbs()"/>
						<input type="button" value="목록" onclick = "goBack()"/>
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
	
	댓글들<hr/><!-- 있으면 반복문으로 출력해주자 -->
	
	<c:forEach var = "cvo" items = "${vo.c_list}">
	
		<div>
			이름:${cvo.writer } &nbsp;&nbsp;
			날짜:${cvo.write_date }<br/>
			내용:${cvo.content }
		</div>
	</c:forEach>
	
	</div>
	
	<form name = "frm1" method = "post" action = "Controller">
	
		<input type = "hidden" name="type"/>
		<input type = "hidden" name="cPage" value = "${param.cPage}"/>
		<!-- 포워드 돼서 온거 바로 오 ㄹ수 있다. 절대 그냥 쓰면 안된다. param 넣어야한다. request에 또 담아야한다 action에서 -->
		<input type = "hidden" name="b_idx" value = "${vo.b_idx }"/>
		<input type = "hidden" name="f_name"/>

		
	
	
	</form>
	<script>
	function goBack(){
		document.frm1.type.value = "list";//안바궈도 상관없겠지만 일단 해놔야한다.
		document.frm1.submit();
		//listaction을 수행하러 갈것이다.
	}
	function editBbs(){
		document.frm1.type.value = "edit"; //controller 가 type에 맞는 action 찾는다.
		document.frm1.submit();
	}
	
	function delBbs(){
		document.frm1.type.value = "del"; //controller 가 type에 맞는 action 찾는다.
		document.frm1.submit();
	}
	
	
	
	</script>
	
</body>
</html>












