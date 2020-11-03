<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 	String msg = request.getParameter("msg");
 
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

	<frameset cols="190,*" border="0">
		<frame src="left.jsp" name="left"/> <!-- 해당 jsp 필요 -->
		<frame src="right.jsp?msg=<%=msg%>" name="right"/> <!-- 이블로그를 여기에 넣겠다 -->
	</frameset><!-- https://blog.naver.com/frogramo src를 다른 걸로 변경-->
</html>

<!-- uvo를 써서 set attribute를 했으면 로그인했다고 가정하는 것. 이를 left에서 수정하자 -->
<!-- sql 문장은
 create table member_t{
m_id VARCHAR2(20),
m_pw VARCHAR2(20) NOT NULL,
m_name VARCHAR2(30),
m_addr VARCHAR2(50),
m_phone VARCHAR2(15),
m_email VARCHAR2(20),
CONSTRAINT member_pk PRIMARY KEY(m_id)
};
}
기본키의 특성은 널값을 가질 수 없으면 중복 불가 그럴때는 member_pk를 보여준다. 원래대로 들어가면안되니까
-->
 



