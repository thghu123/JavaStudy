package com.project.ex;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bbs.util.Paging;
import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

@Controller
public class MarketController {

	@Autowired
	private BbsDAO b_dao;
	//만약에 이미지가 있으면 띄워주는 게시물을 만들어주고 b_dao와 xml 파일 변경
	private int blockList = 10;
	private int blockPage = 5;
	
	
	@RequestMapping("/market")
	public ModelAndView marketList(String bname, String cPage) {
		ModelAndView mv = new ModelAndView();
		
		int c_page = 1;
		if(cPage != null)
			c_page = Integer.parseInt(cPage);
		//cpage와 c_page로 다른 변수명
		
		if(bname == null) 
			bname = "BBS"; //**추후에 MARKET 테이블 만들어서 bname을 MARKET으로 변경하자
		
		int rowTotal = b_dao.totalCount(bname); //테이블에 bname은 추가할 것
		
		Paging page = new Paging(c_page, rowTotal, blockList, blockPage);
		
		BbsVO[] ar = b_dao.getList(page.getBegin(), page.getEnd(), bname);
		//BbsController와 비교하며 진행 중 jsp 호출만 변경함
		
		mv.addObject("ar", ar);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("p_code", page.getSb().toString());
		mv.addObject("blockList", blockList);		
		mv.addObject("nowPage",c_page);
		
		mv.setViewName("market/list");
		
		return mv;
		
	}
	
}
