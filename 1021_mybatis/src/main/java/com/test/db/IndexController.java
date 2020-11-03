package com.test.db;

import java.util.Hashtable;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.dao.MemDAO;
import mybatis.vo.MemVO;

@Controller
public class IndexController {

	
	@Autowired
	private MemDAO m_dao;
	//자동으로 들어온다. 단, selvet.xml에 annotation-driven이있어야한다. 스프링 내장 설정이다.
	//하지만 root-context.xml는 내가 넣어줘야한다.
	//서버 구동전엔 이미 MemDAO 생성되고 이미 있다.
	
	@RequestMapping("/")
	public String home() { //mapping으로 인해 메서드 명은 큰 의미 없다.
		return "index";//index.jsp로 넘어간다 viewresolver로 인해

	}

	/* @RequestMapping("/total") 원래는 post를 json으로 바꾸는 코드니까
	 * 그냥 써도 되지만 post로 받아들이기에 아래처럼 명확히 post로 정해서 명시해준다.*/
	@RequestMapping(value="/total", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> total(){//memVO[]로 해도 되지만 Object로 하면 String 배열 다 가능하다
		//배열도 객체이기 때문에 memVO도 적절하다.
		//json이니까 map가장 적합하다.
		Map<String, Object> map = new Hashtable<String, Object>();
		//hash맵, 테이블 다 가능하다 .여기서는 db를 쓸 것이다
		//DAO의 getall을 쓸 것이다. 그래서 DAO 컨트롤러가 필요하다 이를 오토 인젝션으로 진행
		
		MemVO[] ar = m_dao.getAll();
		map.put("list", ar);
		
		return map; // 여기 total은 index.jsp의 $.ajax 비동기식 통신으로 호출 되어졌어
		//반환을 json으로 해야하지만 map으로 하고 있다.
		//다시 말해서 이것을 라이브러리가 하도록하겠다.
		//함수 맨 위에서 requstmapping아래에 @ResponseBody 통째로 주고 라이브러리가 json으로 변환한다는 의미
		
		//text 어제 받은 파일 중 spring_responseBoby이용방법(비동기식JSON반환방법) 들어간다.
		//jackson을 https://mvnrepository.com/search?q=jackson에 검색
		//스프링 4.0을 쓸 때 다른 거를 쓰고 지금은 위에서 4번째 잭슨만 써있는 걸 쓴다. 1.9.1.3을 이용 이걸 prom.xml에 넣기
		
		
	}
	
}
