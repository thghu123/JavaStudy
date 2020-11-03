package com.project.ex;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.go.vo.DataVO;

	@Controller
	public class GoDataController {
	
		@RequestMapping("/goData")
		public ModelAndView data() throws Exception {
			//rest API 서버의 URL을 객체로 만들어둔다.
			String url_src="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?serviceKey=edh68oHntQrWlGu%2B77Bdml97TV9kDdgI07WJt48vzsiU%2FZJxHr3miYl3JLu5jZMidnuQeOoR3pq%2FR13wTO%2F2vQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&eventStartDate=20201022";
			URL url = new URL(url_src);
					//url 생성시 경로를 넣을 수 있는 데 경과를 넣는다.
					//자바입장에서는 오류가 날 가능성이있기에 예외 처리를 진행한다.
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			//연결끝
			conn.setRequestProperty("Content-Type","application/xml");
			//위 key value는 MIME Type을 의미한다. 웹상에서 지원하는 문서형식을 뜻한다.
			//받는 자원 모두 xml로 인식한다. content-type뒤에 image/jtag 등등 검색하면 많다.
			
			conn.connect(); //나이제 연결하러 들어갈거야. 연결, 요청, 위안에 String을 뽑아낸다.
			
			SAXBuilder builder = new SAXBuilder();
			Document doc = builder.build(conn.getInputStream());
			//문서 틀에 모든 html 태그 수집 ,파일 경로가 아니라 스트림을 넣어준다.
			
			Element root = doc.getRootElement();
			
			//현재 xml 내용 중 response 안 body 안 items 안 item들이 필요하다
			//수집
			
			Element body = root.getChild("body");
			Element items = body.getChild("items"); //얻은 body 안으로 들어간다.
			
			//items 안에 있는 여러개의 item들을 얻어낸다.
			List<Element> e_list = items.getChildren("item"); //아이들이니까 getchildren , item 태그를 가져온다.
			
			//e_list에 있는 것은 element이다. 이것을 List<element>를 List<DataVO>
			//DAtaVO[] 로 바꿔야 jsp에서 표현할 수 있다. element는 표현 못한다.
			
			
			List<DataVO> d_list = null;
			DataVO[] d_array = null;
			for(Element e : e_list) {
				
			
				DataVO vo = null;
				//vo.setMapx(e.getAttribute("mapx"));	
				
				
				
				
			}
			
			
			
			return null;
		}
	}