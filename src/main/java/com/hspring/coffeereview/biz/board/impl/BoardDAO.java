package com.hspring.coffeereview.biz.board.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
*/

@Repository
public class BoardDAO {

	@PersistenceContext
	private EntityManager em;

	/**
	 * @methodName : getBoard
	 * @author : SeongPyo Jo
	 * @date : 2020.08.24
	 * @param vo
	 * @return BoardVO
	 */
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> JPA로 getBoard() 처리");
		// return (BoardVO) em.find(BoardVO.class, vo.getSeq());
		return vo;
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

		TypedQuery<BoardVO> query = em.createQuery("from BoardVO b where b.cname = :cafename order by b.savg desc",
				BoardVO.class);
		query.setParameter("cafename", vo.getCname());

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
		TypedQuery<Number> query = em.createQuery("select count(*) from BoardVO b where b.cname = :cafename",
				Number.class);
		query.setParameter("cafename", vo.getCname());
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
		TypedQuery<BoardVO> query = em.createQuery(
				"from BoardVO b where b.cname = :cafename order by b." + vo.getMenuSort() + "+0 desc", BoardVO.class);
		query.setParameter("cafename", vo.getCname());
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
		TypedQuery<Number> query = em.createQuery("select count(*) from BoardVO b where b.name LIKE '%'||:keyword||'%'",
				Number.class);
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
		TypedQuery<BoardVO> query = em.createQuery(
				"from BoardVO b where b.name LIKE '%'||:keyword||'%' order by b." + vo.getMenuSort() + "+0 desc",
				BoardVO.class);
		query.setParameter("keyword", vo.getSearchKeyword());
		return query.setFirstResult(vo.getStartIndex()).setMaxResults(vo.getCntPerPage()).getResultList();
	}
}