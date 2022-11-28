package com.meatShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CouponDAO {
	
	private Connection conn;
	public CouponDAO(Connection conn) {
		this.conn = conn;
	}
		
	public CouponDTO getReadData(String cName){
		
		CouponDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select cName,disRate,disPrice from Coupon where cName=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cName);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new CouponDTO();
			
				dto.setcName(rs.getString("cName"));
				dto.setDisrate(rs.getInt("disRate"));
				dto.setDisPrice(rs.getInt("disPrice"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

}
