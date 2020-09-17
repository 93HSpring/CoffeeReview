package com.hspring.coffeereview.biz.board;

import java.util.List;

/**
* @packageName   : com.hspring.coffeereview.biz.board
* @fileName      : BoardService.java
* @author        : SeongPyo Jo
* @date          : 2020.08.24
* @description   : 다양한 Database와 연동하여 CRUD 기능을 하기위한 Interface
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.08.24        SeongPyo Jo       최초 생성
* 2020.09.16        SeongPyo Jo       별점 평균 갱신을 위한 메쏘드 추가 (updateStarAvg)
*/

public interface BoardService {
	/**
	* @methodName  : getBoard
	* @author      : SeongPyo Jo
	* @date        : 2020.08.24
	* @param vo
	* @return BoardVO
	*/
	BoardVO getBoard(BoardVO vo);

	/**
	* @methodName  : getBoardList
	* @author      : SeongPyo Jo
	* @date        : 2020.08.24
	* @param vo
	* @return List<BoardVO>
	*/
	List<BoardVO> getBoardList(BoardVO vo);
	
	/**
	* @methodName  : selectCafeBoardCnt
	* @author      : SeongPyo Jo
	* @date        : 2020.08.24
	* @param vo
	* @return int
	*/
	int selectCafeBoardCnt(BoardVO vo);
	
	/**
	* @methodName  : selectCafeListPaging
	* @author      : SeongPyo Jo
	* @date        : 2020.08.24
	* @param vo
	* @return List<BoardVO>
	*/
	List<BoardVO> selectCafeListPaging(BoardVO vo);
	
	/**
	* @methodName  : selectMenuBoardCnt
	* @author      : SeongPyo Jo
	* @date        : 2020.08.24
	* @param vo
	* @return int
	*/
	int selectMenuBoardCnt(BoardVO vo);
	
	/**
	* @methodName  : selectMenuListPaging
	* @author      : SeongPyo Jo
	* @date        : 2020.08.24
	* @param vo
	* @return List<BoardVO>
	*/
	List<BoardVO> selectMenuListPaging(BoardVO vo);
	
	void updateStarAvg(String cid, double starAvg) throws Exception;
}
