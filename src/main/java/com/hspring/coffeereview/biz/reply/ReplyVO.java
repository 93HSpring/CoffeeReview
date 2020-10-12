package com.hspring.coffeereview.biz.reply;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 
* @packageName   : com.hspring.coffeereview.biz.reply
* @fileName      : ReplyVO.java
* @author        : SeongPyo Jo
* @date          : 2020.09.14
* @description   :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.09.14        SeongPyo Jo       최초 생성
* 2020.09.15        SeongPyo Jo       별점 관련 변수 추가
 */
@Entity
@Table(name = "REPLY")
public class ReplyVO {
	@Id
	@GeneratedValue
	private int rid;
	private String cid;
	private String id;
	private String replyText;
	private int starNum;
	@Temporal(TemporalType.TIMESTAMP)
	private Date regDate = new Date();
	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate = new Date();
	
	@PreUpdate
	public void preUpdate() {
		updateDate = new Date();
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReplyText() {
		return replyText;
	}

	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}

	public int getStarNum() {
		return starNum;
	}

	public void setStarNum(int starNum) {
		this.starNum = starNum;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", cid=" + cid + ", id=" + id + ", replyText=" + replyText + ", starNum="
				+ starNum + ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
	}

	
	
}
