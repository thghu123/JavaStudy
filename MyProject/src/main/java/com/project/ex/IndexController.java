package com.project.ex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.vo.MemVO;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String index() {
		return "index"; //views/index.jsp를 의미
	}
/*	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(MemVO vo) { 
		ModelAndView mv = new ModelAndView();
		
		System.out.println(vo.getM_id()+"/"+vo.getM_pw());
		return mv;
	}
*/	
}








