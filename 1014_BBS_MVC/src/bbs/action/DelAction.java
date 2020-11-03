package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;

public class DelAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		//기본 키를 받아서 삭제를 수행합니다. --- view.jsp에서 호출한다. 이로인해 컨트롤러 호출돼서 delAction 수행
		//그리고 삭제는 post방식으로 버튼으로 들어온다. cPage와 b_idx가 존재한다. 고로 view.jsp로 돌아간다.
		
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage"); 
		//파라미터가 10개가 넘으면 다 받아야한다. usebean Action요소 이런 것도 없다. 다 써야한다.
		//그런데 누군가가 이를 받아 준다면 좋을 것이다. 이를 스프링 환경이 한번에 다 받아준다.
		BbsDAO.delBbs(b_idx);
		
		return "Controller?type=list&cPage="+cPage;//cPage값 주면서 list로 이동
		//??cpage는 왜주지. listAction을 수행하는 데 page값을 주겠다. 원하는 페이지를 보는 list를 구현하겠다.
		
	}

}
