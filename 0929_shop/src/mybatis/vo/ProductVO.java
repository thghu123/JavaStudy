package mybatis.vo;

public class ProductVO {

	private String 
	num			 , //기본키
	category	 ,
	p_num		 ,
	p_name		, 
	p_company 	,
	p_image_s	, //제품 목록 창에서 사용
	p_image_l	, //제품 상세보기 장에서 사용
	p_content	, //제품 설명
	p_date		; //등록일
	private int 	
	p_price		, //단가
	p_saleprice , //세일가
	quant, 		  //수량
	totalPrice	; //세일가 *수량, 총결제 금액
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_company() {
		return p_company;
	}
	public void setP_company(String p_company) {
		this.p_company = p_company;
	}
	public String getP_image_s() {
		return p_image_s;
	}
	public void setP_image_s(String p_image_s) {
		this.p_image_s = p_image_s;
	}
	public String getP_image_l() {
		return p_image_l;
	}
	public void setP_image_l(String p_image_l) {
		this.p_image_l = p_image_l;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_saleprice() {
		return p_saleprice;
	}
	public void setP_saleprice(int p_saleprice) {
		this.p_saleprice = p_saleprice;
		
	}
	public int getQuant() {
		return quant;
		
	}
	public void setQuant(int quant) {
		//수량이 변경될 때 총액도 자동적으로 다시 구해져야한다 = 수량*세일가격
		this.quant = quant;
		setTotalPrice(quant*p_saleprice);
		//혹은 totalPrice = quant * p_saleprice
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	//단가가 있고 세일가있으면 옆에 얼마나 세일인지도 알려준다
	public String getPersent() {
		float per = (p_price - p_saleprice) * 100/p_price;
		int value = (int)per; //소수점 이하 절삭
		
		//굳이 String으로 반환한다.
		return String.valueOf(value);
		//return value+""; //""안은 암시적 객체생성으로 안바뀐다. 앞은 정수이기에 못더한다. 고로 연결 연산자가된다
		//앞이 정수기에 value를 문자열로 바꾸고 뒤에것과 연결한다. 이 문장으로 String객체가 2개가 생성된다
		//이제 합쳐지면 또다른 문자열이 생기니까 더 많은 연산이 들어가고 자주 호출될 수록 속도가 저하된다.
		
	}
	
	
}
