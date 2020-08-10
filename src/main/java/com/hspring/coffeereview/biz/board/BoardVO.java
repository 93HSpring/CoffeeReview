package com.hspring.coffeereview.biz.board;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

// Value Object
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
		return "BoardVO [id=" + id + ", name=" + name + ", cname=" + cname + ", kcal=" + kcal + ", sugars=" + sugars
				+ ", sodium=" + sodium + ", caffeine=" + caffeine + ", star=" + star + ", savg=" + savg
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", uploadFile="
				+ uploadFile + "]";
	}

}