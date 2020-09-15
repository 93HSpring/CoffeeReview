package com.hspring.coffeereview.view.user;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hspring.coffeereview.biz.user.UserService;
import com.hspring.coffeereview.biz.user.UserVO;

/**
* @packageName    : com.hspring.coffeereview.view.user
* @fileName        : UserController.java
* @author        : Goonoo Jang
* @date            : 2020.08.24
* @description   : User와 관련된 컨트롤러이다.
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.08.24        Goonoo Jang       최초 생성
* 2020.09.02		Goonoo Jang		  signupUser수정 - redirect X
* 2020.09.03		Goonoo Jang		  userInfo 구현
*/
@Controller
@SessionAttributes("user")
public class UserController {
	@Autowired
	private UserService userService;
	
	/**
	 * @methodName	: insertUser
	 * @author		: Goonoo Jang
	 * @date		: 2020.08.24
	 * @param vo
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/insertUser")
	public String insertUser(UserVO vo) throws IOException{
		System.out.println("JPA로 user Insert");
		userService.insertUser(vo);
		return "index.jsp";
	}
	
	/**
	 * @methodName	: deleteUser
	 * @author		: Goonoo Jang
	 * @date		: 2020.08.24
	 * @param vo
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/deleteUser")
	public String deleteUser(UserVO vo) throws IOException{
		System.out.println("JPA로 user Delete");
		userService.deleteUser(vo);
		return "index.jsp";
	}
	
	/**
	 * @methodName	: signupUser
	 * @author		: Goonoo Jang
	 * @date		: 2020.09.02
	 * @param vo
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/signup", method = { RequestMethod.GET, RequestMethod.POST })
	public String signupUser(@ModelAttribute UserVO vo) throws IOException {

		userService.insertUser(vo);

		return "signupSuccess.jsp";
	}

	/**
	 * @methodName	: userInfo
	 * @author		: Goonoo Jang
	 * @date		: 2020.09.03
	 * @param model
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/userInfo", method = { RequestMethod.GET, RequestMethod.POST })
	public String userInfo(Model model, HttpSession session) throws IOException {
		String id = (String) session.getAttribute("sessionId");
		UserVO vo = userService.getUser(id);
		System.out.println(vo.getName() + "의 정보를 조회합니다.");
		model.addAttribute("userInfo", vo);

		return "userInfo.jsp";
	}
	// 네이버 로그인 API쓰니까 보안 좀 신경써야할둣 로그인쪽 보안을 좀 더 생각해보자
	// 쿼리문, 에러페이지 이런건 나중에.
	// 20200915 수정시작
}
