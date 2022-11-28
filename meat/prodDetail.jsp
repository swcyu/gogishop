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

<!DOCTYPE html >
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

/* 틀 */
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
	document.myForm.action = "<%=cp%>/meatShop/qnalist.do";
	document.myForm.submit();	
}

/*   */

function descLoad(){
	document.myForm.pCount.value = 1;
	
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


function tab1(){
	
	document.getElementById("tab1").className = "visable";
	document.getElementById("tab2").className = "unvisable";
	document.getElementById("tab3").className = "unvisable";
	
	document.getElementById("tab1Btn").className = "selected";
	document.getElementById("tab2Btn").className = "unselected";
	document.getElementById("tab3Btn").className = "unselected";
		
}//tab1



function tab2(){

	document.getElementById("tab1").className = "unvisable";
	document.getElementById("tab2").className = "visable";
	document.getElementById("tab3").className = "unvisable";

	document.getElementById("tab1Btn").className = "unselected";
	document.getElementById("tab2Btn").className = "selected";
	document.getElementById("tab3Btn").className = "unselected";
	
}//tab2


function tab3(){
	
	document.getElementById("tab1").className = "unvisable";
	document.getElementById("tab2").className = "unvisable";
	document.getElementById("tab3").className = "visable";
	
	document.getElementById("tab1Btn").className = "unselected";
	document.getElementById("tab2Btn").className = "unselected";
	document.getElementById("tab3Btn").className = "selected";
	

}//tab3



function pay(){
	
	document.myForm.action = "<%=cp%>/meatShop/buyWishList.do";
	document.myForm.submit();
	
}

function wish(){
	if(<%=check%>){
		document.myForm.action = "<%=cp%>/meatShop/login.do";
		document.myForm.submit();
		return;
	}
	document.myForm.action = "<%=cp%>/meatShop/addWishList.do?category=desc";
	document.myForm.submit();
}

function revSend(pNum){
	
	f = document.rForm;
	
	str = f.rTitle.value;
	str = str.trim();
	if(!str) {
		alert("리뷰 제목을 입력해 주세요.");
		f.rTitle.focus();
		return;
	}
	f.rTitle.value = str;

	
	str = f.rContent.value;
	if(!str) {
		alert("리뷰 내용을 입력해 주세요.");
		f.rContent.focus();
		return;
	}
	f.rContent.value = str;
	
	f.action = "<%=cp%>/meatShop/review_ok.do?pNum="+pNum;
	f.submit();
	
}



</script>


<style type="text/css">

* {
	margin:0px;
	padding:0px;
	align-content: center;
	font-family: 맑은 고딕;
}

/* 틀 */

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


.hidden { 
overflow-y :hidden !important;
height: 100%; min-height: 100%;

}

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

/*   */

input:focus { outline: none; }

.td{
	text-decoration: none;
	color: #bdbdbd;
}

.td:hover {
	color: black;
	text-decoration: underline;

}

.selected {
	color: black;
	text-decoration: underline;
	
}

.unselected {
	text-decoration: none;
	color: #bdbdbd;
}

.buyCount {
	color: white;
	width: 190px; 
	height: 50px; 
	background-color: black; 
	border-style: none;
}

.pOption {
	color: white;
	width: 190px; 
	height: 50px; 
	background-color: black; 
	border-style: none;

}

.btnCount {
	background-repeat: no-repeat; 
	background-size: 100%; 
	width: 50px; 
	height: 50px; 
	border-style: none;"
}

.textArea {
	border-style: none;
}

.textArea:focus { outline: none; }

.rTitle {
	width: 850px; 
	height: 25px; 
	background-color: #ffffff; 
	border-style: none;
	margin: 20px;
	font-size: 12pt;
}

.rContent {
	width: 850px; 
	height: 125px; 
	background-color: #f5f5f5; 
	border-style: none;
	padding: 20px;
	font-size: 11pt;
	color: black;
}


.reviewTd1 {
	font-size: 11pt;
	color: #969696;
	border-style: #787878 solid thin;
	height: 25px;

}

.reviewTd2 {
	font-size: 10pt;
	color: #969696;
	border-style: #787878 solid thin;
	height: 25px;
	

}
.rBuyTd {
	font-size: 11pt;
	color: #73a9ff;
	height: 25px;
	
}

.visable{
	visibility: visible;
}
.unvisable{
	display: none;
}

.boxTF { 
	border:1px solid; 
	height:25px;  
	padding-left : 10px;
	border-color:#D5D5D5; 
	background-color:#ffffff; 
	font-family:"굴림"; 
	font-size:12pt; 
}

.boxTF:focus{ outline: none; }
.boxTA:focus{ outline: none; }


.boxTA { 
	border:1px solid; 
	height:150px; 
	padding-left:10px; 
	border-color:#D5D5D5; 
	background-color:#ffffff; 
	font-family:"굴림"; 
	font-size:11pt; }

.btn1 {
	font-size: 11pt; 
	color:rgb(0,0,0); 
	background-color:rgb(245,245,245); 
	line-height:19px;
}

.freshDate1{
	background-image:url(${descImgUrl}desc-fresh-date.jpg); 
	background-repeat: no-repeat; 
	background-size: 50px;
	background-position: center;
	font-size: 50pt;
	text-align: center; 
}

.freshDate2{
	
	color: #ffffff;
	font-size: 20pt;
}



</style>




</head>
<body onload="descLoad();">

<form action="" name="myForm" method="post">

<!-- 틀 -->
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
		<img src="<%=cp %>/meat/image/menu.jpg" style="cursor: pointer;"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">			
		</td>
	</tr>
	</table>
</div>



<!-- 상품정보 --> 
<table align="center" style="background-color: #1b1c1b; font-size: 13pt; width: 100%;">

	<tr>
	<td></td>
	
	
	<td style="width: 900px;">
	<table align="center" cellpadding="0" cellspacing="0" style="margin: 80px 30px 100px 30px">
		
		<tr>
			<td>
				<img src="${blackUrl }${dto.pImage}" style="width: 500px; height: 500px; margin: 5px 100px 5px 5px;"/>
			</td>
			
			<td>
				<table cellpadding="0" cellspacing="0" style="width: 400px; height: 500px;">
					<tr>
						<td colspan="2">
							<font color="white" style="font-size: 20pt;">
							<b>${dto.pName }</b></font>
						</td>	
						
					<tr>
						<td colspan="2">
							<font color="#999999" style="font-size: 12pt;">${dto.standard } ${dto.stPrice }</font>
						</td>	
					</tr>
					
					<tr>
						<td colspan="2">
							<font color="white" style="font-size: 17pt;">
							기준가 ${dto.commaPrice } (${dto.unit })</font>
						</td>	
					</tr>
					<tr>
						<td colspan="2" height="1" bgcolor="#787878" align="center"></td>
					</tr>
					
					<tr>
						<td align="center" valign="middle" style="width: 100px;">
						<font color="white">옵션</font></td>
									
						<td>
							<select class="pOption" name="pOption" style="border-color: #787878; border-width: thin; border-style: solid; 
								background-color: #1b1c1b; width: 315px; height: 55px;  text-align-last: center; font-size: 12pt; color: white; cursor:pointer;">
								<c:forEach var="i" begin="0" end="${dto.opCount-1 }" step="1">
									<option>${dto.pOption[i] }</option>
								</c:forEach>
							</select>	
						</td>
					</tr>
						
					<tr valign="bottom">	
						<td align="center" valign="middle" style="width: 100px;"><font color="white">수량</font></td>
						
						<td>
							<table style="width: 200px; height: 45px; 
								border-color: #787878; border-width: thin; border-style: solid;">
								<tr>
									<td class="btnCount" style="border-right: #787878 solid thin;">
										<input type="button" name="countMinus" onclick="countDown();"
											style="background-image: url(../meat/descImage/countMinus.jpg);
											background-repeat: no-repeat; background-size: 100%; 
											width: 50px; height: 50px; border-style: none;cursor:pointer;"/>
										
									</td>
									<td align="center" bgcolor="#1b1c1b">
										<input type="text" readonly="readonly" name="pCount" 
											style="text-align: center; background-color: #1b1c1b; color: white; font-weight: bold; font-size: 13pt;
											border-style: none; box-shadow: none;"/>
									</td>
									<td class="btnCount" style="border-left: #787878 solid thin;">
										<input type="button" name="countPlus" onclick="countUp();"
											style="background-image: url(../meat/descImage/countPlus.jpg);
											background-repeat: no-repeat; background-size: 100%; 
											width: 50px; height: 50px; border-style: none;cursor:pointer;"/>
									</td>
								</tr>
							
							</table>
							<br/>
						</td>
					</tr>
						
					
					<tr>
						<td colspan="2" align="right"><table><tr>
							<td>
							<input type="hidden" name="pNum" value="${dto.pNum }"/>
							<input type="hidden" name="pOption" value=""/>
							</td>			
							<td align="center" valign="middle" 
								style="background-color: #8c8c8c; cursor:pointer; color: white; width: 180px; height: 55px; font-size: 13pt;" onclick="pay();">
							<b>바로구매</b></td>
							<td style="width: 20px"></td>
							<td align="center" valign="middle"
								style="background-color: #d60f0f; cursor:pointer; color: white;	width: 180px; height: 55px; font-size: 13pt;" onclick="wish();">
							<b>장바구니</b></td>
							
						</tr></table></td>
					</tr>
		</table></tr>	
		
	</table></td>
	
	<td></td>

	</tr>
	
	
		
</table>


<!-- 탭 버튼 -->
<div align="center" style="width: 100%">
<table align="center" cellpadding="0" cellspacing="0" style="margin: 20px;">


<tr height="50">
	<td class="td" onclick="tab1();" style="cursor: pointer;"><div id="tab1Btn" class="selected"><b>상품설명</b></div></td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td class="td" onclick="tab2();" style="cursor: pointer;"><div id="tab2Btn" class="unselected"><b>상품리뷰</b></div></td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>	
	<td class="td" onclick="tab3();" style="cursor: pointer;"><div id="tab3Btn" class="unselected"><b>상품정보안내</b></div></td>
</tr>


</table>
</div>


<table style="width: 100%">
<tr><td height="1" bgcolor="black" align="center" width="100%;"></td></tr>
</table>


<!-- 상품설명 탭 -->
<div id="tab1" class="visable" align="center" >
	<table cellspacing="0" style="width: 100%">
		<tr><td><br/><br/></td></tr>
			
		<tr><td style="color: fuchsia;">
		<div style="width: 100%; color: #000000; font-size: 15pt;">	
		<table style="width: 100%; height: 160px;">
			<tr style="width: 100%;"><td align="center" style="background-color: #ffffff; width: 100%; height: 40px;">
				<table style="width: 500px; height: 30px; font-size: 13pt;">
				<tr><td align="center"><b>${delMM }</b>월 <b>${delDD }</b>일에 받으실 <b>${freshMk }</b>의 <b>${fresh }</b> 확인하세요.</td></tr>
				</table>
			</td></tr>
			
			<tr style="width: 100%;"><td align="center" style="background-color: #000000; width: 100%; height: 80px; padding-top: 20px; margin: 0;">
				<table style="width: 500px; height: 80px;" cellpadding="0" cellspacing="0">
				<tr valign="bottom">
					<td rowspan="2" style="width: 110px"></td>
					<td rowspan="2" style="width:55px"><div class="freshDate1"><b>0</b></div></td>
					<td rowspan="2" style="width:55px"><div class="freshDate1"><b>${freshM1 }</b></div></td>
					<td valign="bottom" style="padding-bottom: 15px;" class="freshDate2">월</td>
					<td rowspan="2" style="width: 10px"></td>
					<td rowspan="2" style="width:55px"><div class="freshDate1"><b>${freshD1 }</b></div></td>
					<td rowspan="2" style="width:55px"><div class="freshDate1"><b>${freshD2 }</b></div></td>
					<td valign="bottom" style="padding-bottom: 15px;" class="freshDate2">일</td>
					<td rowspan="2" style="width: 110px"></td>
				</tr>
			
				</table>
			</td></tr>
			
			<tr style="width: 100%;"><td align="center" style="background-color: #ffffff; width: 100%; height: 40px;">
				<table style="width: 500px; height: 30px;">
				<tr><td align="center">* 서울 당일 배송 기준</td></tr>
				</table>
			</td></tr>
		</table></div>
	</td></tr>
		
		
		<div style="width: 100%"><tr align="center"><td>
			<c:forEach var="dfdto" items="${dfnLists }">
				<c:if test="${dfdto.type=='img' }">
					<img src="${descImgUrl }${dfdto.fileName}" width="100%"/><br/>
				</c:if>
				<c:if test="${dfdto.type=='vid' }">
					<video src="${descImgUrl }${dfdto.fileName}" loop="loop" autoplay="autoplay" width="100%" ></video><br/>
				</c:if>
			</c:forEach>
		</td></tr></div>
	</table>
</div>
</form>

<!-- 리뷰 탭 -->
<div id="tab2" class="unvisable" align="center">

<c:if test="${not empty sessionScope.customInfo.userNum }">
<c:if test="${pBuyCount!=0 }">
	<!-- 리뷰 작성 창 -->
<form action="" method="post" name="rForm">
	<table align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff"
		style="width: 900px; height: 150px;
		border-color: #D5D5D5; border-width: thin; border-style: solid; margin: 20px;">
	
	
	<tr valign="bottom" align="center">
		<td class="rTitle" colspan="4" style="padding: 20px; font-size: 13pt;">
			<b>가장 최근에 구매하신 <u style="color: #73a9ff;">${dto.pName }</u>의 후기를 남겨주세요!</b>
		</td>
	</tr>
	
	<tr align="center"><td colspan="4" align="center" style="padding-left: 25px;">
	<table align="center" style="width: 100%; padding-left: 20">
	<tr>
	<td bgcolor="#f5f5f5" style="height: 25px;">
		제&nbsp;&nbsp;목
	</td>
	<td style="padding-left: 10px; height: 25px;">
		<input type="text" name="rTitle" style="height: 30px; width: 794px;" maxlength="20" class="boxTF"/>
	</td>
	</tr>
	
	<tr><td colspan="2" height="3" bgcolor="#ffffff" align="center"></td></tr>
	
	<tr>
	<td align="center" bgcolor="#f5f5f5" style="padding-top: 5px; height: 30px;"
		valign="middle">내&nbsp;&nbsp;용</td>
	<td valign="top" style="padding-left: 10px; height: 30px;">
		<textarea rows="7" cols="85" name="rContent" class="boxTA"></textarea>
	</td>
	</tr>		
	</table></td></tr>

	
	
	<tr>
		<td align="right" class="reviewTd1" style="padding: 20px; width: 10%;">
			<b>${sessionScope.customInfo.userName }</b>
		</td>
		<td class="rBuyTd" style="padding: 20px; width: 15%;">
			<b>${pBuyCount }회 구매</b>
		</td>
		<td style="padding: 20px;  width: 55%;">
			
		</td>
		<td align="right" class="reviewTd1" style="padding: 20px; width: 20%;">
			<b>${revDate }</b>
		</td>
	</tr>
	
<c:forEach var="rdto" items="${oLists }">		
	<tr align="left">
		<td class="reviewTd2" colspan="2" style="padding: 10px; width: 25%; height: 25px; border-color: #D5D5D5;  border-width: thin; border-style: solid;">
			<b>함께 구매하신 상품(${pBuyCount })</b>
		</td>
		<td class="reviewTd2" colspan="2" style="padding: 10px; width: 75%; height: 25px; border-color: #D5D5D5;  border-width: thin; border-style: solid;">
			<b>
				${rdto. pName}x${rdto.buyCount }
			</b>
		</td>
	</tr>
</c:forEach>	
	
	<tr align="center" style="border-style: none;"><td colspan="4">
		<table width="560" border="0" cellpadding="3" cellspacing="0" align="center">
		<tr align="center">
		<td height="40">
		<input type="hidden" name="userNum" value="${sessionScope.customInfo.userNum }"/>
		<input type="button" value=" 등록하기 " class="btn1" style="cursor: pointer;" 
			onclick="revSend(${dto.pNum});"/>
		<input type="reset" value=" 다시입력 " class="btn1" style="cursor: pointer;"
			onclick="document.myForm.rtitle.focus();"/>
			
		</table>
		
	</td></tr>
	
	</table>
</form>
</c:if>
</c:if>

<!-- 리뷰 출력 -->
<c:forEach var="rdto" items="${tRLists }">

	<c:if test="${revCount==0 }">
	<table><tr align="center"><td>
		등록된 리뷰가 없습니다.
	</td></tr></table>
	</c:if>

	<!-- 이미지 없는 경우 -->
	<table align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff"
		style="width: 900px; height: 100px;
		border-color: #D5D5D5; border-width: thin; border-style: solid; margin: 20px;">
	
	<tr valign="bottom">
		<td class="rTitle" colspan="4" style="padding: 20px;">
			<b>${rdto.rTitle}</b>
		</td>
	</tr>
			
	<tr align="center" valign="top">
		<td colspan="4"><table cellspacing="20"><tr><td class="rContent">
			${rdto.rContent }
		</td></tr></table></td>
	</tr>
		
	<tr>
		<td align="right" class="reviewTd1" style="padding: 20px; width: 10%;">
			<b>${rdto.userName }</b>
		</td>
		<td class="rBuyTd" style="padding: 20px; width: 15%;">
			<b>${rdto.buyCount }회 구매</b>
		</td>
		<td style="padding: 20px;  width: 55%;">
			
		</td>
		<td align="right" class="reviewTd1" style="padding: 20px; width: 20%;">
			<b>${rdto.rDate }</b>
		</td>
	</tr>
	
<c:forEach var="rdto" items="${oLists }">		
	<tr align="left">
		<td class="reviewTd2" colspan="2" style="padding: 10px; width: 25%; height: 25px; border-color: #D5D5D5;  border-width: thin; border-style: solid;">
			<b>함께 구매하신 상품(${rdto.buyCount })</b>
		</td>
		<td class="reviewTd2" colspan="2" style="padding: 10px; width: 75%; height: 25px; border-color: #D5D5D5;  border-width: thin; border-style: solid;">
			<b>
				${rdto. pName}x${rdto.buyCount }
			</b>
		</td>
	</tr>
</c:forEach>	
	</table>

</c:forEach>	
	
	

<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
</div>

<!-- 상품정보 탭 -->
<div id="tab3" class="unvisable" align="center" style="width: 100%">

	<table style="width: 1200px;">
	
	<tr><td><br></td></tr>
	<tr><td><br></td></tr>
	
	<tr>
		<td colspan="2" align="left" style="font-size: 25pt; padding-left: 20px;">
			<font><b>상품 기본정보</b></font>	
		</td>
	</tr>	
	
	<tr><td><br></td></tr>
		
	<tr>
		<td colspan="2" height="1" width="100%" bgcolor="black" align="center"></td>
	</tr>
	
	<tr align="center"><td>
			<c:forEach var="dfdto" items="${ifnLists }">
				<img src="${descImgUrl }${dfdto.fileName}" style="width: 1200px; margin: 25px;"/>
			</c:forEach>
	
	</td></tr>	
	
	<tr>
		<td colspan="2" height="1" width="100%" bgcolor="black" align="center"></td>
	</tr>
	
	<tr><td><br></td></tr>
	<tr><td><br></td></tr>
	
	<tr>
		<td colspan="2" align="left" style="font-size: 25pt; padding-left: 20px;">
			<font><b>배송 안내</b></font>	
		</td>
	</tr>	
	
	<tr><td><br></td></tr>

		
	<tr>
		<td colspan="2" height="1" width="100%" bgcolor="black" align="center"></td>
	</tr>
	
	<tr align="center">	
		<td >
			<img src="${descImgUrl }info2.jpg" style="width: 700px; margin: 50px 0px 25px 0px;"/><br/>
			<img src="${descImgUrl }info3.jpg" style="width: 700px; margin: 25px 0px 25px 0px;"/><br/>
			<img src="${descImgUrl }info4.jpg" style="width: 700px; margin: 25px 0px 50px 0px;"/><br/>
		</td>
	</tr>	
	
	
	<tr>
		<td colspan="2" height="1" width="100%" bgcolor="black" align="center"></td>
	</tr>
	
	<tr><td><br></td></tr>
	<tr><td><br></td></tr>
	
	<tr>
		<td colspan="2" align="left" style="font-size: 25pt; padding-left: 20px;">
			<font><b>교환/환불 안내</b></font>	
		</td>
	</tr>	
	
	<tr><td><br></td></tr>
		
	<tr>
		<td colspan="2" height="1" width="100%" bgcolor="black" align="center"></td>
	</tr>
	
	<tr align="left">	
		<td >
			<img src="${descImgUrl }info5.jpg" style="width: 1200px; margin: 25px;"/>
		</td>
	</tr>

	<tr>
		<td colspan="2" height="1" width="100%" bgcolor="black" align="center"></td>
	</tr>
	



</table>

</div>
<br/><br/><br/><br/>


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





</body>
</html>