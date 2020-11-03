<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% //에디터에서 보내지는 이미지는 무조건! upload라는 폴더에 저장할 거다
    String path = application.getRealPath("/upload");
    
    MultipartRequest mr = new MultipartRequest(request,path,1024*1024*5,"utf-8",
    		new DefaultFileRenamePolicy());//제한은 5mega Byte
    		//이렇게 선언하는 순간 파일이 업로드라는 폴더로 저장된다
    		
    //이제 요청한 곳으로 저장된 파일의 경로를 보내줘야하기 때문에 정확한 저장된 파일명이 필요하다
    String f_name = "";
    		//첨부된 파일은 멀티파트가 안다
    File f = mr.getFile("img");//파일이 전달해올 때 사용된 파라미터 이름이 업로드로서 기억해두자.
    //폴더가 아니고 파라미터이름이다
    //서버에서 클라이언트로 경로를 보내야한다. 
    
    if(f != null) f_name = f.getName();//저장시 파일명
    
    //이쯤에서 서버에 저장된 파일의 겨올르 json 표기법으로 보냅니다.
    // http://www....../upload/back.png 이런식으로 가는 것을 의미
    //이모든것을 제이슨 표기법으로 보내야한다
    //request
    // {"img_url" : "<%=request.getContextPath()>/upload/<%=f_name >" <!-- 0928_editor까지 전달된다 -->
	//밑의 html 태그는 전부 지워야만한다. 위처럼 적으면 폴더가 나온다. 이후 uplaod와 f_name이 붙는다.
	//이 jsp를 비동기식 통신으로 호출할 거다
    
    		
    
    %>
    {"img_url" : "<%=request.getContextPath()%>/upload/<%=f_name %>"}
