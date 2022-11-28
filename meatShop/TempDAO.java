package com.meatShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TempDAO {
	
	private Connection conn;
	
	public TempDAO(Connection conn) {
		this.conn = conn;
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
	
}
