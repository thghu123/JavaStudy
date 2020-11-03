package ex1;

import java.awt.print.Book;
import java.io.FileWriter;
import java.io.IOException;
import java.time.format.FormatStyle;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class JDomTest2 {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		// 실제 존재하는 xml문서를 로드한다.
		SAXBuilder sb = new SAXBuilder();
		Document doc = sb.build("src/ex1/test1.xml"); //src를 읽을 수 있다.
		
		Element book = new Element("book");
		Element title = new Element("title");
		Element price = new Element("price");//생성
		
		title.setText("자바바이블"); //<title>자바바이블</title>
		price.setText("29000"); //dtd할때 CDATA라고 쓰듯 모두 문자열 데이터
		
		book.addContent(title); //title이 add에 추가한다. 배치시킨다
		book.addContent(price);
		
		Element root = doc.getRootElement();
		root.addContent(book); 
		
		XMLOutputter xo = new XMLOutputter();
		Format f = xo.getFormat();
		
		f.setEncoding("utf-8");
		f.setIndent("  ");
		f.setLineSeparator("\r\n");
		f.setTextMode(Format.TextMode.TRIM);
		
		
		xo.setFormat(f);
		//xo.output(doc, System.out);
		xo.output(doc, new FileWriter("src/books.xml"));
		
		
		
		
	}

}
