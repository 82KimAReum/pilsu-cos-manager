package com.pcos.vo;

public class AdminVO {
	private String uid="admin";
	private String upw="1234";
	private int upoint;
	public AdminVO() {
	}
	public AdminVO(String uid, String upw, int upoint) {
		super();
		this.uid = uid;
		this.upw = upw;
		this.upoint = upoint;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public int getUpoint() {
		return upoint;
	}
	public void setUpoint(int upoint) {
		this.upoint = upoint;
	}
	@Override
	public String toString() {
		return "AdminVO [uid=" + uid + ", upw=" + upw + ", upoint=" + upoint + "]";
	}
	
}
