package com.hspring.coffeereview.view.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
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
import com.hspring.coffeereview.biz.common.Pagination;

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
		//System.out.println("데이터 처리");
		InputStream in = null;
		String basePath = request.getSession().getServletContext().getRealPath("resources");
		
		//System.out.println(System.getProperty("user.dir"));
		//System.out.println("BasePath : " + basePath);
		
	    ResponseEntity<byte[]> retEntity = null;
	    
	    try {
	        String filePath = basePath + "/" + type + "/" + cname + "/" + id + "." + suffix;
	        //System.out.println("filePath : " + filePath);
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
	
	@RequestMapping("/getBoardList")
	public String getBoardList(@RequestParam(value="cafe", defaultValue="STARBUCKS", required=false) String cname, 
							   @RequestParam(value="page", defaultValue="1") int page,
							   @RequestParam(value="keyword", defaultValue="") String keyword,
							   @RequestParam(value="sort", defaultValue="star") String sort,
							   BoardVO vo, Model model) {
		System.out.println("카페 목록 처리");
		
		// 카페이름에 해당하는 전체 메뉴 조회
		//BoardVO boardVO = new BoardVO();
		//boardVO.setCname(cafeName);
		// 카페이름에 해당하는 전체 메뉴 조회하고 전달
		// model.addAttribute("boardList", boardService.getBoardList(boardVO));
		
		// 페이징
		int listCnt;
		Pagination pagination;
		
		vo.setCname(cname);
		
		if (sort.equals("star")) {
			vo.setMenuSort("savg");
		}
		else if (sort.equals("caffeine")) {
			vo.setMenuSort("caffeine");
		}
		else if (sort.equals("kcal")) {
			vo.setMenuSort("kcal");
		}
		else if (sort.equals("sodium")) {
			vo.setMenuSort("sodium");
		}
		else if (sort.equals("sugars")) {
			vo.setMenuSort("sugars");
		}
		
		if (keyword.isEmpty()) {
			// 총 게시물
			listCnt = boardService.selectCafeBoardCnt(vo);
			
			// 생성인자로 총 게시물 수, 현재 페이지를 전달
			pagination = new Pagination(listCnt, page);
			vo.setStartIndex(pagination.getStartIndex());
			vo.setCntPerPage(pagination.getPageSize());
			
			model.addAttribute("boardList", boardService.selectCafeListPaging(vo));
			model.addAttribute("listCnt", listCnt);
			model.addAttribute("pagination", pagination);
			//model.addAttribute("sort", sort);
			model.addAttribute("keyword", keyword);
			//model.addAttribute("cafename", cname);
			
			return "getBoardList.jsp";
		}
		else {
			// 검색
			vo.setSearchKeyword(keyword);
			listCnt = boardService.selectMenuBoardCnt(vo);
			
			// 생성인자로 총 게시물 수, 현재 페이지를 전달
			pagination = new Pagination(listCnt, page);
			vo.setStartIndex(pagination.getStartIndex());
			vo.setCntPerPage(pagination.getPageSize());
			
			List<BoardVO> boardList = boardService.selectMenuListPaging(vo);
			
			model.addAttribute("boardList", boardList);
			model.addAttribute("listCnt", listCnt);
			model.addAttribute("pagination", pagination);
			//model.addAttribute("sort", sort);
			model.addAttribute("keyword", keyword);
			//model.addAttribute("cafename", cname);
			
			return "getBoardList.jsp";
		}
	}
}
