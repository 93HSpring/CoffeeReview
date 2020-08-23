package com.hspring.coffeereview.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hspring.coffeereview.biz.board.BoardService;
import com.hspring.coffeereview.biz.board.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	// JPA
	@Autowired
	private BoardDAO boardDAO;
		
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}
		
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}
		
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}
		
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
