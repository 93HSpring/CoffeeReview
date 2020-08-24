package com.hspring.coffeereview.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hspring.coffeereview.biz.board.BoardService;
import com.hspring.coffeereview.biz.board.BoardVO;

/**
* @packageName   : com.hspring.coffeereview.biz.board.impl
* @fileName      : BoardServiceImpl.java
* @author        : SeongPyo Jo
* @date          : 2020.08.24
* @description   : BoardService Interface를 상속받아 다양한 Database와 연동하여 query를 수행하기 위한 class 
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.08.24        SeongPyo Jo       최초 생성
*/

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	// JPA
	@Autowired
	private BoardDAO boardDAO;
		
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}
		
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}
	
	public int selectCafeBoardCnt(BoardVO vo) {
		return boardDAO.selectCafeBoardCnt(vo);
	}
	
	public List<BoardVO> selectCafeListPaging(BoardVO vo) {
		return boardDAO.selectCafeListPaging(vo);
	}
	
	public int selectMenuBoardCnt(BoardVO vo) {
		return boardDAO.selectMenuBoardCnt(vo);
	}
	
	public List<BoardVO> selectMenuListPaging(BoardVO vo) {
		return boardDAO.selectMenuListPaging(vo);
	}
}
