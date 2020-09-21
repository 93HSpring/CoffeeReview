package com.hspring.coffeereview.biz.common;

/**
 * 
* @packageName   : com.hspring.coffeereview.biz.common
* @fileName      : Criteria.java
* @author        : SeongPyo Jo
* @date          : 2020.09.15
* @description   :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2020.09.15        SeongPyo Jo       최초 생성
* 2020.09.15        SeongPyo Jo       페이지 처리를 위한 메쏘드
 */

public class Criteria {
	
	// 현재 페이지 번호
	private int page;
	// 페이지 당 출력되는 게시글의 갯수
	private int perPageNum;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	// 음수와 같은 값이 안들어오도록 처리
	public void setPage(int page) {
		if (page <= 0)
		{
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public int getPage() {
		return page;
	}
	
	// 초기 perPageNum 보다 너무 크거나 작은 수일 경우 초기값으로 설정
	// 
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 10 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	// 현재 페이지의 시작 게시글 번효 = (현재 페이지 번호 - 1) * 페이지 당 출력할 게시글의 갯수
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
}
