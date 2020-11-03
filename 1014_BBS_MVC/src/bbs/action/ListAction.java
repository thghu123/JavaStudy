
package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.util.Paging;
import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class ListAction implements Action {

	
	int blockList = 10;
	int blockPage = 5;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		//사용자가 선택한 페이지 번호를 받아야한다. DAO를 실행시켜야하니까 , 페이지 안넘기면 첫페이지
		String cPage = request.getParameter("cPage");
		int p = 1;
		if(cPage != null) {
			p = Integer.parseInt(cPage); //받아온 String 을 정수로 바꾼다.
		}
		
		
		//현재 페이지값 p를 이용하여 begin과 end를 구해야한다. -> 이건 내일할 계획 페이징 기법 내일 오전
		String bname = request.getParameter("bname");
		if(bname == null) {
			bname = "BBS";
		}
		
		int rowTotal = BbsDAO.totalCount(bname); //count값 bname 생성되고 가져온다.
		Paging page = new Paging(p, blockList, blockPage, rowTotal);
		//위에 page와 list는 정의해두고 이용
		
		//원하는 게시판의 목록을 얻어낸다
		BbsVO[] ar = BbsDAO.getList(page.getBegin(), page.getEnd(), bname);
		//위처럼 1,10이 아닌 위처럼 해두면 now page 바뀌면서 알아서 begin end 바뀐다.
		
		
		//뷰페이지에서 표현할 것들을 request에 저장한다
		request.setAttribute("ar", ar);
		
		//페이징 기법의 html 코드가 저장이 안됐다
		request.setAttribute("p_code", page.getSb().toString());
		//stringbuffer가 가진 걸 문자열로 주어라. pcode라는 이름으로 page html 코드가 저장됨
		//jsp에서 바로 표현하려고 하는 것 html코드를 만들 필요가 없고 출력만 하면된다
		//paging만 들고가서 쓰면된다.
		
		//list.jsp에서 앞에 번호를 출력하기 위해 필요한 변수를 저장
		request.setAttribute("rowTotal", rowTotal);
		request.setAttribute("nowPage", p);
		request.setAttribute("blockList", blockList);
		
		return "/bbs/list.jsp";
		
		//위의 페이징 기법은 빠졌고 이제 컨트롤러만 정리하고 jsp넣어주면된다
	}

}
/*이걸로하면 페이징이 아예 안됨

package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.util.Paging;
import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class ListAction implements Action {

	int blockList = 10;
	int blockPage = 5;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 사용자가 선택한 페이지 번호를 받아야한다.
		String cPage = request.getParameter("cPage");
		int p = 1;
		if(cPage != null) {
			p = Integer.parseInt(cPage);
			
		}
		
		
		
		//현재 페이지값(p)를 이용하여 begin과 end를 구해야 한다.
		
		String bname = request.getParameter("bname");
		if(bname == null)
			bname = "BBS";
		
		int rowTotal = BbsDAO.totalCount(bname);
		Paging page = new Paging(p, rowTotal, blockList, blockPage);
		
		//원하는 게시판의 목록을 얻어낸다.
		BbsVO[] ar = BbsDAO.getList(page.getBegin(), page.getEnd(), bname);
		
		//뷰 페이지에서 표현할 것들을 request에 저장!
		request.setAttribute("ar", ar);
		
		// 페이징 HTML코드를 저장하자
		request.setAttribute("p_code", page.getSb().toString());
		
		//list.jsp에서 앞에 번호를 출력하기 위해 필요한 변수를 저장
		request.setAttribute("rowTotal", rowTotal);
		
		
		
		return "/bbs/list.jsp";
	}

}
*/
