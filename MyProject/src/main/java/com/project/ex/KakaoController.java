package com.project.ex;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.vo.MemVO;

@Controller
public class KakaoController {
	
	@Autowired
	private HttpSession session; //로그인 처리를 위함
	
	
	@RequestMapping("/kakao_login")
	public ModelAndView kakaoLogin(String code) {

		//카카오 서버에서 인증 코드를 전달해 주는 곳
		ModelAndView mv = new ModelAndView();
		
		//인증코드는 인자인 code로 받는다.
		//System.out.println("kakao code:"+code);
		
		//받은 코드를 가지고 토큰을 받아야한다. post 방식으로 해야함
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";//***즁요
		
		try {
			//controller에서 위를 요청하려면?? URL 만든다
			URL url = new URL(reqURL); //어디를 연결하려고한다를 정의
			
			//httpurlconnection 연결을 진행하고 url로 연결한다
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); //반환형이 다르니 성정
			
			//이제 post 방식으로 요청 ,요청 방식과 setDoOutput을 true로 지정해야한다
			conn.setRequestMethod("POST"); //requst way setting
			conn.setDoOutput(true); //요청한다는 의미
			
			//문서 아래의 parameter들을 보내야한다. grant_type, client_id(restapikey),redirect_uri,code,client secret 등등
			//required는 필수 여부를 표현, 고로 4개는 꼭 넣어야한다
			
			//인자 4개 만들어서 카카오 서버로 보낸다.
			//문자열 받아야하니 버퍼 이용한다
			StringBuffer sb = new StringBuffer();
			sb.append("grant_type=authorization_code&client_id=65e8c05234d4c18817eb381a809a6295"); //***중요
			sb.append("&redirect_uri=http://localhost:8080/kakao_login");
			sb.append("&code="+code);
			//grant_type은 홈페이지에 고정 값 존재, clientid는 restapikey
			
			//이제는 보내야한다. 여기를 요청한 곳은 우리가 아니라 kakao server이고 위에 데이터 보내기 위해 stream 준비
			
			//전달하고자하는 파라미터를 보낼 스트림 준비, 보내는 것이니 output, 모두 문자만 있으니 문자만 처리하는 butteredwrite를 쓰겠다
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			//커넥션과 연결돼있는 bufferedWriter가 생성된다
			bw.write(sb.toString());//요청을 POST 방식으로 진행.
			bw.flush();//스트림 비우기 - 404 경로오류 500대는 코드 문제, 200대는 정상적인 결과처리 시 넘어온다
			
			//결과 코드가 200번이면 성공이다
			int res_code = conn.getResponseCode();//이걸로 동작 여부를 알 수 있다.
			//System.out.println("rescode:"+res_code); 200나온다
			
			//이제 토큰을 알아내야한다.
			if(res_code == 200) {
				//요청 성공 시 요청을 통해 얻은 json타입의 결과를 얻어내야한다. response 홈페이지 표에 보면 나온다.
				//읽어와야하니까 reader
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				StringBuffer result = new StringBuffer(); //읽을 준비
				
				while((line = br.readLine()) != null) {//이전의 size와 달리 문자기반이므로 line을 이용한다 
					//enter가 있을 때까지 한줄을 읽는 다는 의미. 이전의 int형일때의 -1이 아닌 값이 없으면 null값을 준다.
					result.append(line);
					//적재
				}//while의 끝
				
					br.close();
					bw.close();
					
					//System.out.println(result.toString());//이거 제이슨이다. 잘 받았다
					
					//JSON 파싱 - json라이브러리를 사용해보자 json.simple 사용
					//access token과 refresh token을 잡아내어 modelandview에 저장한 후 
					//result.jsp로 이동하여 결과를 표현하려고한다.
					
					//라이브러리 추가 - 이제 jsonparser를 쓸 수 있다, jsonp자동완성 경로에 simple 있는 것 사용
					JSONParser j_par = new JSONParser(); //파서 생성
					Object obj = j_par.parse(result.toString()); //아직은 json 객체는 아니다
					
					//자바에서 편하게 사용할 수 있도록 json 객체로 변환하자
					JSONObject j_obj = (JSONObject) obj; //이러면 String이 json객체로 변환된 것
					//오류는 다운 캐스팅한다
					
					//앞의 key값을 요구하면 value를 준다
					access_Token = (String) j_obj.get("access_token"); //캐스팅하면 긴 access token값이 들어간다
					refresh_Token = (String) j_obj.get("refresh_token");
	
					//사용자 정보를 얻기 위해 토큰을 이용한 서버 요청을 다시 진행해야한다. 서버 요청 방법이 있다.
					
					String header = "Bearer "+access_Token; //**주의 반드시 스페이바하나 두기
					String apiURL = "https://kapi.kakao.com/v2/user/me";//마지막 요청을 위한 url경로 설정했다.
					//kakao 관련은 항상 https로 호출하자
					
					
					
					
					
				
				
				URL url2 = new URL(apiURL);
				HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
				
				//post 방식 설정
				conn2.setRequestMethod("POST");
				conn2.setDoOutput(true);
				
				conn2.setRequestProperty("Authorization", header);
				//문서>카카오 로그인>REST API문서 request에 존재한다.
				
				res_code = conn2.getResponseCode();
				
				if(res_code == HttpURLConnection.HTTP_OK) { //httpURLconnection.HTTP_OK이 200을 의미한다.
					//주석이 없어도 연결이 되었음을 코드만으로 확인할 수 있다. == 200을 쓰고 주석
					
					//정상적으로 사용자 정보를 요청했다면 이제 받아내야한다.이메일, 프로필 사진(경로를 준다) -> reader(txt처리)를 사용한다
					BufferedReader brd = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
					
					StringBuffer sBuff = new StringBuffer();
					String str = null;
					while((str = brd.readLine())!=null) {
						sBuff.append(str); //kakao server에서 전달되는 모드든 값들이 sBuff에 누적 (JSON)	
					}//while의 끝
					
					obj = j_par.parse(sBuff.toString());
					//파싱, 받아온 문자열을 json표기법으로 인식시킴. 이걸 json object로 바꿔줘야한다
					
					j_obj = (JSONObject) obj;
					
					JSONObject n = (JSONObject) j_obj.get("properties");
					//문서에서 사용자 정보 가져오기 - success에 긴 글을 가져오는 데 이중 properties 키만 가져온 것
					
					String name = (String) n.get("nickname");
					String p_img = (String) n.get("profile_image");				
					

					mv.addObject("nickname",name);
					mv.addObject("pic",p_img);
					//입력
					
					//로그인 할거면 memvo를 만들어서 이름을 저장해주면된다. 그리고 session에 mvo를 넣어주면된다.
					//물론 정보는 카카오에서 받은 것
					MemVO mvo = new MemVO();
					mvo.setM_name(name);
					
					session.setAttribute("mvo", mvo);//로그인 승인
					
					

					
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("kakao_result");
		return mv;
		
	}
	
	
}

/*package com.project.ex;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.vo.MemVO;

@Controller
public class KakaoController {
	
		@Autowired
		private HttpSession session;

		@RequestMapping("/kakao_login")
		public ModelAndView kakaoLogin(String code) {
			//카카오서버에서 인증코드를 전달해 주는 곳!
			ModelAndView mv = new ModelAndView();
			
			//인증코드는 인자인 code로 받는다.
			//System.out.println("CODE:"+code);
			
			//받은 코드를 가지고 다시 토큰을 받기 위한 작업 - POST방식
			String access_Token = "";
			String refresh_Token = "";
			String reqURL = "https://kauth.kakao.com/oauth/token";
			
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				
				//POST방식으로 요청하기 위해 setDoOutput을 true로 지정
				conn.setRequestMethod("POST");//요청방식 설정
				conn.setDoOutput(true);
				
				//인자 4개를 만들어서 카카오 서버로 보낸다.
				// grant_type, client_id, redirect_uri, code
				StringBuffer sb = new StringBuffer();
				sb.append("grant_type=authorization_code&client_id=c37b872ad93eb8dccb862abcc027ef66");
				sb.append("&redirect_uri=http://localhost:8080/kakao_login");
				sb.append("&code="+code);
				
				//전달하고자 하는 파라미터들을 보낼 스트림 준비
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				bw.write(sb.toString());//요청을 POST방식으로 보낸다.
				bw.flush();//스트림 비우기
				
				//결과코드가 200이면 성공!!!
				int res_code = conn.getResponseCode();
				//System.out.println("RES_CODE:"+res_code);
				
				if(res_code == 200) { //요청이 성공시
					//요청을 통해 얻은 JSON타입의 결과메세지를 읽어온다.
					BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					
					String line = "";
					StringBuffer result = new StringBuffer();
					while((line = br.readLine()) != null) {
						result.append(line);
					}//while의 끝!
					
					br.close();
					bw.close();
					
					//받은 결과 확인
					//System.out.println(result.toString());
					
					//JSON파싱 처리 
					// "access_token"과 "refresh_token"을 잡아내어 ModelAndView에 저장한 후
					// result.jsp로 이동하여 결과를 표현한다.
					JSONParser j_par = new JSONParser();
					Object obj = j_par.parse(result.toString());
					
					//자바에서 편하게 사용할 수 있도록 JSON객체로 변환하자!
					JSONObject j_obj = (JSONObject) obj;
					
					access_Token = (String) j_obj.get("access_token");
					refresh_Token = (String) j_obj.get("refresh_token");
					
					//사용자 정보를 얻기 위해 토큰을 이용한 서버요청시작
					String header = "Bearer "+access_Token;
					String apiURL = "https://kapi.kakao.com/v2/user/me";
					
					URL url2 = new URL(apiURL);
					HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
					
					//POST방식 설정
					conn2.setRequestMethod("POST");
					conn2.setDoOutput(true);
					
					conn2.setRequestProperty("Authorization", header);
					
					res_code = conn2.getResponseCode();
					System.out.println(res_code);
					if(res_code == HttpURLConnection.HTTP_OK) {
						//정상적으로 사용자 정보를 요청했다면...
						BufferedReader brd = new BufferedReader(
								new InputStreamReader(conn2.getInputStream()));
						
						StringBuffer sBuff = new StringBuffer();
						String str = null;
						while((str = brd.readLine()) != null) {
							sBuff.append(str); //카카오 서버에서 전달되는 모든 값들이
										//sBuff에 누적된다. (JSON)
						}//while의 끝
						
						obj = j_par.parse(sBuff.toString());// JSON인식
						
						//JSON으로 인식된 정보를 다시 JSON객체로 형변환한다.
						j_obj = (JSONObject) obj;
						
						JSONObject n = (JSONObject) j_obj.get("properties");
						
						String name = (String) n.get("nickname");
						String p_img = (String) n.get("profile_image");
						
						
						MemVO mvo = new MemVO();
						mvo.setM_name(name);
						
						session.setAttribute("mvo", mvo);//로그인!!!
						mv.addObject("nickname", name);
						mv.addObject("pic", p_img);
					}
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("kakao_result");
			return mv;
		}
}


*/

