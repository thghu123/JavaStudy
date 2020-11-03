package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//현재 인터페이스는 앞으로 만들어질 모든 액션 객체들을 통칭하기 위해 필요하다.
	String execute(HttpServletRequest request, HttpServletResponse response);
	
}
