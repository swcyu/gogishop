package com.meatShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DescFileDAO {

	private Connection conn;
	
	public DescFileDAO(Connection conn) {
		this.conn = conn;
	}
	
	//iNum의 최대값
	public int getMaxNum() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			
			sql = "select nvl(max(iNum),0) from descFile";
			
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

	
	//fileCount
	public int getFileCount(int pNum, String tab) {
		
		int fileCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			
			sql = "select count(fileName) fileCount from descFile where tab=? and pNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tab);
			pstmt.setInt(2, pNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				fileCount = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return fileCount;
	}

	
	
	
	//fileName 구하기
	public List<DescFileDTO> getFileNames(int pNum, String tab) {
		
		List<DescFileDTO> fnLists = new ArrayList<DescFileDTO>(); 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			
			sql = "select rowNum, iNum, fileName, type from descFile where tab=? and pNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tab);
			pstmt.setInt(2, pNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				DescFileDTO dfdto = new DescFileDTO();
				
				dfdto.setRowNum(rs.getInt("rowNum"));
				dfdto.setiNum(rs.getInt("iNum"));
				dfdto.setFileName(rs.getString("fileName"));
				dfdto.setType(rs.getString("type"));
				
				fnLists.add(dfdto);
	
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return fnLists;
	}


	//입력 - iNum 최대값으로 자동입력?
	public int insertData(DescFileDTO dfdto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into descFile (iNum,pNum,fileName,tab,type) ";
			sql+= "values (?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dfdto.getiNum());
			pstmt.setInt(2, dfdto.getpNum());
			pstmt.setString(3, dfdto.getFileName());
			pstmt.setString(4, dfdto.getTab());
			pstmt.setString(5, dfdto.getType());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	
	//pNum으로 조회한 한 페이지의 데이터
	public List<DescFileDTO> getLists(int pNum) {
		
		List<DescFileDTO> lists = new ArrayList<DescFileDTO>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		String sql;
		
		try {
			
	         sql = "select iNum,fileName,tab,type ";
	         sql+= "from descFile where pNum=? order by iNum asc"; 
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, pNum);

	         rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				DescFileDTO dfdto = new DescFileDTO();
				
				dfdto.setiNum(rs.getInt("iNum"));
				dfdto.setFileName(rs.getString("fileName"));
				dfdto.setTab(rs.getString("tab"));
				dfdto.setType(rs.getString("type"));
				
				lists.add(dfdto);
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}	

	//수정하기
	public int updateData(DescFileDTO dfdto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update review set iNum=?,fileName=?,tab=?,type=? where pNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dfdto.getiNum());
			pstmt.setString(2, dfdto.getFileName());	
			pstmt.setString(3, dfdto.getTab());	
			pstmt.setString(4, dfdto.getType());	
			pstmt.setInt(5, dfdto.getpNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	//삭제
	public int deleteData(int iNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete descFile where iNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, iNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

		
}//DescFileDAO
