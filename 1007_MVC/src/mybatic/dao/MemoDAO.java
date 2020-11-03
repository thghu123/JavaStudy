package mybatic.dao;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.MemoVO;

public class MemoDAO {
	
	/* public static String idx = "1"; */

	public static List<MemoVO> getList(){
		//인자를 받는 경우는 between 으로 서버의 일부만 받아 게시판 속도를 올리는 용도
		SqlSession ss = FactoryService.getFactory().openSession();
		List<MemoVO> list = ss.selectList("memo.total");
		
		ss.close();
		
		return list;
		//null값은 없고 공백이 나간다.
		
	}
	
	public static List<MemoVO> getPart(){
		//인자를 받는 경우는 between 으로 서버의 일부만 받아 게시판 속도를 올리는 용도
		SqlSession ss = FactoryService.getFactory().openSession();
		List<MemoVO> list = ss.selectList("memo.part");
		
		ss.close();
		
		
		return list;
		//null값은 없고 공백이 나간다.
		
	}
	
	
	public static MemoVO getView(String i){
		//인자를 받는 경우는 between 으로 서버의 일부만 받아 게시판 속도를 올리는 용도
		SqlSession ss = FactoryService.getFactory().openSession();
		MemoVO mem = ss.selectOne("memo.view",i);//idx
		
		ss.close();
		
		return mem;
		//null값은 없고 공백이 나간다.
		//return ss.selectOne("memo.view",i); 이렇게하면 session close를 못한다
		
	}
	
	
	//메모를 저장하는 기능, 결과 확인할 길은 열어놔야한다. boolean 반환타입
	/*
	 * public static boolean add( String content, String writer, String ip, String
	 * idx) {
	 */
		public static boolean add( String content, String writer, String ip) {
		SqlSession ss = FactoryService.getFactory().openSession();
		//인자로 넘어온값을 하나로 합친다.
		Map<String, String> map = new HashMap<String, String>();
		//섞어서 받아오기 위해서 String int 이렇게 받기 위해서는 통칭하기위해 object를 사용해야한다.
		boolean value = false;
		
	
		if(writer != null || writer.trim().length()>0){
			map.put("content", content);
			map.put("writer", writer);
			map.put("ip", ip);
			
		}
		
		int cnt = ss.insert("memo.add",map); //저장에 설공하면 1을 반환받는다.
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
		
		public static void del( String idx) {
			SqlSession ss = FactoryService.getFactory().openSession();
			//인자로 넘어온값을 하나로 합친다.

			ss.delete("memo.del",idx);
			ss.commit();
			ss.close();
			}
		
		public static List<MemoVO> searchMemo(String searchType, String searchValue){
			//jsp 단에서는 되도록이면 map구조 작업을 안하는 게 좋다. 왜냐하면 보여주는 단에서 연산을 하면 느려진다
			//고로 이안에서 작업을 여기서하는 게 바람직하다.
			Map<String,String> map = new HashMap<String, String>();
			map.put("searchType",searchType);
			map.put("searchValue",searchValue);
			
			SqlSession ss = FactoryService.getFactory().openSession();
			List<MemoVO> list = ss.selectList("memo.searchM",map);
			ss.close();
			
			return list;
			
			
		}
		public static boolean updat(String ip,String content,String writer,String idx){ 
			SqlSession ss = FactoryService.getFactory().openSession();

		
			Map<String, String> map = new HashMap<String, String>();
			
			int tmp = 0; 
		
			if(writer != null || writer.trim().length()>0) {
				map.put("writer", writer);
			}
			if(content != null || content.trim().length()>0) {
			map.put("content", content);
			tmp++;
			}
			if(idx != null || idx.trim().length()>0) {
			map.put("idx", idx);
			tmp++;
			}
			boolean value = false;
			if(tmp>0) {
			
			int cnt = ss.update("memo.edit", map); 
				
			if(cnt > 0) {
				ss.commit();
				ss.close();
				 value = true; 
				return true;
			}
			else {
				ss.close();
			
			}
			}
			
			return value;
			
		

			
		}
		
		public static List<MemoVO> list(String begin, String end)
		{
		Map<String, String> map = new Hashtable<String, String>();
		map.put("begin",begin);
		map.put("end", end);
		SqlSession ss = FactoryService.getFactory().openSession();
		List<MemoVO> list = ss.selectList("memo.list",map);
		ss.close();
		return list;
		}
		
		
	
	
}
