package com.hspring.coffeereview.biz.board;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

/**
* @packageName   : com.hspring.coffeereview.biz.board
* @fileName      : BoardVO.java
* @author        : SeongPyo Jo
* @date          : 2020.08.24
* @description   : Database와 value를 위한 VO class
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.08.24        SeongPyo Jo       최초 생성
* 2020.08.24        SeongPyo Jo       별점 처리 위한 변수명 변경 및 변수 삭제 (star->starAvg)
*/

@Entity // JPA
@Table(name = "CAFES")
public class BoardVO {

	@Id
	@GeneratedValue
	private String cid;
	private String cafename;
	private String menuname;
	private String kcal;
	private String sugars;
	private String sodium;
	private String caffeine;
	private double starAvg;
	@Transient // JPA
	private String menuSort;
	@Transient // JPA
	private int startIndex;
	@Transient // JPA
	private int cntPerPage;
	@Transient // JPA
	private String searchCondition;
	@Transient // JPA
	private String searchKeyword;
	@Transient // JPA
	private MultipartFile uploadFile;
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCafename() {
		return cafename;
	}
	public void setCafename(String cafename) {
		this.cafename = cafename;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public String getKcal() {
		return kcal;
	}
	public void setKcal(String kcal) {
		this.kcal = kcal;
	}
	public String getSugars() {
		return sugars;
	}
	public void setSugars(String sugars) {
		this.sugars = sugars;
	}
	public String getSodium() {
		return sodium;
	}
	public void setSodium(String sodium) {
		this.sodium = sodium;
	}
	public String getCaffeine() {
		return caffeine;
	}
	public void setCaffeine(String caffeine) {
		this.caffeine = caffeine;
	}
	public double getStarAvg() {
		return starAvg;
	}
	public void setStarAvg(double starAvg) {
		this.starAvg = starAvg;
	}
	public String getMenuSort() {
		return menuSort;
	}
	public void setMenuSort(String menuSort) {
		this.menuSort = menuSort;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	@Override
	public String toString() {
		return "BoardVO [cid=" + cid + ", cafename=" + cafename + ", menuname=" + menuname + ", kcal=" + kcal
				+ ", sugars=" + sugars + ", sodium=" + sodium + ", caffeine=" + caffeine + ", starAvg=" + starAvg
				+ ", menuSort=" + menuSort + ", startIndex=" + startIndex + ", cntPerPage=" + cntPerPage
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", uploadFile="
				+ uploadFile + "]";
	}
}