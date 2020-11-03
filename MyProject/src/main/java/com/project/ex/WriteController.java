package com.project.ex;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;
import mybatis.vo.MemVO;
import spring.util.FileUploadUtil;

@Controller
public class WriteController {

	@Autowired
	private BbsDAO b_dao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private HttpServletRequest request;
	
	//첨부파일이 저장될 위치
	private String uploadPath = "/resources/upload";
	
	
	@RequestMapping("/write")
	@ResponseBody
	public Map<String, String> write() {
		Map<String, String> map = new Hashtable<String, String>();
		
		// 로그인이 되었다면 글쓰기 화면으로 이동!
		//그렇지 않다면 로그인이 필요하다는 신호를 준다.
		MemVO mvo = (MemVO) session.getAttribute("mvo");
		
		
		if(mvo != null) {
			map.put("chk", "1");
			map.put("url", "writeForm");
		}else
			map.put("chk", "0");
		
		
		
		return map;
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		MemVO mvo = (MemVO) session.getAttribute("mvo");
		String viewPath = null;
		if(mvo != null)
			viewPath = "bbs/write";
		else
			viewPath = "/login";
		return viewPath;
	}
	
	@RequestMapping("/write_ok")
	public ModelAndView writeOK(BbsVO vo) throws Exception {
		/*
		 * write.jsp에서 전달되는 폼의 값들(bname, subject, content, file)을 
		 * 멤버변수로 가지고 있는 BbsVO로 모두 받는다.
		 * 
		System.out.println(vo.getSubject());
		System.out.println(vo.getContent());
		System.out.println(vo.getBname());
		System.out.println(vo.getFile().getName());
		*/
		
		ModelAndView mv = new ModelAndView();
		
		//첨부된 파일이 있는지? 없는지?
		MultipartFile mf = vo.getFile();
		
		if(mf != null && mf.getSize() > 0) {
			// 첨부파일이 있는 경우! -- 저장될 위치를 절대경로로 만든다.
			String path = application.getRealPath(uploadPath);
			
			// 파일명 얻기
			String f_name = mf.getOriginalFilename();
			
			// 동일한 파일명이 있다면 변경해야 한다.(내일 한단다)
			f_name = FileUploadUtil.checkSameFileName(f_name, path);
			
			//업로드
			mf.transferTo(new File(path, f_name));
			
			//DB작업을 위해 파일명을 vo객체 저장한다.
			vo.setFile_name(f_name);
		}
		
		vo.setIp(request.getRemoteAddr());// ip저장!
		//로그인 한 정보를 얻어낸다.
		MemVO mvo = (MemVO) session.getAttribute("mvo");
		vo.setWriter(mvo.getM_name());
		
		b_dao.add(vo);
		
		
		mv.setViewName("redirect:/bbs");
		
		return mv;
	}
}









