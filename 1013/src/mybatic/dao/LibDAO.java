package mybatic.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.LibJoinVO;


public class LibDAO {
	
	 public static List<LibJoinVO> showall() {
		 SqlSession ss = FactoryService.getFactory().openSession();
		 List<LibJoinVO> list = ss.selectList("lib.search");
		 ss.close();
		 return list;
	 }

}
