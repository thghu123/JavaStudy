package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.mainAction;
import model.searchBookaction;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		
		String type = request.getParameter("type");
		String viewPath = null;
		
		Action action = null;
		
		if(type == null || type.equalsIgnoreCase("main")) {
			//성립이 되면 뒤에는 실행하지 않고 진행한다.
			action = new mainAction();

		}
		
		//request에 저장된 lgom_chk가 그대로 저장되어 전달된다.
		else if(type.equals("search")) {

			action = new searchBookaction();
		}		

	
		
		viewPath = action.execute(request, response);
		//그냥 하면 널포인트 익셉션이 쓴다. 위를 쓰고 싶으니까 액션 객체를 그냥하나 만들자. login action
		
		RequestDispatcher disp = request.getRequestDispatcher(viewPath);
		disp.forward(request, response);
		//페이지 포워드
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
