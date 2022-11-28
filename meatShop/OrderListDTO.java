package com.meatShop;

public class OrderListDTO {
	
	private int listNum;
	private int pNum;
	private int pCount;
	private int pPrice;
	private String pOption;
	private String pImage;
	private String pName;
	private String commaPrice;
	private String unit;

	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getCommaPrice() {
		return commaPrice;
	}
	public void setCommaPrice(String commaPrice) {
		this.commaPrice = commaPrice;
	}
	private int userNum;
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpImage() {
		return pImage;
	}
	public void setpImage(String pImage) {
		this.pImage = pImage;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getpCount() {
		return pCount;
	}
	public void setpCount(int pCount) {
		this.pCount = pCount;
	}
	public String getpOption() {
		return pOption;
	}
	public void setpOption(String pOption) {
		this.pOption = pOption;
	}
	
}
