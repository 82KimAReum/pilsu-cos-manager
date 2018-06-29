package com.pcos.vo;

public class OrderDetailVO {

	private String productcode;
	private String orderno;
	private int amount;
	private int price;
	public OrderDetailVO() {
	
	}
	public OrderDetailVO(String productcode, String orderno, int amount, int price) {
	//	super();
		this.productcode = productcode;
		this.orderno = orderno;
		this.amount = amount;
		this.price = price;
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
	@Override
	public String toString() {
		return "OrderDetailVO [productcode=" + productcode + ", orderno=" + orderno + ", amount=" + amount + ", price="
				+ price + "]";
	}
	
	
}
