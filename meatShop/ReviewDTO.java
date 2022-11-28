package com.meatShop;

public class ReviewDTO {
	
	private int rNum;
	private String rTitle;
	private String rContent;
	private String rDate;
	private int pNum;
	private int userNum;
	private String userName;
	private int buyCount;	//상품당 구매개수
	
							//함께 구매한 상품 개수(buyNum 기준 pNum당 구매개수(buyCount))
	private int buyNum;		//주문번호()
	private int totBuyCount;//총 구매횟수(주문목록 정보 - buyNum 기준 userNum count)
	private String pName;	//상품명

	
	
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getBuyCount() {
		return buyCount;
	}
	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public int getTotBuyCount() {
		return totBuyCount;
	}
	public void setTotBuyCount(int totBuyCount) {
		this.totBuyCount = totBuyCount;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}

	
		
	
	
	
	

}//ReviewDTO
