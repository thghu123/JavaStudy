package ex4;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Action3 implements Action {
	@Override
	public String execute(HttpServletRequest request ,HttpServletResponse response) {
		
		DataVO dvo1 = new DataVO();
		dvo1.setName("일지매");
		dvo1.setAge(31);
		
		DataVO dvo2 = new DataVO();
		dvo2.setName("칠지매");
		dvo2.setAge(3);
		
		DataVO dvo3 = new DataVO();
		dvo3.setName("사지매");
		dvo3.setAge(333);
		
		//위의 3개의 자료들을 하나로 묶어 처리
		DataVO[] ar =new DataVO[3];
		//datavo3개가 들어갈 수 있는 공간이 만들어진 것이지, dataVO가 만들어진게 아니다
		
		ar[0] = dvo1;
		ar[1] = dvo2;
		ar[2] = dvo3;
		
		request.setAttribute("ar", ar);
		return "/ex4/ar.jsp";
	}
}
