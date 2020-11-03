package am.servlet;

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
 * Servlet implementation class EmpAll
 */
@WebServlet("/EmpAll")
public class EmpAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	SqlSessionFactory factory; //멤버변수 선언
	
    public EmpAll() {
      //객체가 생성될 때 한번만 실행하는 생성자 영역
    	try {
			
    		Reader r = Resources.getResourceAsReader("am/config/config.xml");
    		//r은 스트림이기에 try 블록을 나가도 안사라진다. 고로 close를 하는 것이다. 영역을 벗어나도 안죽는다.
    		//이런게 쌓이면 서버가 db에러가 난다. 
    		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
    		factory = builder.build(r);
    		//팩토리가 지역변수네. 고로 아래에서 사용 못함.
    		//전역변수없기에 멤버변수로 만들어준다. static이냐, member냐 둘중하나이다.
    		//
    		r.close();
    		
    		
		} catch (Exception e) {
			e.printStackTrace(); //오류 구조 순차 출력
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = utf-8");
		//요청이 발생할 때 실행된다
		
		//팩토리로 부터 세션을 얻는 것
		SqlSession ss = factory.openSession();
		
		//sqlsession을 통해서 원하는 sql 문장을 호출한다
		List<EmpVO> list = ss.selectList("emp.total");
		//여기서 발생하는 결과는 오로지 하나가 아니라 여러개의 행이 발생한다.
		//그래서 각 행마다 하나의 EmpVO가 생성되어 여러개의 EmpVO가 ArrayList에 담겨져서 넘어오게된다
		
		PrintWriter out = response.getWriter();
		out.println("<table border = '1'>");
		out.println("<tbody>");
		for(int i = 0; i<list.size(); i++) {
			EmpVO vo = list.get(i); //사원정보 하나씩 얻어낸다
			out.println("<tr>");
			out.println("<td>"+vo.getEmpno()+"</td>");
			out.println("<td>"+vo.getEname()+"</td>");
			out.println("<td>"+vo.getJob()+"</td>");
			
			out.println("</tr>");
			
		}
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
