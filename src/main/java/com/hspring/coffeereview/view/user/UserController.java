package com.hspring.coffeereview.view.user;

import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hspring.coffeereview.biz.user.UserService;
import com.hspring.coffeereview.biz.user.UserVO;

@Controller
@SessionAttributes("user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/insertUser")
	public String insertUser(UserVO vo) throws IOException{
		System.out.println("JPA로 user Insert");
		userService.insertUser(vo);
		return "index.jsp";
	}
	
	@RequestMapping("/deleteUser")
	public String deleteUser(UserVO vo) throws IOException{
		System.out.println("JPA로 user Delete");
		userService.deleteUser(vo);
		return "index.jsp";
	}
	
	@RequestMapping(value = "/signup", method = { RequestMethod.GET, RequestMethod.POST })
	public String signupUser(Model model, HashMap<String, String> userInfo) throws IOException{
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		
		UserVO vo = new UserVO();
		
		/*
		 	userInfo.put("name", name);
			userInfo.put("id", id);
			userInfo.put("nickname", (String) response_obj.get("nickname"));
			userInfo.put("age", (String) response_obj.get("age"));
			userInfo.put("gender", (String) response_obj.get("gender"));
			userInfo.put("email", (String) response_obj.get("email"));
		 */
		
		vo.setId(userInfo.get("id"));
		vo.setName(userInfo.get("name"));
		vo.setNickname(userInfo.get("nickname"));
		vo.setAge(userInfo.get("age"));
		vo.setGender(userInfo.get("gender"));
		//vo.setPhonenum(userInfo.get("phonenum"));
		vo.setEmail(userInfo.get("email"));
		//vo.setAddress(userInfo.get("address"));
		// 주소와 전화번호는 네아로에서 받을 수 없으므로 빈칸
		
		
		userService.insertUser(vo);
		
		
		/*
		 	userInfo.put("name", name);
			userInfo.put("id", id);
			userInfo.put("nickname", (String) response_obj.get("nickname"));
			userInfo.put("age", (String) response_obj.get("age"));
			userInfo.put("gender", (String) response_obj.get("gender"));
			userInfo.put("email", (String) response_obj.get("email"));
		 */
		
		
		
		return "signupSuccess.jsp";
	}
	
	
	
}
