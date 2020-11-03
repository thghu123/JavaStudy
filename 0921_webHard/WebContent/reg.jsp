<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"/>
</script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> j쿼리 들어가있다. -->
<style>
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
	
	div#wrap{
		width: 400px;
		margin: 30px auto;
	}
	
	table th, table td{
		padding: 3px;
	}
	table tbody td>input{
		width: 120px;
		border: 1px solid #27a;
		border-radius: 3px;
		padding: 4px;
	}
	.txt_r{ text-align: right; }
	.phone{ width: 50px; }
	
	.success{ color: #00f; font-weight: bold; font-size: 11px;}
	.fail{ color: #f00; font-weight: bold; font-size: 11px; }
	
	div#box{
		display: inline-block;
		width: 65px;
		height: 20px;
		padding: 0;
		margin: 0;
		margin-left: 3px;
	}
</style>


</head>
<body>
	<div id="wrap">
		<form action="registry.jsp" method="post">
			<table>
				<colgroup>
					<col width="100px"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th><label for="s_id">ID:</label></th>
						<td>
							<input type="text" id="s_id" name="id"/>
							<div id="box"></div>
						</td>
					</tr>
					<tr>
						<th><label for="s_pw">PW:</label></th>
						<td>
							<input type="text" id="s_pw" name="pw"/>
						</td>
					</tr>
					<tr>
						<th><label for="s_name">NAME:</label></th>
						<td>
							<input type="text" id="s_name" name="name"/>
						</td>
					</tr>
					<tr>
						<th><label for="s_addr">ADDR:</label></th>
						<td>
							<input type="text" id="s_addr" name="addr"/>
						</td>
					</tr>
					<tr>
						<th><label for="s_phone">PHONE:</label></th>
						<td>
							<input type="text" id="s_phone" name="phone" class="phone"/>
							- <input type="text" name="phone" class="phone"/>
							- <input type="text" name="phone" class="phone"/>
						</td>
					</tr>
					<tr>
						<th>
							<label for="s_email">EMAIL:</label>
						</th>
						<td>
							<input type="text" id="s_email" name="email"/>
						</td>
					</tr>					
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" >
							<p class="btn">
								<a href="javascript:reg()">
									회원가입
								</a>
							</p>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		
		$(function(){
			
			$("table th").css("text-align","right");
			
			$("#s_id").on('keyup',function(){
				//alert("**");
				// 사용자가 입력한 문자값이 현재 4자 이상일 때만
				// 서버로 보낸다.
				var str = $("#s_id").val();
				
				//str의 값에서 공백들을 정규표현식 등을 
				//이용하여 제거하는 작업이 필요하다.
				
				if(str.trim().length > 3){
					$.ajax({
						url: "checkId.jsp",
						data:"u_id="+encodeURIComponent(str),
						type: "POST"
					}).done(function(str){
						//도착함수
						$("#box").html(str);
					});
				}else{
					$("#box").html("");
				}
			});
		});
		
		function reg(){
			// 반드시 입력이 되야하는 값을 비교
			// (id와 이름과 비밀번호를 검사!)
			var id = $("#s_id").val();
			var pw = $("#s_pw").val();
			var name = $("#s_name").val();
			
			if(id.trim().length < 1){
				alert("아이디를 입력하세요");
				$("#s_id").focus();
				return;
			}
			
			if(pw.trim().length < 1){
				alert("비밀번호를 입력하세요");
				$("#s_pw").focus();
				return;
			}
			
			if(name.trim().length < 1){
				alert("이름을 입력하세요");
				$("#s_name").focus();
				return;
			}
			//위의 3개 비교문을 모두 피했다면 서버로 보낸다.
			document.forms[0].submit();
		}
	</script>
</body>
</html>




    