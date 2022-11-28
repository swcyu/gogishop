package com.meatShop;

public class MeatShopDTO {
	
	private int userNum;
	private String userId;

	private String userPwd;
	private String userName;
	private String userBirth;
	private String userPhone;
	private String gName;
	private int userPoint;
	private int totalPoint;
	private String emailCheck;
	
	private int qnaNum;
	private String qnaContent;
	private String qnaTitle;
	private String saveFileName;
	private String originalFileName;
	private String qnaDate;
	
	
	
	public String getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getEmailCheck() {
		return emailCheck;
	}
	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	
	
	
	
	/*
	 Create table userInfo
(userNum number(30) constraint userInfo_userNum_pk primary key,
userId varchar2(30) NOT NULL,
userPwd varchar2(50) NOT NULL,
userName varchar2(15) NOT NULL,
userBirth date NOT NULL,
userPhone varchar2(20) NOT NULL,
gName varchar2(10) DEFAULT 'BRONZE',
userPoint number(20) DEFAULT 0,
totalPoint number(20) DEFAULT 0,
constraint userInfo_userGrade_fk foreign key(gName) 
references grade(gName)); 
	 
	 */
	
}
