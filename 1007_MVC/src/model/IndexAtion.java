package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatic.dao.MemoDAO;
import mybatis.vo.MemoVO;

public class IndexAtion implements Action {
//아래에서 접근 제한자를 public이 아닌 다른 걸로 하면 에러가 난다.
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		//로그인 유무 판단
		//로그인 했다면 session에 vo라는 이름으로 저장이 되어있다.

		/* 시도
		 * Object log = request.getAttribute("vo"); if(log != null) { //jsp로 가는 데 로그인
		 * 데이터를 넘겨주며 이동한다.
		 * 위에는 인자를 건드리는 것 뿐 세션을 건드리는 건 아니다
		 * }
		 */
	
		//먼저 세션을 얻어냅니다.
			HttpSession session = request.getSession();//이러면 세션 얻어진다
			
		//vo라는 이름으로 저장된 객체를 얻어낸다. 
			Object obj = session.getAttribute("vo");
		//obj가 null일때 비로그인이다.
			boolean chk = false;
			//있을 수도 없을 수도 있기 때문
			if(obj != null)
				chk = true;
				//request.setAttribute("login_chk", false);
				/*
				 * else chk = false;
				 */
				//request.setAttribute("login_chk", true);
			//위처럼 써도된다. 간결
			request.setAttribute("login_chk", chk);
			
			/***************************더보기 띄워주기**********************************/
			List<MemoVO> list = MemoDAO.getPart(); //list 구조를 반환하는 데 배열을 준비했으니 변경해줘야한다. 
			//애초에 
			
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
			/***************************더보기 띄워주기**********************************/
			
			String begin = "1";
			String end = "3"; //유지보수에 좋다.
			
			List<MemoVO> list2 = MemoDAO.list(begin,end);
			//속도를 높이기 위해 배열로 만들자.
			
			
			MemoVO[] ar2 = null;
			if(list2!=null&& list2.size()>0) {
				ar2 = new MemoVO[list2.size()];
				list2.toArray(ar2);
			}
			request.setAttribute("ar2", ar2);
			
					
			
			
			
		return "/jsp/index.jsp";
	}

}
