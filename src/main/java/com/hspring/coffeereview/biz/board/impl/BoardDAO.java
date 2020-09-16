package com.hspring.coffeereview.biz.board.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.hspring.coffeereview.biz.board.BoardVO;

/**
* @packageName   : com.hspring.coffeereview.biz.board.impl
* @fileName      : BoardDAO.java
* @author        : SeongPyo Jo
* @date          : 2020.08.24
* @description   : JPA를 사용하여 Database와 query를 실제로 수행하는 class
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.08.24        SeongPyo Jo       최초 생성
* 2020.09.01        SeongPyo Jo       getBoard를 위한 SQL 처리문 추가
* 2020.09.01        SeongPyo Jo       url 방식 변경으로 인한 query 변경
* 2020.09.16        SeongPyo Jo       별점 평균 갱신을 위한 메쏘드 추가 (updateStarAvg)
*/

@Repository
public class BoardDAO {
	@PersistenceContext
	private EntityManager em;

	/**
	 * @methodName : getBoard
	 * @author : SeongPyo Jo
	 * @date : 2020.09.01
	 * @param vo
	 * @return BoardVO
	 */
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> JPA로 getBoard() 처리");
		
		TypedQuery<BoardVO> query = em.createQuery("from BoardVO b where b.cafename = :cname AND b.cid = " + vo.getCid(), BoardVO.class);
		query.setParameter("cname", vo.getCafename());
		return query.getSingleResult();
	}

	/**
	* @methodName  : getBoardList
	* @author      : SeongPyo Jo
	* @date        : 2020.08.24
	* @param vo
	* @return List<BoardVO>
	*/
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> JPA로 getBoardList() 처리");

		TypedQuery<BoardVO> query = em.createQuery("from BoardVO b where b.cafename = :cname order by b.savg desc",	BoardVO.class);
		query.setParameter("cname", vo.getCafename());

		return query.getResultList();
	}

	/**
	* @methodName  : selectCafeBoardCnt
	* @author      : SeongPyo Jo
	* @date        : 2020.08.24
	* @param vo
	* @return int
	*/
	public int selectCafeBoardCnt(BoardVO vo) {
		TypedQuery<Number> query = em.createQuery("select count(*) from BoardVO b where b.cafename = :cname", Number.class);
		query.setParameter("cname", vo.getCafename());
		return (query.getSingleResult()).intValue();
	}

	/**
	* @methodName  : selectCafeListPaging
	* @author      : SeongPyo Jo
	* @date        : 2020.08.24
	* @param vo
	* @return List<BoardVO>
	*/
	public List<BoardVO> selectCafeListPaging(BoardVO vo) {
		TypedQuery<BoardVO> query = em.createQuery("from BoardVO b where b.cafename = :cname order by b." + vo.getMenuSort() + " desc", BoardVO.class);
		query.setParameter("cname", vo.getCafename());
		return query.setFirstResult(vo.getStartIndex()).setMaxResults(vo.getCntPerPage()).getResultList();
	}

	/**
	* @methodName  : selectMenuBoardCnt
	* @author      : SeongPyo Jo
	* @date        : 2020.08.24
	* @param vo
	* @return int
	*/
	public int selectMenuBoardCnt(BoardVO vo) {
		TypedQuery<Number> query = em.createQuery("select count(*) from BoardVO b where b.menuname LIKE '%'||:keyword||'%'", Number.class);
		query.setParameter("keyword", vo.getSearchKeyword());
		return (query.getSingleResult()).intValue();
	}

	/**
	* @methodName  : selectMenuListPaging
	* @author      : SeongPyo Jo
	* @date        : 2020.08.24
	* @param vo
	* @return List<BoardVO>
	*/
	public List<BoardVO> selectMenuListPaging(BoardVO vo) {
		TypedQuery<BoardVO> query = em.createQuery("from BoardVO b where b.menuname LIKE '%'||:keyword||'%' order by b." + vo.getMenuSort() + " desc", BoardVO.class);
		query.setParameter("keyword", vo.getSearchKeyword());
		return query.setFirstResult(vo.getStartIndex()).setMaxResults(vo.getCntPerPage()).getResultList();
	}
	
	public void updateStarAvg(String cid, double starAvg) throws Exception {
		Query query = em.createQuery("update BoardVO b set b.starAvg = " + starAvg + " where b.cid = " + cid);
		query.executeUpdate();
	}
}