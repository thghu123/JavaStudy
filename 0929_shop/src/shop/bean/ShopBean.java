package shop.bean;

import mybatis.dao.ShopDAO;
import mybatis.vo.ProductVO;

public class ShopBean {
//사용자가 선택한 카테고리값을 저장할 변수
	private String category; //이것은 <jsp:setProperty에 의해 자동 저장됨
	/* 위 자체가 세터를 부르는 의미 */
	
	/*
	 * 카테고리 값으로 제품들을 선별하 후 배열로도 처리해보자 왜 리스트로 해도되는 데 배열로해야하는가 list는 저장할 수록 사이즈가 늘어난다
	 * 가변 메모리를 가지기 때문에 연산을 조금 더 한다 , 웹상에서는 배열이 더 빠르다. 그래서 속도를 위해 배열로 처리 많이한다.
	 */
	
	private ProductVO[] p_list;
	
	//제품 상세보기 기능에서 사용할 제품 번호를 저장
	private String p_num;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public ProductVO[] getP_list() {
		return p_list;
	}

	public void setP_list(ProductVO[] p_list) {
		this.p_list = p_list;
	}

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	

	//제품 목록(제품 진열대)를 shopDAO를 통해 생성해야합니다.
	public void searchProduct() {
		p_list = ShopDAO.getList(category);//카테고리가 인자로 안들어왔는 데 어떻게 쓰는가
		//이미 jsp:setproperty를 이용해서 sb에 보내어 들어와있는 상태입니다. 그 자체가 request *의 의미
		
		
	}
	
	//사용자가 상세보기를 하기위해 제품번호를 이용하게 된다.
	//원하는 제품을 제품 진열대 p_list에서 검색한 후 productVO를 반환하자
	//product_contetnt.jsp에서 표현한다. p_num이 있다.
	//public ProductVO getProduct(){//인자는 이미 안에 있다
		public ProductVO getProduct(){//인자는 이미 안에 있다
		ProductVO pro = null;
		
		//사용자가 선택한 제품은 이미 p_num이라는 변수에 들어가있다.
		//for문으로  p_list에서 찾아서 반환하면 된다
		for(ProductVO vo : p_list) {
			
			if(vo.getP_num().equals(p_num)) {
			pro =vo;				//이것도 그냥 된다.
			/* System.out.print("값 검출."); */
			/* pvo2 = vo; */
			/* return vo; */
				break;
			}
			
		}
		
		return pro;
		
	
	}
	
	
	
	
	
	
}


