package com.hspring.coffeereview.view.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hspring.coffeereview.biz.common.Criteria;
import com.hspring.coffeereview.biz.common.PageMaker;
import com.hspring.coffeereview.biz.reply.ReplyService;
import com.hspring.coffeereview.biz.reply.ReplyVO;

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

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	/**
	 * 
	* @methodName  : list
	* @author      : SeongPyo Jo
	* @date        : 2020.09.14
	* @param cid
	* @return
	 */
	@RequestMapping(value = "/all/{cid}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> getReplyList(@PathVariable("cid") String cid) {
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(replyService.getReplyList(cid), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
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
	@RequestMapping(value = "", method = RequestMethod.POST) //댓글 작성 
    public ResponseEntity<String> create(@RequestBody ReplyVO replyVO) {
		ResponseEntity<String> entity = null;
		
		try {
			replyService.create(replyVO);
			entity = new ResponseEntity<>("regSuccess", HttpStatus.OK);
		} catch (Exception e)
		{
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
    }
	
	/**
	 * 
	* @methodName  : update
	* @author      : SeongPyo Jo
	* @date        : 2020.09.14
	* @param replyNo
	* @param replyVO
	* @return
	 */
	@RequestMapping(value = "/{rid}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rid") int rid, @RequestBody ReplyVO replyVO) {
	    ResponseEntity<String> entity = null;
	    System.out.println(">> " + replyVO.getReplyText());
	    try {
	        replyVO.setRid(rid);
	        replyService.update(replyVO);
	        entity = new ResponseEntity<>("modSuccess", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
	
	/**
	 * 
	* @methodName  : delete
	* @author      : SeongPyo Jo
	* @date        : 2020.09.14
	* @param replyNo
	* @return
	 */
	@RequestMapping(value = "/{rid}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rid") int rid) {
	    ResponseEntity<String> entity = null;
	    try {
	        replyService.delete(rid);
	        entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
	
	/**
	 * 
	* @methodName  : listPaging
	* @author      : SeongPyo Jo
	* @date        : 2020.09.14
	* @param articleNo
	* @param page
	* @return
	 */
	@RequestMapping(value = "/{cid}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("cid") String cid,
                                                          @PathVariable("page") int page) {
        ResponseEntity<Map<String, Object>> entity = null;

        try {
            Criteria criteria = new Criteria();
            criteria.setPage(page);
            criteria.setPerPageNum(8);

            List<ReplyVO> replies = replyService.getReplyListPaging(cid, criteria);
            int repliesCount = replyService.countReply(cid);

            PageMaker pageMaker = new PageMaker();
            pageMaker.setCriteria(criteria);
            pageMaker.setTotalCount(repliesCount);

            Map<String, Object> map = new HashMap<>();
            map.put("replies", replies);
            map.put("pageMaker", pageMaker);

            entity = new ResponseEntity<>(map, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.OK);
        }
        return entity;
    }
}
