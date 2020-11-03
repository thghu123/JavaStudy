package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action{

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path = "/jsp/index.jsp";
		
		HttpSession ss = request.getSession();
		/* ss.setAttribute("vo", ""); */
		request.setAttribute("login_chk", false);
		request.removeAttribute("vo");
		return path;
	}
	
	
}
