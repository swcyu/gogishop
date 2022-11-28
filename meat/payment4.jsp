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
<link rel="stylesheet" type="text/css" href="<%=cp%>/meat/data/payment.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=cp%>/meat/css/pignose.calendar.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="<%=cp%>/meat/js/pignose.calendar.full.min.js"></script>


<script type="text/javascript">

$(function() {
	$("input:radio[name=pay]").click(function(){
	    if($("input[name=pay]:checked").val() == "payKakao"){
	    	jQuery('.layer1').show();
	    	jQuery('.layer2').hide();
	    	jQuery('.layer3').hide();
	    	
	    	document.getElementById("Acc").value = "0원";
			
			var totalPrice = '<c:out value="${pFinalPrice}"/>';
			document.getElementById("Final").value = totalPrice;
	    	
	    }else if($("input[name=pay]:checked").val() == "payNaver"){
	    	jQuery('.layer1').hide();
	    	jQuery('.layer2').show();
	    	jQuery('.layer3').hide();
	    	
	    	document.getElementById("Acc").value = "0원";
			
			var totalPrice = '<c:out value="${pFinalPrice}"/>';
			document.getElementById("Final").value = totalPrice;
	    	
	    }else if($("input[name=pay]:checked").val() == "payPayco"){
	    	jQuery('.layer1').hide();
	    	jQuery('.layer2').hide();
	    	jQuery('.layer3').show();
	    	
			document.getElementById("Acc").value = "0원";
			
			var totalPrice = '<c:out value="${pFinalPrice}"/>';
			document.getElementById("Final").value = totalPrice;
			
	    }else if($("input[name=pay]:checked").val() == "payCard"){
	    	jQuery('.layer1').hide();
	    	jQuery('.layer2').hide();
	    	jQuery('.layer3').hide();
	    	
	    	document.getElementById("Acc").value = "0원";
			
			var totalPrice = '<c:out value="${pFinalPrice}"/>';
			document.getElementById("Final").value = totalPrice;
	    	
	    }else if($("input[name=pay]:checked").val() == "payAccount"){
	    	jQuery('.layer1').hide();
	    	jQuery('.layer2').hide();
	    	jQuery('.layer3').hide();
	    	
	    	var addPrice = '<c:out value="${addPrice}"/>';
			document.getElementById("Acc").value = addPrice;
			
			var pAccFinalPrice = '<c:out value="${pAccFinalPrice}"/>';
			document.getElementById("Final").value = pAccFinalPrice;
	    	
	    }
	});
});	

	function init(){
		jQuery('.layer1').hide();
		jQuery('.layer2').hide();
		jQuery('.layer3').hide();
		
		var totalPrice = '<c:out value="${pFinalPrice}"/>';
		
		document.getElementById("Acc").value = "0원";
		document.getElementById("Final").value = totalPrice;
	}
	
	function Account(){

		var addPrice = '<c:out value="${addPrice}"/>';
		document.getElementById("Acc").value = addPrice;
	
	}
	
	function hideBackground(){
	    document.body.classList.remove('hidden');
	    document.getElementById("dark").className = "unvisable";
	    document.getElementById("shoppingEnd").className = "unvisable";
	}
	
	function the_End(){
		document.body.classList.add('hidden');
		document.getElementById("dark").className = "visable";
		document.getElementById("shoppingEnd").className = "visable";
	}
	function sendIt() {
		
		var finalPrice = document.getElementById("Final").value;
		var addrNum = '<c:out value="${addrNum}"/>'
		document.myForm.action = "<%=cp%>/meatShop/payment5.do?finalPrice=" +finalPrice;
		document.myForm.submit();

	}
	
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
h6 {
    display: block;
    font-size: 0.67em;
    margin-block-start: 2.33em;
    margin-block-end: 2.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
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
.checkbox__form {
    width: 16px;
    height: 16px;
    border: 2px solid #979797;
    border-radius: 50%;
    cursor: pointer;
    margin-left: 2px;
    margin-top: 21px;
    float: left;
}
.checkbox__form .checkbox__checked {
    width: 10px;
    height: 10px;
    background-color: #d0021b;
    border-radius: 50%;
    margin-left: 3px;
    margin-top: 3px;
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


<body onload="init();">

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


<!-- 여기부터 결제4 -->

<input type="hidden" name="addrNum" value="${addrNum }">
<input type="hidden" name="cNum" value="${cNum }">
<input type="hidden" name="userPoint" value="${userPoint }">

<div id="dark" style="width: 100%; height: 10000px; position: absolute; left: 0px; top:0px; z-index:100; 
background-color: black; opacity: 60%" class="unvisable" onclick="hideBackground();"></div>

<div id="popup">
	<div id="shoppingEnd" style="background:#ffffff; width: 500px; height: 240px; position: fixed; left:50%;
	 top:50%; z-index: 9999 ; margin: -250px 0 0 -120px;" class="unvisable" align="center">
	 	<div style="width: 100%; height: 100%;position: relative;" >
	 		<div style="text-align: center; top: 37px; margin-top: 30px;">
			<div style="width: 500px; height: 21.6px; font-size: 19px; font-weight: 700;">주문확정</div>
			<div style="width: 450px; height: 24px; margin-top: 22px; margin-left: 25px;">주문을 확정합니다. 계속 진행하시겠습니까?</div>
			</div>
			<div style="width: 500px; margin-top: 90px;">
				<input type="button" value="확인" id="btn6" style="cursor: pointer; outline: none;" onclick="sendIt();"/>
			</div>
		</div>
	</div>
</div>


<div class="wrap" align="center">
	<div align="center" style="width: 1180px;">
		<div style="height: 50px; font-size: 26px; text-align: center; margin-top: 100px;">주문하기</div>
		<div style="margin-top: 20px;"><img src="../meat/image/process4.png"></div>
		
		<div style="width: 980px; margin-top: 50px; margin-bottom: 80px;">
			<div style="margin-top: 50px; font-size: 21px; font-weight: bold; text-align: left;">결제방법</div>
			<div style="width: 980px; margin-top: 10px;">
				<div align="left" style="border: 1px solid #bbbbbb;">
	
					<div style="height: 60px; margin-left: 19px; margin-right: 19px;">
						<input type="radio" id="payCard" name="pay" class="checkbox__form" value="payCard" checked="checked"/>
						<div style="font-size: 16px; margin-top: 18px; margin-left: 16px; float: left; font-weight: bold;">카드 결제</div>
					</div>
					<div style="border-bottom: 1px solid #bbbbbb;"></div>
					
					<div style="height: 60px; margin-left: 19px; margin-right: 19px;">
						<input type="radio" id="payKakao" name="pay" class="checkbox__form" value="payKakao"/>
						<img src="../meat/image/kakaopay.png" style="margin-top: 14px; margin-left: 14px;">
					</div>
					<div class="layer1" align="left" style="margin-left: 36px; width: 904px; height: 336px;">
						<div style="width: 320px; height: 40px; margin-top: 20px; border: 1px solid #dcdcdc; background-color: #fff; padding-left: 8px;">
							<div style="width: 16px; height: 16px; background-color:#000; border-radius:50%; margin-top: 12px; float: left; color: #fff; text-align: center; font-size: 15px; font-weight: 700;">!</div>
							<div style="font-size: 16px; margin-left: 7px; margin-top:9px; float: left; font-weight: bold;">카카오페이로 결제시 꼭 확인해주세요!</div>
						</div>
						<img src="../meat/image/info-kakaopay.png" width="243.750px" height="260px" style="margin-top: 12px;">
					</div>
					<div style="border-bottom: 1px solid #bbbbbb;"></div>
					
					<div style="height: 60px; margin-left: 19px; margin-right: 19px;">
						<input type="radio" id="payNaver" name="pay" class="checkbox__form" value="payNaver"/>
						<img src="../meat/image/npay.png" style="margin-top: 15px; margin-left: 16px;">
					</div>
					<div class="layer2" align="left" style="margin-left: 36px; padding-top: 10px; width: 904px; height: 783px;">
						<div style="margin-top: 10px; margin-bottom: 20px; width: 904px; height: 88px; font-size: 12px; color: #6b6b6b;">
							- 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.<br>
							- 네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.<br>
							- 결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티, 카카오뱅크<br>
							- 결제 가능한 은행: NH농협, 국민, 신한, 우리 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행, 케이뱅크, <br>&nbsp;&nbsp;카카오뱅크, 삼성증권<br>
							- 네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사 별 무이자, 청구할인 혜택을 받을 수 있습니다.
						</div>
						<img src="../meat/image/info-naverpay.png" width="730px" height="640px" style="margin-bottom: 20px;">
					</div>
					<div style="border-bottom: 1px solid #bbbbbb;"></div>
					
					<div style="height: 60px; margin-left: 19px; margin-right: 19px;">
						<input type="radio" id="payPayco" name="pay" class="checkbox__form" value="payPayco"/>
						<img src="../meat/image/payco.png" style="margin-top: 18px; margin-left: 16px;">
					</div>
					<div class="layer3" align="left" style="margin-left: 36px; padding-top: 10px; width: 904px; height: 593px;">
						<div style="margin-top: 10px; margin-bottom: 20px; width: 904px; height: 53px; font-size: 12px; color: #6b6b6b;">
							PAYCO는 온/오프라인 쇼핑은 물론 송금 멤버십 적립까지 가능한 통합 서비스입니다. 휴대폰과 카드 명의자가 동일해야 결제 가능하며 결제 금액 제한은 없습니다.<br><br>
							지원카드: 모든 국내 신용/체크카드
						</div>
						<img src="../meat/image/info-payco.png" width="730px" height="485px" style="margin-bottom: 20px;">
					</div>
					<div style="border-bottom: 1px solid #bbbbbb;"></div>
					
					<div style="height: 60px; margin-left: 19px; margin-right: 19px;">
						<input type="radio" id="payAccount" name="pay" class="checkbox__form" value="payAccount" onclick="Account();"/>
						<div style="font-size: 16px; margin-top: 18px; margin-left: 16px; float: left; font-weight: bold;">
							무통장 결제&nbsp;<img src="../meat/image/qicon.png" style="cursor: pointer;" onclick="javascript:location.href='<%=cp%>/meatShop/freshPlan.do';" width="19px;" height="19px">
						</div>
					</div>
					
				</div>	
			</div>
			
			<div style="margin-top: 50px; font-size: 21px; font-weight: bold; text-align: left;">주문내역</div>
			<div style="width: 980px; margin-top: 10px; border: 1px solid #bbbbbb;">
				<div align="left">
				<c:forEach var="dto" items="${lists }">
					<div style="margin-left: 99px; width: 775px; margin-top: 45px; border-bottom: 1px solid #e1dedf; height: 25px;">
						<p style="font-size: 15px; color: #555; float: left;">${dto.pName }</p>
						<p style="font-size: 13px; font-weight: 700; color: #d3d3d3; margin-left: 15px; float: left;">${dto.pOption }</p>
						<p style="font-size: 13px; width: 131.5px; float: right; text-align: right; color: #555;">${dto.commaPrice }</p>
						<p style="font-size: 15px; width: 92.5px; float: right; text-align: right;">${dto.pCount}팩</p>
						<p style="font-size: 15px; width: 130px; float: right; text-align: right; color: #555;">${dto.unit }</p>
					</div>
				</c:forEach>
				</div>
				
				<div style="width: 940px; height: 100px; margin-left: 19px; margin:40px auto 22px; background-color: #f7f7f7;">
					<div style="margin-top: 25px; margin-left: 35px; float: left; width: 136.44px;">
						<font style="font-size: 13px; color: #9b9b9b;">상품총합<br></font>
						<font style="font-size: 21px; font-weight: 700; margin-top: -20px;">${pTotalPrice }</font>
					</div>
					<img src="../meat/image/plus.svg" width="29px" height="29px" style="margin-top: 36px; float: left;">
					<div style="margin-top: 25px; margin-left: 35px; float: left; width: 119.67px;">
						<font style="font-size: 13px; color: #9b9b9b;">무통장 추가금액<br></font>
						<div style="margin-top: 20px;">
							<input type="text" readonly="readonly" id="Acc" style="width:130px; border: 0px; font-size: 21px; font-weight: 700; margin-top: -20px; background-color: #f7f7f7;"/>
						 </div>
					</div>
					
					<img src="../meat/image/plus.svg" width="29px;" height="29px" style="margin-top: 36px; float: left;">
					<div style="margin-top: 25px; margin-left: 35px; float: left; width: 83.89px;">
						<font style="font-size: 13px; color: #9b9b9b;">배송비<br></font>
						<font style="font-size: 21px; font-weight: 700; margin-top: -20px;">0원</font>
					</div>
					<img src="../meat/image/minus.svg" width="29px;" height="29px" style="margin-top: 36px; float: left;">
					<div style="margin-top: 25px; margin-left: 35px; float: left; width: 110.86px;">
						<font style="font-size: 13px; color: #9b9b9b;">쿠폰/적립금<br></font>
						<font style="font-size: 21px; font-weight: 700; margin-top: -20px;">${disPrice }</font>
					</div>
					<img src="../meat/image/equal.svg" width="29px;" height="29px" style="margin-top: 36px; float: left;">
					<div style="margin-top: 25px; margin-left: 35px; float: left; width: 136.44px;">
						<font style="font-size: 13px; color: #9b9b9b;">최종 결제예정금액<br></font>
						<div style="margin-top: 20px; margin-left: 20px;">
							<input type="text" readonly="readonly" id="Final" style="width:130px; border: 0px; font-size: 21px; font-weight: 700; margin-top: -20px; background-color: #f7f7f7;"/>
						 </div>		
					</div>
				</div>
			</div>
			
			<div style="margin-top: 50px; font-size: 21px; font-weight: bold; text-align: left;">배송정보</div>
			<div style="width: 978px; height: 58px; margin-top: 10px; margin-left: auto; margin-right: auto; border: 1px solid #e1dedf; color: #4a90e2; font-size: 18px; font-weight: 700; text-align: center;">
				<div style="margin-top: 14px;">${calendar } 오전 7시 전 도착(새벽배송)</div>
			</div>
			
			<div style="width: 978px; height: 118px; border: 1px solid #e1dedf; margin: 40px auto 60px;">
				<div style="margin-top: 21px; margin-left: 20px;">
					<div style="width: 958px; height: 24px;">
						<div style="width: 20px; height: 20px; background-color:#000; border-radius:50%; margin-top: 3px; float: left; color: #fff; text-align: center; font-size: 15px; font-weight: 700;">!</div>
						<div style="font-size: 16px; margin-left: 7px; margin-top:2px; float: left; font-weight: bold;">주문 전 확인사항!</div>
					</div>
					<div style="width:958px; height:40px; margin-left: 20px; margin-top: 13px; font-size: 13px; line-height: 20px; text-align: left;">
						주문 확정 버튼을 누르면 고객님이 주문하신 상품의 생산이 시작될 예정이며, 생산이 완료되면 결제가 진행됩니다.<br>
						정상적인 결제가 가능하도록 카드 정보를 한번 더 확인해주세요! (유효기간 만료, 사용한도 초과, 잔액부족 거래거절, 도난/분실 신청 등)
					</div>
				</div>
			</div>
		</div>
			
		<div style="width: 980px;" align="center">
			<button type="button" name="back" onclick="javascript:location.href='<%=cp %>/meatShop/payment3.do?change=1&addrNum=${addrNum }&cNum=${cNum }&userPoint=${userPoint }';" style="width: 50%; height: 60px; cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: gray; border: 0;">이전단계</button>
			<button type="button" name="forward" onclick="the_End();" style="width: 50%; height: 60px; cursor:pointer; float: right; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">주문확정</button>
		</div>
			
	</div>
</div>

<br><br><br><br><br><br><br><br>







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
			onclick="">
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