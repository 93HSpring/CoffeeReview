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
*/

@Entity // JPA
@Table(name = "CAFES")
public class BoardVO {

	@Id
	@GeneratedValue
	private String id;
	private String name;
	private String cname;
	private String kcal;
	private String sugars;
	private String sodium;
	private String caffeine;
	private String star;
	private BigDecimal savg;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
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

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public BigDecimal getSavg() {
		return savg;
	}

	public void setSavg(BigDecimal savg) {
		this.savg = savg;
	}
	
	public String getMenuSort() {
		return menuSort;
	}

	public void setMenuSort(String menuSort) {
		this.menuSort = menuSort;
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

	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", name=" + name + ", cname=" + cname + ", kcal=" + kcal + ", sugars=" + sugars
				+ ", sodium=" + sodium + ", caffeine=" + caffeine + ", star=" + star + ", startIndex=" + startIndex
				+ ", cntPerPage=" + cntPerPage + ", savg=" + savg + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + ", uploadFile=" + uploadFile + ", menuSort=" + menuSort + "]";
	}

}