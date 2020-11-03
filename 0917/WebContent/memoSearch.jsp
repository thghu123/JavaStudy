<%@page import="mybatic.dao.MemoDAO"%>
<%@page import="mybatis.vo.MemoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- jsp를 의미하는 페이지 지시자 -->
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
</head>
<body>
	<h1>검색 목록</h1>
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
					<form action="memoSearch.jsp" method="post">
						<select id="searchType" name="searchType">
							<option value="0">글쓴이</option>
							<option value="1">내용</option>
							<option value="2">날짜</option>
						</select>
						<input type="text" id="searchValue" name="searchValue" />
						<input type="button" value="검색"onclick = "search(this.form)"/>
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

		<%
			//요청시 한글 처리
				
				request.setCharacterEncoding("utf-8");
				String type = request.getParameter("searchType");
				String value = request.getParameter("searchValue");
				//jsp에서의 연산은 최대한 자제하자.
				List<MemoVO> list = MemoDAO.searchMemo(type, value);
				
				if(list.size()>0){//list가 null이 일단 아니니까 size로 비교한다.
			for ( MemoVO mem : list){
		%>
				<tr>
					<td><%= mem.getIdx() %></td>
					<td><a href="memoView.jsp?idx=<%=mem.getIdx()%>"><%= mem.getContent() %></a></td>	
					<td><%= mem.getWriter() %></td>
					<td><%= mem.getReg_date() %></td>
				</tr>
		
		
		
			<%
			}//for문 끝
			
		}else{
			//목록이 없는 경우
			%>
			
			<tr>
				<td colspan="4" class ="h70">등록된 메모가 없습니다.</td>
			
			</tr>
			<%
			
			
			
		}

		%>


		</tbody>	
	</table>
	
<script type="text/javascript">
	function goAdd(){
		location.href = "memoAdd.jsp";
	}
	
	
	function search(f){
		var v = f.searchValue.value;
		if(v.trim().length<1){
			alert("검색할 단어를 입력하세요");
			v = "";
			f.searchValue.focus();
			//document.getElementById("searchValue").focus
			return;
		}
		
		f.submit();
	}
</script>
</body>
</html>