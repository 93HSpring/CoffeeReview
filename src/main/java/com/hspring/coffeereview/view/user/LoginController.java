package com.hspring.coffeereview.view.user;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.hspring.coffeereview.biz.user.UserService;

@Controller
public class LoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private UserService userService;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		return "login.jsp";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String name = (String) response_obj.get("name");
		String id = (String) response_obj.get("id");
		
		System.out.println(name);
		/*
		if(userService.checkUser(id)) { // 가입되어있는 회원
			// 4.파싱 닉네임 세션으로 저장
			session.setAttribute("sessionId", id); // 세션 생성
			model.addAttribute("result", apiResult);
			model.addAttribute("id", id);
			return "index.jsp"; 
		} else { // 가입되지 않은 회원 
			// 회원가입 시키기
			model.addAttribute("id", id); // 네이버 로그인 된 정보를 model에 담는다
			model.addAttribute("name", name);
			model.addAttribute("gender", (String) response_obj.get("gender"));
			model.addAttribute("email", (String) response_obj.get("email"));
			
			
				// id pw uname sex uphonenum uemail uadr
			 
			
			
			return "signup.jsp";
		}
		*/
		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId", id); // 세션 생성
		model.addAttribute("result", apiResult);
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		return "index.jsp";
		
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "redirect:index.jsp";
	}

	/*
	 * @RequestMapping(value="/login.do", method=RequestMethod.GET) public String
	 * loginView(UserVO vo) { System.out.println("�α��� ȭ������ �̵�");
	 * vo.setId("test"); //vo.setPassword("test123"); return "login.jsp"; }
	 * 
	 * 
	 * @RequestMapping(value="/login.do", method=RequestMethod.POST) public String
	 * login(UserVO vo, UserDAO userDAO, HttpSession session) { if(vo.getId() ==
	 * null || vo.getId().equals("")) { throw new
	 * IllegalArgumentException("���̵�� �ݵ�� �Է��ؾ� �մϴ�."); }
	 * 
	 * UserVO user = userDAO.getUser(vo); if(user != null) {
	 * //session.setAttribute("userName", user.getName()); return "getBoardList.do";
	 * } else return "login.jsp"; }
	 */
}
