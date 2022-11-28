package com.meatShop;

public class ValidCouponDTO {
	
	private int cNum;
	private String cName;
	private int userNum;
	private String cStartDate;
	private String cEndDate;
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getcStartDate() {
		return cStartDate;
	}
	public void setcStartDate(String cStartDate) {
		this.cStartDate = cStartDate;
	}
	public String getcEndDate() {
		return cEndDate;
	}
	public void setcEndDate(String cEndDate) {
		this.cEndDate = cEndDate;
	}

}
