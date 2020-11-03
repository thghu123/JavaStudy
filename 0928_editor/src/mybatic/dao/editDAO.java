package mybatic.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.EditVO;

public class editDAO {
	

	public static boolean addEdit(String title, String content) 
	 { 
		
		SqlSession ss = FactoryService.getFactory().openSession(); //인자로 넘어온값을 하나로 합친다. 
	 Map<String,String> map = new HashMap<String, String>(); //섞어서 받아오기 위해서 String int 이렇게 받기
		 boolean value = false;
		 int cnt = 0;
		 
		 if(title != null){ // || title.trim().length()>0
			 
			map.put("m_title", title);
		 	map.put("m_content",content);
		 	
		 	cnt = ss.insert("edit.insertEdit",map); //저장에 설공하면 1을 반환받는다. 
		 	if(cnt > 0) {
		 		value = true;
		 		ss.commit();
		 }
		  else { 
			  ss.rollback(); 
		 }

		  }
		 ss.close(); 
		 return value; 
		
	 }
		
	
	
}
