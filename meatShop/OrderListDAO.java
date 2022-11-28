package com.meatShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class OrderListDAO {

private Connection conn;
	
	public OrderListDAO(Connection conn) {
		this.conn = conn;
	}
	
	//num의 최대값
	public int getMaxNum() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			
			sql = "select nvl(max(listNum),0) from orderlist";
			
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
	public int insertData(OrderListDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into orderlist (listNum, pNum, pCount, pOption, userNum) ";
			sql+= "values (?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getListNum());
			pstmt.setInt(2, dto.getpNum());
			pstmt.setInt(3, dto.getpCount());
			pstmt.setString(4, dto.getpOption());
			pstmt.setInt(5, dto.getUserNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	//표시할 전체데이터
	public List<OrderListDTO> getLists(int userNum) {
		
		List<OrderListDTO> lists = new ArrayList<OrderListDTO>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		String sql;
		
		try {
		
			sql= "select a.listNum, a.pNum, a.pCount, a.pOption, b.pName, b.price, b.pImage, b.category, b.gram ";
			sql+= "from orderlist a, prodInfo b where a.pNum=b.pNum and userNum=? order by listNum desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				OrderListDTO dto = new OrderListDTO();
				
				dto.setListNum(rs.getInt("listNum"));
				dto.setpNum(rs.getInt("pNum"));
				dto.setpCount(rs.getInt("pCount"));
				dto.setpOption(rs.getString("pOption"));
				dto.setUserNum(userNum);
				dto.setpName(rs.getString("pName"));
				dto.setpImage(rs.getString("pImage"));
				dto.setpPrice(rs.getInt("price"));
				
				DecimalFormat formatter = new DecimalFormat("###,###");
				if(dto.getpPrice()==0) {
					dto.setCommaPrice("무료증정");
				}else {
					String commaPrice =  formatter.format(dto.getpCount()*dto.getpPrice()) +"원";
					dto.setCommaPrice(commaPrice);
				}
				String unit = "";
				if(rs.getString("category").equals("달걀"))
					unit = Integer.toString(rs.getInt("gram"))+"구";
				else if (rs.getString("category").equals("우유")) 
					unit = Integer.toString(rs.getInt("gram"))+"ml";
				else 
					unit = Integer.toString(rs.getInt("gram"))+"g";
				
				dto.setUnit(unit);
				
				
				lists.add(dto);
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	
	public int getCount(int listNum) {
		
		int pCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql= "select pCount from orderlist where listNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, listNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {				
				pCount = rs.getInt(1);
			}
			
			pstmt.close();
			rs.close();
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		return pCount;
	}
	
	
	public boolean orderCheck(int userNum, int pNum) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql= "select pNum from orderlist where userNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {				
				if(rs.getInt("pNum")==pNum) {
					return true;
				}
			}
			
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		return false;
	}
	
	public int updateData(int pCount,int pNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update orderlist set pCount=? where pNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pCount);	
			pstmt.setInt(2, pNum);	
			
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	public String getFreeCheck(int listNum) {
		
		String pName="";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql;
		
		try {
			
			sql = "select b.pName from (select pNum from orderlist where listNum=?) a, prodInfo b where a.pNum=b.pNum";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, listNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pName=rs.getString(1);
			}
	
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return pName;
	}
	
	
	public int minusCount(int listNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			

			sql = "update orderlist set pCount=pCount-1 where listNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, listNum);		
			
			
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	public int plusCount(int listNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update orderlist set pCount=pCount+1 where listNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, listNum);		
			
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	//삭제
	public int deleteData(int listNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete orderlist where listNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, listNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//삭제
		public int deleteAllData(int userNum) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql;
			
			try {
				
				sql = "delete orderlist where userNum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNum);
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return result;
		}
}
