package com.pcos.vo;

import java.sql.Timestamp;
import java.util.Date;

public class QnaVO {
	private String qnaNo;//char(17)
	private String title;//varchar2(50)
	private String contents;//varchar2(1000)
	private String reContents;//varchar2(1000)
	private String regDate;//sysdate
	private String replStat;//char(1)
	private String email;//varchar2(50)
	public QnaVO() {
	
	}
	public QnaVO(String qnaNo, String title, String contents, String reContents, String regDate, String replStat,
			String email) {
		super();
		this.qnaNo = qnaNo;
		this.title = title;
		this.contents = contents;
		this.reContents = reContents;
		this.regDate = regDate;
		this.replStat = replStat;
		this.email = email;
	}
	public String getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(String qnaNo) {
		this.qnaNo = qnaNo;
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
	public String getReContents() {
		return reContents;
	}
	public void setReContents(String reContents) {
		this.reContents = reContents;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getReplStat() {
		return replStat;
	}
	public void setReplStat(String replStat) {
		this.replStat = replStat;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "QnaVO [qnaNo=" + qnaNo + ", title=" + title + ", contents=" + contents + ", reContents=" + reContents
				+ ", regDate=" + regDate + ", replStat=" + replStat + ", email=" + email + "]";
	}
	
	
	
}
