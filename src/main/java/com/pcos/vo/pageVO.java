package com.pcos.vo;

public class pageVO {
	private int count;//총 데이터 개수
	private int page;//현재 페이지
	private int pageStart;//index로 뿌리기 시작할 페이지 //현재 페이지가 12인경우 11.
	private int pageEnd;//index로 뿌릴때 끝날 페이지//현재 페이지가 12인경우 20
	private int pageTotalEnd; //index가 완전히 끝나는 페이지
	private String searchData;//찾는 값으로 들어오는 값
	
	
	
	public pageVO(int count, int page, String searchData) {
		super();
		this.count = count;
		this.page = page;
		this.searchData = searchData;
		pageCalc();
	}

	public void pageCalc() {
		pageEnd=(int) (Math.ceil(page/(double)10))*10;
		pageStart=(pageEnd-10)+1;
		pageTotalEnd=(int)(Math.ceil(count/(double)10));
		if(pageEnd>= pageTotalEnd) {
			pageEnd=pageTotalEnd;
		}
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getPageTotalEnd() {
		return pageTotalEnd;
	}

	public void setPageTotalEnd(int pageTotalEnd) {
		this.pageTotalEnd = pageTotalEnd;
	}

	public String getSearchData() {
		return searchData;
	}

	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}
	
}
