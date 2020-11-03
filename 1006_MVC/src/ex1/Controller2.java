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

/**
 * Servlet implementation class Controller2
 */
@WebServlet("/Controller2")
public class Controller2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//타입이라는 파라미터를 받습니다. 
	//그 값이 "date"이면 ex2/date.jsp로 포워드 이때 표현될 값은 현재날짜입니다.
	
	String type = request.getParameter("type");
	
	String viewPath = null;
	
	if(type == null) {
		
		viewPath = "/ex2/date.jsp";
		request.setAttribute("dat", "type을 입력하세요 : ?type=date or greet" );
	}
 	else if(type.equals("date")) {
		
		viewPath = "/ex2/date.jsp";
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		Date date = new Date();
		String time1 = date1.format(date);
		
		request.setAttribute("dat",time1 );
		
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
