package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatic.dao.MemoDAO;
import mybatis.vo.MemoVO;

public class NoticeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//index화면에서 공지사항 파트의 더보기를 클릭했을 때 오는 곳
		/* MemoVO[] */ 
		List<MemoVO> list = MemoDAO.getList(); //list 구조를 반환하는 데 배열을 준비했으니 변경해줘야한다.
		
		//배열로 변환하기 위해 배열의 변수를 준비
		MemoVO[] ar = null; //객체 자료형이면 전부 null, 기본 자료형이면 맞게 넣어준다.
		
		//list가 비어있지 않을 때 배열을 list의 크기와 동일하게 하여 생성한다.
		
		if(list != null && list.size()>0) { //비어있지 않은 경우
			//null이 넘어오지 못해도 혹시 모르니 해준다. null값 비교하는 습관 들이기
			ar = new MemoVO[list.size()]; //배열이 만들어진게 아니라 공간만 확보해준 것
			
			//리스트에 저장된 요소들을 배열인 ar에 그대로 넣어준다.
			list.toArray(ar);			
						
		}
		//결과가 널값이 나올 수 있으니 가서 유효한지 비교를 해야한다.
		
		//jsp 에서 표현할 배열을 request에 list라는 이름으로 저장
		request.setAttribute("list", ar);
		
		return "/jsp/notice.jsp";
	}

}
