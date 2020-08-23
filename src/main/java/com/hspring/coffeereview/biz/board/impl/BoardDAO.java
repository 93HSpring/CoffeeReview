package com.hspring.coffeereview.biz.board.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.hspring.coffeereview.biz.board.BoardVO;


@Repository
public class BoardDAO {
   
   @PersistenceContext
   private EntityManager em;
   
   public void insertBoard(BoardVO vo) {
      System.out.println("===> JPA로 insertBoard() 처리");
      em.persist(vo);
   }
   
   public void updateBoard(BoardVO vo) {
      System.out.println("===> JPA로 updateBoard() 처리");
      em.merge(vo);
   }
   
   public void deleteBoard(BoardVO vo) {
      System.out.println("===> JPA로 deleteBoard() 처리");
      //em.remove(em.find(BoardVO.class, vo.getSeq()));
   }
   
   public BoardVO getBoard(BoardVO vo) {
      System.out.println("===> JPA로 getBoard() 처리");
      //return (BoardVO) em.find(BoardVO.class, vo.getSeq());
      return vo;
   }
   
   public List<BoardVO> getBoardList(BoardVO vo) {
      System.out.println("===> JPA로 getBoardList() 처리");
      
      TypedQuery<BoardVO> query = em.createQuery("from BoardVO b where b.cname = :cafename order by b.savg desc", BoardVO.class);
      query.setParameter("cafename", vo.getCname());
      
      return query.getResultList();
   }
   
   public int selectCafeBoardCnt(BoardVO vo) {
	   TypedQuery<Number> query = em.createQuery("select count(*) from BoardVO b where b.cname = :cafename", Number.class);
	   query.setParameter("cafename", vo.getCname());	
	   return (query.getSingleResult()).intValue();
   }
   
   public List<BoardVO> selectCafeListPaging(BoardVO vo) {
	   TypedQuery<BoardVO> query = em.createQuery("from BoardVO b where b.cname = :cafename order by b.savg desc", BoardVO.class);
	   query.setParameter("cafename", vo.getCname());
	   return query.setFirstResult(vo.getStartIndex()).setMaxResults(vo.getCntPerPage()).getResultList();
   }
   
   public int selectMenuBoardCnt(BoardVO vo) {
	   TypedQuery<Number> query = em.createQuery("select count(*) from BoardVO b where b.name LIKE '%'||:keyword||'%'", Number.class);
	   query.setParameter("keyword", vo.getSearchKeyword());
	   return (query.getSingleResult()).intValue();
   }
   
   public List<BoardVO> selectMenuListPaging(BoardVO vo) {
	   TypedQuery<BoardVO> query = em.createQuery("from BoardVO b where b.name LIKE '%'||:keyword||'%' order by b.savg desc", BoardVO.class);
	   query.setParameter("keyword", vo.getSearchKeyword());
	   return query.setFirstResult(vo.getStartIndex()).setMaxResults(vo.getCntPerPage()).getResultList();
   }
}