package com.hspring.coffeereview.biz.reply.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hspring.coffeereview.biz.common.Criteria;
import com.hspring.coffeereview.biz.reply.ReplyService;
import com.hspring.coffeereview.biz.reply.ReplyVO;

/**
 * 
* @packageName   : com.hspring.coffeereview.biz.reply.impl
* @fileName      : ReplyServiceImpl.java
* @author        : SeongPyo Jo
* @date          : 2020.09.14
* @description   :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.09.14        SeongPyo Jo       최초 생성
 */

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO replyDAO;
	
	public List<ReplyVO> getReplyList(String cid) {
		return replyDAO.getReplyList(cid);
	}
	
	public void create(ReplyVO vo) {
		replyDAO.create(vo);
	}
	
	public void update(ReplyVO vo) {
		replyDAO.update(vo);
	}
	
	public void delete(int rid) {
		replyDAO.delete(rid);
	}
	
	public List<ReplyVO> getReplyListPaging(String cid, Criteria criteria) throws Exception {
		return replyDAO.getReplyListPaging(cid, criteria);
	};
	
	public int countReply(String cid) throws Exception {
		return replyDAO.countReply(cid);
	}
}
