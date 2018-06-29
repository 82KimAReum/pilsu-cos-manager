package com.pcos.vo;

public class FaqVO {
	int faqno;
	String title;
	String contents;
	public FaqVO(int faqno, String title, String contents) {
		//super();
		this.faqno = faqno;
		this.title = title;
		this.contents = contents;
	}
	public FaqVO(String title, String contents) {
		//super();
		this.title = title;
		this.contents = contents;
	}
	public FaqVO() {}
	
	public int getFaqno() {
		return faqno;
	}
	public void setFaqno(int faqno) {
		this.faqno = faqno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "FaqVO [faqno=" + faqno + ", title=" + title + ", contents=" + contents + "]";
	}
	
}
