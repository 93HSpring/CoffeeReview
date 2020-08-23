package com.hspring.coffeereview.biz.board;

import java.util.List;

public interface BoardService {
	// CRUD 기능 구현
	void insertBoard(BoardVO vo);

	void updateBoard(BoardVO vo);

	void deleteBoard(BoardVO vo);

	BoardVO getBoard(BoardVO vo);

	List<BoardVO> getBoardList(BoardVO vo);
	
	int selectCafeBoardCnt(BoardVO vo);
	
	List<BoardVO> selectCafeListPaging(BoardVO vo);
	
	int selectMenuBoardCnt(BoardVO vo);
	
	List<BoardVO> selectMenuListPaging(BoardVO vo);
}
