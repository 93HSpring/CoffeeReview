package com.hspring.coffeereview.biz.reply.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hspring.coffeereview.biz.board.impl.BoardDAO;
import com.hspring.coffeereview.biz.common.Criteria;
import com.hspring.coffeereview.biz.reply.ReplyService;
import com.hspring.coffeereview.biz.reply.ReplyVO;
import com.hspring.coffeereview.biz.user.impl.UserDAO;

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
* 2020.09.16        SeongPyo Jo       별점 평균 계산을 위한 메쏘드 추가(getStarAvg)
* 2020.09.16        SeongPyo Jo       별점 평균 갱신을 위한 BoardDAO 객체 추가
* 2020.09.16        SeongPyo Jo       cid를 얻어오기 위한 메쏘드 추가(getCid)
* 2020.10.20        SeongPyo Jo       uid를 통해 name을 얻어오기 위한 메쏘드 추가(getUserName)
* 2020.10.21        Seongpyo Jo       getUserName -> getUserNickname 변경
* 2020.10.27		Goonoo Jang		   특정 user가 작성한 리뷰들을 얻어오기 위한 메소드 추가 (getUserReplyList)
 */

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO replyDAO;
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private UserDAO userDAO;
	
	public List<ReplyVO> getReplyList(String cid) {
		return replyDAO.getReplyList(cid);
	}
	
	public List<ReplyVO> getUserReplyList(String uid) throws Exception {
		return replyDAO.getReplyList(uid);
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
	
	@Transactional
	public double getStarAvg(String cid) throws Exception {
		double starAvg = replyDAO.getStarAvg(cid);
		System.out.println(">>> " + starAvg);
		boardDAO.updateStarAvg(cid, starAvg);
		return starAvg;
	}
	
	public String getCid(int rid) throws Exception {		
		return replyDAO.getCid(rid);
	}
	
	public String getUserNickname(String uid) throws Exception {
		return userDAO.getUserNickname(uid);
	}
}
