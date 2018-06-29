package com.pcos.vo;

public class CommunityVO {
	//boardno,title,contents,regdate,readcount,likecount,dislikecount,b.email as email,name
	private String boardno;
	private String title;
	private String contents;
	private String regdate;
	private int readcount;
	private int likecount;
	private int dislikecount;
	private String email;
	private String name;
	public CommunityVO() {}
	public CommunityVO(String boardno, String title, String contents, String regdate, int readcount, int likecount,
			int dislikecount, String email, String name) {
		super();
		this.boardno = boardno;
		this.title = title;
		this.contents = contents;
		this.regdate = regdate;
		this.readcount = readcount;
		this.likecount = likecount;
		this.dislikecount = dislikecount;
		this.email = email;
		this.name = name;
	}
	public String getBoardno() {
		return boardno;
	}
	public void setBoardno(String boardno) {
		this.boardno = boardno;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public int getDislikecount() {
		return dislikecount;
	}
	public void setDislikecount(int dislikecount) {
		this.dislikecount = dislikecount;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "CommunityVO [boardno=" + boardno + ", title=" + title + ", contents=" + contents + ", regdate="
				+ regdate + ", readcount=" + readcount + ", likecount=" + likecount + ", dislikecount=" + dislikecount
				+ ", email=" + email + ", name=" + name + "]";
	}

}
