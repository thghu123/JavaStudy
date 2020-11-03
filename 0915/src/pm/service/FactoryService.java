package pm.service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {

	//현재 객체가 아무리 많이 만들어져도 팩토리는 오직 하나만 생성돼야한다
	private static SqlSessionFactory factory;
	
	//static 초기화가 존재 -> 생성자보다 우선 실행
	static { //여기가 생성자보다 바람직하다 static으로 선언된 멤버변수들에 대한 초기화 작업
		try {
			Reader r = Resources.getResourceAsReader("pm/config/config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
	}
	
	
	//외부 접근하도록 메서드 쓰자
	public static SqlSessionFactory getFactory() {
		return factory;
	}
	//static 특징
	//static 은 하나만 생성된다. 객체 생성을 안하더라도 static 직접 접근할 수 있다
	
	
	
	
	
	
}
