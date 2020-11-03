package bbs.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.BbsDAO;

public class writeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPath = "/bbs/write.jsp";
		
		//현재 영역은 get방식으로 요청되었을 때는 write.jsp로 페이지 이동
		//그게 아니라 post 방식이면서 파일 첨부가 되었다면 파라미터들을 받아서
		//DB에 저장해야합니다.
		
		/*
		 * String method = request.getMethod(); if(!method.equalsIgnoreCase("get")) {
		 * //get이 대문자로 넘어온다 //파라미터 받아서 DB작업을 하자. post로 왔으니까 , 이부분은 알고있는 내용 }
		 */
		
		String c_type = request.getContentType();
		//이러면 write에 enc 타입이 들어온다
		/* System.out.println(c_type); */
		
		if(c_type != null && c_type.startsWith("multipart")) {
			//이 부분이 파라미터 받아서 db에 저장하는 형태
			//파라미터는 multipart request로 받아야한다.
			try {
				
				//첨부파일을 저장할 폴더를 절대 경로화해야한다 어플리케이션이 있어야한다. 있어봐야 request, response 뿐 하지만 request로 구할 수 있다
				//어플리케이션의 자료형은 자동완성하면 서블릿 컨텍스트 타입이다 이걸 받아내자
				ServletContext application = request.getServletContext();
				
				String path = application.getRealPath("/bbs_upload");
				// 슬래시 까지가 웹컨텐트를 의미한다. 이걸만들어두고 멀티 파트 리퀘스트를 만든다.
				// 받아오는 값을 저장하기 위함
				MultipartRequest mr = new MultipartRequest(request, path,1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
				//이렇게 지정하면 첨부된 파일이 bbs_uplaod라는 폴더로 업로드가 됩니다.
				//이미 업로드가 됐다.
				
				//bbs 테이블에 저장할 업로드된 파일명을 얻어야한다.
				
				File f = mr.getFile("file");//wrtie.jsp에 파일의 name이 file이기에 , 이미 받아왔다
				
				String fname = null;
				
				if( f!=null) {
					//파일이 첨부된 경우
					fname = f.getName();
				}
				//나머지 파라미터 값들 받기
				
				String subject = mr.getParameter("title");
				String writer = mr.getParameter("writer");
				String content = mr.getParameter("content");
				String bname = mr.getParameter("bname");
				String ip = request.getRemoteAddr();
				
				//이제 DAO의 add만 호출하면 된다
				BbsDAO.add(subject, writer, content, fname, ip, bname);
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			viewPath= null;
		}
		
		return viewPath;
	}

}
