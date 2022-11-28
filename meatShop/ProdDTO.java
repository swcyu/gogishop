package com.meatShop;

public class ProdDTO {
	private int pNum;
	private String pName;
	private int price;
	private String category;
	private String pImage;
	private String[] pOption;
	private int gram;
	private String standard;
	private String stPrice;
	private String commaPrice;
	private String unit;
	private boolean mu;
	private int opCount;
	


	public int getOpCount() {
		return opCount;
	}
	public void setOpCount(int opCount) {
		this.opCount = opCount;
	}
	public void setMu(boolean mu) {
		this.mu = mu;
	}
	public boolean getMu() {
		return mu;
	}
	public void setMu(Boolean mu) {
		this.mu = mu;
	}
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
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getStPrice() {
		return stPrice;
	}
	public void setStPrice(String stPrice) {
		this.stPrice = stPrice;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getpImage() {
		return pImage;
	}
	public void setpImage(String pImage) {
		this.pImage = pImage;
	}
	public String[] getpOption() {
		return pOption;
	}
	public void setpOption(String[] pOption) {
		this.pOption = pOption;
	}
	public int getGram() {
		return gram;
	}
	public void setGram(int gram) {
		this.gram = gram;
	}
	
}
