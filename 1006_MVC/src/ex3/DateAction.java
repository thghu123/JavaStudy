package ex3;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DateAction {

	
	public String execute(HttpServletRequest request, HttpServletResponse response) { 
		//인자로 바당오는 데 타입이 기억이 안나면 doget에서 가져와도 된다
		//현재 날짜 구하기 , sql Date 받아오자
		Date now = new Date(System.currentTimeMillis());
		
		//request에 현재 날짜를 저장할 것이다
		request.setAttribute("now", now.toString());
		
		//반환 표현할 jsp의 경로를 반환한다. 이미 request는 저장했다
		return "/ex3/date.jsp";
		
		//연산은 이곳에서하는 거지 컨트롤러에서 하는 것이 아니다.
	}
	
}
