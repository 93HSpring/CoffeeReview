package com.hspring.coffeereview.biz.user.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.hspring.coffeereview.biz.user.UserVO;

// DAO (Data Access Object)
@Repository("userDAO")
public class UserDAO {

	/*
	// SQL ��ɾ��
	private final String USER_GET = "select * from users where id=? and password=?";
	private final String USER_INSERT = "insert into users(id, pw, uname, sex, uphonenum, uemail, uadr) values(?,?,?,?,?,?,?)";
	private final String USER_DELETE = "delete users where id=?";
	*/
	
	@PersistenceContext
	//(unitName = "users")
	private EntityManager em;
	
	// 회원 생성
	public void insertUser(UserVO vo) {
		
		System.out.println("===> JPA로 insertUser() 처리");
	 
		if(em.find(UserVO.class, vo.getId()) == null) {
			em.persist(vo);
			System.out.println("===> JPA로 insertUser() 처리 완료");
		} else {
			System.out.println("이미 가입된 아이디입니다.");
		}
		/*
		em.createQuery("insert into users(id, pw, uname, sex, uphonenum, uemail, uadr) values(?,?,?,?,?,?,?)")
		.setParameter(1, vo.getId()).setParameter(2, vo.getPw()).setParameter(3, vo.getUname()).setParameter(4, vo.getSex()).setParameter(5, vo.getUphonenum())
		.setParameter(6, vo.getUemail()).setParameter(7, vo.getUadr()).executeUpdate();
		*/
		
	}
	
	// ȸ�� ����
	void deleteUser(UserVO vo) {
		System.out.println("===> JPA로 deleteUser() 처리 ");
		em.remove(em.find(UserVO.class, vo.getId()));
		
	}
	
	// ȸ�� ��ȸ
	public UserVO getUser(UserVO vo) {
		System.out.println("===> JPA로 getUser() 처리");
		return vo;
	}

}
