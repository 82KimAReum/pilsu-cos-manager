package com.pcos.vo;

public class P_orderVO {
	//p_order
			private String orderno;
			private String name;
			private String zipcode;
			private String address1;
			private String address2;
			private String phone;
			private String payment;
			private String comments;
			private String orderdate;
			private String orderstat;
			private String email;
			
			public P_orderVO() {
				// TODO Auto-generated constructor stub
			}

			public P_orderVO(String orderno, String name, String zipcode, String address1, String address2,
					String phone, String payment, String comments, String orderdate, String orderstat, String email) {
				this.orderno = orderno;
				this.name = name;
				this.zipcode = zipcode;
				this.address1 = address1;
				this.address2 = address2;
				this.phone = phone;
				this.payment = payment;
				this.comments = comments;
				this.orderdate = orderdate;
				this.orderstat = orderstat;
				this.email = email;
			}

			public String getOrderno() {
				return orderno;
			}

			public void setOrderno(String orderno) {
				this.orderno = orderno;
			}

			public String getName() {
				return name;
			}

			public void setName(String name) {
				this.name = name;
			}

			public String getZipcode() {
				return zipcode;
			}

			public void setZipcode(String zipcode) {
				this.zipcode = zipcode;
			}

			public String getAddress1() {
				return address1;
			}

			public void setAddress1(String address1) {
				this.address1 = address1;
			}

			public String getAddress2() {
				return address2;
			}

			public void setAddress2(String address2) {
				this.address2 = address2;
			}

			public String getPhone() {
				return phone;
			}

			public void setPhone(String phone) {
				this.phone = phone;
			}

			public String getPayment() {
				return payment;
			}

			public void setPayment(String payment) {
				this.payment = payment;
			}

			public String getComments() {
				return comments;
			}

			public void setComments(String comments) {
				this.comments = comments;
			}

			public String getOrderdate() {
				return orderdate;
			}

			public void setOrderdate(String orderdate) {
				this.orderdate = orderdate;
			}

			public String getOrderstat() {
				return orderstat;
			}

			public void setOrderstat(String orderstat) {
				this.orderstat = orderstat;
			}

			public String getEmail() {
				return email;
			}

			public void setEmail(String email) {
				this.email = email;
			}

			@Override
			public String toString() {
				return "P_orderVO [orderno=" + orderno + ", name=" + name + ", zipcode=" + zipcode + ", address1="
						+ address1 + ", address2=" + address2 + ", phone=" + phone + ", payment=" + payment
						+ ", comments=" + comments + ", orderdate=" + orderdate + ", orderstat=" + orderstat
						+ ", email=" + email + "]";
			}
			
}
