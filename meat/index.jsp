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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고기샵 :: 언제나 초신선</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/meat/data/meat.css"/>
<link rel=icon type=image/x-icon href=https://yookgak.com/website/favicon.ico>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>


<script type="text/javascript">

function fgOff(){	
	
	$("#firstgift").hide();	

}	

function wishlist(pOption1,pOption2,pOption3,count,pName,price,pNum){
	if(<%=check%>){
		document.myForm.action = "<%=cp%>/meatShop/login.do";
		document.myForm.submit();
		return;
	}
	document.body.classList.add('hidden'); 
	document.getElementById("dark").className = "visable";
	document.getElementById("wish").className = "visable";
	
	
	document.myForm.pOption[0] = new Option(pOption1,pOption1);
	document.myForm.pOption[0].selected = "selected";
	if(pOption2!="")
		document.myForm.pOption[1] = new Option(pOption2,pOption2);
	if(pOption3!="")
		document.myForm.pOption[2] = new Option(pOption3,pOption3);
	
	
	document.myForm.prodName.value = pName;
	document.myForm.pCount.value = 1;
	document.myForm.pNum.value = pNum;
	var commaPrice = numberWithCommas(price);
	document.myForm.intPrice.value = price;
	document.myForm.prodPrice.value = commaPrice+'원';
}
function wishCancle(count){
    document.body.classList.remove('hidden');
    document.getElementById("dark").className = "unvisable";
    document.getElementById("wish").className = "unvisable";
    for(i=0;i<3;i++){
		document.myForm.pOption[i] = null;
	}
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function countUp(){
	document.myForm.pCount.value = parseInt(document.myForm.pCount.value) + 1;	
	var price = parseInt(document.myForm.pCount.value) * parseInt(document.myForm.intPrice.value);
	var commaPrice = numberWithCommas(price);
	document.myForm.prodPrice.value = commaPrice+'원';
}
function countDown(){
	if(parseInt(document.myForm.pCount.value)>1){
	document.myForm.pCount.value = parseInt(document.myForm.pCount.value) -1 ;	
	}
	var price = parseInt(document.myForm.pCount.value) * parseInt(document.myForm.intPrice.value);
	var commaPrice = numberWithCommas(price);
	document.myForm.prodPrice.value = commaPrice+'원';
}


function pay(){
	
	document.myForm.action = "<%=cp%>/meatShop/buyWishList.do";
	document.myForm.submit();
	
}

function wish(){
	document.myForm.action = "<%=cp%>/meatShop/addWishList.do?category=main";
	document.myForm.submit();
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

.carousel-control-prev-icon{
	
	filter: invert(1);
	background-color:#111111;
	border-radius:30%;
	padding:3px;
	margin-left:0px;
	margin-top:0px;
}
.carousel-control-next-icon{
	filter: invert(1);
	background-color:#111111;
	border-radius:30%;
	padding:3px;
	margin-left:0px;
	margin-top:0px;
}
body {
-ms-overflow-style: none; /* IE and Edge */
scrollbar-width: none; /* Firefox */
}
body::-webkit-scrollbar {display: none !important; } 

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

.wish{
	cursor: pointer;
	position:absolute;
	left:290px;
	top:386px ;
	background-color:#ffffff;  
	height: 68px; width: 68px; 
	border-radius: 50%;
	background-image: url('${imageUrl }cart.png') ;
	background-position:15px 17px ;
	background-size:42px ;
	background-repeat: no-repeat;
	box-shadow: 0px 0px 8px #aaa;
	
}
.mu{
	position:absolute;
	right:25px;
	top:20px ;
	background-color:#ffffff;  
	height: 27px; width: 73px; 
	border-radius: 20px;
	border: 2px solid #68d1e6;
	font-size: 11pt;
	color: #68d1e6;
	box-shadow: 0px 0px 2px #aaa;
}
.new{
	position:absolute;
	right:5px;
	top:5px ;
	padding-top:1px;
	background-color:#ff0000;  
	height: 18px; width: 33px; 
	border-radius: 7px;
	font-size: 3pt;
	color: #ffffff;
	box-shadow: 0px 0px 2px #aaa;
}
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

.best{
	position:absolute;
	left:5px;
	top:0px ;
	border-radius: 50%;
}
.close{
	cursor: pointer;
	position:absolute;
	left:480px;
	top:-20px ;
	background-color:#ffffff;  
	height: 40px; width: 40px; 
	border-radius: 50%;
	background-image: url('${imageUrl }close.png') ;
	background-position:-3px -3px ;
	background-size:46px ;
	background-repeat: no-repeat;
	box-shadow: 0px 0px 8px #aaa;
}

.choice{
	border-radius:2%; 
	position: relative;
	background-color: #f5f5f5; 
	color: #212121; 
	font-size: 11pt; 
	cursor: pointer;
	width: 140px; height: 56px; 
	padding-top: 18px; 
	font-weight: 900;
}

.choice:hover{
	border-radius:2%; 
	background-color: #212121; 
	color: white; 
	font-size: 11pt; 
	cursor: pointer;
	width: 140px; height: 56px; 
	padding-top: 18px; 
	font-weight: 900;
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
		<td style="width: 120px" onclick="location.href='<%=cp%>/meatShop/freePork.do';">
			<font style="font-size: 10pt; color: #85483d;"><b>고기샵 첫구매 선물</b></font>
		</td>
		<td style="width: 960px" onclick="location.href='<%=cp%>/meatShop/freePork.do';">
			<img src="<%=cp%>/meat/image/firstgift.jpg">
		</td>
		<td style="width: 60px" onclick="location.href='<%=cp%>/meatShop/freePork.do';"></td>
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

<!-- 장바구니 팝업 -->
<div id="dark" style="width: 100%; height: 20000px; position: absolute; left: 0px; top:0px; z-index:9900; 
background-color: black; opacity: 70%" class="unvisable" onclick="wishCancle();"></div>
<div id="wish" style=" width: 520px; height: 400px; position: fixed;transition: all 0.5s;left:700px;
	 top:300px; z-index: 9999; padding-top: 20px"   class="unvisable" align="center">
	<div style="width: 100%; height: 100%;position: relative;" >
		<table width="480px" height="380" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0">
		
	
		<tr>
		<td colspan="2" align="center" style="padding-top: 30px">
		<input type="text" name="prodName" readonly="readonly" style="border: 0px;font-size: 16pt ; width: 100%; text-align: center;
		font-weight: 900; "></td>
		</tr>	
		<tr>
		<td colspan="2" align="center">
			<table width="400px" border="1" bordercolor="#eeeeee" cellpadding="0" cellspacing="0">
			<tr height="40px">
				<td width="40px" align="center" style="font-size: 17pt; color: #aaaaaa; cursor: pointer ; " onclick="countDown();"><b>-</b></td>
				<td><input type="text" readonly="readonly" name="pCount" style="border: 0px;font-size: 13pt ; width: 100%; text-align: center; "></td>
				<td width="40px" align="center" style="font-size: 17pt; color: #aaaaaa;cursor: pointer ;" onclick="countUp();"><b>+</b></td>
			</tr>
			</table>

		</td>
		</tr>	
		<tr height="10px">
		<td colspan="2" align="left" style="padding-left: 40px; font-size: 10pt"><b>옵션선택</b></td>
		</tr>	
		<tr>
		<td colspan="2" align="center" height="38px" style="padding 5px">
	<!-- 	
		<div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
		    Dropdown button
		  </button>
		  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
		    <li><a class="dropdown-item" href="#">Action</a></li>
		    <li><a class="dropdown-item" href="#">Another action</a></li>
		    <li><a class="dropdown-item" href="#">Something else here</a></li>
		  </ul></div>
		 -->


		<select name="pOption" style="width: 400px; height: 40px;  border:2px solid ;border-color: #eeeeee; text-align-last: center;"></select>
		</td>
		</tr>	
		<tr>
		<td colspan="2" align="right" style="padding-right: 40px">
		<input type="hidden" name="pNum">
		<input type="hidden" name="intPrice">
		<input type="text" readonly="readonly" name="prodPrice" style="border: 0px;
		font-size: 16pt ; width: 100%; text-align: right; font-weight: 900;"></td>
		</tr>	
		<tr>
		<td align="center" valign="middle" style="background-color: #cccccc; font-size: 9pt; color: white; cursor: pointer;"
		onclick="pay();"><b>바로구매</b></td>
		<td align="center" valign="middle" style="background-color: #000000; font-size: 9pt; color: white; cursor: pointer;"
		onclick="wish('${category}');"><b>장바구니</b></td>
		</tr>	
		</table>
		<div class="close" align="center" onclick="wishCancle();"></div>
	</div>
</div>


<div align="center">
	<div><a href="<%=cp%>/meatShop/freePork.do"> <img alt="" src="../meat/image/mainAD.png"></a>
	</div>

	<div style="padding-top: 20px;">
		<table width="1180px">
		<tr>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td width="50%">

				<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
				 
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <a href="<%=cp%>/meatShop/mainAD1.do"><img src="../meat/image/avalonewhole.png" width="582px" height="176px" class="d-block w-100" ></a>
				    </div>
				    <div class="carousel-item">
				      <a href="<%=cp%>/meatShop/mainAD2.do"><img src="../meat/image/invitation-points-mainbanner-pc.png" width="582px" height="176px"  class="d-block w-100" ></a>
				    </div>
				    <div class="carousel-item">
				      <a href="<%=cp%>/meatShop/mainAD3.do"><img src="../meat/image/app-coupon-mainbanner-pc.png" width="582px" height="176px" class="d-block w-100"></a>
				    </div>
				    <div class="carousel-item">
				      <a href="<%=cp%>/meatShop/mainAD4.do"><img src="../meat/image/instagram-points-mainbanner-pc.png" width="582px" height="176px" class="d-block w-100"></a>
				    </div>
				    <div class="carousel-item">
				      <a href="<%=cp%>/meatShop/list.do?category=baby"><img src="../meat/image/baby-giftcube-mainbanner-pc.png" width="582px" height="176px" class="d-block w-100"></a>
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" " data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
				

			</td>
			<td width="50%"><a href="<%=cp%>/meatShop/freshPlan.do"><img alt="" src="../meat/image/freshplan.png"></a></td>
		</tr>
		</table>
	</div>
	<div>
		<table  border="0" cellspacing="20" >
		
			
			
			<!-- 주간 베스트 -->
			<tr height="40px"><td style="font-size: 24pt; font-weight: 900;padding-bottom:15px ;padding-top:15px ;
			 border-bottom: 1px solid #cccccc; border-top:1px solid #cccccc; "colspan="3" align="left" valign="middle">
			GO<font color="red">!</font> GI<font color="red">!</font> SHOP<font color="red">!</font> 주간 <font color="red">BEST</font> 상품</td></tr>
			<tr height="40px">
			<td width="390px" ></td>
			<td width="390px" ></td>
			<td width="390px" ></td>
			</tr>
			
			<tr>
			<c:set var="best" value="1"></c:set>
			<c:forEach var="bestdto" items="${bestLists }">
				<td  align="center" style="position: relative; cursor: pointer;" height="580px" valign="top">	
				<div onclick="javascript:location.href='<%=cp%>/meatShop/desc.do?pNum=${bestdto.pNum }&category=${category }';">
				<img alt="" src="${imageUrl }${bestdto.pImage }" height="420px" width="380px" style="border-radius: 3%"></div>
				<div onclick="javascript:location.href='<%=cp%>/meatShop/desc.do?pNum=${bestdto.pNum }&category=${category }';" 
				style="height: 30px; padding-top: 30px; font-size: 12pt" align="left"><b>${bestdto.pName }</b></div>
				<div onclick="javascript:location.href='<%=cp%>/meatShop/desc.do?pNum=${bestdto.pNum }&category=${category }';" 
				style="height: 23px; color: #999999; font-size: 12pt;margin-top: 25px;" align="left">기준가 ${bestdto.commaPrice }/${bestdto.unit }</div>
				<div onclick="javascript:location.href='<%=cp%>/meatShop/desc.do?pNum=${bestdto.pNum }&category=${category }';" 
				style="height: 24px; color: #999999; font-size: 9pt; vertical-align: top" align="left" >(${bestdto.standard } ${bestdto.stPrice})</div>
				<div class="wish"  align="center" onclick="wishlist('${bestdto.pOption[0]}','${bestdto.pOption[1]}','${bestdto.pOption[2]}','${bestdto.opCount }','${bestdto.pName }','${bestdto.price }','${bestdto.pNum }');"></div>

			
				<div class="best"><img alt="" src="../meat/image/best.png" width="100px" height="100px"></div>
				<c:if test="${bestdto.mu==true }">
					<div class="mu" align="center">무항생제</div>
				</c:if>
				</td>
			<c:set var="best" value="${best+1 }"></c:set>
			</c:forEach>
			</tr>
			<tr height="1px"><td style="padding-bottom:15px ;
			 border-top: 1px solid #cccccc; "colspan="3" align="left" valign="middle">
		</table>
	</div>
	<div style="margin-top: 50px; margin-bottom: 100px;">
		<a href="<%=cp%>/meatShop/list.do"><img alt="안나와" src="../meat/image/banner_shop.png"></a>
	</div>
</div>


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