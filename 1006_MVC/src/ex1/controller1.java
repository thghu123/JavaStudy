package ex1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class controller1
 */
@WebServlet("/controller1")
public class controller1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controller1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//무조건 요청을 받는데, 약속된 요청을 받아야 한다. (프로토콜과 동일) type이라는 파라미터 값을 받는다
		//무조건 컨트롤러를 부를때는 타입을 줘야하다는 약속
		String type = request.getParameter("type");
		/*
		 type의 값이 만약 null이거나 "v1"이면 view1.jsp로 경로를 지정한다. -> 매번 경로를 변화
		 이동할 뷰 페이지의 경로를 저장할 변수를 선언
		 */
		String viewPath = null;
		
		if(type == null || type.equals("v1")) {
			viewPath = "/ex1/view1.jsp"; //슬러시는 webcontent까지이다.
			//request에 msg라는 이름으로 문자열을 저장한다
			request.setAttribute("msg", "안녕하세요");
			
		}else if(type.equals("v2")){
			viewPath = "/ex1/view2.jsp";
			request.setAttribute("str", "asdfasdf");
			
		}else if(type.equals("v3")){
			viewPath = "/ex1/view3.jsp";
			int res = 10*10;
			request.setAttribute("res", res);
			
		}
		
		//MVC에서 뷰페이지 이동은 forward를 시킨다.
		RequestDispatcher disp = request.getRequestDispatcher(viewPath);
		//어디로 이동해야할지는 disp가 이미 알고있다 이제 포워드로 이동
		disp.forward(request, response);//이게 포워드로 페이지를 이동하는 것 request,response는 이미 있는 정보
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
