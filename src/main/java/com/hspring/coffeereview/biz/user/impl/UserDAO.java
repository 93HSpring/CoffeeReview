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
* 2020.09.21		Goonoo Jang		  id -> uid 수정
* 2020.10.20        Goonoo Jang       uid를 통해 name을 얻기위한 메쏘드 추가(getUserName)
* 2020.10.21        Seongpyo Jo       getUserName -> getUserNickname 변경
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
	 
		if(em.find(UserVO.class, vo.getUid()) == null) {
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
		em.remove(em.find(UserVO.class, vo.getUid()));
		
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
	public UserVO getUser(String uid) {
		System.out.println("===> JPA로 getUser() 처리 (uid로)");
		return em.find(UserVO.class, uid);
	}
	
	// 이미 가입된 회원인지 확인

	/**
	 * @methodName	: checkUser
	 * @author		: Goonoo Jang
	 * @date		: 2020.09.02
	 * @param id
	 * @return
	 */
	public Boolean checkUser(String uid) {
		return em.find(UserVO.class, uid) == null ? false : true;
	}
	
	/**
	 * @methodName	: modifyProfile
	 * @author		: Goonoo Jang
	 * @date		: 2020.09.16
	 * @param vo
	 */
	void modifyProfile(UserVO vo) {
		UserVO temp = em.find(UserVO.class, vo.getUid());
		System.out.println("수정 시작띠");
		temp.setAddress(vo.getAddress());
		temp.setAge(vo.getAge());
		temp.setName(vo.getName());
		temp.setEmail(vo.getEmail());
		temp.setGender(vo.getGender());
		temp.setUid(vo.getUid());
		temp.setNickname(vo.getNickname());
		temp.setPhonenum(vo.getPhonenum());
		em.merge(temp);
		
		// 가급적 find로 찾아와서 값을 수정하는 것이 낫다. (vo의 name만 변경하고자 member만 세팅하고 merge한다면 vo의 나머지 필드는 기존의 값을 잃고 null이 대입된다.)
		// 하지만 우린 userInfo에서 완전한 형식의 vo를 받으므로 그대로 진행
		// https://ecsimsw.tistory.com/entry/JPA-%EB%8D%B0%EC%9D%B4%ED%84%B0-%EC%88%98%EC%A0%95-%EB%B3%80%EA%B2%BD-%EA%B0%90%EC%A7%80%EC%99%80-%EB%B3%91%ED%95%A9
	}

   
   /**
	* @methodName  : getUserNickname
	* @author      : SeongPyo Jo
	* @date        : 2020.10.21
	* @param uid
	* @return
	*/
	public String getUserNickname(String uid) {
      UserVO vo = em.find(UserVO.class, uid);
      return vo.getNickname();
   }
}
