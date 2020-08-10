package com.hspring.coffeereview.view.user;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hspring.coffeereview.biz.user.UserService;
import com.hspring.coffeereview.biz.user.UserVO;

@Controller
@SessionAttributes("user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/insertUser.do")
	public String insertUser(UserVO vo) throws IOException{
		System.out.println("JPA로 user Insert");
		userService.insertUser(vo);
		return "index.jsp";
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser(UserVO vo) throws IOException{
		System.out.println("JPA로 user Delete");
		userService.deleteUser(vo);
		return "index.jsp";
	}
	
	
	
}
