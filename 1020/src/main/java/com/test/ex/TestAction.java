package com.test.ex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestAction {
	private int value;
	private String msg; //setter injection을 사용하기 위해서 반드시 setMsg 필요
	
	@RequestMapping("/ex1.ex")
	public ModelAndView ex1() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("str",msg);
		mv.addObject("v1",value);
		mv.setViewName("ex1");
		return mv;
		
		
	}

	public int getValue() {
		return value;//멤버 변수인 value의 값을 호출한 곳으로 전달한다.
	}
	
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public void setValue(int value) {
		this.value = value;
	}
	
}
