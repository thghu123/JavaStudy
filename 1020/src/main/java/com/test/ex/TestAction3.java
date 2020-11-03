package com.test.ex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mybatis.vo.TestVO;

@Controller
public class TestAction3 {
	//그냥 jsp로만 갈거다.
	
	@RequestMapping("/ex3")
	public String ex3() {
		
		
		return "ex3";
	}
	
	//@RequestMapping("/ex3_1")
	//public void ex3_1(String s_id, String s_pw) {//인자를 여기서 적는 것이다
		//진짜 넘어왔다면 여기서 찍혀야한다
	//	System.out.println(s_id+"/"+s_pw);
		
	//}
	
	@RequestMapping("/ex3_1")
	public void ex3_1(TestVO vo) {//인자를 여기서 적는 것이다
		System.out.println(vo.getM_id()+"/"+vo.getM_pw());	
	}
	//mybatis에 보낼 때 map으로 하나하나 넣지 않아도 된다 하나의 객체에 담아서 줄 수 있다.
	//이게 액션 요소의 *와같다. 파일첨부할때는 못썼다.얘는 파일첨부도된다. 물론 파일 타입과 xml 환경설정도 있어야한다
	
	
}
