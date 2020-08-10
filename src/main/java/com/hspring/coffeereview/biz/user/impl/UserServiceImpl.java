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
	
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
	
	// ȸ�� ���
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
	
	// ȸ�� ����
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}
}
