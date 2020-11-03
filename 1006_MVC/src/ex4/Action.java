package ex4;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {

	//추상 메서드만 정의할 수 있다.
	String execute(HttpServletRequest request, HttpServletResponse response);
	
	
}
