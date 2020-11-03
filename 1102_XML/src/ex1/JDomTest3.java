package ex1;

import java.io.IOException;
import java.time.format.FormatStyle;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import com.sun.xml.internal.bind.v2.runtime.output.XmlOutput;

public class JDomTest3 {

	public static void main(String[] args) throws IOException {
		// 실제 존재하는 xml 문서를 로드 하는 것이 아니라
		// 존재하지 않는 xml 문서를 만들어서 그곳에 원하는 형태의 
		// element를 추가하는 예제!
		
		//xml문서 전체는 document와 같다. 지금은 빈 document를 만드러야한다.
		//xml문서를 의미하는 객체(Document)를 생성
		Document doc = new Document(); //빈 걸로 생성한다
		
		//가장 먼저 root element를 만들어야한다.
		//생성순서는 상관없지만 배치는 정확히해야하낟
		
		//하위요소 생성
		/*<book>
			<title>책이름</title>
			<price>20000<price>
		</book>*/
		
		Element book = new Element("book");
		Element title = new Element("title");
		Element price = new Element("price");
		
		title.setText("엄마를 부탁해");
		price.addContent("11000");
		
		book.addContent(title);
		book.addContent(price);
		
		
		//위의 book을 가지는 root를 만들자
		Element root = new Element("total");
		//루트에 추가한다. 위 루트를 doc에 적용을 안시켰다. 많이 놓치는 부분으로 root가 안나온다.
		root.addContent(book);
		doc.setRootElement(root);
		
		//---test
		
		//Element check = new Element("check");
		//check.addContent(root);
		//doc.setRootElement(check);
		//---루트 2개 지정시  에러가 나온다.
		
		XMLOutputter xo = new XMLOutputter();
		Format f = xo.getFormat();
		f.setEncoding("utf-8");
		f.setIndent("  ");
		f.setLineSeparator("\r\n");
		f.setTextMode(Format.TextMode.TRIM);
		
		xo.setFormat(f);
		
		xo.output(doc, System.out);
	
		
		
		
	}

}
