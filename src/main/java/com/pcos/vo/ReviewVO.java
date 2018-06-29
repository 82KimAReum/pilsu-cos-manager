package com.pcos.vo;

public class ReviewVO {
	private String gradeno ;
	private String comments;
	private double grade;
	private String regdate;
	private String email;
	private String productcode;
	//
	private String productname;
	//
	private String name;
	 
	public ReviewVO() {
		// TODO Auto-generated constructor stub
	}
	

	public ReviewVO(String gradeno, String comments, double grade, String regdate, String email, String productcode,
			String productname, String name) {
		super();
		this.gradeno = gradeno;
		this.comments = comments;
		this.grade = grade;
		this.regdate = regdate;
		this.email = email;
		this.productcode = productcode;
		this.productname = productname;
		this.name = name;
	}


	public String getGradeno() {
		return gradeno;
	}

	public void setGradeno(String gradeno) {
		this.gradeno = gradeno;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProductcode() {
		return productcode;
	}

	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "ReviewVO [gradeno=" + gradeno + ", comments=" + comments + ", grade=" + grade + ", regdate=" + regdate
				+ ", email=" + email + ", productcode=" + productcode + ", productname=" + productname + ", name="
				+ name + "]";
	}
	
	
}
