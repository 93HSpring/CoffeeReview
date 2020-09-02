package com.hspring.coffeereview.biz.user.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.hspring.coffeereview.biz.user.UserVO;

// DAO (Data Access Object)
/**
* @packageName	: com.hspring.coffeereview.biz.user.impl
* @fileName		: UserDAO.java
* @author		: Goonoo Jang
* @date			: 2020.08.24
* @description	: User 데이터를 DB에서 받아오는 클래스
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.08.24        Goonoo Jang       최초 생성
* 2020.09.02		Goonoo Jang		  checkUser(name->id 변경)
* 2020.09.03		Goonoo Jang		  getUser(String id) 추가
*/
@Repository("userDAO")
public class UserDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	// 회원 생성
	/**
	 * @methodName	: insertUser
	 * @author		: Goonoo Jang
	 * @date		: 2020.08.24
	 * @param vo
	 */
	public void insertUser(UserVO vo) {
		
		System.out.println("===> JPA로 insertUser() 처리");
	 
		if(em.find(UserVO.class, vo.getId()) == null) {
			em.persist(vo);
			System.out.println("===> JPA로 insertUser() 처리 완료");
		} else {
			System.out.println("이미 가입된 아이디입니다.");
		}
		
	}
	
	// 회원 삭제
	/**
	 * @methodName	: deleteUser
	 * @author		: Goonoo Jang
	 * @date		: 2020.08.24
	 * @param vo
	 */
	void deleteUser(UserVO vo) {
		System.out.println("===> JPA로 deleteUser() 처리 ");
		em.remove(em.find(UserVO.class, vo.getId()));
		
	}
	
	// 회원 조회 (vo를 통해)
	/**
	 * @methodName	: getUser
	 * @author		: Goonoo Jang
	 * @date		: 2020.08.24
	 * @param vo
	 * @return
	 */
	public UserVO getUser(UserVO vo) {
		System.out.println("===> JPA로 getUser() 처리");
		return vo;
	}
	
	// 회원 조회 (ID를 통해)
	/**
	 * @methodName	: getUser
	 * @author		: Goonoo Jang
	 * @date		: 2020.09.03
	 * @param id
	 * @return
	 */
	public UserVO getUser(String id) {
		System.out.println("===> JPA로 getUser() 처리 (id로)");
		return em.find(UserVO.class, id);
	}
	
	// 이미 가입된 회원인지 확인

	/**
	 * @methodName	: checkUser
	 * @author		: Goonoo Jang
	 * @date		: 2020.09.02
	 * @param id
	 * @return
	 */
	public Boolean checkUser(String id) {
		return em.find(UserVO.class, id) == null ? false : true;
	}


}
