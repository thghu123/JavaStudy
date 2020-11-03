<%@page import="mybatis.vo.EditVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous">
</script>
<!-- 로그인 확인 httpsession에 uvo로 저장된 것이 있다면? 로그인을 한 것이다 -->
<style type="text/css">
	.btn{
		width: 70px;
		height: 20px;
		text-align: center;
		padding:0px;		
	}
	.btn a{
		display: block;
		width: 100%;
		padding: 4px;
		height: 20px;
		line-height: 20px;
		background: #27a;
		color: #fff;
		border-radius: 3px;
		text-decoration: none;
		font-size: 12px;
		font-weight: bold;
	}
	.btn a:hover{
		background: #fff;
		color: #27a;
		border: 1px solid #27a;
	}
	
	#s_id, #s_pw{
		width: 80px;
		border: 1px solid #27a;
		border-radius: 3px;
		padding: 4px;
	}
	div#log_fail, div#log_suc{
		width: 170px;
		border: 1px solid #27a;
		border-radius: 3px;
	}
	.hide{ display: none; }
	.show{ display: block; }
	.txt_r{ padding-left: 10px;}
</style>
</head>
<body>

<%
	//로그인 여부 확인
/*  	session.setAttribute("uvo",null);  */ 
	Object obj = session.getAttribute("uvo"); 
	
	if(obj == null){ //처음  화면이 나와야한다.
%>
    
    
	<div id="log_fail" class="">
		
		<form action="" method="post">
			<table>
				<colgroup>
					<col width="50px"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<td><label for="s_id">ID:</label></td>
						<td>
							<input type="text" id="s_id" name="u_id"/>
						</td>
					</tr>
					<tr>
						<td><label for="s_pw">PW:</label></td>
						<td>
							<input type="password" id="s_pw" name="u_pw"/>
						</td>
					</tr>
					<tr>
						<td>
							<p class="btn">
								<a href="javascript:exe()">
									로그인
								</a>
							</p>							
						</td>
						<td class="txt_r">
							<p class="btn">
								<a href="javascript:reg()">
									회원가입
								</a>
							</p>							
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
	
	<%
				}else{ 
				//obj가 있는 경우이므로 우리가 login에서 uvo이라는 이름으로 session에 저장할 당시 MemVO로 저장했다.
				EditVO vo = (EditVO)obj; //자식 개체로 넘어가면된다. instance는 안바뀐다. 이때 casting을 사용한다.
				// 실제로 사용하기 위해 오브젝트를 memverVO로 형변환해서 사용한다
				
				//단점: up casting은 다형성으로 자동으로 되지만 casting은 형변환해줘야하고, 시스템 처리가 오래걸린다. 그래서 제네릭 타입이 생긴것
			%>
		
	
	
	<div id="log_suc" class="">
	

		<p><%=vo.getM_name()%>님 환영</p>
		<p class="btn">
		 	<a href="logout.jsp">로그아웃</a> 
			
		<!-- 	 <a href="javascript:logout()">로그아웃</a>  -->
		</p>
		<p class="btn">
			<a href="javascript:memo()">메모장</a>
		</p>
		<p class="btn">
			<a href="javascript:myDisk()">MyDisk</a>
		</p>
	</div>
	

	<form>
		<input type="hidden" name="res" id="res" value=""/>
	</form>
	
	<% }%>
	
	<script>

	
	
		$(function(){
			var res = $("#res").val();
			if(res == "1")
				alert("저장 완료!");
			else if(res == "0")
				alert("저장시 오류가 발생했습니다.");
		});
		
		function exe(){
			var id = $("#s_id");
			var pw = $("#s_pw");
			
			if(id.val().trim().length <= 0){
				alert("아이디를 입력하세요!");
				id.focus();
				return;
			}
			if(pw.val().trim().length <= 0){
				alert("비밀번호를 입력하세요!");
				pw.focus();
				return;
			}
			//요청할 서버경로를 변경한다.
			document.forms[0].action = "login.jsp";
			document.forms[0].submit();//서버로 보내기
		}
		
		function reg(){
			//현재 index.jsp문서의 안이고, 현재 문서의 경로를
			//변경하지 않고, 오른쪽 화면을 변경하려 한다.
			//parent라는 명령으로 화면을 분활시킨 부모 창으로 
			//이동하여 그곳에 등록된 right라는 창의 경로를 변경한다.
			parent.right.location.href="reg.jsp";
		}
		
		function myDisk(){
			parent.right.location.href="disk/myDisk.jsp"
		}	
		
/* 		function failalert(){
			alert("로그인 실패");
		} */
	</script>
</body>
</html>




