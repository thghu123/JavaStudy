<%@page import="mybatic.dao.MemoDAO"%>
<%@page import="mybatis.vo.MemoVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	table tfoot td{ text-align: right; }
	table caption { text-indent: -9999px; height: 0; }
</style>
</head>
<body>
<%
	//한글이 넘어오지 않으니까 처리는 안해도된다. 
	//getpara의 반환형이 String 이기에 String으로만 받는다.
	
	String idx = request.getParameter("idx");//해당 파라미터 없으면 null값이 들어온다
	MemoVO mem;
	//if(idx != null){ //이거 왜 안들어가지?, else 처리를 안해줘서 그런가 else면 다시 redirect로 맨 아래에서 list로 돌아가면된다.
	mem = MemoDAO.getView(idx);
	//}
%>
	<h1>내용보기</h1>
	<form action="memoEdit_ok.jsp" method="post">
	<input type="hidden" name="idx" value="2"/>
		<table>
			<caption>내용보기 테이블</caption>
			<colgroup>
				<col width="100px"/>
				<col width="*"/>
			</colgroup>
			<tbody>
				<tr>
					<input type="hidden" id="idx" name="w_idx" value="<%=mem.getIdx()%>"/>
					<th><label for="writer">글쓴이</label></th>
					<td><input type="text" id="writer" name="writer" value="<%=mem.getWriter()%>"/></td>
					<th><label for="w_date">날짜</label></th>
					<td><input type="text" id="w_date" name="w_date" value="<%=mem.getReg_date()%>"/></td>
					
				</tr>
				<tr>
					<th><label for="content">내용</label></th>
					<td colspan="3"><textarea rows="5" cols="45" name="content" ><%=mem.getContent()%></textarea></td>
					
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
					<input type="button" value="수정" id="btn" onclick="sendData(this.form)"/>
				</tr>
			</tfoot>
		</table>
	</form>
	
	<script type="text/javascript">
		function sendData(frm) {
			var writer = frm.writer.value;
			var content = frm.content.value;	
			if(writer.trim().length <1){
				alert("글쓴이를 입력하세요");
				frm.writer.focus();
				return;
			}
			if(content.trim().length <1){
				alert("내용을 입력하세요");
				frm.content.focus();
				return;
			}
			frm.submit();
		}
	</script>
</body>
</html>