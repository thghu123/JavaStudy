package pm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import pm.service.FactoryService;
import pm.vo.EmpVO;

public class EmpDAO {
	//원하는 mapper를 호출하고 수행하는 메서드를 정의한다
	//mapper에 하나 sql 문있으니 여기 하나 만들자.
	//단 id와 같게해야 유지보수에 편하다.
	public static List<EmpVO> getTotal(){
		SqlSession ss = FactoryService.getFactory().openSession();
		//우선 원하는 맵퍼를 호출하기 위해서 sql session을 팩토리로 부터 얻어온다
		
		List<EmpVO> list = ss.selectList("emp.total");
		
		ss.close();//이것도 썼으면 닫아줘야한다.
		
		return list;
		
		//이놈은 jsp에서 호출한다.
	}

	public static List<EmpVO> getSearchName(String name){
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<EmpVO> list = ss.selectList("emp.searchName",name);
		
		ss.close();//이것도 썼으면 닫아줘야한다.
		return list;
		
		
		
	}



}
