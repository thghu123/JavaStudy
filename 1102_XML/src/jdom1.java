import java.io.IOException;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

public class jdom1{

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		
		SAXBuilder sb = new SAXBuilder();
		Document doc = sb.build("src/ex1/test1.xml");
		
		Element root = doc.getRootElement();
		System.out.println("루트이름:"+root.getName());
		
		List<Element> list = root.getChildren("book");
	
		//북이라는 애가 element이기 때문 == tag를 의미. 여러개 나온다. child는 한개만
		for(Element e : list) {
			System.out.println(e.getName());//output : book
			//book의 자식 중 이름이 title인 element의 문자열을 가져온다
			String title = e.getChildText("title");
			String price = e.getChildText("price");
			System.out.println(title+price);//output : book
			
		}
		
		System.out.println("===second child access===");
		Element e = list.get(1);
		System.out.println(e.getChildText("title"));
		
		
	}

}
