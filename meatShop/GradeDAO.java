package com.meatShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GradeDAO {

private Connection conn;
	
	public GradeDAO(Connection conn) {	
		this.conn = conn;
	}
	
	public GradeDTO getReadData(String gName) {	//userNum으로 한명 정보읽기
		
		String sql;
		GradeDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			sql = "select gName,minPoint,maxPoint,addPRate from grade where gName=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gName);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	
				
				dto = new GradeDTO();
				
				dto.setgName(gName);
				dto.setMinPoint(rs.getInt("minPoint"));
				dto.setMaxPoint(rs.getInt("maxPoint"));
				dto.setAddPRate(rs.getInt("addPRate"));
				
			}
			
			pstmt.close();
			rs.close();
					
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
}
