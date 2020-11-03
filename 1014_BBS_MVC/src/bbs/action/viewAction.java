package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class viewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//파라미터 값들 받기
		String cPage = request.getParameter("cPage"); //목록누르면 언제든 원래 페이지로 가야하기에 꼭필요
		//게시물을 구별하는 기본 키값
		String b_idx = request.getParameter("b_idx");
		
		BbsVO vo = BbsDAO.getBbs(b_idx);
				//b_idx를 던져서 하나의 게시물을 얻어내는 mapper xml이 필요하다
				
		if(vo!=null) {
			request.setAttribute("vo", vo);
			//이쯤에서 사실 hit 수 하나 증가시켜주는 게 맞기는 하다
		}
		
		//접속 후 한번도 읽지 않았던 게시물이면 조회수 증가 ==> 생략
		
		
		return "/bbs/view.jsp";
	}

}
