package com.meatShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;


public class ProdDAO {
	
private Connection conn;
	
	public ProdDAO(Connection conn) {
		this.conn = conn;
	}
	
	
	//num�� �ִ밪
	public int getMaxNum() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			
			sql = "select nvl(max(pNum),0) from prodInfo";
			
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
	
	
	//�Է�
	public int insertData(ProdDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into prodInfo (pNum,pName,price,category,pImage,pOption1,pOption2,pOption3,opCount,gram) ";
			sql+= "values (?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getpNum());
			pstmt.setString(2, dto.getpName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getCategory());
			pstmt.setString(5, dto.getpImage());
			pstmt.setString(6, dto.getpOption()[0]);
			pstmt.setString(7, dto.getpOption()[1]);
			pstmt.setString(8, dto.getpOption()[2]);
			pstmt.setInt(9, dto.getOpCount());
			pstmt.setInt(10, dto.getGram());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	//��ü�������� ���� 
	public int getDataCount(String category) {
		
		int totalDataCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(count(*),0) from prodInfo ";
			sql+= "where category = ?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalDataCount = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return totalDataCount;
	}
	
	//ǥ���� ������(rownum ����)��ü������
	public List<ProdDTO> getLists(String category) {
		
		List<ProdDTO> lists = new ArrayList<ProdDTO>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		String sql;
		
		switch (category) {
		case "pork":
			category = "�������";
			break;
		case "beef":
			category = "�Ұ��";
			break;
		case "chicken":
			category = "�߰��";
			break;
		case "seafood":
			category = "����";
			break;
		case "mealkit":
			category = "��ŰƮ";
			break;
		case "egg":
			category = "�ް�";
			break;
		case "milk":
			category = "����";
			break;
		case "baby":
			category = "������";
			break;
		}
		
		try {
		
			sql = "select pNum,pName,price,category,pImage,pOption1,pOption2,pOption3,opCount,gram ";
			sql+= "from prodInfo where category=? order by pNum desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);

	
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProdDTO dto = new ProdDTO();
				
				dto.setpNum(rs.getInt("pNum"));
				dto.setpName(rs.getString("pName"));
				dto.setPrice(rs.getInt("price"));
				dto.setCategory(rs.getString("category"));
				dto.setpImage(rs.getString("pImage"));
				String[] options = new String[3];
				options[0] = rs.getString("pOption1");
				options[1] = rs.getString("pOption2");
				options[2] = rs.getString("pOption3");
				dto.setpOption(options);
				dto.setOpCount(rs.getInt("opCount"));
				dto.setGram(rs.getInt("gram"));
				
				String standard = "";
				
				if(dto.getCategory().equals("�ް�"))
					standard = "1����";
				else if (dto.getCategory().equals("����")) 
					standard = "100ml��";
				else 
					standard = "100g��";
				
				String stPrice = "";
				
				DecimalFormat formatter = new DecimalFormat("###,###");
				
				if(dto.getCategory().equals("�ް�")) 
					stPrice =  formatter.format(dto.getPrice()/dto.getGram()) +"��";
				else 
					stPrice =  formatter.format(100*dto.getPrice()/dto.getGram()) +"��";
				
				String unit = "";
				if(dto.getCategory().equals("�ް�"))
					unit = Integer.toString(dto.getGram())+"��";
				else if (dto.getCategory().equals("����")) 
					unit = Integer.toString(dto.getGram())+"ml";
				else 
					unit = Integer.toString(dto.getGram())+"g";
				
				if(dto.getpName().indexOf("���׻���")!=-1) {
					dto.setMu(true);
				}else
					dto.setMu(false);
				dto.setUnit(unit);
				dto.setStandard(standard);
				dto.setStPrice(stPrice);
				dto.setCommaPrice(formatter.format(dto.getPrice())+"��");
				lists.add(dto);
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	
	
	//�ְ�����Ʈ
	public List<ProdDTO> getBestLists() {
		
		List<ProdDTO> lists = new ArrayList<ProdDTO>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select * from (select rownum rnum, data.* from "
					+ "(select a.pNum, a.buy, b.pName, b.price,b.category,b.pImage,b.pOption1,b.pOption2,b.pOption3,b.opCount,b.gram "
					+ "from (select pNum, sum(buycount) buy from orderInfo where buyDate>sysdate-7 group by pNum order by buy desc) a, "
					+ "prodInfo b where a.pNum = b.pNum order by a.buy desc) data) where rnum>0 and rnum<4";
			
			pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProdDTO dto = new ProdDTO();
				
				dto.setpNum(rs.getInt("pNum"));
				dto.setpName(rs.getString("pName"));
				dto.setPrice(rs.getInt("price"));
				dto.setCategory(rs.getString("category"));
				dto.setpImage(rs.getString("pImage"));
				String[] options = new String[3];
				options[0] = rs.getString("pOption1");
				options[1] = rs.getString("pOption2");
				options[2] = rs.getString("pOption3");
				dto.setpOption(options);
				dto.setOpCount(rs.getInt("opCount"));
				dto.setGram(rs.getInt("gram"));
				
				String standard = "";
				
				if(dto.getCategory().equals("�ް�"))
					standard = "1����";
				else if (dto.getCategory().equals("����")) 
					standard = "100ml��";
				else 
					standard = "100g��";
				
				String stPrice = "";
				
				DecimalFormat formatter = new DecimalFormat("###,###");
				
					
				if(dto.getCategory().equals("�ް�")) 
					stPrice =  formatter.format(dto.getPrice()/dto.getGram()) +"��";
				else 
					stPrice =  formatter.format(100*dto.getPrice()/dto.getGram()) +"��";
				
				String unit = "";
				if(dto.getCategory().equals("�ް�"))
					unit = Integer.toString(dto.getGram())+"��";
				else if (dto.getCategory().equals("����")) 
					unit = Integer.toString(dto.getGram())+"ml";
				else 
					unit = Integer.toString(dto.getGram())+"g";
				
				if(dto.getpName().indexOf("���׻���")!=-1) {
					dto.setMu(true);
				}else
					dto.setMu(false);
				
				dto.setUnit(unit);
				dto.setStandard(standard);
				dto.setStPrice(stPrice);
				dto.setCommaPrice(formatter.format(dto.getPrice())+"��");
				lists.add(dto);
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	
	
	
	
	//pNum���� ��ȸ�� �Ѱ��� ������
	public ProdDTO getReadData(int pNum) {
		
		ProdDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select pNum,pName,price,category,pImage,pOption1,pOption2,pOption3,opCount,gram ";
			sql+= "from prodInfo where pNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new ProdDTO();
				dto.setpNum(rs.getInt("pNum"));
				dto.setpName(rs.getString("pName"));
				dto.setPrice(rs.getInt("price"));
				dto.setCategory(rs.getString("category"));
				dto.setpImage(rs.getString("pImage"));
				String[] options = new String[3];
				options[0] = rs.getString("pOption1");
				options[1] = rs.getString("pOption2");
				options[2] = rs.getString("pOption3");
				dto.setpOption(options);
				dto.setOpCount(rs.getInt("opCount"));
				dto.setGram(rs.getInt("gram"));
				String standard = "";
				
				if(dto.getCategory().equals("�ް�"))
					standard = "1����";
				else if (dto.getCategory().equals("����")) 
					standard = "100ml��";
				else 
					standard = "100g��";
				
				String stPrice = "";
				
				DecimalFormat formatter = new DecimalFormat("###,###");
				
				if(dto.getCategory().equals("�ް�")) 
					stPrice =  formatter.format(dto.getPrice()/dto.getGram()) +"��";
				else 
					stPrice =  formatter.format(100*dto.getPrice()/dto.getGram()) +"��";
				
				String unit = "";
				if(dto.getCategory().equals("�ް�"))
					unit = Integer.toString(dto.getGram())+"��";
				else if (dto.getCategory().equals("����")) 
					unit = Integer.toString(dto.getGram())+"ml";
				else 
					unit = Integer.toString(dto.getGram())+"g";
				
				dto.setUnit(unit);
				dto.setStandard(standard);
				dto.setStPrice(stPrice);
				dto.setCommaPrice(formatter.format(dto.getPrice())+"��");

			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	
	
	//�����ϱ�
	public int updateData(ProdDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update prodInfo set pName=?,price=?,category=?,pImage=?,pOption1=?,pOption2=?,pOption3=?,opCount=?,gram=? where pNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getpName());
			pstmt.setInt(2, dto.getPrice());	
			pstmt.setString(3, dto.getCategory());
			pstmt.setString(4, dto.getpImage());
			pstmt.setString(5, dto.getpOption()[0]);
			pstmt.setString(6, dto.getpOption()[1]);
			pstmt.setString(7, dto.getpOption()[2]);
			pstmt.setInt(8, dto.getOpCount());	
			pstmt.setInt(9, dto.getGram());	
			pstmt.setInt(10, dto.getpNum());	
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	//����
	public int deleteData(int pNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete prodInfo where pNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
