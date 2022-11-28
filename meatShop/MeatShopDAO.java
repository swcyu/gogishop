package com.meatShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MeatShopDAO {
	
	private Connection conn;
	
	public MeatShopDAO(Connection conn) {	
		this.conn = conn;
	}
	
	//num의 최대값
		public int getMaxNum() {
			
			int maxNum = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql ="";
			
			try {
				
				sql = "select nvl(max(userNum),0) from userInfo";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					maxNum = rs.getInt(1);
				}
				
				rs.close();
				pstmt.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return maxNum;
		}
	
	//회원가입정보 입력
		public int insertData(MeatShopDTO dto) {	
	
	
	int result = 0;
	PreparedStatement pstmt = null;
	String sql;
	
	try {
		
		sql = "insert into userInfo (userNum,userId,userPwd,userName,";
		sql+= "userBirth,userPhone,emailCheck,gName) values (?,?,?,?,?,?,?,'Bronze')";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getUserNum());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getUserPwd());
			pstmt.setString(4, dto.getUserName());
			pstmt.setString(5, dto.getUserBirth());
			pstmt.setString(6, dto.getUserPhone());
			pstmt.setString(7, dto.getEmailCheck());
			
			result = pstmt.executeUpdate();
			
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	public boolean duplicateIdCheck(String userId) {	
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		boolean result = false;
		
		try {
			
			sql = "select userId from userInfo where userId=?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userId);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()) {	
		result = true;
	} // 아이디 존재
		
		pstmt.close();
		rs.close();
		
	} catch (Exception e) {
		System.out.println(e.toString());
	}
	
	return result;
	}
	
	
	
	//데이터 읽기(한명)
	
	public MeatShopDTO getReadData(String userId) {	
		
		String sql;
		MeatShopDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			sql = "select userId,userPwd,userName,to_char(userBirth, 'YYYY-MM-DD') userBirth,userPhone,gName,userPoint,";
			sql+= "totalPoint,userNum from userInfo where userId=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	
				
				dto = new MeatShopDTO();
				
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserBirth(rs.getString("userBirth"));
				dto.setUserPhone(rs.getString("userPhone"));
				dto.setgName(rs.getString("gName"));
				dto.setUserPoint(rs.getInt("userPoint"));
				dto.setTotalPoint(rs.getInt("totalPoint"));
				dto.setUserNum(rs.getInt("userNum"));
				
				
			}
			
			pstmt.close();
			rs.close();
					
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	public MeatShopDTO getReadDataN(int userNum) {	//userNum으로 한명 정보읽기
		
		String sql;
		MeatShopDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			sql = "select userId,userPwd,userName,userBirth,userPhone,gName,userPoint,totalPoint,emailCheck from userInfo where userNum=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	
				
				dto = new MeatShopDTO();
				
				dto.setUserNum(userNum);
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserBirth(rs.getString("userBirth"));
				dto.setUserPhone(rs.getString("userPhone"));
				dto.setgName(rs.getString("gName"));
				dto.setUserPoint(rs.getInt("userPoint"));
				dto.setTotalPoint(rs.getInt("totalPoint"));
				dto.setEmailCheck(rs.getString("emailCheck"));
				
			}
			
			pstmt.close();
			rs.close();
					
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	
	public MeatShopDTO getSearchData(String userId) {	
		
		String sql;
		MeatShopDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			sql = "select userId,userPwd,userName,to_char(userBirth, 'YYYY-MM-DD') userBirth,userPhone,gName,userPoint,";
			sql+= "totalPoint from userInfo where userId=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	
				
				dto = new MeatShopDTO();
				
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserBirth(rs.getString("userBirth"));
				dto.setUserPhone(rs.getString("userPhone"));
				dto.setgName(rs.getString("gName"));
				dto.setUserPoint(rs.getInt("userPoint"));
				dto.setTotalPoint(rs.getInt("totalPoint"));
				
				
			}
			
			pstmt.close();
			rs.close();
					
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	
	public int updateData(String userId, String userPwd) {	
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update userInfo set userPwd=? ";
			sql+= "where userId=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userPwd);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
			return result;
		
	}
	
	public int getMaxNumFile() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			
			sql = "select nvl(max(qnaNum),0) from qnaInfo";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}
	
	public int insertDataFile(MeatShopDTO dto) {	
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into qnaInfo (qnaNum,qnaTitle,qnaContent,saveFileName,originalFileName,qnaDate) ";
			sql+= "values (?,?,?,?,?,sysdate)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getQnaNum());
			pstmt.setString(2, dto.getQnaTitle());
			pstmt.setString(3, dto.getQnaContent());			
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setString(5, dto.getOriginalFileName());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	public int getDataCountFile() {	
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			
			sql = "select nvl(count(*),0) from qnaInfo";
			
			
			pstmt = conn.prepareStatement(sql);
		
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				result = rs.getInt(1);
			}
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	
	public List<MeatShopDTO> getLists(int start, int end){	
		
		List<MeatShopDTO> lists = new ArrayList<MeatShopDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		
		try {
			
			
			sql = "select * from (select rownum rnum,data.* from"
					+ " (select qnaNum,qnaTitle,qnaContent,saveFileName,originalFileName,to_char(qnaDate, 'YYYY-MM-DD')"
					+ " qnaDate from qnaInfo order by qnaNum desc) data) where rnum>=? and rnum<=?";
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {	
				
				MeatShopDTO dto = new MeatShopDTO();
				
				
				dto.setQnaNum(rs.getInt("qnaNum"));
				dto.setQnaTitle(rs.getString("qnaTitle"));
				dto.setQnaContent(rs.getString("qnaContent"));				
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				dto.setQnaDate(rs.getString("qnaDate"));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	
	
	
	
	public MeatShopDTO getReadData(int qnaNum) {	
		
		MeatShopDTO dto =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select qnaNum,qnaTitle,qnaContent,saveFileName,originalFileName,to_char(qnaDate, 'YYYY-MM-DD') qnaDate ";
			sql+= "from qnaInfo where qnaNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	
				
				dto = new MeatShopDTO();
				
				dto.setQnaNum(rs.getInt("qnaNum"));
				dto.setQnaTitle(rs.getString("qnaTitle"));
				dto.setQnaContent(rs.getString("qnaContent"));				
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				dto.setQnaDate(rs.getString("qnaDate"));
			}
			
			pstmt.close();
			rs.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	public int deleteData(int qnaNum) {	
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete qnaInfo where qnaNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		return result;
	}
	
	public int updateData(MeatShopDTO dto) { // 구매 후 등급,적립금,구매횟수 업데이트
		
		String sql;
		PreparedStatement pstmt = null;
		int result=0;
		
		try {
			
			sql = "update userInfo set gName=?,userPoint=?,totalPoint=? where userNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getgName());
			pstmt.setInt(2, dto.getUserPoint());
			pstmt.setInt(3, dto.getTotalPoint());
			pstmt.setInt(4, dto.getUserNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	public int getMaxBuyNum(int userNum) { //구매횟수 update를 위해 구매횟수 불러옴
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			
			sql = "select nvl(max(totalPoint),0) from userInfo where userNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}
}
