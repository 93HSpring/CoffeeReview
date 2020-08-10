package com.hspring.coffeereview.biz.user;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

// VO (Value Object)
@Entity
@Table(name="USERS")
public class UserVO {
	
	@Id
	private String id;
	private String pw;
	private String uname;
	private String sex; 
	private String uphonenum;
	private String uemail;
	private String uadr;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getUphonenum() {
		return uphonenum;
	}
	public void setUphonenum(String uphonenum) {
		this.uphonenum = uphonenum;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUadr() {
		return uadr;
	}
	public void setUadr(String uadr) {
		this.uadr = uadr;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", uname=" + uname + ", sex=" + sex + ", uphonenum=" + uphonenum
				+ ", uemail=" + uemail + ", uadr=" + uadr + "]";
	}
	
	
}
