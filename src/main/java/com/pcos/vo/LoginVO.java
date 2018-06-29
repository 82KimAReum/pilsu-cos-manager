package com.pcos.vo;

public class LoginVO {

	private String uid;
	private String upw;
	private boolean useCooki;
	public LoginVO(){}
	public LoginVO(String uid, String upw) {
		super();
		this.uid = uid;
		this.upw = upw;
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
	
	public boolean isUseCooki() {
		return useCooki;
	}
	public void setUseCooki(boolean useCooki) {
		this.useCooki = useCooki;
	}
	@Override
	public String toString() {
		return "LoginDao [uid=" + uid + ", upw=" + upw + ", useCooki="  + useCooki+"]";
	}
	
}
