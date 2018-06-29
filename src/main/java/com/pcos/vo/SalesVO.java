package com.pcos.vo;

public class SalesVO {
	
	// p.productcode,p.productname, r.orderno, o.amount,o.price as profit ,p.price,r.orderdate
	private String productcode;
	private String productname;
	private int amount;
	private int profit;
	private String orderno;
	private int price;
	private String orderdate;
	public SalesVO() {}
	public SalesVO(String productcode, String productname, int amount, int profit, String orderno, int price,
			String orderdate) {
		super();
		this.productcode = productcode;
		this.productname = productname;
		this.amount = amount;
		this.profit = profit;
		this.orderno = orderno;
		this.price = price;
		this.orderdate = orderdate;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getProfit() {
		return profit;
	}
	public void setProfit(int profit) {
		this.profit = profit;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	@Override
	public String toString() {
		return "SalesVO [productcode=" + productcode + ", productname=" + productname + ", amount=" + amount
				+ ", profit=" + profit + ", orderno=" + orderno + ", price=" + price + ", orderdate=" + orderdate + "]";
	}
	
	
}