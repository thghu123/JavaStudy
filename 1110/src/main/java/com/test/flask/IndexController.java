package com.test.flask;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String first() {
		return "index";
	}
	@RequestMapping("/chart")
	public String chart() {
		return "chart";
	}
	
	@RequestMapping("/evCar")
	public String evCar() {
		return "evCar";
	}
}
