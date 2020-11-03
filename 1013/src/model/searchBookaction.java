package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mybatic.dao.LibDAO;

import mybatis.vo.LibJoinVO;


public class searchBookaction implements Action {
//아래에서 접근 제한자를 public이 아닌 다른 걸로 하면 에러가 난다.
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		

			/***************************띄워주기**********************************/

			List<LibJoinVO> list = LibDAO.showall();
					
			
			if(list != null && list.size()>0) { 

			request.setAttribute("s_list", list);	
			
			//for each 문으로 출력해서 결과 확잉ㄴ하자.			
			}
			
			
			
		return "/jsp/m_list.jsp";
	}

}
