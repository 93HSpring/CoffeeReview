package com.hspring.coffeereview.biz.reply.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.hspring.coffeereview.biz.common.Criteria;
import com.hspring.coffeereview.biz.reply.ReplyVO;

/**
 * 
* @packageName   : com.hspring.coffeereview.biz.reply.impl
* @fileName      : ReplyDAO.java
* @author        : SeongPyo Jo
* @date          : 2020.09.14
* @description   :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.09.14        SeongPyo Jo       최초 생성
* 2020.09.14        SeongPyo Jo       댓글 기능 CRUD 기능 메쏘드 추가
* 2020.09.14        SeongPyo Jo       댓글 페이징 기능 메쏘드 추가
 */

@Repository
public class ReplyDAO {
	@PersistenceContext
	private EntityManager em;

	/**
	 * 
	* @methodName  : getReplyList
	* @author      : SeongPyo Jo
	* @date        : 2020.09.14
	* @param cid
	* @return
	 */
	public List<ReplyVO> getReplyList(String cid) {
		TypedQuery<ReplyVO> query = em.createQuery("from ReplyVO r where cid = " + cid + "order by r.rid", ReplyVO.class);
		return query.getResultList();
	}
	
	/**
	 * 
	* @methodName  : create
	* @author      : SeongPyo Jo
	* @date        : 2020.09.14
	* @param vo
	 */
	public void create(ReplyVO vo) {
		em.persist(vo);
	}
	
	/**
	 * 
	* @methodName  : update
	* @author      : SeongPyo Jo
	* @date        : 2020.09.14
	* @param vo
	 */
	public void update(ReplyVO vo) {		
		// ReplyVO의 @PreUpdate를 사용하여
		// 기존 객체를 가져와 내용을 수정하여 수정된 날짜를 저장하게한다.
		ReplyVO replyVO = em.find(ReplyVO.class, vo.getRid());
		
		replyVO.setReplyText(vo.getReplyText());
		
		em.merge(replyVO);
	}
	
	/**
	 * 
	* @methodName  : delete
	* @author      : SeongPyo Jo
	* @date        : 2020.09.14
	* @param vo
	 */
	public void delete(int rid) {
		em.remove((em.find(ReplyVO.class, rid)));
	}
	
	/**
	 * 
	* @methodName  : getReplyListPaging
	* @author      : SeongPyo Jo
	* @date        : 2020.09.14
	* @param rid
	* @param criteria
	* @return
	 */
	public List<ReplyVO> getReplyListPaging(String cid, Criteria criteria) throws Exception {
		TypedQuery<ReplyVO> query = em.createQuery("from ReplyVO r WHERE r.cid = " + cid + " order by r.regDate", ReplyVO.class);
		return query.setFirstResult(criteria.getPageStart()).setMaxResults(criteria.getPerPageNum()).getResultList();
	};
	
	/**
	 * 
	* @methodName  : countReply
	* @author      : SeongPyo Jo
	* @date        : 2020.09.14
	* @param rid
	* @return
	* @throws Exception
	 */
	public int countReply(String cid) throws Exception {
		TypedQuery<Number> query = em.createQuery("select COUNT(cid) from ReplyVO r WHERE r.cid = " + cid, Number.class);
		return (query.getSingleResult()).intValue();
	}
}