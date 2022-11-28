package com.meatShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.net.aso.r;

public class ReviewDAO {
	
	private Connection conn;
	
	public ReviewDAO(Connection conn) {
		this.conn = conn;
	}
	
	//num�� �ִ밪
	public int getMaxNum() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			
			sql = "select nvl(max(rNum),0) from review";
			
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
		public int insertData(ReviewDTO rdto) {
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			String sql;
			
			try {
						
					sql = "insert into review (rNum,rTitle,rContent,rDate,pNum,userNum) ";
					sql+= "values (?,?,?,sysdate,?,?)";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, rdto.getrNum());
					pstmt.setString(2, rdto.getrTitle());
					pstmt.setString(3, rdto.getrContent());
					pstmt.setInt(4, rdto.getpNum());
					pstmt.setInt(5, rdto.getUserNum());
					
					result = pstmt.executeUpdate();
				
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return result;
		}

	
		//��ǰ�� ���� ���� 
		public int getDataCount(int pNum) {
			
			int totalDataCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
					
				sql = "select nvl(count(*),0) from review";
					
				pstmt = conn.prepareStatement(sql);
				
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
	
	
		//userNum ���� �ش� ��ǰ ���ſ��� Ȯ��
		
		
		
		//userNum �������� ���� �ֱ� �ֹ���ȣ(buyNum)
		public int getRecBuyNum(int userNum) {
			
			int recBuyNum = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
					
				sql = "select buyNum from (select rownum, data.* from (select buyNum from orderInfo where usernum=? order by BUYDATE DESC) data) where rownum=1";
					
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					recBuyNum = rs.getInt(1);
				}
				
				rs.close();
				pstmt.close();
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return recBuyNum;
		}

		//userNum ���� �� �ֹ� Ƚ��
		public int getTotBuyTimes(int userNum) {
			
			int totBuyTimes = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
					
				sql = "select count(distinct buynum) totBuyTimes from orderinfo where usernum=?";
					
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					totBuyTimes = rs.getInt(1);
				}
				
				rs.close();
				pstmt.close();
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return totBuyTimes;
		}
		
		//�ֹ���ȣ ���� �� ���ż���
		public int getTotBuyCount(int recBuyNum) {
			
			int totBuyCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
					
				sql = "select sum(buyCount) from orderInfo where buyNum=?";
					
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, recBuyNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					totBuyCount = rs.getInt(1);
				}
				
				rs.close();
				pstmt.close();
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return totBuyCount;
		}

		
		//userNum���� �ش� ��ǰ ����Ƚ��
		public int getPBuyCount(int userNum, int pNum) {
			
			int pBuyCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
					
				sql = "select count(buyNum) count from orderInfo where userNum=? and pNum=?";
					
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNum);
				pstmt.setInt(2, pNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					pBuyCount = rs.getInt(1);
				}
				
				rs.close();
				pstmt.close();
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return pBuyCount;
		}

		
		
		
	
	
		//ǥ���� ������(rownum ����)��ü������
		public List<ReviewDTO> getPageLists(int start, int end, int pNum) {
			
			List<ReviewDTO> lists = new ArrayList<ReviewDTO>();
			
			PreparedStatement pstmt = null;
			
			ResultSet rs = null;
			String sql;
			
			try {
				
		         sql = "select * from (";
		         sql+= "select rownum,data.* from (";
		         sql+= "select rNum,rTitle,rContent,";
		         sql+= "substr(userName,1,1)||lpad('*',length(userName)-2,'*')||substr(userName,length(userName),1) userName,";
		         sql+= "to_char(rDate,'YYYY-MM-DD') rDate ";
		         sql+= "from review where pNum=? order by rNum desc) data) "; 
		         sql+= "where rownum>=? and rownum<=?";
		         
		         pstmt = conn.prepareStatement(sql);
		         
		         pstmt.setInt(1, pNum);
		         pstmt.setInt(2, start);
		         pstmt.setInt(3, end);

				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					ReviewDTO rdto = new ReviewDTO();
					
					rdto.setrNum(rs.getInt("rNum"));
					rdto.setrTitle(rs.getString("rTitle"));
					rdto.setrContent(rs.getString("rContent"));
					rdto.setUserName(rs.getString("userId"));
					rdto.setrDate(rs.getString("rDate"));
					
					lists.add(rdto);
					
				}
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return lists;
		}
		
		
		//��ǰ��ȣ ���� ��ü����
		public List<ReviewDTO> getLists(int pNum) {
			
			List<ReviewDTO> tRLists = new ArrayList<ReviewDTO>();
			
			PreparedStatement pstmt = null;
			
			ResultSet rs = null;
			String sql;
			
			try {
				
				sql = "select d.rNum rNum, d.rTitle rTitle, d.rContent rContent, to_char(d.rDate,'yyyy-mm-dd') rDate, c.buyCount buyCount, "
					+ "c.pNum pNum, substr(c.userName,1,1)||lpad('*',length(c.userName)-2,'*')||substr(c.userName,length(c.userName),1) "
					+ "userName from (select a.count buyCount, a.pNum pNum, a.userNum userNum, b.userName userName from (select distinct f.pNum pNum, "
					+ "g.count count, g.userNum from orderInfo f,(select count(buyNum) count, userNum from orderInfo where pNum=? group by userNum) g "
					+ "where f.userNum=g.userNum and pNum=?) a, userInfo b where a.userNum = b.userNum) c, review d where c.userNum=d.userNum and "
					+ "c.pNum=d.pNum order by rNum desc";
		         
		         pstmt = conn.prepareStatement(sql);
		         
		         pstmt.setInt(1, pNum);
		         pstmt.setInt(2, pNum);

				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					ReviewDTO rdto = new ReviewDTO();
					
					rdto.setrNum(rs.getInt("rNum"));
					rdto.setrTitle(rs.getString("rTitle"));
					rdto.setrContent(rs.getString("rContent"));
					rdto.setUserName(rs.getString("userName"));
					rdto.setrDate(rs.getString("rDate"));
					rdto.setBuyCount(rs.getInt("buyCount"));
						
					tRLists.add(rdto);
					
				}
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return tRLists;
		}


	
		//pNum���� ��ȸ�� ������
		public ReviewDTO getReadData(int pNum) {
			
			ReviewDTO rdto = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				
				sql = "select d.rNum rNum, d.rTitle rTitle, d.rContent rContent, to_char(d.rDate,'yyyy-mm-dd') rDate, c.buyCount buyCount, "
						+ "c.pNum pNum, substr(c.userName,1,1)||lpad('*',length(c.userName)-2,'*')||substr(c.userName,length(c.userName),1) "
						+ "userName from (select a.count buyCount, a.pNum pNum, a.userNum userNum, b.userName userName from (select distinct f.pNum pNum, "
						+ "g.count count, g.userNum from orderInfo f,(select count(buyNum) count, userNum from orderInfo where pNum=? group by userNum) g "
						+ "where f.userNum=g.userNum and pNum=?) a, userInfo b where a.userNum = b.userNum) c, review d where c.userNum=d.userNum and "
						+ "c.pNum=d.pNum order by rNum desc";

				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, pNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					rdto = new ReviewDTO();
					
					rdto.setrNum(rs.getInt("rNum"));
					rdto.setrTitle(rs.getString("rTitle"));
					rdto.setrContent(rs.getString("rContent"));
					rdto.setUserName(rs.getString("userName"));
					rdto.setrDate(rs.getString("rDate"));
					rdto.setBuyCount(rs.getInt("buyCount"));
					
				}
				
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return rdto;
		}
		
	
		//�����ϱ�
		public int updateData(ReviewDTO rdto) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql;
			
			try {
				
				sql = "update review set rTitle=?,rContent=?,rDate=? where rNum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, rdto.getrTitle());	
				pstmt.setString(2, rdto.getrContent());	
				pstmt.setString(3, rdto.getrDate());
				pstmt.setInt(4, rdto.getrNum());
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return result;
		}

		//����
		public int deleteData(int rNum) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql;
			
			try {
				
				sql = "delete review where rNum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, rNum);
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return result;
		}
	

}//ReviewDAO
