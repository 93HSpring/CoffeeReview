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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.hspring.coffeereview.biz.user.UserService;

/**
* @packageName    : com.hspring.coffeereview.view.user
* @fileName        : LoginController.java
* @author        : Goonoo Jang
* @date            : 2020.08.24
* @description            :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.08.24        Goonoo Jang       최초 생성
*/
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
	/**
	 * @methodName	: login
	 * @author		: Goonoo Jang
	 * @date		: 2020.08.24
	 * @{tags}
	 */
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
	
	/**
	 * @methodName	: loginForSignup
	 * @author		: Goonoo Jang
	 * @date		: 2020.08.24
	 * @{tags}
	 */
	@RequestMapping(value = "/loginForSignup", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForSignup(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		return "signup.jsp";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	
	/**
	 * @methodName	: callback
	 * @author		: Goonoo Jang
	 * @date		: 2020.08.24
	 * @{tags}
	 */
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	// @RequestMapping(value = "/callback", method = RequestMethod.POST) // 20200901 임시로 지움
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, RedirectAttributes redirect)
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
		model.addAttribute("result", apiResult);
		System.out.println(name);
		
		// users DB에 현재 로그인된 회원이 존재하면 
		if(userService.checkUser(id)) {
			// 4.파싱 닉네임 세션으로 저장
			session.setAttribute("sessionId", id); // 세션 생성
			session.setAttribute("sessionName", name); // 웹에 띄울 사용자 이름 저장
			
			//model.addAttribute("id", id);
			//model.addAttribute("name", name);
			return "index.jsp";
		} else { // users DB에 회원정보가 없으면
			// 회원가입 페이지로 넘어가기
			 
			/*
			redirect.addFlashAttribute("name", name);
			redirect.addFlashAttribute("id", id);
			redirect.addFlashAttribute("nickname", (String) response_obj.get("nickname"));
			redirect.addFlashAttribute("age", (String) response_obj.get("age"));
			redirect.addFlashAttribute("gender", (String) response_obj.get("gender"));
			redirect.addFlashAttribute("email", (String) response_obj.get("email"));
			// redirect는 HashMap<String, String>형식으로 전달
			
			return "redirect:signup";
			*/
			// 20200901 redirect로 UserController의 signup 메소드로 곧바로 넘기는게 아니라 register.jsp로 넘기도록
			
			model.addAttribute("id", id);
			model.addAttribute("name", name);
			model.addAttribute("nickname", (String) response_obj.get("nickname"));
			model.addAttribute("age", (String) response_obj.get("age"));
			model.addAttribute("gender", (String) response_obj.get("gender"));
			model.addAttribute("email", (String) response_obj.get("email"));
			// phonenum, address 
			
			return "register.jsp";
		}
		
	}

	// 로그아웃

	/**
	 * @methodName	: logout
	 * @author		: Goonoo Jang
	 * @date		: 2020.08.24
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "redirect:index.jsp";
	}

}
