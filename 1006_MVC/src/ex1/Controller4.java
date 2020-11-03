package ex1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ex4.Action;
import ex4.Action1;
import ex4.Action2;
import ex4.Action3;

/**
 * Servlet implementation class Controller4
 */
@WebServlet("/Controller4")
public class Controller4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//type이 t1이면 action1을 수행하고 , "t1"면 actino2를 수행한다.
	//단순히 jsp 이동만 진행
	String type = request.getParameter("type");
	String vP = null;
	
	Action action = null;
	
	if(type != null && type.equals("t1")) { //res1.jsp
		action = new Action1();
			//Action1 action = new Action1();//객체 생성을 안해서 오류났었다.
			//vP = action.execute(request,response);
	}
	else if(type != null && type.equals("t2")) { //data.jsp
		
		 action = new Action2();
			//vP = action.execute(request, response);
	}else if(type == null || type.equals("t3")) { //ar.jsp
		
		 action = new Action3();
			//vP = action.execute(request, response);
	}
		vP = action.execute(request, response);
		
		RequestDispatcher disp = request.getRequestDispatcher(vP);
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
