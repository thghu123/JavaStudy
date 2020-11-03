package com.test.ex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class TestAction2 {

	private String now_date;
	private boolean check;
	private TestAction t1;

	public void setNow_date(String now_date) {
		this.now_date = now_date;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}

	public TestAction2(String now_date, boolean check,TestAction t1) {
		super();
		this.now_date = now_date;
		this.check = check;
		this.t1 = t1; 
	}
	
	@RequestMapping("/ex2")
	public ModelAndView ex2() {
		


		
		ModelAndView mv = new ModelAndView();
		mv.addObject("date",now_date);
		mv.addObject("check",check);
		mv.addObject("value",t1.getValue());
		mv.setViewName("ex2");
		return mv;
		
	}
	
}
