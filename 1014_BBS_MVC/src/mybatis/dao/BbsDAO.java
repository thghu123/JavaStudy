package mybatis.dao;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.BbsVO;

public class BbsDAO {

	
	//페이징을 위한 목록 기능 - 배열로 던지는 게 속도상 빠르다
	public static BbsVO[] getList(int begin, int end, String bname) {
		SqlSession ss = FactoryService.getFactory().openSession();
		//호출할때 map구조로 begin,end, bname을 줘야한다
		
		Map<String, String> map = new Hashtable<String, String>();
		
		map.put("bname", bname);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));

		//mapper list가 리스트를 넘겨줄 것이다. 결과는 resultMap으로 갈거고 결과는 bbsVO로 줄것이다
		List<BbsVO> list = ss.selectList("bbs.list",map);
		
		//이제 배열로 바꿔줘서 return 
		BbsVO[] ar = null;
		
		if(list != null && list.size() > 0) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
		
		}
		
		ss.close();
		
		
		
		return ar;
		
	}
	
	//전체 게시물의 수를 반환하는 기능
	public static int totalCount(String bname) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		//bname이 반드시 필요하다
		int cnt = ss.selectOne("bbs.totalCount",bname);
		
		ss.close();
		return cnt;
	}
	
	//원글 저장 ,writer는 로그인 한 사람의 아이디가 오면 된다. 받는 게 아니라
	public static void add(String subject, String writer, String content, String file_name, String ip, String bname) {
		
		Map<String, String> map = new Hashtable<String, String>();
		map.put("subject",subject);
		map.put("writer",writer);
		map.put("content",content);
		map.put("file_name",file_name);
		map.put("ip",ip);
		map.put("bname",bname);
		
		//인자 넘어온 값을 map으로 다 받았다.
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("bbs.add",map);
		/* cnt가 1일 것이다. 하나가 들어갔으니까 */
		if(cnt>0)ss.commit();
		else ss.rollback();
		
		ss.close();
		

		
	}
	
	//view
	public static BbsVO getBbs(String b_idx) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		BbsVO vo = ss.selectOne("bbs.getBbs",b_idx);
		ss.close();
		return vo;
	
	}
	
	//수정 기능
	public static boolean editBbs(String b_idx, String subject, String content,
			String fname, String ip) {
		boolean value = false;
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("b_idx",b_idx);
		map.put("subject",subject);
		map.put("content",content);
		//무조건 mapper의 인자로 들어가야하는 인자는 다 들어가야한다
		
		//파일첨부는 없을 수 도 있기에 유효검사를 하자. 그 때만 파일명을 DB에 저장한다.
		//만약 첨부된 파일이 없다면 기존 파일을 유지
		if(fname != null && fname.trim().length()>0) {
			//글자가 있다는 이야기
			map.put("fname",fname);
		}
		//mapper에서는 fname 자체가 있냐 없냐는 의미이다. map안의 변수 fname이 위의
		//유효성 결과로 들어가 있는가?
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.update("bbs.edit",map); //update 수정되면 수정된 레코드 수를 반환하게 되어잇다.
		
		if(cnt > 0) {
			ss.commit();
			value = true;
		}else {
			ss.rollback();
		}
		ss.close();
		
		return value;
	}
	
	public static void delBbs(String b_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.update("bbs.del",b_idx);
		if(cnt>0) {
			ss.commit();
		}else ss.rollback();
		
		ss.close();
	}
	
	
	
	
	
	
}
