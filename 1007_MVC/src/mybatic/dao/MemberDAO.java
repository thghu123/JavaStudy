package mybatic.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.MemberVO;

public class MemberDAO {
	

	//아이디를 검색하는 메서드
	 public static MemberVO searchId(String m_id) {
		 
		 SqlSession ss = FactoryService.getFactory().openSession();
		 MemberVO vo = ss.selectOne("member.search_id", m_id);
		 ss.close();
		 return vo; //vo가 null이면 id가 없는 아이디라는 의미이다.
		 //널이 아니면 테이블에 있다는 얘기
	 }		
	 
	 public static List<MemberVO> lsAll() {
		 SqlSession ss = FactoryService.getFactory().openSession();
		 List<MemberVO> list = ss.selectList("member.all");
		 ss.close();
		 return list;
	 }
		
	 	public static MemberVO check(HashMap<String, String> map) {
	 		//여기서 String 으로 id, name넣어서 map으로 해도된다. 둘이 같다.
	 		
	 		SqlSession ss = FactoryService.getFactory().openSession();
	 		MemberVO list = ss.selectOne("member.check_m", map);

	 		ss.close();
	 		return list;
	 	}
		
	
	
		public static boolean add(String m_id, String m_pw,String m_name,String m_addr,String m_phone,String m_email) {
		SqlSession ss = FactoryService.getFactory().openSession();
		//인자로 넘어온값을 하나로 합친다.
		Map<String, String> map = new HashMap<String, String>();
		//섞어서 받아오기 위해서 String int 이렇게 받기 위해서는 통칭하기위해 object를 사용해야한다.
		boolean value = false;
		
	
		if(m_id != null || m_id.trim().length()>0){
			map.put("m_id", m_id);
			map.put("m_pw", m_pw);
			map.put("m_name", m_name);
			map.put("m_addr", m_addr);
			map.put("m_phone", m_phone);
			map.put("m_email", m_email);
			
		}
		
		int cnt = ss.insert("member.add",map); //저장에 설공하면 1을 반환받는다.
		if(cnt > 0) {
			
			ss.commit();
			
			value = true; 
			
		}
		else {
			ss.rollback();
			//return false;
		}
		
		ss.close();
		return value;
		}
		
		//로그인 기능 - login.jsp에서 호출 
		public static MemberVO login(String u_id, String u_pw) {
			//login이라는 mapper를 사용하기 위해서는 map을 만들어서 그곳에 파라미터를 넣는다.
			Map<String, String> map = new HashMap<String, String>();
			map.put("u_id", u_id);
			map.put("u_pw", u_pw);
			
			SqlSession ss = FactoryService.getFactory().openSession();
			//세션이 열림
			MemberVO vo = ss.selectOne("member.login",map);
			//id와 pw가 정확하다면 VO를 받고 아니면 null값을 받는 다. sellist면 빈 리스트 값이 온다
			//selectlist는 빈리스트를 넘긴다. 
			ss.close();
			
			return vo;

		}
		

		

	
	
}
