package com.hspring.coffeereview.view.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value = "/data/{type}/{cname}/{id}.{suffix}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> image(@PathVariable("cname") String cname,
										@PathVariable("type") String type,
										@PathVariable("id") String id,
										@PathVariable("suffix") String suffix, HttpServletRequest request) throws Exception {
		System.out.println("데이터 처리");
		InputStream in = null;
		String basePath = request.getSession().getServletContext().getRealPath("resources");
		
		System.out.println(System.getProperty("user.dir"));
		System.out.println("BasePath : " + basePath);
		
	    ResponseEntity<byte[]> retEntity = null;
	    
	    try {
	        String filePath = basePath + "/" + type + "/" + cname + "/" + id + "." + suffix;
	        System.out.println("filePath : " + filePath);
	        in = new FileInputStream(new File(filePath));
	        final HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.IMAGE_JPEG);
	        retEntity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
	    } catch (Exception e) {
	        e.printStackTrace();
	        retEntity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    } finally {
	    	in.close();
	    }
	    
	    return retEntity;
	}
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(@RequestParam(value="cafe", defaultValue="starbucks", required=false) String cafeName, BoardVO vo, Model model) {
		System.out.println("카페 목록 처리");
		
		BoardVO boardVO = new BoardVO();
		boardVO.setCname(cafeName);
		
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
