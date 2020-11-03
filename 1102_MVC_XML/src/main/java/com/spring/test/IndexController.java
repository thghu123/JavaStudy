package com.spring.test;

import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.nio.file.attribute.AclEntry.Builder;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	
	@RequestMapping("/form")
	public String form() {
		return "form"; //views/form.jsp를 의미함
	}
	
	@RequestMapping("/add")
	public ModelAndView add(String name , String b_day, String phone) throws Exception {
		ModelAndView mv = new ModelAndView();
		//이미 존재하는 xml문서를 로드한다. 일단 만들자. src/main/resources
		SAXBuilder sb = new SAXBuilder();
		//Document doc = sb.build("classpath:data/members.xml");
		Document doc = sb.build(getClass().getResource("/data/members.xml").getPath());
		//제대로 얻었다면 doc로 부터 root를 얻을 수 있다
		Element root = doc.getRootElement();
		System.out.println(root.getName());
		//방금 xml에 추가한 members나와야한다.
		
		Element member = new Element("member");
		Element ename = new Element("name");
		Element eb_day = new Element("b_day");
		Element ephone = new Element("phone");
		//현재 인자들을 name, b_day,phone에 문자열로 설정을 해준다
		ename.setText(name);
		eb_day.setText(b_day);
		ephone.setText(phone);
		
		member.addContent(ename);
		member.addContent(eb_day);
		member.addContent(ephone);
		
		root.addContent(member);
		
		XMLOutputter xo = new XMLOutputter();
		
		Format f = xo.getFormat();
		f.setEncoding("utf-8");
		f.setIndent("  ");
		f.setLineSeparator("\r\n");
		f.setTextMode(Format.TextMode.TRIM);
		xo.setFormat(f); 
		//xo.output(doc,System.out);
		
		//xo.output(doc,new FileWriter("data/members.xml"));
		URL url = getClass().getResource("/data/members.xml");
		xo.output(doc, new FileWriter(url.getPath()));
		//해당 부 오류 - members.xml은 resource에 있다. 경로찾기 어려우니, 함수이용
		
	
		
		return null;
	}
	
}
