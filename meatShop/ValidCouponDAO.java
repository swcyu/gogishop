package com.meatShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ValidCouponDAO {
	
	private Connection conn;
	public ValidCouponDAO(Connection conn) {
		this.conn = conn;
	}
	
	//표시할 전체데이터
		public List<ValidCouponDTO> getLists(int userNum) {
			
			List<ValidCouponDTO> lists = new ArrayList<ValidCouponDTO>();
			
			PreparedStatement pstmt = null;
			
			ResultSet rs = null;
			String sql;
			
			try {
			
				sql= "select cNum,cName,cStartDate,cEndDate from ValidCoupon where userNum=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNum);

				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					ValidCouponDTO dto = new ValidCouponDTO();
	
					dto.setcNum(rs.getInt("cNum"));
					dto.setcName(rs.getString("cName"));
					dto.setcStartDate(rs.getString("cStartDate"));
					dto.setcEndDate(rs.getString("cEndDate"));
					
					lists.add(dto);
					
				}
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return lists;
		}
		
		public ValidCouponDTO getReadData(int cNum){
			
			ValidCouponDTO dto = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				
				sql = "select cName from ValidCoupon where cNum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, cNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto = new ValidCouponDTO();
				
					dto.setcName(rs.getString("cName"));
					dto.setcNum(cNum);
					
				}
				
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return dto;
		}
		
		public int deleteData(int cNum) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql;
			
			try {
				
				sql = "delete validCoupon where cNum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, cNum);
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return result;
		}
}
