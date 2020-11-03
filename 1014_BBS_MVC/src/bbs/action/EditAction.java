package bbs.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class EditAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//요청한 context Type을 얻어낸다.
		
		//post 방식으로 요청되엇을 때와 multi Type으로 요청 되었을 때를 
		//구분하여 뷰 페이지를 작업을 다르게 해야한다.
		//리스트에서 항목 들어가 수정 누르면 바로 post 방식으로 먼저 보내면 화면을 바꿔야한다
		//post로 보내는 법은 form을 hidden으로 만들고 심어두고 보내면 post 방식이 가능하다. (책에 없다)
		//view.jsp에 가보면 폼이 116Line에 존재한다. "수정" 누르면 함수를 호출한다.
		//함수 : 현재 문서의 frm1이라는 폼에 type이 있는 데 그 값을 edit으로 바꾸어 전송
		//상세보기에 vo.b_idx 들어가있고 , 이제 controller를 호출하면서 edit 타입을 전달한다
		//action의 type이 post이므로 post로 들어오고 이를 구별하기 위해 request.getMethod도 있지만
		//multipart가 있어서 못 쓴다 그래서
		
		String c_type = request.getContentType();//get방식 null, post : application
		//파일 첨부 시 multipart ..... 로 진행한다. 앞단 글자를 구별할 수 있구나
		String viewPath = null;
		
		//c type이 null이 아니고 application으로 시작한다면 : 화면 전환, multipart로 시작하면 DB 작업한다.
		if(c_type.startsWith("application")) {
			//post 방식
			String b_idx = request.getParameter("b_idx");//반드시 넘어온다??어디서 오지??
			BbsVO vo = BbsDAO.getBbs(b_idx);
			if(vo != null) {
				request.setAttribute("vo", vo);
			}//edit.jsp에서 표현하기위해 해당 레코드를 저장하였다.
			viewPath = "/bbs/edit.jsp";
			//request에 vo를 저장하고 edit.jsp로 가는 게 전부, write.jsp와 유사하다.
		}else if(c_type.startsWith("multipart")) {
			
			//파일 첨부 했는 지 안했는 지는 예상. 일단은 멀티 파트로 선언을 해야한다.
			//db 작업을 진행한다. 마치면 뷰 화면으로 간다. 리스트로 가는 건 쉽다. 뷰로 가는 건 문제
			
			try { //이제 첨부파일을 저장할 위치를 절대경로로 만들자.
				ServletContext application = request.getServletContext(); //절대 경로 함수 필요하다
				String path = application.getRealPath("/bbs_upload");//슬래시까지가 webcontent
				
				MultipartRequest mr = new MultipartRequest(request, path,1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
				//방식, 저장공간, 용량(5mb), 한글처리, 파일이름이 똑같을 때 처리하는 함수, 이때 첨부파일이 있으면 업로드가 이미 된다. 
				
				//나머지 파라미터 받기
				String b_idx = mr.getParameter("b_idx");//edit.jsp에서 이런애가 있어야한다.
				//이거 없으면 수정을 할 수 없다. 기본키이기 때문이다. 그런데 edit.jsp에는 없다.
				//** <input type="hidden" name ="b_idx" value = "${vo.b_idx }"/>이렇게 추가해준다.
				//cPage도 있어야한다 자신의 위치로 돌아올 수 있어야하니까, view.jsp에서 왔고 cPage외 3개를 보냈다.
				//위가 edit Action으로 왔고 edit.jsp로 포워드 당했다. 이걸 edit.jsp로 쓸 수 있느냐? param.으로 가능하다.
				//<input type="hidden" name ="cPage" value = "${param.cPage }"/> **param은 붙어야한다. edit.jsp에 추가

				String cPage = mr.getParameter("cPage");//controller?type=view로 보낼 때 필요하다
				//뷰엑션에서도 String cPage = request.getParameter("cPage"); //목록누르면 언제든 원래 페이지로 가야하기에 꼭필요
				String subject = mr.getParameter("subject");	
				String writer = mr.getParameter("writer");	
				String content = mr.getParameter("content");	
				
				//파일이 있는 지 확인				
				File f = mr.getFile("file");
				String fname = null;
				
				if(f!=null) {
					fname = f.getName();
				}//변수 잡아서 위처럼 받아주기, 
				//동일명의 파일명이 있었다면 파일명이 변경될 것이다
				
				String ip = request.getRemoteAddr();//ip를 가져온다.
				
				BbsDAO.editBbs(b_idx, subject, content, fname, ip);
			
				viewPath = "Controller?type=view&cPage="+cPage+"&b_idx="+b_idx;
				//이렇게 진행해줘도 된다.
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		return viewPath;
	

	}
}
