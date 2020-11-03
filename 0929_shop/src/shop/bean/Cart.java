package shop.bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import mybatis.vo.ProductVO;

public class Cart {

	/*
	 카트의 기능 분석
	  1)제품(productVO)을 담을 공간이 필요
	  :list<productVO> 이거에 담으면된다. 계속 추가되기 때문
	  2)1)의 제품을 저장하는 기능
	  3)1)의 제품을 삭제하는 기능
	  4)1)의 모든 제품들을 배열로 반환하는 기능, 출력시 이용
	  5)1)에서 특정 제품을 검색하는 기능, 삭제하기 전 검색한 후 삭제해야한다.
	  6)5)에서 검색된 제품의 수량을 변경
	  7)총액 계산
	  기능 분석
	
	위 분석에 따른 필요한 멤버 변수들
		list<productVO>
		int totalprice; 없어도 될 것 같다.
						--> productVO안에 total price를 다 더하면되니까
	 카트의 기능 - 메서드
	 	searchProduct : 제품 검색 기능
	 	addProduct : 제품 추가기능
	 	delProduct : 제품 삭제기능
	 	changeCount : 수량 변경
	 	get-list : 배열로 반환
	 	
	 */
	
	private List<ProductVO> list;
	
	public Cart() {
		list = new ArrayList<ProductVO>(); //어레이 리스트 생성
	}
	
	//카트에서 특정 제품을 검색하여 반환하는 기능 method
	public ProductVO searchProduct(String p_num) {//하나만 반환될 것이다.
		//p_num을 list에서 찾아야한다.
		/*
		 * for(ProductVO vo : list) { if(vo.getP_num().equals(p_num)) { return vo; } }
		 * 
		 * return null;
		 */
		//검색 속도를 늘리기 위해 반복자를 사용 => 객체가 존재한다. 
		Iterator<ProductVO> it = list.iterator();
		//java.util에 있는 iterator 반복자 사용 
		//가장 적합한 반복문이 while문
		while(it.hasNext()){ //다음 요소를 가지고 있냐
			ProductVO vo = it.next();//그 값을 반환하게 되어있다.
			if(vo.getP_num().equals(p_num))
				return vo;
		}//while의 끝
		return null;
	}
	
	public ProductVO[] getList() {
		ProductVO[] ar = null;
		if(list.size() > 0) { 
			//카드가 생성될 때 무조건 멤버변수로 list가 생성되기에 null일 수 없다
			//원래는 (list!=null&&list.size()>0)
			ar = new ProductVO[list.size()];
			list.toArray(ar);
		}
		return ar; //list가 없으면 null 반환 , 아니면 배열 복사되어 전달
	}
	
	public boolean delProduct(String p_num) { 
		boolean value = false; //list에서 찾아서 있으면 삭제하자.
		/*
		 * Iterator<ProductVO> it = list.iterator(); while(it.hasNext()){ ProductVO vo =
		 * it.next(); if(vo.getP_num().equals(p_num))
		 * 
		 * }//while의 끝
		 */		
		//위에 이미 search Product있고 없으면 null 이온다
		ProductVO vo = searchProduct(p_num);
		if(vo!=null) {
			list.remove(vo);//이건 list에서 삭제한 것을 의미, 장바구니니까 db 접근 하지 않는다.
			value = true;
		}		
		return value;
	}
	public void addProduct(ShopBean sb, String p_num) {
		//현재 인자로 넘어온 선택된 제품 번호가 이미 카트에 저장된 제품일 수 있기에 검색
		ProductVO vo = searchProduct(p_num);
		
		if(vo != null) {//이미 있는 경우
			//기존 저장된 제품의 수량을 먼저 뽑아낸다. 거기에 +1
			int q = vo.getQuant();
			vo.setQuant(q+1);
			//vo가 기억하고 있는 수량을 1을 더해 다시 저장한다
			return;
		}
		
		//vo가 null을 가진 경우 , 선택한 제품을 하나 진열대에서 얻어내고 추가한다
		//p_list, p_num, category 등등이 메서드로 존재한다.
		//addproduct는 shopbean 에서 선택된 p_list중 하나를 Cart의 productVO배열에 넣겠다
		//shopbean을 p_list대신에 그냥 진열대니까 통째로 넣은 것
		//shopbean에 getProduct도 있어서 이용할 수 있다. 검색또한 가능
		//지금 getProduct를 호출하면 이전에 있던 p_num으로 인해서 다른 게 검색되기에 이를 수정해야함
		//그래서 p_num을 같이 받아서 shopbean안의 p_num을 변경해야한다.
		sb.setP_num(p_num);//1
		vo = sb.getProduct();//2
		
		//가져온 제품의 수량을 지정한다
		vo.setQuant(1);
		
		list.add(vo);//카트에 저장, 적재하였다.
		
		
		
	}
	
	//카트에서 원하는 제품을 검색한 후
	//수량만 변경하는 기능
	public void changeCount(String p_num, int q){
		//이제품이 있는 지 확인하고 있을 때만 수행한다.
		ProductVO vo = searchProduct(p_num);
		if(vo != null) {
			vo.setQuant(q);//수량과 함게 total Price도 조정된다
		}
		
		
	}
			
			
	
}
