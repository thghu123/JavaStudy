package mybatis.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.SQLExceptionSubclassTranslator;

import mybatis.vo.MemVO;

public class MemDAO {
	@Autowired
	private SqlSessionTemplate sst;
	
	
	public MemDAO() {
		System.out.println("memdao!");
	}
	

	//회원 목록
	public MemVO[] getAll() {
		MemVO[] ar = null;
		//mapper을 호출해서 받아오는 과정 selectOne처럼 jsp와 똑같다.
		List<MemVO> list = sst.selectList("mem.all");
		if(list != null && list.size()>0) {
			ar = new MemVO[list.size()];//memVo 생성이 아니라 공간만 만든 것
			//리스트에 복사하기 좋은 공간을 확보
			
			//이제 list의 각요소들을 ar에 복사
			list.toArray(ar);			
		}
		
		//여기서 ss를 닫았는 데 이를 닫으면 안된다. 그 당시에는 지역 변수였다.
		//지금은 멤버 변수로 선언돼있다. 이 DAO는 한번만 생성되기에, 2번째 호출 시부터 사용 못한다.
		
		return ar;
	}
			
	//해당 메서드를 static으로 안하는 이유는 위 부분을 쓰는 곳에서 똑같이 골뱅이 오토 와이드로 연결시킬 거다
	//빈번하게 쓰이기에 계속 만들어지면 sst가 하나뿐이지만 혼선이 일어나니까 하나의 DAO를 만들고 
	//쓰다가 닫아버리게 되면 죽은 DAO가 되는 것 sst가 닫혔기에 sst.selectlist 도 못쓴다
	//필요한 컨트롤러에서 써야하니까 거기서 DAO를 멤버변수로 지정하고 오토와이어드를 입히면
	//컨트롤러가 수행될때 DAO가 들어온다. 하지만 그 컨트롤러가 수행되기 전에 만들어져있어야만한다.
	//마치 싱글 톤처럼 딱 한개 만들어두고 쓰는 것과 같다.
}
