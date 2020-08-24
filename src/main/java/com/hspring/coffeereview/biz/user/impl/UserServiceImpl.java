package com.hspring.coffeereview.biz.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hspring.coffeereview.biz.user.UserService;
import com.hspring.coffeereview.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	// 회원 정보 확인
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
	
	// 회원 생성
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
	
	// 회원 탈퇴
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}
	
	// 회원 가입여부 확인
	public boolean checkUser(String id) {
		return userDAO.checkUser(id);
	}
}
