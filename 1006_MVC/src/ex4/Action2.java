package ex4;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Action2 implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response){
		//나머지 파라미터 name과 age를 받는다.
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		if(name != null && age != null) {
			//받은 값들을 저장할 VO 객체를 생성한다
			DataVO dvo = new DataVO();
			dvo.setName(name);
			dvo.setAge(Integer.parseInt(age));
			
			//준비된 vo를 jsp에서 표현할 수 있도록 request에 담아라
			request.setAttribute("dvo", dvo);
			//여기서의 변수명은 jsp에서 뿌릴 변수명
			//이번에는 객체를 받았는 데 이를 어떻게 출력할 것인가
		}
		
		return "/ex4/data.jsp";
	}
	
	
}
