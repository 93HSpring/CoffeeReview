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
* 2020.09.15        SeongPyo Jo       별점 등록 및 출력 기능 추가
* 2020.09.15        SeongPyo Jo       댓글, 별점 등록 예외처리 기능 추가
* 2020.09.16        SeongPyo Jo       별점 평균을 구하는 메쏘드 추가(calcStarAvg)
* 2020.09.16        SeongPyo Jo       댓글 등록 예외처리 기능 추가 (글자수가 특정 수 이상 될 시 리뷰 작성 불가)
* 2020.09.16        SeongPyo Jo       댓글, 별점 등록 예외처리 기능 추가 (공백, 개행문자만 있을 시 리뷰 작성 불가)
* 2020.10.12        SeongPyo Jo       주석 및 메쏘드 이름 오타 수정
* 2020.10.20        SeongPyo Jo       uid를 통해 username을 구하는 메쏘드 추가(getUserName)
*/

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	/**
	 * 
	* @methodName  : getReplyList
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
	* @methodName   : create
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
			// 최대 글자 수
			int limitByte = 1000;
			String replyText = replyVO.getReplyText();
				
			if (replyText.trim().length() == 0)
			{
				entity = new ResponseEntity<>("textSpaceFail", HttpStatus.OK);
				return entity;
			}
			if (replyText.length() > limitByte)
			{
				entity = new ResponseEntity<>("textLongFail", HttpStatus.OK);
				return entity;
			}
			if (replyVO.getStarNum() == 0)
			{
				entity = new ResponseEntity<>("starNumFail", HttpStatus.OK);
				return entity;
			}
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
	
	/**
	 * 
	* @methodName  : calcStarAvg
	* @author      : SeongPyo Jo
	* @date        : 2020.09.16
	* @param cid
	* @return
	 */
	@RequestMapping(value = "/{cid}", method = RequestMethod.GET) //별점 갱신 
    public ResponseEntity<Double> calcStarAvg(@PathVariable("cid") String cid) {
		ResponseEntity<Double> entity = null;
		
		try {
			double sAvg = replyService.getStarAvg(cid);
			entity = new ResponseEntity<>(sAvg, HttpStatus.CREATED);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return entity;
    }
	
	@RequestMapping(value = "/getUserName/{uid}", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public ResponseEntity<String> getUserName(@PathVariable("uid") String uid) {
	    ResponseEntity<String> entity = null;
	    
	    try {
	        String userName = replyService.getUserName(uid);
	        System.out.println(userName);
	        entity = new ResponseEntity<>(userName, HttpStatus.CREATED);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
}
