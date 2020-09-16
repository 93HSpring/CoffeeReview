package com.hspring.coffeereview.biz.reply;

import java.util.List;

import com.hspring.coffeereview.biz.common.Criteria;

public interface ReplyService {
	List<ReplyVO> getReplyList(String cid) throws Exception;
	
	void create(ReplyVO vo) throws Exception;
	
	void update(ReplyVO vo) throws Exception;
	
	void delete(int rid) throws Exception;
	
	List<ReplyVO> getReplyListPaging(String cid, Criteria criteria) throws Exception;
	
	int countReply(String cid) throws Exception;
	
	double getStarAvg(String cid) throws Exception;
	
	String getCid(int rid) throws Exception;
}
