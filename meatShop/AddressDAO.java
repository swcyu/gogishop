package com.meatShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AddressDAO {

	private Connection conn;
	
	public AddressDAO(Connection conn) {
		this.conn = conn;
	}
	
	//num의 최대값
	public int getMaxNum() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			
			sql = "select nvl(max(addrNum),0) from Address";
			
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
	public int insertData(AddressDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into Address (addrNum, userNum, recvName, recvPhone, recvAddr1, recvAddr2, zipcode) ";
			sql+= "values (?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getAddrNum());
			pstmt.setInt(2, dto.getUserNum());
			pstmt.setString(3, dto.getRecvName());
			pstmt.setString(4, dto.getRecvPhone());
			pstmt.setString(5, dto.getRecvAddr1());
			pstmt.setString(6, dto.getRecvAddr2());
			pstmt.setString(7, dto.getZipcode());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	//표시할 전체데이터
	public List<AddressDTO> getLists(int userNum) {
		
		List<AddressDTO> lists = new ArrayList<AddressDTO>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		String sql;
		
		try {
		
			sql= "select addrNum, recvName, recvPhone, recvAddr1, recvAddr2,zipcode ";
			sql+= "from Address where userNum=? order by addrNum desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				AddressDTO dto = new AddressDTO();
				
				dto.setAddrNum(rs.getInt("addrNum"));
				dto.setUserNum(userNum);
				dto.setRecvName(rs.getString("recvName"));
				dto.setRecvPhone(rs.getString("recvPhone"));
				dto.setRecvAddr1(rs.getString("recvAddr1"));
				dto.setRecvAddr2(rs.getString("recvAddr2"));
				dto.setZipcode(rs.getString("zipcode"));
				
				lists.add(dto);
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	public AddressDTO getReadData(int addrNum){
		
		AddressDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select userNum, recvName, recvPhone, recvAddr1, recvAddr2, zipcode from Address where addrNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, addrNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new AddressDTO();
				
				dto.setAddrNum(addrNum);
				dto.setUserNum(rs.getInt("userNum"));
				dto.setRecvName(rs.getString("recvName"));
				dto.setRecvPhone(rs.getString("recvPhone"));
				dto.setRecvAddr1(rs.getString("recvAddr1"));
				dto.setRecvAddr2(rs.getString("recvAddr2"));
				dto.setZipcode(rs.getString("zipcode"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	public int updateData(AddressDTO dto) {
		
		String sql;
		PreparedStatement pstmt = null;
		int result=0;
		
		try {
			
			sql = "update address set recvName=?,recvPhone=?,zipcode=?,recvAddr1=?,recvAddr2=? where addrNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getRecvName());
			pstmt.setString(2, dto.getRecvPhone());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getRecvAddr1());
			pstmt.setString(5,  dto.getRecvAddr2());
			pstmt.setInt(6, dto.getAddrNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	//삭제
	public int deleteData(int addrNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete address where addrNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, addrNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}
