package com.project.ex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class evCarController {


	@RequestMapping("/chart")
	public String chart() {
		return "chart";
	}
	
	@RequestMapping("/evCar_call")
	public String evCar() {
		return "evCar/evCar";
	}
}
