package com.meatShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import oracle.net.aso.r;

public class OrderInfoDAO {
	
private Connection conn;
	
	public OrderInfoDAO(Connection conn) {
		this.conn = conn;
	}
	
	//num의 최대값
	public int getMaxNum() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			
			sql = "select nvl(max(orderNum),0) from OrderInfo";
			
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
	
	
	//입력
	public int insertData(OrderInfoDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into OrderInfo (orderNum,pNum,addPoint,cNum,buyCount,userNum,buyDate,addrNum,userPoint,buyNum) ";
			sql+= "values (?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getOrderNum());
			pstmt.setInt(2, dto.getpNum());
			pstmt.setInt(3, dto.getAddPoint());
			pstmt.setInt(4, dto.getcNum());
			pstmt.setInt(5, dto.getBuyCount());
			pstmt.setInt(6, dto.getUserNum());
			pstmt.setString(7, dto.getBuyDate());
			pstmt.setInt(8, dto.getAddrNum());
			pstmt.setInt(9, dto.getUserPoint());
			pstmt.setInt(10, dto.getBuyNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	public int getMaxNum2() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			
			sql = "select nvl(max(buyNum),0) from OrderInfo";
			
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
	public int getBuyCount(int userNum) {
		
		int count=0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select count(buyNum) from orderinfo where userNum=?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return count;
		
	}
	
	
	public int checkBuyFree(int userNum, int pNum) {
		int check=0;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql;
		try {
			
			sql = "select orderNum from orderInfo where userNum=? and pNum=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, pNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = 2;//이미 샀으면 2
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return check;
	}
}
