package com.pcos.vo;

public class ProductVO {
	private String productcode ;
	private String productname;
	private String productdesc;
	private int price;
	private String capacity;
	private String image;
	private String categorycode;
	private String brandcode;
	private String gender;
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public ProductVO(){}
	
	public ProductVO(String productcode, String productname, String productdesc, int price, String capacity,
			String image, String categorycode, String brandcode) {
		super();
		this.productcode = productcode;
		this.productname = productname;
		this.productdesc = productdesc;
		this.price = price;
		this.capacity = capacity;
		this.image = image;
		this.categorycode = categorycode;
		this.brandcode = brandcode;
	}
	
	
	public ProductVO(String productcode, String productname, String productdesc, int price, String capacity,
			String image, String categorycode, String brandcode, String gender) {
		super();
		this.productcode = productcode;
		this.productname = productname;
		this.productdesc = productdesc;
		this.price = price;
		this.capacity = capacity;
		this.image = image;
		this.categorycode = categorycode;
		this.brandcode = brandcode;
		this.gender = gender;
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
	public String getProductdesc() {
		return productdesc;
	}
	public void setProductdesc(String productdesc) {
		this.productdesc = productdesc;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCategorycode() {
		return categorycode;
	}
	public void setCategorycode(String categorycode) {
		this.categorycode = categorycode;
	}
	public String getBrandcode() {
		return brandcode;
	}
	public void setBrandcode(String brandcode) {
		this.brandcode = brandcode;
	}
	@Override
	public String toString() {
		return "ProductVO [productcode=" + productcode + ", productname=" + productname + ", productdesc=" + productdesc
				+ ", price=" + price + ", capacity=" + capacity + ", image=" + image + ", categorycode=" + categorycode
				+ ", brandcode=" + brandcode + "]";
	}
	
	

}
