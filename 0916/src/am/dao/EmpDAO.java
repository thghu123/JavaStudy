package am.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import am.service.FactoryService;
import am.vo.EmpVO;

public class EmpDAO {

	
	
	public static List<EmpVO> getAll(){
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<EmpVO> list = ss.selectList("emp.All");
		
		ss.close();
		
		return list;
		
		
		
	}
	
	
	public static List<EmpVO> getSearchNo(String no){
		
		int s_no = Integer.parseInt(no);
		
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		
		List<EmpVO> list = ss.selectList("emp.searchNo",s_no);
		
		//이걸 파세인트로 받고 empno 에서 양옆에 기호 떼자.
		ss.close();
		
		return list;
	}
	
	
	//동적 쿼리를 활용하는 메서드 

		public static List<EmpVO> search(String type, String value){ 
			
		SqlSession ss = FactoryService.getFactory().openSession();
		//마이 바티스 환경에서 인자를 보낼 때는 한번에 보내야하는 데 이때 쓰이는 것이 map구조이다
		//key,value로 계속 저장할 수 있다.
		Map<String, String> map = new HashMap<String, String>();
		//hash table로 new해도 된다
		//key와 value의 자료형을 지정한다
		
		map.put("searchType", type); //앞이 변수명
		map.put("searchValue", value);
		//이걸 my batis 에 던지면 된다. 2개 자료를 준다
		
		List<EmpVO> list = ss.selectList("emp.search",map);
		//예를 부를 때 Map을 줘라. 한번에 2개의 값을 전달하는 것
		
		//이제는 search가 중요하다. 이걸 mapper에서 어떻게 처리하는 지?
		
		ss.close();
		
		return list;
		
	}
	
		//반환형은 보통 int로 진행한다. 수정에 성공했다 안했는 의미로 true, false로 
		//반환을 하기 위헤 boolean도 많이 사용환다
		public static boolean updat(String no, String name, String job, String sal){ 
			SqlSession ss = FactoryService.getFactory().openSession();
			//위에는 셀렉트에서만 이렇게 쓴다.
			
			
			
			//마이 바티스 환경에서 인자를 보낼 때는 한번에 보내야하는 데 이때 쓰이는 것이 map구조이다
			//key,value로 계속 저장할 수 있다.
			
			//맵구조도 준비한다. 알아서 id값으로 호환해준다.
			Map<String, String> map = new HashMap<String, String>();
			//자동완성으로 하자, hash table로 new해도 된다
			//key와 value의 자료형을 지정한다, 키는 밸류명 발류가 값
			//변수명은 보통 String 넣을 값들도 String 
			
			//값으로 들어갈때는 map, list, empVO 모든 객체, 저장하고 싶은 객체를 넣을 수 있다.
			
			//오라클은 하나에 하나만 넣을 수 있다. mysql은 values로 ,를 넣어서
			//for문을 써서 한번에 여러개 insert할 수 있다 그래서 ArrayList가 map value에 들어간다.
			int tmp = 0; //전부 공백일때를 대비.
			//해당 key값이 반드시 mapper.xml파일과 동일한 변수여야한다. 변수명이 key니까
			if(no != null || no.trim().length()>0) {
				//들어가서는 안되는 애
				map.put("sempno", no);
				
		
			}
			if(name != null || name.trim().length()>0) {
			map.put("sename", name); //앞이 변수명
			tmp++;
			}
			if(job != null || job.trim().length()>0) {
			map.put("sjob", job);
			tmp++;
			}
			if(sal != null || sal.trim().length()>0) {
			map.put("ssal", sal);
			tmp++;
			}
			//스프링 환경에서 처리하는 게 좋다. jsp 전단계
		
			//다음 값중 하나라도 들어갔다면? map에 저장되었을 때만 mybatis의 맵퍼를 호출할 것이다.
			boolean value = false;
			if(tmp>0) {

			//이걸 my batis 에 던지면 된다. 2개 자료를 준다.
			//이안에 값을 입력 안하면 공백값이 들어간다. 고로 이걸 막으면 emp.xml에서 처리해주지 않아도된다
			//해당 sename 자체가 없어야 null이다.
			
			int cnt = ss.update("emp.edit", map); 
			//update의 반환형이 int 몇개의 행이 바뀔지를 의미한다., 1을 반환할 것이다.
			/* ss.insert("emp.edit",map); */
			//예를 부를 때 Map을 줘라. 한번에 2개의 값을 전달하는 것
			
			//update는 업뎃 insert는 인설트 사용할 것
			
			
			if(cnt > 0) {
				//db의 내용을 적용하고 새로운 트랜젝션을 생성해라
				ss.commit();
				ss.close();
				 value = true; 
				return true;
			}
			else {
				ss.close();
				//return false;
			}
			}
			
			//else {//return false;}
			
			return value;
			
			//이제는 search가 중요하다. 이걸 mapper에서 어떻게 처리하는 지?
			//ss.commit();

			
		}
		
		public static boolean add(EmpVO vo){ 
			SqlSession ss = FactoryService.getFactory().openSession();
			
			boolean value = false;
			
			int cnt = ss.insert("emp.add", vo); 
			
			if(cnt > 0) {
				//db의 내용을 적용하고 새로운 트랜젝션을 생성해라
				ss.commit();
				
				 value = true; 
				return true;
			}
			else {
				ss.rollback(); //db에서의 실행 전부 취소한 뒤 트랜잭션을 새롭게 생성해라.
				//트랜잭션 은 기록지와 같다. db 에서 일어난 일을 기록하고 commit하면 적용을 한다.
				//다 처리했으면 새로운 트랙잭션 기록지를 꺼낸다. rollback을 만나면 지금 기록지 버린다.
				
				//return false;
				//지금까지의 과정을 기록지에서 삭제해야 중복이 안된다.
			}
			ss.close();
			return value;
			}
			
			//else {//return false;}
			
			
			
			//이제는 search가 중요하다. 이걸 mapper에서 어떻게 처리하는 지?
			//ss.commit();

			
		
		
		
}
	
	
	
	
	

