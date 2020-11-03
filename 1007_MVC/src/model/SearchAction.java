package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatic.dao.MemoDAO;
import mybatis.vo.MemoVO;

public class SearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		//나머지 파라미터 searchType과 value를 받아야한다.
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		//이 타입에 맞는 검색을 하기 위해서
		//이미 동적 쿼리를 이용해서 (뭐가 들어오냐에 따라 다른 결과가 나오는) sql 문장을 호출하면된다.
		//mapper와 DAO가 이미 존재한다.
		
		List<MemoVO> list = MemoDAO.searchMemo(searchType, searchValue);
		
		//list를 받았다면 배열로 변환을 한다
		MemoVO[] ar = null;
		if(list!=null&&list.size()>0) {
			
			ar = new MemoVO[list.size()];
			list.toArray(ar);
			
			
		}
		
		/* request.setAttribute("ar", ar); */ //중요
		//여기서 list 가 실제 리스트이기에 list를 담아줘야 대체가된다. 한글은 깨진다.
		 request.setAttribute("list", ar); 
		return "jsp/notice.jsp";
		
		

	}

}
