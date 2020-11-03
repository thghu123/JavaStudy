package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.ProductVO;

public class ShopDAO {

	
	//카테고리별 목록을 반환하는 기능
	/*
	 * public static List<ProductVO> getList(String category){
	 * 
	 * SqlSession ss = FactoryService.getFactory().openSession();
	 * 
	 * List<ProductVO> list = ss.selectList("shop.list",category);
	 * 
	 * ss.close();
	 * 
	 * return list;
	 * 
	 * }
	 */
	
//베열로 변경
	  public static ProductVO[] getList(String category){
	  
	  SqlSession ss = FactoryService.getFactory().openSession();
	  
	  ProductVO[] ar = null;
	  
	  //마이바티스 매퍼가 리스트 환경으로 주기에 이렇게 받기는 해야한다
	  List<ProductVO> list = ss.selectList("shop.list",category);
	  
	  ss.close();
	  
	  //받은 리스트를 배열로 변경해야한다, 배열은 아직 미생성
	  if(list != null && list.size()>0){
		  
		  ar = new ProductVO[list.size()];//리스트의 크기와 동일하게 한다
		  
			/*
			 * for(int i = 0; i<list.size(); i++) { ar[i] = list.get(i); } //이거보단 자바의 장점을
			 * 살리자. 3000번을 돌면 너무 많다.
			 */
		  
		  //배열이 list와 같은 크기이므로 list에 있는 모든 요소들을 배열에 
		  //한번씩 뜨면서 반복하지말고 크기가 같으니까 부으면 된다
		  list.toArray(ar);//T[]은 제네릭타입 배열을 의미하므로 productVO를 의미한다.
		  /* 이러면 한번에 list에 있는 내용을 ar에 복사한 것  그냥 반환*/
		  
		  
		  
	  }
	  
	  
	  return ar;
	  
	 }
	
	
	
}
