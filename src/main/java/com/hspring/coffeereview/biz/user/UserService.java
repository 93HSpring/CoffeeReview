package com.hspring.coffeereview.biz.user;

public interface UserService {

	// 회원 생성
	void insertUser(UserVO vo);
	
	// 회원 탈퇴
	void deleteUser(UserVO vo);
	
	// 회원 정보 확인
	UserVO getUser(UserVO vo);

}