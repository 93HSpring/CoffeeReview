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
      query.setParameter("cafename", vo.getId());
      
      return query.getResultList();
   }
}