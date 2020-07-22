package com.example.auction.model;

public class BidderInfoVO {
	private int item_seq;
	private String user_ID;
	private int bid_Price;
	private int bid_Unit;
	private String regdate;
	private String majorName;
	private String subName;
	
	public int getBid_Unit() {
		return bid_Unit;
	}
	public void setBid_Unit(int bid_Unit) {
		this.bid_Unit = bid_Unit;
	}
	public int getItem_seq() {
		return item_seq;
	}
	public void setItem_seq(int item_seq) {
		this.item_seq = item_seq;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public int getBid_Price() {
		return bid_Price;
	}
	public void setBid_Price(int bid_Price) {
		this.bid_Price = bid_Price;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	
}