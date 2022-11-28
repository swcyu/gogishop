package com.meatShop;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.FileManager;
import com.util.MyUtil;

public class MeatShopServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		
		Connection conn = DBConn.getConnection();
		ProdDAO dao = new ProdDAO(conn);
		OrderListDAO odao = new OrderListDAO(conn);
		ReviewDAO rdao = new ReviewDAO(conn);
		MeatShopDAO mdao = new MeatShopDAO(conn);
		AddressDAO adao = new AddressDAO(conn);
		DescFileDAO dfdao = new DescFileDAO(conn);
		TempDAO tdao = new TempDAO(conn);//구매정보 DAO만들면 변경
		ValidCouponDAO vdao = new ValidCouponDAO(conn);
		CouponDAO cdao = new CouponDAO(conn);
		OrderInfoDAO oidao = new OrderInfoDAO(conn);
		GradeDAO gdao = new GradeDAO(conn);
		
		//파일 저장경로
		String root = getServletContext().getRealPath("/");
		//D:\java\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\study\pds\saveFile
		String path = root + "pds" + File.separator + "qnaFile";
		
		File f = new File(path);
		
		if(!f.exists()) {	
			f.mkdirs();
		}
		DecimalFormat formatter = new DecimalFormat("###,###");

		String uri = req.getRequestURI();
		
		String imageUrl = cp + "/meat/image/";
		String descUrl = cp + "/meatShop/desc.do";
		String url;
		HttpSession session = req.getSession();
		int userNum;
		
		if(uri.indexOf("desc.do")!=-1) {
			

			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			
			//상품정보 
			int pNum = Integer.parseInt(req.getParameter("pNum"));
			String descImgUrl = cp + "/meat/descImage/";
			String blackUrl = cp + "/meat/black/";
			
			ProdDTO dto = dao.getReadData(pNum);
			
			String category = dto.getCategory();
			if(dto.getpName().indexOf("무료")!=-1) {
				url = cp +"/meatShop/freePork.do";
				resp.sendRedirect(url);
				return;
			}

			
			List<DescFileDTO> dfLists = dfdao.getLists(pNum);
			
			String desc = "desc";
			String dInfo = "info";
			
			List<DescFileDTO> dfnLists = dfdao.getFileNames(pNum, desc);
			List<DescFileDTO> ifnLists = dfdao.getFileNames(pNum, dInfo);
			List<ReviewDTO> tRLists = rdao.getLists(pNum);
			int dfCount = dfdao.getFileCount(pNum, desc);
			int ifCount = dfdao.getFileCount(pNum, dInfo);
			int revCount = rdao.getDataCount(pNum);

			
			
			
			if(info!=null) {
				
				//리뷰탭 - 작성 데이터(가장 최근 주문번호(주문 상품 번호, 구매수량, 상품이름),총 주문 횟수)
				userNum = info.getUserNum();
				int recBuyNum = rdao.getRecBuyNum(userNum);
				int totBuyTimes = rdao.getTotBuyTimes(userNum);
				int totBuyCount = rdao.getTotBuyCount(recBuyNum);
				int pBuyCount = rdao.getPBuyCount(userNum, pNum);
				
				req.setAttribute("userNum", userNum);
				req.setAttribute("totBuyTimes", totBuyTimes);
				req.setAttribute("totBuyCount", totBuyCount);
				req.setAttribute("pBuyCount", pBuyCount);

			}
			


			//날짜 
			Calendar cal = Calendar.getInstance();
			
			//배송일 (sysdate+2)
			cal.add(Calendar.DAY_OF_MONTH, 2);
			int delMM = cal.get(Calendar.MONTH)+1;
			int delDD = cal.get(Calendar.DAY_OF_MONTH);
								
			//도축일 (배송일 -5)
			cal.add(Calendar.DAY_OF_MONTH, -5);

			String freshMM = Integer.toString(cal.get(Calendar.MONTH)+1);
			String freshDD = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
			
			String freshM1 = freshMM.substring(0, 1);
			String freshM2 = freshMM.substring(1);
			String freshD1 = freshDD.substring(0, 1);
			String freshD2 = freshDD.substring(1);
			
			String fresh = "";
			String freshMk = "";
			//신선도
			switch (category) {
			case "이유식":
				fresh = "도축일을";
				freshMk = "다짐육";
				break;
			case "닭고기":
				fresh = "도계일을";
				freshMk = "닭고기";
				break;
			case "달걀":
				fresh = "산란일을";
				freshMk = "달걀";
				break;
			case "수산":
				fresh = "직송일을";
				freshMk = "수산물";
				cal.add(Calendar.DAY_OF_MONTH, 4);
				freshMM = Integer.toString(cal.get(Calendar.MONTH)+1);
				freshDD = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
				freshM1 = freshMM.substring(0, 1);
				freshM2 = freshMM.substring(1);
				freshD1 = freshDD.substring(0, 1);
				freshD2 = freshDD.substring(1);
				break;
			case "돼지고기":
				fresh = "도축일을";
				freshMk = "돼지고기";
				break;
			case "소고기":
				fresh = "도축일을";
				freshMk = "소고기";
				break;
	
			case "우유":
				fresh = "착유일을";
				freshMk = "우유";
				break;
			case "밀키트":
				if(dto.getpName()=="초신선 고추장 닭볶음탕"||dto.getpName().equals("초신선 고추장 닭볶음탕")) {
					fresh = "도계일을";
					freshMk = "닭고기";
				}else if(dto.getpName()=="정온 숙성 한우 간장불고기"||dto.getpName().equals("정온 숙성 한우 간장불고기")) {
					fresh = "도축일을";
					freshMk = "소고기";
				}else if(dto.getpName()=="초신선 등심 돈까스"||dto.getpName().equals("초신선 등심 돈까스")) {
					fresh = "도축일을";
					freshMk = "돼지고기";
				}else if(dto.getpName()=="초신선 한우 육사시미"||dto.getpName().equals("초신선 한우 육사시미")) {
					fresh = "도축일을";
					freshMk = "소고기";
				}
				break;
	
			}//switch

			//리뷰 날짜 포맷
			String pattern = "yyyy-MM-dd";
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			String revDate = sdf.format(new Date());
			
					
			req.setAttribute("dto", dto);
			req.setAttribute("imageUrl", imageUrl);
			req.setAttribute("category", category);

			req.setAttribute("descImgUrl", descImgUrl);
			req.setAttribute("blackUrl", blackUrl);
			req.setAttribute("delMM", delMM);
			req.setAttribute("delDD", delDD);
			req.setAttribute("fresh", fresh);
			req.setAttribute("dfLists", dfLists);
			req.setAttribute("dfnLists", dfnLists);
			req.setAttribute("ifnLists", ifnLists);
			req.setAttribute("dfCount", dfCount);
			req.setAttribute("ifCount", ifCount);
			req.setAttribute("freshMk", freshMk);
		
			req.setAttribute("freshM1", freshM1);
			req.setAttribute("freshM2", freshM2);
			req.setAttribute("freshD1", freshD1);
			req.setAttribute("freshD2", freshD2);
			req.setAttribute("revDate", revDate);
			req.setAttribute("tRLists", tRLists);
			req.setAttribute("revCount", revCount);
			
			String key = "image"+Integer.toString(dto.getpNum());
			
			Cookie delCookie = new Cookie(key,null);
			delCookie.setMaxAge(0);
			resp.addCookie(delCookie);
			
			Cookie createCookie = new Cookie(key,Integer.toString(dto.getpNum()));
			createCookie.setMaxAge(60*15);
			resp.addCookie(createCookie);
			
			url = "/meat/prodDetail.jsp";
			
			forward(req, resp, url);

		}else if(uri.indexOf("review_ok.do")!=-1) {
			
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
			
			int pNum = Integer.parseInt(req.getParameter("pNum"));
			ProdDTO dto = dao.getReadData(pNum);
			int maxNum = rdao.getMaxNum();

			ReviewDTO rdto = new ReviewDTO();
	
			rdto.setrNum(maxNum+1);
			rdto.setrTitle(req.getParameter("rTitle"));
			rdto.setrContent(req.getParameter("rContent"));
			rdto.setpNum(Integer.parseInt(req.getParameter("pNum")));
			rdto.setUserNum(userNum);

			rdao.insertData(rdto);
			
			url = cp + "/meatShop/desc.do?pNum="+pNum;
			resp.sendRedirect(url);
			
	
		}else if(uri.indexOf("review_del.do")!=-1) {

			int pNum = Integer.parseInt(req.getParameter("pNum"));
			int rNum = Integer.parseInt(req.getParameter("rNum"));
		
			ReviewDTO rdto = rdao.getReadData(rNum);
			
		
			rdao.deleteData(rNum);
			
			req.setAttribute("pNum", pNum);
			
			url = cp + "/meatShop/desc.do?pNum="+pNum;
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("list.do")!=-1) {

			String category = req.getParameter("category");
			if(category==null||category.equals(""))
				category = "pork";
			List<ProdDTO> lists = dao.getLists(category);
			List<ProdDTO> bestLists = dao.getBestLists();
			Cookie[] cookies = req.getCookies();
			List<ProdDTO> clists = null;
			
			if(cookies!=null){	
				clists = new ArrayList<ProdDTO>();
				for(int i=cookies.length-1;i>=0;i--){
					if(cookies[i].getName().indexOf("image")!=-1){
						ProdDTO dto= dao.getReadData(Integer.parseInt(cookies[i].getValue()));
						clists.add(dto);
					}
				}
			}
			if(clists.size()==0)
				clists = null;

			
			//포워딩할 페이지에 넘길 데이터
			req.setAttribute("lists", lists);
			req.setAttribute("bestLists", bestLists);
			req.setAttribute("clists", clists);
			req.setAttribute("descUrl", descUrl);
			req.setAttribute("category", category);
			req.setAttribute("imageUrl", imageUrl);
			
			
			url = "/meat/prodList.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("wishList.do")!=-1) {
			
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
			int delivery =0;
			
			
			//구매정보DAO 만들면 변경
			if(tdao.getBuyCount(userNum)>0) {
				delivery=2500;
			}
			String deliveryCost = formatter.format(delivery) +"원";
			
			List<OrderListDTO> flists = new ArrayList<>();
			List<OrderListDTO> nlists = new ArrayList<>();
			List<OrderListDTO> lists = odao.getLists(userNum);
			boolean wish = (lists.size()==0);
			int total = 0;
			String totalPrice;
			Iterator<OrderListDTO> iter = lists.iterator();
			while(iter.hasNext()) {
				OrderListDTO dto = iter.next();
				if(dto.getpName().indexOf("무료")!=-1) {
					flists.add(dto);
				}else {
					nlists.add(dto);
				}
				total += dto.getpCount() * dto.getpPrice();
			
			}
			int finalPrice  = total+delivery;
			String commaFinalPrice = formatter.format(finalPrice) +"원";
			totalPrice = formatter.format(total) +"원";
			boolean free = (flists.size()==0);
						
			req.setAttribute("wish", wish);
			req.setAttribute("free", free);
			req.setAttribute("flists", flists);
			req.setAttribute("nlists", nlists);
			req.setAttribute("imgUrl", imageUrl);
			req.setAttribute("total", total);
			req.setAttribute("totalPrice", totalPrice);
			req.setAttribute("delivery", delivery);
			req.setAttribute("deliveryCost", deliveryCost);
			req.setAttribute("finalPrice", finalPrice);
			req.setAttribute("commaFinalPrice", commaFinalPrice);
			
			url = "/meat/wishList.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("addWishList.do")!=-1) {
			
			OrderListDTO dto = null;
			String category = req.getParameter("category");
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
			
			List<OrderListDTO> lists = odao.getLists(userNum);
			Iterator<OrderListDTO> it = lists.iterator();
			int pNum = Integer.parseInt(req.getParameter("pNum"));
			int pCount = Integer.parseInt(req.getParameter("pCount"));
			info.setWishCount(info.getWishCount()+pCount);
			session.setAttribute("customInfo", info);
			while (it.hasNext()) {
				dto = it.next();
				if(dto.getpNum()==pNum) {
					pCount += dto.getpCount();
					odao.updateData(pCount, pNum);
					if(category.equals("main")) {
						url = cp + "/meatShop/main.do";
						resp.sendRedirect(url);
						return;
					}else if(category.equals("desc")) {
						url = cp + "/meatShop/desc.do?pNum="+pNum;
						resp.sendRedirect(url);
						return;
					}
					url = cp + "/meatShop/list.do?category=" +category;
					resp.sendRedirect(url);
					return;
				}
			}
			
			int listNum = odao.getMaxNum()+1;
			
			dto = new OrderListDTO();
			dto.setListNum(listNum);
			dto.setpNum(Integer.parseInt(req.getParameter("pNum")));
			dto.setpCount(Integer.parseInt(req.getParameter("pCount")));
			dto.setpOption(req.getParameter("pOption"));
			dto.setUserNum(userNum);
					
			odao.insertData(dto);
			if(category.equals("main")) {
				url = cp + "/meatShop/main.do";
				resp.sendRedirect(url);
				return;
			}else if(category.equals("desc")) {
				url = cp + "/meatShop/desc.do?pNum="+pNum;
				resp.sendRedirect(url);
				return;
			}
			url = cp + "/meatShop/list.do?category=" +category;
			resp.sendRedirect(url);
		
		}else if(uri.indexOf("buyWishList.do")!=-1) {	
			
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
			OrderListDTO dto = null;
			List<OrderListDTO> lists = odao.getLists(userNum);
			Iterator<OrderListDTO> it = lists.iterator();
			int pNum = Integer.parseInt(req.getParameter("pNum"));
			int pCount = Integer.parseInt(req.getParameter("pCount"));
			info.setWishCount(info.getWishCount()+pCount);
			session.setAttribute("customInfo", info);
			while (it.hasNext()) {
				dto = it.next();
				if(dto.getpNum()==pNum) {
					pCount += dto.getpCount();
					odao.updateData(pCount, pNum);
					
					url = cp + "/meatShop/wishList.do";
					resp.sendRedirect(url);
					return;
				}
			}
			
			dto = new OrderListDTO();
			
			int listNum = odao.getMaxNum()+1;
			
			dto.setListNum(listNum);
			dto.setpNum(pNum);
			dto.setpCount(pCount);
			dto.setpOption(req.getParameter("pOption"));
			dto.setUserNum(userNum);
			
			odao.insertData(dto);
			
			url = cp + "/meatShop/wishList.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("payment.do")!=-1) {	//결제
			
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
		
			AddressDTO dto = new AddressDTO();
			MeatShopDTO mdto = mdao.getReadDataN(userNum);
			
			int change = Integer.parseInt(req.getParameter("change"));
			int addrNum = Integer.parseInt(req.getParameter("addrNum"));
			dto = adao.getReadData(addrNum);
			
			List<AddressDTO> addrlists = adao.getLists(userNum);
			
			req.setAttribute("mdto", mdto);
			req.setAttribute("addrlists", addrlists);
			req.setAttribute("change", change);
			req.setAttribute("dto", dto);
			req.setAttribute("addrNum", addrNum);
			
			
			url = "/meat/payment.jsp";
			forward(req, resp, url);
		
			}else if(uri.indexOf("addAddr.do")!=-1) {	//주소추가
			
			AddressDTO dto = new AddressDTO();
			
			int addrNum = adao.getMaxNum()+1;
			
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
			
			dto.setAddrNum(addrNum);
			dto.setRecvName(req.getParameter("recvName"));
			dto.setRecvPhone(req.getParameter("recvPhone"));
			dto.setUserNum(userNum);
			dto.setZipcode(req.getParameter("zipcode"));
			dto.setRecvAddr1(req.getParameter("recvAddr1"));
			dto.setRecvAddr2(req.getParameter("recvAddr2"));
			
			adao.insertData(dto);
			
			url = cp + "/meatShop/payment.do?change=2&addrNum=0";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("deleteAddr.do")!=-1) {	// 주소 삭제
			
			int addrNum = Integer.parseInt(req.getParameter("addrNum"));
			
			adao.deleteData(addrNum);
			
			url = cp + "/meatShop/payment.do?change=2&addrNum=0";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("updateAddr.do")!=-1) {	// 주소 수정
			
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
			//String userName = info.getUserName();
			//String userPhone = info.getUserPhone();
			//String userMail = info.get이메일
			
			int addrNum = Integer.parseInt(req.getParameter("addrNum"));
			int selectAddr = Integer.parseInt(req.getParameter("selectAddr"));
			
			MeatShopDTO mdto = mdao.getReadDataN(userNum);
			AddressDTO dto = adao.getReadData(selectAddr);
			AddressDTO dto2 = adao.getReadData(addrNum);
			
			req.setAttribute("mdto", mdto);
			req.setAttribute("dto", dto);
			req.setAttribute("dto2", dto2);
			req.setAttribute("addrNum", addrNum);
			//req.setAttribute("addrNum", addrNum);
			
			url = "/meat/updateAddr.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("updateAddr_ok.do")!=-1) {	//수정정보 입력다하고
			
			AddressDTO dto = new AddressDTO();
			
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
			int addrNum = Integer.parseInt(req.getParameter("addrNum"));
			
			dto.setAddrNum(Integer.parseInt(req.getParameter("selectAddr")));
			dto.setRecvName(req.getParameter("recvName"));
			dto.setRecvPhone(req.getParameter("recvPhone"));
			dto.setUserNum(userNum);
			dto.setRecvAddr1(req.getParameter("recvAddr1"));
			dto.setRecvAddr2(req.getParameter("recvAddr2"));
			dto.setZipcode(req.getParameter("zipcode"));
			
			adao.updateData(dto);
			
			if(addrNum!=0) {
				url = cp + "/meatShop/payment.do?change=2&addrNum=" + addrNum;
				resp.sendRedirect(url);
			}else {

				url = cp + "/meatShop/payment.do?change=2&addrNum=0";
				resp.sendRedirect(url);
			}

		}else if(uri.indexOf("payment2.do")!=-1) {	//결제2
			
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
			
			int change = Integer.parseInt(req.getParameter("change"));
			int addrNum = Integer.parseInt(req.getParameter("addrNum"));
			
			req.setAttribute("change", change);
			req.setAttribute("addrNum", addrNum);
		
			url = "/meat/payment2.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("payment3.do")!=-1) {	//결제3
			
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
			
			ValidCouponDTO vdto = new ValidCouponDTO();
			
			int change = Integer.parseInt(req.getParameter("change"));
			int addrNum = Integer.parseInt(req.getParameter("addrNum"));
			int cNum = Integer.parseInt(req.getParameter("cNum"));
			int userPoint = Integer.parseInt(req.getParameter("userPoint"));
			String calendar = req.getParameter("calendar");
			
			List<ValidCouponDTO> vCoupon = vdao.getLists(userNum);
			
			vdto = vdao.getReadData(cNum);
			MeatShopDTO mdto = mdao.getReadDataN(userNum);
			
			List<OrderListDTO> lists = odao.getLists(userNum);
			
			int total = 0;
			Iterator<OrderListDTO> iter = lists.iterator();
			while(iter.hasNext()) {
				OrderListDTO dto = iter.next();
				total += dto.getpCount() * dto.getpPrice();
			}
			
			req.setAttribute("total", total);
			req.setAttribute("mdto", mdto);
			req.setAttribute("vdto", vdto);
			req.setAttribute("vCoupon", vCoupon);
			req.setAttribute("change", change);
			req.setAttribute("addrNum", addrNum);
			req.setAttribute("cNum", cNum);
			req.setAttribute("userPoint", userPoint);
			req.setAttribute("calendar", calendar);
			System.out.println(userPoint);
			url = "/meat/payment3.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("payment4.do")!=-1) {	//결제4
			
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();

			int change = Integer.parseInt(req.getParameter("change"));
			int addrNum = Integer.parseInt(req.getParameter("addrNum"));
			int cNum = Integer.parseInt(req.getParameter("cNum"));
			int userPoint = Integer.parseInt(req.getParameter("userPoint"));
			String calendar = req.getParameter("calendar");
			
			MeatShopDTO mdto = mdao.getReadDataN(userNum);
			List<OrderListDTO> lists = odao.getLists(userNum);
			ValidCouponDTO vdto = vdao.getReadData(cNum);
			
			//상품총합
			int total = 0;
			Iterator<OrderListDTO> iter = lists.iterator();
			while(iter.hasNext()) {
				OrderListDTO dto = iter.next();
				total += dto.getpCount() * dto.getpPrice();
			}
			String pTotalPrice = formatter.format(total)+"원"; //상품가격총합
			
			double discount=0;

			if(cNum!=0) {//쿠폰선택한 경우
				CouponDTO cdto = cdao.getReadData(vdto.getcName());
				int disrate = cdto.getDisrate();

				if(disrate==0) {//금액할인이면
					discount = cdto.getDisPrice();
				}else {
					discount = total*cdto.getDisrate()/100;
				}
				
			}
			//쿠폰 + 적립금한 할인금액
			discount += userPoint;
			
			String addPrice = formatter.format(total*0.1)+"원"; //무통장 추가금액
			String disPrice = formatter.format(discount)+"원";	//쿠폰/적립금
			
			//최종결제예정금액
			double finalPrice = total - discount;
			double accfinalPrice = ((total*1.1)-discount);
			
			String pFinalPrice = formatter.format(finalPrice)+"원";	//상품총합-쿠폰/적립금 결제가격
			String pAccFinalPrice = formatter.format(accfinalPrice)+"원"; //무통장시 최종 결제가격
			
			req.setAttribute("pAccFinalPrice", pAccFinalPrice);
			req.setAttribute("pFinalPrice", pFinalPrice);
			req.setAttribute("disPrice", disPrice);
			req.setAttribute("addPrice", addPrice);
			req.setAttribute("pTotalPrice", pTotalPrice);
			
			req.setAttribute("lists", lists);
			req.setAttribute("addrNum", addrNum);
			req.setAttribute("cNum", cNum);
			req.setAttribute("userPoint", userPoint);
			req.setAttribute("calendar", calendar);
			
			url = "/meat/payment4.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("payment5.do")!=-1) {	//결제완료...?
			
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c1 = Calendar.getInstance();
			String sysdate = sdf.format(c1.getTime());
			
			int addrNum = Integer.parseInt(req.getParameter("addrNum"));
			int cNum = Integer.parseInt(req.getParameter("cNum"));
			int userPoint = Integer.parseInt(req.getParameter("userPoint"));
			String finalPrice = req.getParameter("finalPrice");
			
			String deleteWon = finalPrice.replace("원", "");//원 떼버리기
			int realPrice = Integer.parseInt(deleteWon.replaceAll(",", ""));//콤마 떼버리기,,
			
			OrderInfoDTO oidto = new OrderInfoDTO(); 
			List<OrderListDTO> lists = odao.getLists(userNum); //장바구니목록 긁어옴
			
			MeatShopDTO mdto = mdao.getReadDataN(userNum);
			GradeDTO gdto = gdao.getReadData(mdto.getgName());//유저 등급
			
			int newUserPoint = mdto.getUserPoint()-userPoint; //사용한 포인트 차감
			newUserPoint = realPrice*gdto.getAddPRate()/100;
					
			int buyCount = mdao.getMaxBuyNum(userNum) + 1; //결제했으니 구매횟수 +1
			
			if(buyCount<3) {
				mdto.setgName("Bronze");
			}else if(buyCount<9) {
				mdto.setgName("Silver");
			}else {
				mdto.setgName("Gold");
			}

			int buyNum = oidao.getMaxNum2()+1;
			
			/*String sysdate2 = sdf2.format(c1.getTime());
			String userNum2 = Integer.toString(userNum);
			String totalCount = Integer.toString(mdao.getMaxBuyNum());
			String makeBuyNum = sysdate2+userNum2+totalCount;
			int buyNum = Integer.parseInt(makeBuyNum);*/
			
			Iterator<OrderListDTO> iter = lists.iterator();
			int count =0;
			while(iter.hasNext()) {
				OrderListDTO dto = iter.next();
				
				int orderNum = oidao.getMaxNum()+1;
				oidto.setOrderNum(orderNum);
				oidto.setpNum(dto.getpNum());
				oidto.setAddPoint(dto.getpCount()*dto.getpPrice()*gdto.getAddPRate()/100);
				oidto.setcNum(cNum);
				oidto.setBuyCount(dto.getpCount());
				oidto.setUserNum(userNum);
				oidto.setBuyDate(sysdate);
				oidto.setAddrNum(addrNum);
				oidto.setUserPoint(userPoint);
				oidto.setBuyNum(buyNum);
				
				oidao.insertData(oidto);
				
				count += dto.getpCount();
			}
			
			mdto.setUserPoint(newUserPoint);
			mdto.setTotalPoint(buyCount);
			mdto.setUserNum(userNum);
			
			mdao.updateData(mdto);
			
			vdao.deleteData(cNum);
			
			odao.deleteAllData(userNum);
			info.setWishCount(info.getWishCount()-count);
			session.setAttribute("customInfo", info);
			
			req.setAttribute("finalPrice", finalPrice); //최종가격
			req.setAttribute("lists", lists); //장바구니목록
			
			url = "/meat/payment5.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("wishDelete.do")!=-1) {	
			
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");	
			
			int listNum = Integer.parseInt(req.getParameter("listNum"));
			info.setWishCount(info.getWishCount()-odao.getCount(listNum));
			session.setAttribute("customInfo", info);
			
			odao.deleteData(listNum);
	
			
			url = cp + "/meatShop/wishList.do";
			resp.sendRedirect(url);
		}else if(uri.indexOf("plusCount.do")!=-1) {		
			
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");	
			int listNum = Integer.parseInt(req.getParameter("listNum"));
		
			if(odao.getFreeCheck(listNum).indexOf("무료")==-1) {
				odao.plusCount(listNum);
				info.setWishCount(info.getWishCount()+1);
				session.setAttribute("customInfo", info);
			}
			url = cp + "/meatShop/wishList.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("minusCount.do")!=-1) {
			
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			info.setWishCount(info.getWishCount()-1);
			session.setAttribute("customInfo", info);
			int listNum = Integer.parseInt(req.getParameter("listNum"));
			odao.minusCount(listNum);
			url = cp + "/meatShop/wishList.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("created.do")!=-1) {	
			
			url = "/meat/created.jsp";
			forward(req, resp, url);
		
		}else if(uri.indexOf("createdenter.do")!=-1) {	
			
			url = "/meat/createdenter.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("created_ok.do")!=-1) {	
			
			url = "/meat/created1.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("created_real.do")!=-1) {	
			//회원가입 정보 db에 입력
			MeatShopDTO dto = new MeatShopDTO();
			int maxNum = mdao.getMaxNum();
			
			
			dto.setUserNum(maxNum+1);
			dto.setUserId(req.getParameter("userId"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserPhone(req.getParameter("userPhone"));
			dto.setEmailCheck(req.getParameter("emailCheck"));
			mdao.insertData(dto);
			
			
			OrderListDTO odto = new OrderListDTO();
			odto.setListNum(odao.getMaxNum()+1);
			odto.setpCount(1);
			odto.setpOption("보통(16mm)");
			odto.setpNum(76);
			odto.setUserNum(dto.getUserNum());
			
			odao.insertData(odto);
			
			
			url = cp+"/meatShop/list.do";
			resp.sendRedirect(url);
		}else if(uri.indexOf("idCheck.do")!=-1) {	
				
			String userId = req.getParameter("userId");
			boolean result = mdao.duplicateIdCheck(userId);
			System.out.println(userId);
			System.out.println(mdao.duplicateIdCheck(userId));
			String message = null;
			
			if(result) {	
				
				message = "<script type=\"text/javascript\">";
			    message += "alert(\""+userId+"가 존재합니다.\")";
				message += "</script>";
				
			}else {	
				
				message = "<script type=\"text/javascript\">";
			    message += "alert(\""+userId +"가능합니다.\")";
				message += "</script>";
			}
			
			req.setAttribute("message", message);
			req.setAttribute("userId", userId);
			
			url = "/meat/created1.jsp";
			forward(req, resp, url);
			return;
			
	
		}else if(uri.indexOf("mailCheck.do")!=-1) {	
			
			Random random = new Random();
					
			int checkNum = 0;
			
			checkNum = random.nextInt(888888) + 111111;
			
			String host = "localhost";
			
			
			String senderName = "정육각";
			String senderEmail = "ok312@naver.com";
			String subject = "이메일 인증번호[정육각]";
			String content = "인증번호는 " + checkNum + "입니다. "
					+ "홈페이지에 입력 부탁드립니다." ;
						
			String receiverEmail = req.getParameter("emailCheck");
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			String userName = req.getParameter("userName");
			String userBirth = req.getParameter("userBirth");
			String userPhone = req.getParameter("userPhone");
			
			
			Properties props = System.getProperties();
			Session ssn = Session.getInstance(props,null);
			
			try {
				
				MimeMessage message = new MimeMessage(ssn);
				
				message.addRecipient(Message.RecipientType.TO, 
						new InternetAddress(receiverEmail));
				
				message.setFrom(new InternetAddress(senderEmail, senderName, "UTF-8"));
				
				message.setSubject(subject,"UTF-8");
				
				message.setContent(content, "text/plain;charset=UTF-8");
				
				Transport tp = ssn.getTransport("smtp");
				tp.connect(host, "", "");
				tp.sendMessage(message, message.getAllRecipients());
				tp.close();
				
				req.setAttribute("checkNum", checkNum);
				req.setAttribute("emailCheck", receiverEmail);
				req.setAttribute("userId", userId);
				req.setAttribute("userPwd", userPwd);
				req.setAttribute("userName", userName);
				req.setAttribute("userBirth", userBirth);
				req.setAttribute("userPhone", userPhone);
				
				url = "/meat/created1.jsp";
				forward(req, resp, url);
				
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
		}else if(uri.indexOf("login.do")!=-1) {	
			
			url = "/meat/login.jsp";
			forward(req, resp, url);
		
		}else if(uri.indexOf("login_ok.do")!=-1) {	
			
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			
			MeatShopDTO dto = mdao.getReadData(userId);
			
			 			
		    String message = "<script type=\"text/javascript\">";
		    message += "alert(\"아이디 또는 패스워드를 정확히 입력하세요\")";
			message += "</script>";
			
			if(dto==null || !dto.getUserPwd().equals(userPwd)) {	
				req.setAttribute("message", message);
				
				url = "/meat/login.jsp";
				forward(req, resp, url);
				return;
			}
			
			List<OrderListDTO> wishLists = odao.getLists(dto.getUserNum());
			Iterator<OrderListDTO> iterator = wishLists.iterator();
			int count = 0;
			while(iterator.hasNext()) {
				count += iterator.next().getpCount();			
			}
			
			
			session = req.getSession();
			session.setMaxInactiveInterval(60*60*24); // 초 단위 
			CustomInfo info = new CustomInfo();
			
			info.setUserId(dto.getUserId());
			info.setUserNum(dto.getUserNum());
			info.setUserName(dto.getUserName());
			info.setUserBirth(dto.getUserBirth());
			info.setUserPhone(dto.getUserPhone());
			info.setgName(dto.getgName());
			info.setUserPoint(dto.getUserPoint());
			info.setTotalPoint(dto.getTotalPoint());
			info.setWishCount(count);
			info.setCountBuy(mdao.getMaxBuyNum(dto.getUserNum()));
			
			
			session.setAttribute("customInfo", info);
			
			url = cp + "/meatShop/main.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("logout.do")!=-1) {	
			
			session = req.getSession();
			
			session.removeAttribute("customInfo"); // 세션 내용 제거
			session.invalidate(); // 세션변수자체 삭세
			
			url = cp + "/meatShop/list.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("searchpw.do")!=-1) {	
			
			url = "/meat/searchinfo.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("idSearch.do")!=-1) {	
			
			String userPhone = req.getParameter("userPhone");
			
			MeatShopDTO dto = mdao.getSearchData(userPhone);
			
			 String message = "<script type=\"text/javascript\">";
			    message += "alert(\"전화번호를 정확히 입력하세요\")";
				message += "</script>";
			
			if(dto==null || !dto.getUserPhone().equals(userPhone)) {	
				
				req.setAttribute("message", message);
				
				url = "/meat/searchinfo.jsp";
				forward(req, resp, url);
				return;
			}
			
			String host = "localhost";
			String userId = dto.getUserId();
			
			String senderName = "정육각";
			String senderEmail = "ok312@naver.com";
			String subject = "조회하신 아이디[정육각]";
			String content = "찾으시는 아이디는 " + userId + "입니다.";
					
						
			String receiverEmail = dto.getUserId();
			
			Properties props = System.getProperties();
			Session ssn = Session.getInstance(props,null);
			
			try {
				
				MimeMessage message1 = new MimeMessage(ssn);
				
				message1.addRecipient(Message.RecipientType.TO, 
						new InternetAddress(receiverEmail));
				
				message1.setFrom(new InternetAddress(senderEmail, senderName, "UTF-8"));
				
				message1.setSubject(subject,"UTF-8");
				
				message1.setContent(content, "text/plain;charset=UTF-8");
				
				Transport tp = ssn.getTransport("smtp");
				tp.connect(host, "", "");
				tp.sendMessage(message1, message1.getAllRecipients());
				tp.close();
				
								
				url = cp + "/meatShop/login.do";
				resp.sendRedirect(url);
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
		}else if(uri.indexOf("pwdSearch.do")!=-1) {	
			
			String userPhone = req.getParameter("userPhone");
			
			MeatShopDTO dto = mdao.getSearchData(userPhone);
			
			 String message = "<script type=\"text/javascript\">";
			    message += "alert(\"전화번호를 정확히 입력하세요\")";
				message += "</script>";
			
			if(dto==null || !dto.getUserPhone().equals(userPhone)) {	
				
				req.setAttribute("message", message);
				
				url = "/meat/searchinfo.jsp";
				forward(req, resp, url);
				return;
			}
			
			String host = "localhost";
			String userPwd = dto.getUserPwd();
			
			String senderName = "정육각";
			String senderEmail = "ok312@naver.com";
			String subject = "조회하신 비밀번호[정육각]";
			String content = "찾으시는 비밀번호는 " + userPwd + "입니다.";
					
						
			String receiverEmail = dto.getUserId();
			
			Properties props = System.getProperties();
			Session ssn = Session.getInstance(props,null);
			
			try {
				
				MimeMessage message2 = new MimeMessage(ssn);
				
				message2.addRecipient(Message.RecipientType.TO, 
						new InternetAddress(receiverEmail));
				
				message2.setFrom(new InternetAddress(senderEmail, senderName, "UTF-8"));
				
				message2.setSubject(subject,"UTF-8");
				
				message2.setContent(content, "text/plain;charset=UTF-8");
				
				Transport tp = ssn.getTransport("smtp");
				tp.connect(host, "", "");
				tp.sendMessage(message2, message2.getAllRecipients());
				tp.close();
				
								
				url = cp + "/meatShop/login.do";
				resp.sendRedirect(url);
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
		}else if(uri.indexOf("main.do")!=-1) {
			List<ProdDTO> bestLists = dao.getBestLists();
			req.setAttribute("bestLists", bestLists);
			req.setAttribute("descUrl", descUrl);
			req.setAttribute("imageUrl", imageUrl);
			url = "/meat/index.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("mypage.do")!=-1) {
			
			url = "/meat/mypage.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("term.do")!=-1) {				
			url = "/meat/tac.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("private.do")!=-1) {				
			url = "/meat/pv.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("brandStory.do")!=-1) {				
			url = "/meat/brandStory.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("guide.do")!=-1) {				
			url = "/meat/guide.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("event.do")!=-1) {				
			url = "/meat/event.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("firstgift.do")!=-1) {				
			url = "/meat/fg.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("notify.do")!=-1) {				
			url = "/meat/notify.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("support.do")!=-1) {				
			url = "/meat/support.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("mypage.do")!=-1) {				
			url = "/meat/mypage.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("mainAD1.do")!=-1) {				
			url = "/meat/main_1.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("mainAD2.do")!=-1) {				
			url = "/meat/main_2.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("mainAD3.do")!=-1) {				
			url = "/meat/main_3.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("mainAD4.do")!=-1) {				
			url = "/meat/main_4.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("freePork.do")!=-1) {
			
			
			int row = 4;
			
			if(req.getParameter("row")!=null)
				row = Integer.parseInt(req.getParameter("row"));

			int orderCheck=0;
			if(session.getAttribute("customInfo")!=null) {
				CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
				userNum = info.getUserNum();
				
				orderCheck = oidao.checkBuyFree(userNum, 76); //이미구매한경우2, 구매안한경우 0
	
				if(odao.orderCheck(userNum, 76)){ //장바구니에 있는경우 1 없는 경우 0
					orderCheck = 1;
				}	
				
			}
			List<ReviewDTO> lists = rdao.getLists(1);
			
			req.setAttribute("orderCheck", orderCheck);
			req.setAttribute("row", row);
			req.setAttribute("lists", lists);
			url = "/meat/freePork.jsp";
			forward(req, resp, url);			
		}else if(uri.indexOf("addFreePork.do")!=-1) {	
			
			OrderListDTO dto = null;
			if(session.getAttribute("customInfo")==null) {
				url = cp + "/meatShop/login.do";
				resp.sendRedirect(url);
				return;
			}
			CustomInfo info =(CustomInfo) session.getAttribute("customInfo");
			userNum = info.getUserNum();
	
			
			List<OrderListDTO> lists = odao.getLists(userNum);
			Iterator<OrderListDTO> it = lists.iterator();
			boolean check =true;
			while (it.hasNext()) {
				dto = it.next();
				if(dto.getpNum()==76) {
					check=false;
					break;
				}
			}
			if(check) {
				
				int listNum = odao.getMaxNum()+1;
				
				dto = new OrderListDTO();
				dto.setListNum(listNum);
				dto.setpNum(76);
				dto.setpCount(1);
				dto.setpOption("보통(16mm)");
				dto.setUserNum(userNum);
				odao.insertData(dto);
				info.setWishCount(info.getWishCount()+1);
			}
			boolean orderCheck = true;
			req.setAttribute("orderCheck", orderCheck);
			PrintWriter out = resp.getWriter();
			out.print("<script type='text/javascript'>");
			out.print("location.href = document.referrer;");
			out.print("</script>");
			
		}else if(uri.indexOf("freshPlan.do")!=-1) {	
			url = "/meat/fresh.jsp";
			forward(req, resp, url);

		}else if(uri.indexOf("aaa.do")!=-1) {	
			
			String userId = req.getParameter("userId");
			String userPhone = req.getParameter("userPhone");
			
			System.out.println("PostOk");
			
			System.out.println(userId);
			System.out.println(userPhone);
		
			
			MeatShopDTO dto = mdao.getSearchData(userId);
			// userId,userPwd,userName
			
			/*
			 String message = "<script type=\"text/javascript\">";
			    message += "alert(\"전화번호를 정확히 입력하세요\")";
				message += "</script>";
			*/
			
			String message = "전화번호를 정확히 입력하세요.";
			
				
			if(dto==null || !dto.getUserPhone().equals(userPhone)) {	
					
					req.setAttribute("message", message);
					
					url = "/meat/poppwsearch.jsp";
					forward(req, resp, url);
					return;
				}
			System.out.println(dto.getUserPhone());
			
			req.setAttribute("userId", userId);
			url = "/meat/updatepwd.jsp";
			forward(req, resp, url);
			
				
				
		}else if(uri.indexOf("insertPwd.do")!=-1) {	
			
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			
			System.out.println(userId);
			System.out.println(userPwd);
			
			mdao.updateData(userId, userPwd);
			
			String message = "window.close();";
			req.setAttribute("message", message);
			
			url = "/meat/updatepwd.jsp";
			forward(req, resp, url);
			//resp.sendRedirect(url);
			
		}else if(uri.indexOf("qnaList.do")!=-1) {	
			
			url = "/meat/11qna.jsp";
			forward(req, resp, url);
			
			
		}else if(uri.indexOf("qnaWrite_ok.do")!=-1) {	
			
		
			System.out.println("qnaWrite");
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			
			//파일업로드 - 그에 대한 정보는 mr에
			MultipartRequest mr = new MultipartRequest(req, path, maxSize,
					encType,new DefaultFileRenamePolicy());
			
		
			
			//DB에 정보 입력

			if(mr.getFile("upload")!=null) {	
				
				int maxNum = mdao.getMaxNumFile();
				
				MeatShopDTO dto = new MeatShopDTO();
				
				dto.setQnaNum(maxNum+1);
				dto.setQnaTitle(mr.getParameter("qnaTitle"));
				dto.setQnaContent(mr.getParameter("qnaContent"));			
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				dto.setOriginalFileName(mr.getOriginalFileName("upload"));
				
				mdao.insertDataFile(dto);
				System.out.println(mr.getParameter("qnaTitle"));
				String message = "window.close();";
				req.setAttribute("message", message);
				
				url = "/meat/11write.jsp";
				forward(req, resp, url);
				
				//url = cp + "/meatShop/qnaList1.do";
				//resp.sendRedirect(url);
			}
			if(mr.getOriginalFileName("upload")==null)	{	
				
				int maxNum = mdao.getMaxNumFile();
				
				MeatShopDTO dto = new MeatShopDTO();
				
				dto.setQnaNum(maxNum+1);
				dto.setQnaTitle(mr.getParameter("qnaTitle"));
				dto.setQnaContent(mr.getParameter("qnaContent"));	
				
				mdao.insertDataFile(dto);
				
				String message = "window.close();";
				req.setAttribute("message", message);
				
				url = "/meat/11write.jsp";
				forward(req, resp, url);
			}
			
		}else if(uri.indexOf("qnaList1.do")!=-1) {	
			
			System.out.println("test11");
			
		
			MyUtil myUtil = new MyUtil();
			
			String pageNum = "1";
			if(req.getParameter("pageNum")!=null)
				pageNum = req.getParameter("pageNum");
			
			int currentPage = 1;
			
			if(pageNum!=null) {	
				currentPage = Integer.parseInt(pageNum);
			}
			
			int dataCount = mdao.getDataCountFile();
			int numPerPage = 5;

			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage) {	
				currentPage = totalPage;
			}
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<MeatShopDTO> lists = mdao.getLists(start, end);
			
			String listUrl = cp + "/meatShop/qnaList1.do";
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("lists", lists);
			
			url = "/meat/11qna.jsp";
			forward(req, resp, url);
		
		}else if(uri.indexOf("qnaCotent.do")!=-1) {	
			
			System.out.println(req.getParameter("qnaNum"));
			int qnaNum = Integer.parseInt(req.getParameter("qnaNum"));
			String pageNum = req.getParameter("pageNum");
			
				
				
			//num을 받아서 내용 읽어오기
			MeatShopDTO dto = mdao.getReadData(qnaNum);
			String content = dto.getQnaContent().replaceAll("\r\n", "<br/>");
			
			req.setAttribute("content", content);
			req.setAttribute("qnaNum", qnaNum);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("dto", dto);
			url = "/meat/11content.jsp";
			forward(req, resp, url);
			
			
		}else if(uri.indexOf("download.do")!=-1) {
			
			int qnaNum = Integer.parseInt(req.getParameter("qnaNum"));
			
			MeatShopDTO dto = mdao.getReadData(qnaNum);
			
			boolean flag = FileManager.doFileDownload(resp,
					dto.getSaveFileName(), dto.getOriginalFileName(), path);
			
			if(flag==false) {	
				
				resp.setContentType("text/html;charset=UTF-8");
				PrintWriter out  = resp.getWriter();
				
				out.print("<script type='text/javascript'>");
				out.print("alert('Download Error');");
				out.print("history.back();");
				out.print("</script>");
			}
			
		}else if(uri.indexOf("supportQ.do")!=-1) {				
			url = "/meat/supportQ.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("bbb.do")!=-1) {	
			
			url = cp + "/meatShop/qnaList1.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("notice.do")!=-1) {				
			url = "/meat/notice.jsp";
			forward(req, resp, url);			
		}


	}

}
