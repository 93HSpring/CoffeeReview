package com.hspring.coffeereview.view.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hspring.coffeereview.biz.board.BoardService;
import com.hspring.coffeereview.biz.board.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(@RequestParam(value="cafe", defaultValue="starbucks", required=false) String cafeName, BoardVO vo, Model model) {
		System.out.println("카페 목록 처리");
		
		BoardVO boardVO = new BoardVO();
		boardVO.setId(cafeName);
		
		System.out.println(vo.toString());
		
		// Null Check
		if (vo.getSearchCondition() == null)
		{
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null)
		{
			vo.setSearchKeyword("");
		}
		
		model.addAttribute("boardList", boardService.getBoardList(boardVO));
		return "getBoardList.jsp";
	}
}
