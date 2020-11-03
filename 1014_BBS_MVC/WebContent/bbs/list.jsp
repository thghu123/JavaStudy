<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
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
	
	#bbs table th,#bbs table td {
	    text-align:center;
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
	
	/* paging */
	
	table tfoot ol.paging {
	    list-style:none;
	}
	
	table tfoot ol.paging li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ol.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #00B3DC;
	    color:#2f313e;
	    font-weight:bold;
	}
	
	table tfoot ol.paging li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #ff4aa5;
	    background:#ff4aa5;
	    color:white;
	    font-weight:bold;
	}
	.empty{height: 50px;}
		
</style>
</head>
<body>
	<div id="bbs">
		<table summary="게시판 목록">
			<caption>게시판 목록</caption>
			<thead>
				
				
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
				
				
				
			</thead>
			
			<tfoot>
                      <tr>
                          <td colspan="4">
                          
                          
                          
                          
${p_code}                          
                          
                          
                          
                          
<!--이부분을 지우고 위의 html 코드를 부여 위에는 sessionscope해주는 게 좋다. 
                               <ol class="paging">
                                 

<li><a href="#">&lt;</a></li>

	<li class="now">1</li>
         
	<li><a href="#">2</a></li>


 
		<li><a href="#">&gt;</a></li>
	
                              </ol> -->
                              

                          </td>
						  <td>
							<input type="button" value="글쓰기"
			onclick="javascript:location.href='Controller?type=write'"/>
						  </td>
                      </tr>
                  </tfoot>
			<tbody>
		
		
		<c:if test = "${ar ne null}">			
			<c:forEach items = "${requestScope.ar}" var = "arr" varStatus="st">	
			
				
				<tr>
					<td>${rowTotal - st.index}</td>
					<td style="text-align: left">
						<a href="Controller?type=view&cPage=${nowPage}&b_idx=${arr.b_idx}">
					${arr.subject}
					</a></td>
					<td>${arr.writer}</td>
					
					<c:if test = "${vo.write_date ne null}">
					<td>${fn:substring(arr.write_date,0,10)}</td> 
					</c:if>
					
					<c:if test = "${vo.write_date eq null}">
					<td>${fn:substring(arr.write_date,0,10)}</td> 
					</c:if>	
									
					<td>${arr.hit}</td>
				</tr>
			
			
			
			</c:forEach>
			
		</c:if>	

		<c:if test = "${ar eq null}">			
				<tr class= "empty">
					<td colspan="5">
					저장된 도서 목록이 없습니다.
					</td>
				</tr>
						
		</c:if>
		
		
		

			</tbody>
		</table>
		
	</div>
</body>
</html>
