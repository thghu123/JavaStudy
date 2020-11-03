<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 파일을 누르면
현재 위치와 이름을 함쳐서 스트림을 연결하고 읽어들이면 됩니다. 
고로 위 2가지는 반드시 받아야한다
*/
request.setCharacterEncoding("utf-8");

//전달되어오는 파라미터들 받기 cpath fname
String cPath = request.getParameter("cPath");//지금은 업로드 아니니까 request가능
String fname = request.getParameter("f_name");


//위의 값을 연결하여 절대경로화 시킨다.
String path = application.getRealPath("/members/"+cPath +"/"+fname);//이렇게해야 전체 경로에 그 파일이 된다

// 절대 경로가지고 파일 객체 생성
File f = new File(path);

//지금은 사과 나무에 접근했다 있는 지 확인
if(f.exists()){
	//존재하면 다운로드를 시작한다
	
	//바구니를 2048 , 2Kbyte담는 컴퓨터에게는 점처럼 작은 데이터
	byte[] buf = new byte[2048];
	
	int size = 0; //바구니에 담은 사과수
	
	//다운로드에 필요한 스트림을 준비합니다.
	BufferedInputStream bis = null;//바로 만들지는 않음
	FileInputStream fis = null;//파일도 해야하니 만들어준다. 둘다 읽을 때 씀. 데이터 유실을 방지한다
	//jsp 입장에서는 다운로드도 해야하니까 읽고/쓰기가 모두 필요하다
	
	//사용자 PC에 저장하기 위한 스트링, 같은 계열을 써주는 게 좋다
	BufferedOutputStream bos = null;
	/* FileOutputStream fos = null; */
	ServletOutputStream sos = null;//웹프로그램이기때문.
	//jsp 입장에서 download는 jsp 입장에서 응답을 하는 것을 의미한다.
	//접속자 PC로 다운로드를 시켜야하기때문에  response를 통해 스트림을 생성해야한다.
	//그것이 바로 servletoutputstream이다.
	//jsp가 아닌 응용프로그램이었으면 fileoutputstream이 맞다. 응답하는 곳으로 부터 보내줘야하기때문에
	//reponse로부터 stream을 얻어와야하고 그일을 하는 게 서블릿 아웃풋 스트림이다.
	
	/* 준비된 stream 생성해서 사용 stream은 무조건 예외를 가지고 잇다 */
	
	try{
		//사용자 화면에 다운로드 창을 보여준다
		//response 응답 객체를 사용하면 된다
		response.setContentType("application/x-msdownload");
		//브라우저들이 가진 다운로드를 해주는 어플리케이션을 부른다
		response.setHeader("Content-Disposition", "attachment;filename="+
		new String(fname.getBytes(), "8859_1")); 
		//이렇게하면 바이트형 배열로 쪼개져서 나온다 , 유니 코드로 나오면 안되니까 , 여기서는 -기호를 인식을 못해서 8859 기본 텍스트 코드로 변환
		//디코드 체제로 바꾸는 게 맞다. encode된 유니코드 말고. 한글 이나 다른 언어들이 왔을 때 유실될 수 있으니 fname 이 아닌 위처럼 주는 것
		
		
		//-----------------------------------------다운로드 준비 끝
		
		//다운로드 할 file연결되는 스트림 생성
		fis = new FileInputStream(f);
		//File과 우선적으로 연결이 되었다
		bis = new BufferedInputStream(fis);
		//위를 만들기 위해서는 inputstream 이 필요하다 고로 위에 만들어 둔것이다.
		
		//response를 통해 이미 out이라는 생성된 stream이 존재하기 때문에 오류가 발생한다
		//그것을 잠깐 지워줘야한다. 아웃.프린트 가 <퍼센트= >와 같은 의미이다. 내장 객체이기에 서로 부딪힌다.
		//out을 안지우고 해도 되긴 하지만 출돌은 일어난다.
		
		out.clear();
		out = pageContext.pushBody();
		//이렇게 하면 치워진다. out은 원래 출력하는 애인데 치워 둔 것이다.
		
		sos = response.getOutputStream();//이 방법 뿐이다. outputstream 얻는 방법
		bos = new BufferedOutputStream(sos);
		//stream 준비 끝
		
		
		//이제 사과나무 올라가서 사과따기
		while((size = bis.read(buf))!= -1){//read는 1개씩만 따지만 buf 바구니 채울때까지 담는다.
		//buf안에 실제 데이터있다.
		//지금까지 읽은 갯수를 size에게 던지고 나간다.
		
		//size가 -1과 같을 때 나가야한다. 고로 위에 반복문이 존재.
		//1개씩 read가 따서 담았다. 다 담고나서 나무에 아무것도 없으면? size에 담은 갯수를 반환해준다.
		//담은 것도 없고 읽을 것도 없을 때, -1을 줘서 반복문을 빠져나오게 하는 형태
		
		//read가 읽을 때는 바이트로 읽는 데 반환값은 int로 준다. 실제 데이터는 buf가 가지고 있다.
		
		bos.write(buf,0,size);
		//input stream으로 부터 내가 읽은 만큼 쓰기를 하자. 
		bos.flush();
		//강제로 보내는 역할을 한다 . 내보내라는 의미. 적재중인 것을 모두 내보낸다.
		
		
		
		
		
		}
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{ //다 닫아줘야하는 데 에러가 나서 비정상 종료되면 종료 안되니까 finally 문안에 넣어준다.
			//앞 단에 에러가 나서 뒤에 값들이 null에서 초기화안되면 또 null이여서 에러가난다. null은 안만들어졌고 사용 안된다 의미
			if(fis != null){fis.close();}
			if(bis != null){bis.close();}
			if(sos != null){sos.close();}
			if(bos != null){bos.close();}
		}
		catch(Exception e){
			 e.printStackTrace();
		}
		//이후 실행시키면 파일이름이 아니라 다른 이름이 뜬다. mydisk의 파일을 클릭할때를 가자.
	//<a href="javascript:down('<퍼셑느=f.getName()퍼센트>')"> 365로 가자
	//		function down(fname){ //588line 이렇게하면 정상저긍로 뜬다.
	
	}
	
	
}





%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>