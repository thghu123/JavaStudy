package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//action들을 하나로 통일시키기 위해서
	String execute(HttpServletRequest request, HttpServletResponse response);
	//위를 구현하는  list action을 같은 자리에 만들자. 모든 인터페이스는 위를 구현해야한다.
	
	
	
	
	
}
