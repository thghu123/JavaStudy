package ex1;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ex3.DateAction;

/**
 * Servlet implementation class Controller3
 */
@WebServlet("/Controller3")
public class Controller3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		
		String viewPath = null;
		
	 	if(type != null && type.equals("date")) {
		//쓰려면 bean 파일을 생성하면됩니다
	 		DateAction action = new DateAction();//객체 생성
	 		viewPath = action.execute(request, response);
	 		//인자로 넘겨줘야만한다. 
	 		//doget은 톰캣이 호출이고 그때 request와 response를 넘겨준다 그대로 넘겨줘야
	 		//새로 만드는 게 아니라  서버와 연결해서 쓸 수 있다.
	 		
		}
	 	else if(type.equals("greet")) {
			
			viewPath = "/ex2/greet.jsp";

			request.setAttribute("gret","안녕하세요");
			
		}
		
		RequestDispatcher disp = request.getRequestDispatcher(viewPath);
		disp.forward(request, response);
		
		
		
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
