<%@page import="java.io.File"%>
<%@page import="mybatic.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    	<%! 
    	private String makeString(String[] ar, String delim){
    		StringBuffer sb = new StringBuffer();
    		for(int i=0; i<ar.length; i++){
    			sb.append(ar[i]);
    			if(i<ar.length-1) //이거 보다 작니? 맨 위것을 생략 가능하다
    			sb.append(delim); // 010-1234-2121- 될수도있다 if로 해결
    			
    		}
    		return sb.toString(); //String 형으로 내보내주자
    	}
    	
    	%>
    <%
    request.setCharacterEncoding("utf-8");
    
    String m_id = request.getParameter("id");
    String m_pw = request.getParameter("pw");
    String m_name = request.getParameter("name");
    String m_addr = request.getParameter("addr");
    String[] a_phone = request.getParameterValues("phone");
    String m_email = request.getParameter("email");
	//String m_phone = a_phone[0]+a_phone[1]+a_phone[2];

	
	
	String m_phone = makeString(a_phone, "-");
	//방법2
	/* 	StringBuffer m_phone = new StringBuffer();
	for(String p : a_phone){
		m_phone.append(p);
	} */


	//방법1
/* 	String phone = "";
	for(String p : a_phone){
		phone += p; //메모리 상에 수정되지 않고 각각 그대로 있다 선언된 스트링 메모리는 바뀌지않는다.
		//벌서 4개의 객체를 다 따로따로 만들어 저장하는 것이다.
		//문자열 편집을 사용할 때는 String buffer를 권장한다.
	} */
	
	//메서드 만들고 싶다
	

	
	
	/* 	
	System.out.print(m_phone);
    */
    
    boolean value = MemberDAO.add(m_id, m_pw, m_name, m_addr, m_phone, m_email);
    
    
/*    session.setAttribute("uvo", value); */
     


//어제 만든 등록정보 다지우자. 어제 만든 것들은 폴더가 생성되지 않았다.
//value가 true , 특정 위치에 가입한 사용자  id 값은 이름으로 폴더를 생성
//folder는 directory와 같은 것이며 이것을 만들기 위해

//java.io.file 객체를 먼저 생성해야한다. 그리고 그 안에 메서들 중 mkdir() 또는 mkdirs로 폴더 생성
//홈페이지에서는 webHard/index.jsp라고 뜬다
//이것은 webcontent가 root folder라는 의미이다.

if(value){
		//현재 서버(application == 내장객체)의 members라는 폴더의 정확한 절대경로를 얻자 c:/...
		String path = application.getRealPath("/members/"+m_id);
		System.out.print(path);
		// /가 webcontents를 의미한다. 접속한 사용자 경로가 상대경로다.서버의 절대 경로가 필요
		//서버의 절대 경로가 필요하기 때문, 서버의 c드라이버가 필요하다.
		//폴더를 만들기 이전에 io file 객체를 먼저 만들어야한다.
		//폴더를 만들 수 있는 객체를 불러와야한다. file이 할 수 있다.
		
		File f = new File(path);
		//file이 존재하는 지 확인
		if(!f.exists()){ //당연히 존재하지만 만의 하나 를 생각해 처리
			f.mkdirs();//실제 물리적으로 폴더를 생성
			//폴더가 없는 경우 자동으로 생성해주는 게 mkdirs 하나만 만들면 되면 mkdir
		%>
	<script> //가입에 성공한 경우에만 들어온다.
    parent.location.href = "index.jsp?msg=1";//바로 상위 오왼 다 가진 놈의 위치를 여기로가라.
    //여러개 파티션으로 오왼위아래 다있어서 헷갈리면 parent 아닌 top으로 간다.
    //중복 아이디가 있어도 에러가 생성된다.
    //페이지 이동은 됐는데 잘 처리됐는지는 모른다 msg=1or0으로 보내서 가입 완료를 판별한다.
    //가입 완료 처리는 right에서 받는다. 고로 parameter msg는 right에 줘서 표현시키자.
    </script>
		<%
		
		
		}else{
			%>
				<script> //가입에 성공한 경우에만 들어온다.
   				 parent.location.href = "index.jsp?msg=0";
    			</script>
			
			<%		
			
		}
		
}
		
	

	

	//response.sendRedirect("index.jsp");
    //위는 잘못된 코드, 왼쪽은 아이디 입력 창 오른쪽은 회원가입 창
    //그리고 오른쪽이 바뀔것이다. 고로 오른쪽 화면이 index.jsp 로 변한다.
    //화면이 나눠져있기에 자바 스크립트로 페이지 이동해야한다.
    //오,왼 2개를 다 가진 걸 변경해줘야한다.
    
    
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