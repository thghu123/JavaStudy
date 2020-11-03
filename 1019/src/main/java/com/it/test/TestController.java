package com.it.test;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	//멤버 변수 하나 선언하고 들어가자
	private String msg;
	
	
	//컨트롤러로 생각하고 만든 것이다. Action과 완전 같지만
	//컨트롤러같은 동작은 스프링에서 안한다. 하지만 얘가 컨트롤러라는 걸 명시해야한다.
	//명시하는 법 중 가장 쉬운 것을 알려준다. 2번째 줄에서 @하나 앳사인
	//cont하고 컨트롤 스페이스 -> 컨트롤러 등록이 끝난다.
	
	@RequestMapping("/t1")
	public String ex(HttpServletRequest request) {
		Date now = new Date(System.currentTimeMillis());//sql의 date
		String now_date = now.toString();
		//이걸 jsp에서 출력해야한다. -> request에 저장하고 갔다. 지금은 없다.
		request.setAttribute("now", now_date);
		msg = now_date;
	
		return "test"; 
		//jsp 경로인데, views폴더 안에만 jsp 돌아간다. .jsp 떼도 인식된다.
	}
	
	@RequestMapping("/t2")
	public ModelAndView tet() {//많이 쓰는 반환 타입 modelandview가 request에 저장되는 애여서 받을 필요없다
		ModelAndView mv = new ModelAndView();
		//위에는 test로 가는 데 얘는 반환형 때문에 그런게 없네

		//modeland view에 값을 저장한다
		mv.addObject("value","안녕하세요"); //맵과 동일구조
		mv.addObject("msg",msg);
		
		//보여질 jsp의 경로를 지정하는 mv내장 함수가있다
		mv.setViewName("test2"); //views의 test2.jsp로 간다.
		
		
		
		return mv;
	}
	
	
		
}
