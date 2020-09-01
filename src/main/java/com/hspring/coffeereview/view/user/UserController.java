package com.hspring.coffeereview.view.user;

import java.io.IOException;
import java.util.HashMap;

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
	 * @date		: 2020.08.24
	 * @param model
	 * @param userInfo
	 * @return
	 * @throws IOException
	 */
	/*
	@RequestMapping(value = "/signup", method = { RequestMethod.GET, RequestMethod.POST })
	public String signupUser(Model model, HashMap<String, String> userInfo) throws IOException{

		UserVO vo = new UserVO();

		vo.setId(userInfo.get("id"));
		vo.setName(userInfo.get("name"));
		vo.setNickname(userInfo.get("nickname"));
		vo.setAge(userInfo.get("age"));
		vo.setGender(userInfo.get("gender"));
		vo.setEmail(userInfo.get("email"));
		// 추후 회원가입 페이지 추가할 예정
		
		userService.insertUser(vo);
		
		return "signupSuccess.jsp";
	}
	
	*/
	
	// 20200901 redirect가 아닌 signup.jsp로 구현, method = post
	@RequestMapping(value = "/signup", method = {RequestMethod.GET, RequestMethod.POST} )
	public String signupUser(@ModelAttribute UserVO vo) throws IOException{
		
		userService.insertUser(vo);
		
		return "signupSuccess.jsp";
	}
	
	
	
}
