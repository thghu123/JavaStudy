package ex4;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Action1 implements Action{
	
	private int value = 10;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		//인자로 넘어온 request와 response는 컨트롤러가 가지고 있는 request, response이다
		//그러므로 또 다른 파라미터가 있다면 여기서 받을 수 있다.
		String value = request.getParameter("value");
		//컨트롤에서만 받는 게 아니라, request 객체가 공유되니 언제든 받으면된다
		if(value != null) {
			int v = Integer.parseInt(value);
			request.setAttribute("res", this.value*v);
		}
		return "/ex4/res1.jsp";
	}
	
}
