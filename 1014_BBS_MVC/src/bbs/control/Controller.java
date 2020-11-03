package bbs.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.action.Action;
import bbs.action.DelAction;
import bbs.action.EditAction;
import bbs.action.ListAction;
import bbs.action.viewAction;
import bbs.action.writeAction;

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
		
		//받기 전에 한글처리
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		
		Action action = null;
		if(type == null || type.equals("list")) {
			//액션 필요
			action = new ListAction();
		}else if(type.equals("write"))
			action = new writeAction();
		else if(type.equals("view"))
			action = new viewAction();
		else if(type.equals("edit"))
			action = new EditAction();
		else if(type.equals("del"))
			action = new DelAction();
		
		String viewPath = action.execute(request, response);
		
		if(viewPath != null) {
		
		RequestDispatcher disp = request.getRequestDispatcher(viewPath);
		
		disp.forward(request, response);
		}
		else {
			//view path가 null을 가졌으면 목록창으로 넘어간다
			response.sendRedirect("Controller");//타입 없으면 list로 자동으로 간다.
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
