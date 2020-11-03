package com.project.ex;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bbs.util.Paging;
import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

@Controller
public class BbsController {

	@Autowired
	private BbsDAO b_dao;
	
	private int blockList = 10; // 한페이지에 보여질 게시물 수
	private int blockPage = 5; // 한 블록당 보여질 페이지 수
	
	@RequestMapping("/bbs")
	public ModelAndView bbsList(String bname, String cPage) {
		ModelAndView mv = new ModelAndView();
		
		int c_page = 1;
		if(cPage != null) // 뭔가가 넘어온 경우
			c_page = Integer.parseInt(cPage);// 3, 4,...
		
		// 현재 페이지 값인 cPage라는 파라미터값이 받지 못한 경우는 
		// 무조건 1페이지가 기본이된다.
		
		if(bname == null)
			bname = "BBS";
		
		int rowTotal = b_dao.totalCount(bname);
		
		Paging page = new Paging(c_page, rowTotal, blockList, blockPage);
		
		// 목록을 얻어낸다.
		BbsVO[] ar = b_dao.getList(page.getBegin(), page.getEnd(), bname);
		
		mv.addObject("ar", ar);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("p_code", page.getSb().toString());
		mv.addObject("blockList", blockList);
		mv.addObject("nowPage", c_page);
		
		
		//화면을 표현할 뷰페이지를 설정
		mv.setViewName("bbs/list");
		return mv;
	}
}








