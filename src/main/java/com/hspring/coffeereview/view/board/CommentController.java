package com.hspring.coffeereview.view.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hspring.coffeereview.biz.board.BoardService;
import com.hspring.coffeereview.biz.board.BoardVO;

/**
* @packageName    : com.hspring.coffeereview.view.board
* @fileName        : CommentController.java
* @author        : Seongpyo Jo
* @date            : 2020.09.03
* @description            :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.09.03        SeongPyo Jo       최초 생성
*/

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	private BoardService boardService;
	
	/**
	* @methodName   : commentInsert
	* @author       : SeongPyo Jo
	* @date         : 2020.09.03
	* @param star
	* @param content
	* @param cname
	* @param name
	* @param vo
	* @param model
	* @return String
	* @throws Exception
	*/
	@RequestMapping("/insert") //댓글 작성 
    public String commentInsert(@RequestParam(value="star") int star, 
    							@RequestParam(value="comment") String content,
    							@RequestParam(value="cafe") String cname,
    							@RequestParam(value="menu") String name,
    							BoardVO vo, Model model) throws Exception {
		
		
		
		vo.setCname(cname);
		vo.setName(name);
		
		BoardVO board = boardService.getBoard(vo);
		
		model.addAttribute("board", board);
        
        return "getBaord.jsp";
    }
}
