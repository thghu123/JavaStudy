package spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// login check
		HttpSession session = request.getSession(true);
		//로그인 확인하려면 session을 얻어야한다. true의 의미는 세션이 있으면 주고 없으면 만들어주세요
		//false는 세션이 있으면 주고 없으면 그냥 두세요 하고 null값을 준다.
		//하지만 일단 session은 존재하기에 true false는 큰의미 없다
		
		//로그인시 저장했던 객체를 얻는 것이 중요하다.
		Object obj = session.getAttribute("mvo");
		//이게 있으면 true를 반환시킨다. obj가 있으면 true를 반환하게 한다
		//그러면 인터셉터가 true를 반환하면서 작업 시작 전에 끼어든다. true는 작업해라. false는 로그인!
		
		if(obj == null) {
			response.sendRedirect("/login"); //아이디 목록없으니 로그인으로 가자
			return false;
		}
		
		//할일이 있으면 추가해준다.
		
		return true;
		//return super.preHandle(request, response, handler); //권장일뿐
	
	}
	//이걸 등록해줘야한다. sevlet.xml 에 등록하고 오면된다

}
