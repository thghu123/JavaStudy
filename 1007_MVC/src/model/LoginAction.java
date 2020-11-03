package model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatic.dao.MemberDAO;
import mybatis.vo.MemberVO;

public class LoginAction implements Action{

	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path = "/jsp/login.jsp";
		//사용자의 요청 방법에 따라 구분하자. 첫페이지에서 / 두번째 페이지에서 로그인을 눌렀을때 호출, getpost 방식만 다르다
		//get메서드가 곧 요청 방식이다 -> String타입으로 돌아온다
		
		//여기서 post 방식일 때만 id name 받아낼 것이다
		if(request.getMethod().equalsIgnoreCase("post")) {
		
				//id와 pw를 받아서 마이바티스 환경을 이용하여 인증을 확인한다.
				//로그인 허용이 됐다면 vo != null httpsession에 vo 객체를 vo라는 이름으로 저장합니다.
				request.setAttribute("login_chk", false);
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				//맵으로 감싸는 건 DAO, 여기 둘다 백엔드니까 해도된다.
				//마이바티스 환경을 잡자. 지금은 멤버 t를 연결할 계획. 1. 라이브러리, 2. VO, 3.
				
				//연결확인
//				List<MemberVO> list = MemberDAO.lsAll();
//				for(MemberVO vo : list) {
//					System.out.println(vo.getM_name());
//				}
				
				/* System.out.println(id+pw); 받아온 값 확인 name이 id pw고 id는 s_pw니까 서버에선 맞다*/
				
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("id",id);
				map.put("pw",pw);
				MemberVO vo = MemberDAO.check(map); 
				if(vo!=null) {
					HttpSession ss = request.getSession();
					ss.setAttribute("vo",vo); //등록 정보도 받아와야하니 boolean말고 통째로 얻어와 확인
					request.setAttribute("login_chk", true);
				}
				
				//샘 MemVO mvo = memDAO.check
				//로그 아웃은 vo를 삭제하는 것으로 액션을 새로 만들어야한다.
				
				//이걸 통째로 DAO에 넘겨주자
				
				
				
				
			//request에 login_chk라는 이름으로 true를 저장합니다. 위의 버튼을 조정하기 위해서
			//HttpSession session = request.getSession();
			
			path = "/jsp/index.jsp";
		}
		
		//get 방식으로 했으면 위의 지정된경로로만 간다.
		return path;
		
	}
	
	
}
