package pm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import am.vo.EmpVO;

/**
 * Servlet implementation class SearchName
 */
@WebServlet("/SearchName")
public class SearchName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	//하나만 생성하기 위해 멤버 변수로 선언한다.
	SqlSessionFactory factory; 	
    public SearchName() {
    	
    	//한번만 수행하여 팩토리를 얻는다.
        //객체가 생성될 때 한번만 실행하는 생성자 영역
      	try {
      		  			
      		Reader r = Resources.getResourceAsReader("am/config/config.xml");
			/*
			 * SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder(); factory =
			 * builder.build(r);
			 */
      		factory = new SqlSessionFactoryBuilder().build(r);
      		r.close();
      		
      		
  		} catch (Exception e) {
  			e.printStackTrace(); //오류 구조 순차 출력
  		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = utf-8");
		
		//요청시 파라미터 받기 s_name
		String s_name = request.getParameter("s_name");
		//위에서 받은 인자, 파라미터를 mybatis 의 mapper를 호출하면서 인자로 전달합니다.
		SqlSession ss = factory.openSession();
		List<EmpVO> list = ss.selectList("emp.search_name", s_name); //스트링을 하나 넣어줘야한다. s_name 홈페이지에서 받아주었으니까
		//인자가 2-3개일때 EmpVO를 써도 되지만 자주 쓰이는 것은 map구조이다.
		
		//응답준비
		PrintWriter out = response.getWriter();
		
		out.println("<table border = '1'>");
		out.println("<tbody>");
		for(int i = 0; i<list.size(); i++) {
			EmpVO vo = list.get(i); //사원정보 하나씩 얻어낸다
//			out.println("<tr>");
//			out.println("<td>"+vo.getEmpno()+"</td>");
//			out.println("<td>"+vo.getEname()+"</td>");
//			out.println("<td>"+vo.getJob()+"</td>");
//			
//			out.println("</tr>");
			out.println(vo.printAll()); //html로 반환한 것.
			
		} //서블릿은 out.println이렇게 안하고 인자 매퍼로 받아오고 내용 비교만 하고, 출력은 안한다.
		out.println("</tbody");
		out.println("</table>");
		
		out.close(); //하나의 스트림이니 닫아주기
		 
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
