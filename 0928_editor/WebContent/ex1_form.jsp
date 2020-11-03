<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel = "stylesheet" href = "css/summernote-lite.min.css">
<style>
	.btn{
		width : 70px;
		height : 20px;
/* 		border : 1px solid red; */
		text-align: center;
		padding : 0;
		
	}
	
	.btn>a {
		display	: block; /* a태그니까 블록레벨화 */
		width 	: 100%;
		padding : 4px;
		height : 20px;
		line-height: 20px;
		background:  #27a;
		border-radius : 3px;
		color : #fff;
		text-decoration: none;
		font-weight: bold;
		font-size : 12px;
		
		/* 안에서 패딩 주면 크기가 더 커진다 */
		 
	
	}
	.btn>a:hover{
		background: #fff;
		color : #27a;
		border : 1px solid #27a;
	
	}
	
	
	
	
</style>

</head>
<body>



<h1>써머노트 에디터 연습</h1>

	<article>
		<form action = "addEdit.jsp" method = "post" name = "frm">
			<table>
				<tbody>
					<tr>
						<td><label for ="title">제목:</label></td>
						<td><input id = "title" name ="title"/></td>
						
					</tr>
					
					<tr>
						<td><label for = "content">내용</label></td>
						<td><!-- 텍스트 에어리어에 끼우자. -->
							<textarea rows = "12" cols = "50"
							id = "content" name = "content"></textarea>
						</td>
						
						<!-- 로그인이나 등등 webhard에서 있던 거는 모두 버튼이 아니였다
						전부 css로 만들었을 뿐 a 태그였다. -->
					</tr>
					
					<tr>
						<td colspan = "2" style = "text-align :right">
							<p class = "btn">
								<!-- 버튼 모양용 p 눌러서 이동하는 a -->
								<a href = "javascript:exe()">보내기
								</a>
								
							</p>
						</td>
					</tr>
					
				</tbody>	
			</table>
		</form>
	</article>

<%--j쿼리 --%>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 
<!--  <link rel = "stylesheet" href = "css/summernote-lite.min.css"> 
이걸 타이틀 아래에 넣어주면 잘된다. 이 뜻은 타이틀아래가 적합하다는 의미이다. 위치상-->
 <%--위 태그의 위치가 유효하지 않기에 노란색 경고줄이 뜬다 --%>
 <!-- 얘는 경로가 괜찮다는 의미이다 -->
 <script src = "js/summernote-lite.min.js"></script>
 <script src = "js/lang/summernote-ko-KR.js"></script>
 
 <script>
 	$(function(){
 		//j쿼리 시작부분
 		  $('#content').summernote({
 			  placeholder : "글자를 입력하세요", //자판에 뜨고 글자를 치면 사라진다.
 			  height : 300,
 			  maxHeight : 400,
 			  minHeight: 200,
 				tabSize : 10,
 				width : 550,
 				focus : true,
 			  	lang : "ko-KR", //이후 한글 js 패치를 시켜줘야한다.
 			  	
 			  	//ko-KR파일을 lang 압축파일에서 빼서 js안에 lang 폴더 만들면서 넣는다.
 			  	//여전히 안된다. 위에 js 추가 처럼 script에 추가해준다
// 			  	lineHeight : 0.7, //1이 아닌 0.7로 지정하자.여기에선 지정 못한다
 			  	callbacks:{
 			  		onImageUpload: function(files,editor){ //file은 배열타입으로 자동으로 들어오고 editer안에는 서버노트가 들어온다.
 			  			//이게 하나의 이벤트성 콜백, 이미지가 에디터에 추가될 때마다 수행하는 곳
 			  			//이미지를 첨부하면 배열로 인식된다.
 			  			//이들을 서버로 비동기식 통신을 수행하는 함수를 호출하도록한다.
 			  			
 			  			for(var i=0; i<files.length; i++){
 			  				sendFile(files[i],editor);
 			  				
 			  			}
 			  			
 			  		}
 			  		
 			  		
 			  	} 
 		  //프로그래머들의 용어로 어떤사건(이벤트)에 의해서 자동으로 호출되는 함수
 			//이미지가 이안에 들어올때 함수가 실행되게 할거야  	
 			  	
 			  	//이미지를 올리고 <>코드 보기를 올리면 엄청난 크기의 글자가 넘어간다.
 			  	//너무 양이 많으므로 이미지를 받은 순간 서버로 받고 서버가 받자마자 특정위치에 저장시키는것
 			  	//이는 db에 저장하지않고 특정 폴더에 이미지를 업로드 시키겠다는 의미
 			  	//img tag로 db에 거장하자 img src = "경로" 해당 경로에 나타날것이다
 			  	//그렇게 처리하는 방법을 알아야한다. 서버의 경로를 db에 준다.
 			  	//이를 사용자가 모르게해야한다. 그게 비동기식 통신이다. 알아서 자동으로 넘어가니까
 			  	//사용자 모르게 서버에 갔다가 오는 것이 비동기통신이다. 서버는 받자마자 특정위치에 저장하고
 			  	//경로를 다시 반환한다. 그리고 그걸 여기서 img태그로 받은 걸로 src 지정해주면 똑같이 나온다
 			  	
 			  	
 			  	
 			  	
 			  	
 			  	
 			  
 		  });
 
 		  $('#content').summernote("lineHeight",0.1);//줄간격 조정
 		  //이렇게 추가해야만 적용된다
 		
 		function sendFile(file,editor){
 		 // console.log(file+"^^");
 		 
 		 
 		 //save image.jsp로 보내고자하는 파라미터 만들자
 		 //이미지 파일을 보내고자한다. 
 		 //파일 보낼 때 enctype multi 이거 꼭 넣어야했다 일반폼은 절대 파일 못보낸다.
 		 //txt가 아닌 file이기에 폼을 만들어야한다.
 		 
 		 //보내고자하는 것이 일반적인 이름 또는 제목 같은 문자열 값이 아니고, 파일이므로 html의
 		 //폼 태그에 enctype 을 지정한 폼객체를 만들어야한다
 		 var frm = new FormData();//파일을 보내기 위해 나와있는 폼객체
 		 //단 문자열 보낼때는 절대 써선 안된다.
 		 
 		 //save.Images.jsp에서 받는 img 파라미터를 등록한다.
 		 frm.append("img",file);//img = 파일
 		 //비동기식 통신
 		 $.ajax({
 			 url : "saveImage.jsp",
 			 type : "post",
 			 data : frm,
 			 contentType : false,
 			 processData : false,
 			 //일반적인 데이터 전송이 아님을 증명한다.
 			 dataType : "json", //나중 서버로 부터 결과를 json으로 받는 다는 의미
 			 
 		 }).done(function(res){
 			 
 			 // console.log(res.img_url);//이제 img tag를 어떻게 만들거냐
 			 // var image = $("<img>").attr("src",res.img_url)//이러면 j쿼리로 이미지 태그를 만든것이고 속성 부여는 .attr이가 속명성 석성값  //여기까지가 img 태그를 만드는 것이다.
 			 // $("#content").summernote("insertNode", image[0]); //tag를 넣는 데도 Node라는 insertnode라는 이름 , 둘다 같은 이름이다, 이미지는 배열이기에 0을 넣어준다. 
 			 // 위방법도 되지만 아래 한줄로도 가능하고 권장하는 포맷이다.
 			 
 			$("#content").summernote("editor.insertImage", res.img_url);
 			 
 			 
 		 }).fail(function(err){
 			 
 			 console.log(err);
 			 
 		 });
 		 
 		 
 		  }
 		/* 넣기는 했는 데 아이콘이 없다 다운로드 받은 곳에 폰트가 있다. */
 		// 폰트 그자체를 복사해서 css에 두자 잘나온다
 		// 이후 조정 , 옵션을 넣을 떄는 ()안에 넣어야한다.
 		
 		
 	});
 	
 	
 	$(function(){//준비
 		//여기가 시작부 메인 함수와 같다. 물론 없어도되지만 문법을 지키기 위해 사용하자

 		//click()함수 첫인자로 실행해야할 함수를 입력한다.
 	
 		$( ".btn" ).click(function() {
 			
 			//한문장에 자바script와 j쿼리 문장을 혼용해서 쓰면 안된다. 하지만 한줄씩 쓰는 건 괜찮다. 
 			document.forms[0].submit();//val()을 붙이는 게 안된다는 의미이다.
 			//j쿼리에서 진행했다. onclick이 아니라
 		  
 		});
 		
 		
 	});

 
 </script>
 
 
 
 
</body>
</html>