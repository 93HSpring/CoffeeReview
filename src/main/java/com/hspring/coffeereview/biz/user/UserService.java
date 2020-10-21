package com.hspring.coffeereview.biz.user;

/**
* @packageName	: com.hspring.coffeereview.biz.user
* @fileName		: UserService.java
* @author		: Goonoo Jang
* @date			: 2020.08.24
* @description	: UserService클래스
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.08.24        Goonoo Jang       최초 생성
* 2020.09.03		Goonoo Jang		  getUser(String id) 추가
* 2020.09.16		Goonoo Jang		  modifyProfile(UserVO vo) 추가
* 2020.09.21		Goonoo Jang		   매개변수명 수정 (id -> uid)
* 2020.10.20        Goonoo Jang       uid를 통해 name을 얻기위한 메쏘드 추가(getUserName)  
*/
public interface UserService {

	// 회원 생성
	void insertUser(UserVO vo);
	
	// 회원 탈퇴
	void deleteUser(UserVO vo);
	
	// 회원 정보 확인 (vo를 통해)
	UserVO getUser(UserVO vo);
	
	// 회원 정보 확인 (ID를 통해)
	UserVO getUser(String uid);
	
	// 회원 가입여부 확인
	boolean checkUser(String uid);
	
	void modifyProfile(UserVO vo);
	
	String getUserName(String uid);

}