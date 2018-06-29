package com.pcos.vo;

public class OrderVO {

	//orderdetail
private String productcode;
private String orderno;
private int amount;
private int price;
	//product
private String productname;
private int productprice;//price
private String image;

public OrderVO() {}
public OrderVO(String productcode, String orderno, int amount, int price, String productname, int productprice,
		String image) {
	super();
	this.productcode = productcode;
	this.orderno = orderno;
	this.amount = amount;
	this.price = price;
	this.productname = productname;
	this.productprice = productprice;
	this.image = image;
}
public String getProductcode() {
	return productcode;
}
public void setProductcode(String productcode) {
	this.productcode = productcode;
}
public String getOrderno() {
	return orderno;
}
public void setOrderno(String orderno) {
	this.orderno = orderno;
}
public int getAmount() {
	return amount;
}
public void setAmount(int amount) {
	this.amount = amount;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getProductname() {
	return productname;
}
public void setProductname(String productname) {
	this.productname = productname;
}
public int getProductprice() {
	return productprice;
}
public void setProductprice(int productprice) {
	this.productprice = productprice;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
@Override
public String toString() {
	return "SalesVO [productcode=" + productcode + ", orderno=" + orderno + ", amount=" + amount + ", price="
			+ price + ", productname=" + productname + ", productprice=" + productprice + ", image=" + image + "]";
}



	

}
