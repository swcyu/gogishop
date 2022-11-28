<%@page import="com.meatShop.CustomInfo"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	int col = 1;
	String prodName = "";
	boolean check = (session.getAttribute("customInfo")==null);
	CustomInfo info =(CustomInfo) session.getAttribute("customInfo");	
	
	String target = request.getParameter("target");
	
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고기샵 :: 언제나 초신선</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/meat/data/meat.css"/>
<link rel=icon type=image/x-icon href=https://yookgak.com/website/favicon.ico>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>


<script type="text/javascript">

function fgOff(){	
	$("#firstgift").hide();	
}	

function loginCheck(){
	
	if(<%=check%>){
		document.myForm.action = "<%=cp%>/meatShop/login.do";
		document.myForm.submit();
		return;
	}
	document.myForm.action = "<%=cp%>/meatShop/wishList.do";
	document.myForm.submit();
	
	
}
function cart(){		
	
	if(<%=check%>){
		document.myForm.action = "<%=cp%>/meatShop/login.do";
		document.myForm.submit();
		return;
	}
	document.myForm.action = "<%=cp%>/meatShop/wishList.do";
	document.myForm.submit();		
	
}           

function myP(){
	
	if(<%=check%>){
		document.myForm.action = "<%=cp%>/meatShop/login.do";
		document.myForm.submit();
		return;
	}
	document.myForm.action = "<%=cp%>/meatShop/mypage.do";
	document.myForm.submit();				
	
}

function oneoneQ(){
	
	if(<%=check%>){
		document.myForm.action = "<%=cp%>/meatShop/login.do";
		document.myForm.submit();
		return;
	}
	document.myForm.action = "<%=cp%>/meatShop/qnaList1.do";
	document.myForm.submit();	
}
</script>

<style type="text/css">

* {
	margin: 0px;
	padding: 0px;
	font-family: 맑은 고딕;
	
}


body {
-ms-overflow-style: none; /* IE and Edge */
scrollbar-width: none; /* Firefox */
}
body::-webkit-scrollbar {display: none !important; } 
.new2{
	position:absolute;
	right:10px;
	top:15px ;
	padding:0px;
	background-color:#ff0000;  
	height: 13px; width: 25px; 
	border-radius: 5px;
	box-shadow: 0px 0px 2px #aaa;
}

.visable{
	visibility: visible;
}
.unvisable{
	display: none;
}




.hidden { 
overflow-y :hidden !important;
height: 100%; min-height: 100%;

}
input:focus {outline:none;}

a {
	cursor: hand;
	color: #000000;
	text-decoration: none;
	font-size: 13pt;
	line-height: 150%;
}

span{
	color: #000000;
	font-size: 12pt;
	line-height: 150%;
}




</style>
</head>


<body>

<form action="" name="myForm" method="post">
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel" style="z-index: 6000;">

<div id="rightMenu"   
		style="background-color: white; right:0;width: 480px; height: 100%; 
		position: fixed; z-index: 5500; border-left: 1px solid #eeeeee;" >
		
	  <table style="font-family: '맑은 고딕'"> 
	  	<tr style="height: 80px">
	  		<td style="width: 360px; font-size: 18pt;font-weight: bold; padding-left: 25px;">
	  		메뉴</td>
	  		<td style="width: 60px; padding-right: 24px; position: relative;">
	  			<img style="cursor: pointer;" src="<%=cp%>/meat/image/s_cart.jpg" 
	  			onclick="cart()">
	  			
	  		<c:choose> 
	  			<c:when test="${not empty sessionScope.customInfo.userId }">
	  				<%if(info.getWishCount()>0) {%>
	  					<div style="position:absolute;right:20px; top:15px; height: 24px; width: 24px; background: red; color: white; 
	  					border-radius: 50%; text-align: center;font-size: 10pt; padding-top: 1px">
	  					<%=info.getWishCount() %>	  					
	  					</div>
	  					<%} %>
	  			</c:when>
	  		</c:choose>
	  			
	  			
	  			
	  		</td>
	  		<td style="width: 60px; padding-right: 24px;">
	  			<img style="cursor: pointer;width: 20px;height: 20px; color: black;" src="<%=cp%>/meat/image/s_x.jpg"  
	  			class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close">  			
	  		</td>
	  	</tr>
	  	<tr style="height: 50px">
	  		<td style="font-size: 14pt; padding-left: 25px;">쇼핑하기</td>
	  	</tr>
	  	<tr style="margin-top: 0; margin-bottom: 30px"><td colspan="3">
	  	<ul class="usm">
	  	
	  		<li><a class="sm" href="<%=cp%>/meatShop/list.do?category=pork">
	  		<img style="cursor: pointer; padding: 0;" 
	  		src="<%=cp%>/meat/image/smi/s_pig.jpg"
	  		onmouseover="this.src='<%=cp%>/meat/image/smi/sh_pig.jpg'"
	  		onmouseout="this.src='<%=cp%>/meat/image/smi/s_pig.jpg'">		
	  		</a></li>
	  		<li><a class="sm" href="<%=cp%>/meatShop/list.do?category=beef">
	  		<img style="cursor: pointer; padding: 0;" 
	  		src="<%=cp%>/meat/image/smi/s_cow.jpg"
	  		onmouseover="this.src='<%=cp%>/meat/image/smi/sh_cow.jpg'"
	  		onmouseout="this.src='<%=cp%>/meat/image/smi/s_cow.jpg'">		
	  		</a></li>
	  		<li><a class="sm" href="<%=cp%>/meatShop/list.do?category=chicken">
	  		<img style="cursor: pointer; padding: 0;" 
	  		src="<%=cp%>/meat/image/smi/s_ck.jpg"
	  		onmouseover="this.src='<%=cp%>/meat/image/smi/sh_ck.jpg'"
	  		onmouseout="this.src='<%=cp%>/meat/image/smi/s_ck.jpg'">		
	  		</a></li>
	  		<li style="position:relative;"><a class="sm" href="<%=cp%>/meatShop/list.do?category=seafood">
	  		<img style="cursor: pointer; padding: 0;" 
	  		src="<%=cp%>/meat/image/smi/s_susan.jpg"
	  		onmouseover="this.src='<%=cp%>/meat/image/smi/sh_susan.jpg'"
	  		onmouseout="this.src='<%=cp%>/meat/image/smi/s_susan.jpg'">		
	  		<div class="new2"><table style="position: relative; top : -6px;"><tr><td style="border-radius: 5px;	font-size: 8px;	color: #ffffff;"
	  		 align="center">NEW</td></tr></table></div>
	  		</a></li>
	  		<li><a class="sm" href="<%=cp%>/meatShop/list.do?category=mealkit">
	  		<img style="cursor: pointer; padding: 0;" 
	  		src="<%=cp%>/meat/image/smi/s_mk.jpg"
	  		onmouseover="this.src='<%=cp%>/meat/image/smi/sh_mk.jpg'"
	  		onmouseout="this.src='<%=cp%>/meat/image/smi/s_mk.jpg'">		
	  		</a></li>
	  		<li><a class="sm" href="<%=cp%>/meatShop/list.do?category=milk">
	  		<img style="cursor: pointer; padding: 0;" 
	  		src="<%=cp%>/meat/image/smi/s_milk.jpg"
	  		onmouseover="this.src='<%=cp%>/meat/image/smi/sh_milk.jpg'"
	  		onmouseout="this.src='<%=cp%>/meat/image/smi/s_milk.jpg'">		
	  		</a></li>
	  		<li><a class="sm" href="<%=cp%>/meatShop/list.do?category=egg">
	  		<img style="cursor: pointer; padding: 0;" 
	  		src="<%=cp%>/meat/image/smi/s_egg.jpg"
	  		onmouseover="this.src='<%=cp%>/meat/image/smi/sh_egg.jpg'"
	  		onmouseout="this.src='<%=cp%>/meat/image/smi/s_egg.jpg'">		
	  		</a></li>
	  		<li><a class="sm" href="<%=cp%>/meatShop/list.do?category=baby">
	  		<img style="cursor: pointer; padding: 0;" 
	  		src="<%=cp%>/meat/image/smi/s_eu.jpg"
	  		onmouseover="this.src='<%=cp%>/meat/image/smi/sh_eu.jpg'"
	  		onmouseout="this.src='<%=cp%>/meat/image/smi/s_eu.jpg'">		
	  		</a></li>  		
	  	</ul>
	  	</td>
	  	</tr>  	
	  	
	  	<tr><td colspan="3" bgcolor="#e0e0e0" align="center" style="height: 1px; margin-top: 25px"></td></tr>
	  	
	  	
	  	<tr><td style="padding-top: 35px; padding-left: 25px; height: 70px;">  	
	  	<a style="font-size:14pt; font-weight: bold; text-decoration: none;" 
	  	href="<%=cp%>/meatShop/brandStory.do">
	  	<font color="black">브랜드스토리</font></a></td></tr>
	  	<tr><td style="height: 50px; padding-left: 25px;">
	  	<a style="font-size:14pt; font-weight: bold; text-decoration: none;" 
	  	href="<%=cp%>/meatShop/notify.do">
	  	<font color="black">공지사항</font></a></td></tr>
	  	<tr><td style="height: 50px; padding-left: 25px;">
	  	<a style="font-size:14pt; font-weight: bold; text-decoration: none;"
	  	 href="<%=cp%>/meatShop/support.do">
	  	<font color="black">고객센터</font></a></td></tr>
	  	<tr><td style="padding-top: 25px; padding-left: 25px; height: 50px;">
	  	<a style="font-size:14pt; font-weight: bold; text-decoration: none; cursor: pointer;" onclick="myP()">
	  	마이페이지</a></td></tr>
	  </table>
	</div>
</div>
<!-- 사이드메뉴 -->
<c:choose> 
	<c:when test="${empty sessionScope.customInfo.userId }">
							
			
<div id="firstgift" align="center">
	<table align="center" style="width: 1200px; cursor: pointer; background-color: #ffc0b4" 
	cellpadding="0" cellspacing="0">
	<tr style="height: 60px;" >
		<td style="width: 120px" onclick="location.href='<%=cp%>/meatShop/firstgift.do';">
			<font style="font-size: 10pt; color: #85483d;"><b>고기샵 첫구매 선물</b></font>
		</td>
		<td style="width: 960px" onclick="location.href='<%=cp%>/meatShop/firstgift.do';">
			<img src="<%=cp%>/meat/image/firstgift.jpg">
		</td>
		<td style="width: 60px" onclick="location.href='<%=cp%>/meatShop/firstgift.do';"></td>
		<td style="width: 60px" onclick="fgOff()">
			<img src="<%=cp%>/meat/image/firstgiftclose.jpg">
		</td>	
	</tr>
	</table>
</div>
</c:when>
</c:choose>	




<div id="menu" align="center" style="z-index: 5000;">
	<table align="center" style="width: 1200px; background-color: #000000;"
	cellpadding="0" cellspacing="0">
	<tr style="height: 95px;">
		<td style="width: 120px">
			<img src="<%=cp%>/meat/image/gogishoplogo.jpg" style="cursor: pointer;"
			onclick="location.href='<%=cp%>/meatShop/main.do';">
		</td>
		<td style="width: 20px"></td>
		<td>
		<ul>
			<li><a class="m1" href="<%=cp%>/meatShop/list.do">쇼핑하기</a></li>	
			<li><a class="m1" href="<%=cp%>/meatShop/guide.do">이용가이드</a></li>
			<li><a class="m1" href="<%=cp%>/meatShop/event.do">이벤트</a></li>
		</ul>		
		</td>
		<td>		
		<ul style="float: right; padding-top:15px;">
			<li><a class="m2" href="<%=cp%>/meatShop/notify.do">공지사항</a></li>
			<li style="border-right: 1px solid white; padding-right: 20px">
			<a class="m2" href="<%=cp%>/meatShop/support.do">고객센터</a></li>
			
			
			<c:choose> 
			<c:when test="${empty sessionScope.customInfo.userId }">
				<li style="padding-left: 5px;">
				<a class="m2" href="<%=cp%>/meatShop/login.do"">로그인</a></li>
				<li><a class="m2" href="<%=cp%>/meatShop/createdenter.do">회원가입</a></li>				
			</c:when>
			<c:otherwise>
				<li style="padding-left: 5px">
				<a class="m2" onclick="myP()" style="cursor: pointer;">마이페이지</a></li>				
			</c:otherwise>
			</c:choose>	
			
		</ul>
		</td>
		<td style="width: 30px; padding-left: 30px; position: relative;">

		<img src="<%=cp%>/meat/image/cart.jpg" style="cursor: pointer;"
			onclick="cart()">
			
			<c:choose> 
	  			<c:when test="${not empty sessionScope.customInfo.userId }">
	  				<%if(info.getWishCount()>0) {%>
	  					<div style="position:absolute;right:-10px; top:20px; height: 24px; width: 24px; background: red; color: white; 
	  					border-radius: 50%; text-align: center;font-size: 10pt; padding-top: 1px">
	  					<%=info.getWishCount() %>	  					
	  					</div>
	  					<%} %>
	  			</c:when>
	  		</c:choose>
			
			
			
			
		</td>
		<td style="width: 30px; padding-left: 20px;">	
		<img src="<%=cp%>/meat/image/menu.jpg" style="cursor: pointer;"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">			
		</td>
	</tr>
	</table>
</div>
<!-- 시작 -->


<div style="height: 100px"></div>

<%if(target.equals("1")) {%>
<div align="center">
	<table align="center" style="width: 980px">
	<tr style="height: 60px; border-bottom: 2px solid #000000;">
	<td style="width: 880px;">
	<h5><b>회원등급안내</b></h5>
	</td>
	<td style="width: 100px;">
	<table style="height: 35px; width: 100px; background-color: black; cursor: pointer;"
	onclick="location.href='<%=cp%>/meatShop/notify.do'">
	<tr><td style="color: white; text-align: center; font-size: 9pt">목록보기</td></tr></table>
	<tr style="height: 45px"><td></td></tr>
	<tr style="height: 25px"><td colspan="2" style="color: #9da7c5">[2020-01-19]</td></tr>
	<tr style="height: 30px"><td></td></tr>
	<tr><td colspan="2" style="color: #9da7c5">
	<!-- 내용부분 -->
	<img style="width: 980px" src="https://firebasestorage.googleapis.com/v0/b/jyg-custom.appspot.com/o/p%2Fm%2F1575020286694_%EC%A0%95%EC%9C%A1%EA%B0%81_%ED%9A%8C%EC%9B%90%EB%93%B1%EA%B8%89_%ED%98%9C%ED%83%9D%EC%95%88%EB%82%B4_MOB.png?alt=media&token=a4305ba2-70fc-4c44-bb1c-8ac492981def">
	</td></tr>	
	</table>
	<div align="center" style="border-bottom: 2px solid black; width: 980px; height: 110px;"></div>
</div>
<%} %>

<%if(target.equals("2")) {%>
<div align="center">
	<table align="center" style="width: 980px">
	<tr style="height: 60px; border-bottom: 2px solid #000000;">
	<td style="width: 880px;">
	<h5><b>회원등급안내</b></h5>
	</td>
	<td style="width: 100px;">
	<table style="height: 35px; width: 100px; background-color: black; cursor: pointer;"
	onclick="location.href='<%=cp%>/meatShop/notify.do'">
	<tr><td style="color: white; text-align: center; font-size: 9pt">목록보기</td></tr></table>
	<tr style="height: 45px"><td></td></tr>
	<tr style="height: 25px"><td colspan="2" style="color: #9da7c5">[2020-01-20]</td></tr>
	<tr style="height: 30px"><td></td></tr>
	<tr><td colspan="2" style="color: #9da7c5">
	<!-- 내용부분 -->
	<img style="width: 980px" src="https://firebasestorage.googleapis.com/v0/b/jyg-custom.appspot.com/o/p%2Fm%2F1564376508343_pc__%EB%90%A3%EB%80%BD_%EB%A4%B3%EB%80%BF_%E3%83%A1%EA%BC%B9_%E2%92%B0%EA%BC%B3_%E2%96%A0%EB%85%85.png?alt=media&token=7482e7b9-f97d-4453-8a76-f898d7cc5583">
	</td></tr>	
	</table>
	<div align="center" style="border-bottom: 2px solid black; width: 980px; height: 110px;"></div>
</div>
<%} %>

<%if(target.equals("3")) {%>
<div align="center">
	<table align="center" style="width: 980px">
	<tr style="height: 60px; border-bottom: 2px solid #000000;">
	<td style="width: 880px;">
	<h5><b>회원등급안내</b></h5>
	</td>
	<td style="width: 100px;">
	<table style="height: 35px; width: 100px; background-color: black; cursor: pointer;"
	onclick="location.href='<%=cp%>/meatShop/notify.do'">
	<tr><td style="color: white; text-align: center; font-size: 9pt">목록보기</td></tr></table>
	<tr style="height: 45px"><td></td></tr>
	<tr style="height: 25px"><td colspan="2" style="color: #9da7c5">[2020-02-17]</td></tr>
	<tr style="height: 30px"><td></td></tr>
	<tr><td colspan="2" style="color: #9b9b9b">
	<!-- 내용부분 -->
	안녕하세요, 고기샵입니다!<br><br>
	한우 일부 상품의 주문 폭주로 준비한 숙성 물량이 모두 판매되었습니다.<br>
	이용에 혼란을 드리지 않기 위해 빨리 받아보시기 힘든 상품의 경우 수령 가능한 날짜를 상품에 표기하였으니 참고 바라며, 빠르게 전해드리지 못하는 점 사과드립니다.<br>
	성원에 감사드리며, 항상 좋은 상품과 서비스로 보답하겠습니다.<br><br>감사합니다!<br>
	</td></tr>	
	</table>
	<div align="center" style="border-bottom: 2px solid black; width: 980px; height: 110px;"></div>
</div>
<%} %>

<%if(target.equals("4")) {%>
<div align="center">
	<table align="center" style="width: 980px">
	<tr style="height: 60px; border-bottom: 2px solid #000000;">
	<td style="width: 880px;">
	<h5><b>회원등급안내</b></h5>
	</td>
	<td style="width: 100px;">
	<table style="height: 35px; width: 100px; background-color: black; cursor: pointer;"
	onclick="location.href='<%=cp%>/meatShop/notify.do'">
	<tr><td style="color: white; text-align: center; font-size: 9pt">목록보기</td></tr></table>
	<tr style="height: 45px"><td></td></tr>
	<tr style="height: 25px"><td colspan="2" style="color: #9da7c5">[2020-04-29]</td></tr>
	<tr style="height: 30px"><td></td></tr>
	<tr><td colspan="2" style="color: #9b9b9b">
	<!-- 내용부분 -->
	안녕하세요, 고기샵입니다!<br><br>
	4/30(목), 5/1(금), 5/5(화) 휴일로 인해 배송 형태에 따라 5월 첫째 주 배송 일정이 제한됩니다.<br>
	또한, 돼지 도축장 휴업으로 5/4(월)-5/6(수) 까지는 돼지고기 상품 수령이 불가하니 이용에 참고 부탁드립니다.<br><br>
	[상세 일정 안내]<br>
	4/30(목)-5/1(금) : 초신선, 당일, 새벽배송 가능<br>
	5/2(토) : 정상 운영<br>
	5/4(월) : 정상 운영<br>
	5/5(화) : 새벽 배송만 가능<br>
	5/6(수): 초신선, 당일배송 가능<br>
	5/7(목): 정상 운영<br><br>
	더 좋은 상품과 서비스를 제공하기 위해 언제나 노력하는 정육각이 되겠습니다.<br><br><br>
	그럼 즐거운 연휴 보내세요!<br>
	감사합니다.
	</td></tr>	
	</table>
	<div align="center" style="border-bottom: 2px solid black; width: 980px; height: 110px;"></div>
</div>
<%} %>

<%if(target.equals("5")) {%>
<div align="center">
	<table align="center" style="width: 980px">
	<tr style="height: 60px; border-bottom: 2px solid #000000;">
	<td style="width: 880px;">
	<h5><b>회원등급안내</b></h5>
	</td>
	<td style="width: 100px;">
	<table style="height: 35px; width: 100px; background-color: black; cursor: pointer;"
	onclick="location.href='<%=cp%>/meatShop/notify.do'">
	<tr><td style="color: white; text-align: center; font-size: 9pt">목록보기</td></tr></table>
	<tr style="height: 45px"><td></td></tr>
	<tr style="height: 25px"><td colspan="2" style="color: #9da7c5">[2020-08-12]</td></tr>
	<tr style="height: 30px"><td></td></tr>
	<tr><td colspan="2" style="color: #9b9b9b">
	<!-- 내용부분 -->
	안녕하세요, 고기샵입니다!<br><br>
	8/14(금) 택배의 날, 8/15(토) 광복절, 8/17(월) 광복절 대체휴일로 배송 형태에 따라 수령 일정에 제한이 있습니다.<br><br><br>
	[상세 일정 안내]<br><br>
	당일/새벽 배송: 정상 운영<br>우
	체국 배송: 8/14(금), 8/15(토), 8/18(화) 수령 불가능<br><br><br>
	더 좋은 상품과 서비스를 제공하기 위해 언제나 노력하는 정육각이 되겠습니다.<br><br>
	그럼 즐거운 연휴 보내세요!<br>감사합니다.
	</td></tr>	
	</table>
	<div align="center" style="border-bottom: 2px solid black; width: 980px; height: 110px;"></div>
</div>
<%} %>

<%if(target.equals("6")) {%>
<div align="center">
	<table align="center" style="width: 980px">
	<tr style="height: 60px; border-bottom: 2px solid #000000;">
	<td style="width: 880px;">
	<h5><b>회원등급안내</b></h5>
	</td>
	<td style="width: 100px;">
	<table style="height: 35px; width: 100px; background-color: black; cursor: pointer;"
	onclick="location.href='<%=cp%>/meatShop/notify.do'">
	<tr><td style="color: white; text-align: center; font-size: 9pt">목록보기</td></tr></table>
	<tr style="height: 45px"><td></td></tr>
	<tr style="height: 25px"><td colspan="2" style="color: #9da7c5">[2020-08-12]</td></tr>
	<tr style="height: 30px"><td></td></tr>
	<tr><td colspan="2" style="color: #9b9b9b">
	<!-- 내용부분 -->
	<img style="width: 980px" src="https://firebasestorage.googleapis.com/v0/b/jyg-custom-app/o/app%2Fnotices%2F%E1%84%8B%E1%85%A2%E1%86%B8%20%E1%84%85%E1%85%A5%E1%86%AB%E1%84%8E%E1%85%B5%E1%86%BC2_mob.png?alt=media&token=d6467fba-705b-4819-ba82-3dec7a972aa2">
	</td></tr>	
	</table>
	<div align="center" style="border-bottom: 2px solid black; width: 980px; height: 110px;"></div>
</div>
<%} %>

<%if(target.equals("7")) {%>
<div align="center">
	<table align="center" style="width: 980px">
	<tr style="height: 60px; border-bottom: 2px solid #000000;">
	<td style="width: 880px;">
	<h5><b>회원등급안내</b></h5>
	</td>
	<td style="width: 100px;">
	<table style="height: 35px; width: 100px; background-color: black; cursor: pointer;"
	onclick="location.href='<%=cp%>/meatShop/notify.do'">
	<tr><td style="color: white; text-align: center; font-size: 9pt">목록보기</td></tr></table>
	<tr style="height: 45px"><td></td></tr>
	<tr style="height: 25px"><td colspan="2" style="color: #9da7c5">[2020-08-25]</td></tr>
	<tr style="height: 30px"><td></td></tr>
	<tr><td colspan="2" style="color: #9b9b9b">
	<!-- 내용부분 -->
	안녕하세요, 고기샵입니다!<br>
	현재 코로나 19확산으로 인해 일부 배송 불가한 지역이 생기거나, 배송 시간이 지연되는 등 대응의 어려움이 발생하고 있습니다.<br><br>
	이용에 불편함을 드린 점 사과드리며, 빠른 시간 내 정상화될 수 있도록 최선을 다하겠습니다!
	</td></tr>	
	</table>
	<div align="center" style="border-bottom: 2px solid black; width: 980px; height: 110px;"></div>
</div>
<%} %>

<%if(target.equals("8")) {%>
<div align="center">
	<table align="center" style="width: 980px">
	<tr style="height: 60px; border-bottom: 2px solid #000000;">
	<td style="width: 880px;">
	<h5><b>회원등급안내</b></h5>
	</td>
	<td style="width: 100px;">
	<table style="height: 35px; width: 100px; background-color: black; cursor: pointer;"
	onclick="location.href='<%=cp%>/meatShop/notify.do'">
	<tr><td style="color: white; text-align: center; font-size: 9pt">목록보기</td></tr></table>
	<tr style="height: 45px"><td></td></tr>
	<tr style="height: 25px"><td colspan="2" style="color: #9da7c5">[2020-04-26]</td></tr>
	<tr style="height: 30px"><td></td></tr>
	<tr><td colspan="2" style="color: #9b9b9b">
	<!-- 내용부분 -->
	안녕하세요, 고기샵입니다.<br><br>
	정육각 생산센터 1개소에서 코로나19 확진자가 발생하여<br>안내 말씀드립니다.<br><br>
	4/24(토) 해당 생산센터 근무자 1명의 가족이 코로나19 확진 판정을 받았으며<br>
	해당 직원과 밀접 접촉한 직원 6명에 대해 검사를 실시한 결과, 4/26(월)에 총 4명이 확진 판정을 받았습니다.<br><br>
	정육각 생산센터는 HACCP 인증을 받은 시설이며<br>확진 판정을 받은 직원 모두 근무 시 방역당국의 지침을 따라<br>
	상시 마스크, 위생복 및 장갑 등을 착용하였음을 안내드립니다.<br><br>
	고기샵은 코로나19 추가 확산 방지를 위하여<br>
	4/26(월)~4/27(화) 양일간 해당 생산센터 폐쇄 및 철저한 방역조치 실시를 결정하였고<br>
	근무자에 대한 전수 검사, 그외 밀접 접촉자에 대한 선제적 확인 및 검사를 진행 중에 있습니다.<br>
	검사 결과는 확인되는 대로 신속히 업데이트 드리겠습니다.<br><br>
	정육각은 현재 분리 운영 중인 2개의 센터에서 생산을 하고 있으며<br>
	영향을 받지 않은 센터 1개소에서는 생산이 정상적으로 이루어질 예정입니다.<br><br>
	관련하여 배송방식별 주문 가능 일정 안내드리오니,<br>이용에 참고 부탁드립니다.<br><br>
	[대상 수령일] 4/27(화) ~ 5/1(토)<br>- 당일배송·새벽배송 : 정상 주문 가능<br>- 우체국배송 : 주문 불가 (※ 추가 검사 결과에 따라 변동 가능)
	<br><br>해당 건으로 불편을 겪으신 고객 여러분께 진심으로 사과드리며,<br>코로나19 확산을 방지하고 안전하고 신선한 상품을 제공하기 위해<br>
	관련 진행 상황에 대해서는 지속적으로 투명하게 업데이트 드리겠습니다.<br><br>감사합니다.<br>고기샵 드림

	
	
	</td></tr>	
	</table>
	<div align="center" style="border-bottom: 2px solid black; width: 980px; height: 110px;"></div>
</div>
<%} %>

<div style="height: 350px;"></div>

<!-- 마지막 이용약관부분 -->
<div style="margin: 0 auto; width: 100%; height: 62px; border-top: 1px solid #bdbdbd;" align="center">
<table align="center" style="width: 1200px;" cellpadding="0" cellspacing="0">
<tr style="height: 62px;"><td style="width: 970px;">
<a href="<%=cp%>/meatShop/term.do" style="text-decoration: none; font-size: 10pt; padding-right: 20px">
이용약관</a>
<a href="<%=cp%>/meatShop/private.do" style="text-decoration: none; font-size: 10pt; font-weight: bold;">
개인정보처리방침</a>
</td>
<td style="width: 140px; padding-right: 12px;">
<img src="<%=cp%>/meat/image/AppInImg.jpg" style="cursor: pointer;"
			onclick="window.open('https://play.google.com/store/apps/details?id=com.jeongyookgak.jyg_order8')">
</td>
<td style="width: 45px; text-align: right;">
<img src="<%=cp%>/meat/image/kaCh.jpg" style="cursor: pointer;"
			onclick="window.open('https://pf.kakao.com/_sKxgkM')">
</td>
<td style="width: 45px; text-align: right;">
<img src="<%=cp%>/meat/image/ins.jpg" style="cursor: pointer;"
			onclick="window.open('https://www.instagram.com/jeongyookgak/')">
</td>
</tr>
</table>
</div>
<div style="margin: 0 auto; width: 100%; height: 205px; border-top: 1px solid #eeeeee;" align="center"> 
<table align="center" style="width: 1200px; height: 205px;" cellpadding="0" cellspacing="0">
<tr>
<td style="width: 600px;">
<table style="width: 600px; height: 205px; font-size: 9pt" cellpadding="0" cellspacing="0">
<tr style="height: 70px;">
<td style="padding-top: 10px"><img src="<%=cp%>/meat/image/gogishopwhitelogo.jpg"></td>
</tr>
<tr style="height: 25px;">
<td>(주)고기샵 대표이사: 마진영 | 주소: 서울특별시 강남구 테헤란로 124( 역삼동,삼원타워 ) 4층</td>
</tr>
<tr style="height: 25px;">
<td>
사업자등록번호:224-87-00271 
<a href="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=2248700271&apv_perm_no=" 
target="_blabk" style="text-decoration: none;">
<font style="color: #5cb8ce">[조회]</font></a>
 | 통신판매업신고번호:2021-경기김포-0668</td>
</tr><tr style="height: 25px;">
<td>개인정보관리책임자: 오현성(sean312103@gamil.com)</td>
</tr>
<tr style="height: 60px;">
<td style="padding-top: 5px;">© 2021 meatShop Inc. All rights reserved.</td>
</tr>
</table>
</td><td style="width: 600px; text-align: right;">
<table style="width: 600px; height: 205px;" cellpadding="0" cellspacing="0">
<tr style="height: 25px"><td style="padding-top:5px; font-weight: 900; font-size: 10pt; position: relative; bottom: -5px;">고객센터</td></tr>
<tr style="height: 25px"><td style="font-weight: 500; font-size: 18pt; position: relative; bottom: 5px;">1800-0658</td></tr>
<tr style="height: 15px">
<td style="font-size: 8pt; position: relative; bottom: 10px;"><font style="color: #757575; size: 6pt">
평일: 08:30 ~ 17:30
</font></td>
</tr>
<tr style="height: 15px">
<td style="font-size: 8pt; position: relative; bottom: 10px;"><font style="color: #757575;">
점심: 12:30 ~ 13:30
</font></td>
</tr>
<tr style="height: 15px">
<td style="font-size: 9pt; position: relative; bottom: 10px;"><font style="color: #757575;">
(토,일 및 공휴일 휴무)
</font></td>
</tr>
<tr style="height: 20px">
<td style="font-size: 9pt;">카카오톡: 
<a href="https://accounts.kakao.com/login?continue=http%3A%2F%2Fpf.kakao.com%2F_sKxgkM%2Fchat" 
target="_blabk" style="text-decoration: none;">
<font style="color: #5cb8ce">@정육각</font></a></td></tr>
<tr style="height: 20px">
<td style="font-size: 9pt;">이메일: help@yookgak.com</td></tr>
<tr>
<td> 															
<img style="cursor: pointer;" src="<%=cp%>/meat/image/QQQ.jpg" 
onclick="location.href='<%=cp%>/meatShop/support.do?view=faq';">&nbsp;
<img style="cursor: pointer;" src="<%=cp%>/meat/image/1Q.jpg" onclick="oneoneQ()">
</td> 
</tr>
</table>
</td></tr>
</table>
</div>
</form>
</body>
</html>