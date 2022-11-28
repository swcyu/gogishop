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
	$('input.calendar').pignoseCalendar({
	modal: true,
	format: 'YYYY-MM-DD', // date format string. (2017-02-02)
	lang: 'ko',
	disabledWeekdays: [0, 1, moment().add(1, 'd').format("YYYY-MM-DD")],
	minDate: moment().format("YYYY-MM-DD"),
	date: moment().add(2, 'd')
	});
});

$(function() {
	$('#selectBox').change(function() {
		var state = jQuery('#selectBox option:selected').val();
		
		if(state=='공동현관 비밀번호'){
			jQuery('.layer1').show();
		}else {
			jQuery('.layer1').hide();
		}
		
		if(state=='세대 호출'){
			jQuery('.layer2').show();
		}else {
			jQuery('.layer2').hide();
		}
		
		if(state=='경비실 호출'){
			jQuery('.layer3').show();
		}else {
			jQuery('.layer3').hide();
		}
		
		if(state=='자유 출입 가능'){
			jQuery('.layer4').show();
		}else {
			jQuery('.layer4').hide();
		}

		if(state=='경비실로 배송'){
			jQuery('.layer5').show();
		}else{
			jQuery('.layer5').hide();
		}
		
		if(state=='기타방법'){
			jQuery('.layer6').show();
		}else{
			jQuery('.layer6').hide();
		}
	});
});
	function init(){
		document.getElementById("calendar").value = moment().add(2, 'd').format("YYYY-MM-DD");
		jQuery('.layer1').hide();
		jQuery('.layer2').hide();
		jQuery('.layer3').hide();
		jQuery('.layer4').hide();
		jQuery('.layer5').hide();
		jQuery('.layer6').hide();
	}

	function hideBackground(){
	    document.body.classList.remove('hidden');
	    document.getElementById("dark").className = "unvisable";
	    document.getElementById("deliever_ask").className = "unvisable";
	}
	
	function show_deliever(){
		document.body.classList.add('hidden');
		document.getElementById("dark").className = "visable";
		document.getElementById("deliever_ask").className = "visable";
	}
	
	function sendIt() {
		
		var calendar = document.getElementById("calendar").value;
		var addrNum = '<c:out value="${addrNum}"/>'
		document.myForm.action = "<%=cp%>/meatShop/payment3.do?change=1&cNum=0&userPoint=0&addrNum="+addrNum+"&calendar="+calendar;
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


<div class="wrap" align="center">
	<div align="center" style="width: 1180px;">
		<div style="height: 50px; font-size: 26px; text-align: center; margin-top: 100px;">주문하기</div>
		<div style="margin-top: 20px;"><img src="../meat/image/process2.png"></div>
		
		<div align="center" style="width: 787px;">
			<div>
			<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; border: 1px solid #bbbbbb; margin-top: 50px;">
				<tr height="100px;">
					<td width="120px;" style="padding-left:23px; font-size: 18px; font-weight:600;">도착희망일</td>
					<td width="665px;">
						<input type="text" id="calendar" class="calendar" style="width:350px; height:50px; cursor:pointer; outline:none; font-size: 18px; padding-left: 15px; margin-left: 25px; border: 1px solid black;
						 background-image:url('../meat/image/calendar.png'); background-repeat: no-repeat; background-position: 300px 5px; "/>
					</td>
				</tr>
				<tr><td colspan="2" style="border-top: 1px solid #bbbbbb;"></td></tr>
				<tr height="100px;">
					<td width="120px;" style="padding-left:23px; font-size: 18px; font-weight:600;">배송 시간</td>
					<td width="665px;" style="font-size: 18px; padding-left: 23px;">오전 7시 전 도착(새벽배송)</td>
				</tr>
			</table>
			</div>
			
			
			<div style="height: 128px; width: 785px; margin-top: 30px;">
				<div style="background-color: #b8b8b8; color:gray; height: 128px; width: 381px; float: left; border:1px solid #bbbbbb; border-radius: 10px;">
				<table>
				<tr height="128px;">
					<td width="130px;" align="center">
						<img src="../meat/image/freedeliever.svg" width="99px;" height="45px;" style="margin-bottom: 10px;"><br>
						<font style="font-size:18px; font-weight:600;">신선플랜</font>
						<img src="../meat/image/qicon.png" style="cursor: pointer;" onclick="javascript:location.href='<%=cp%>/meatShop/freshPlan.do';" width="19px;" height="19px">
					</td>
					<td width="250px;">
					<font style="font-size:14px; font-weight:600; color: gray;">이번 주문 배송비만으로<br>한달 간 3번 더 무료배송! (즉시적용)<br></font>
					<font style="font-size:12px;">첫구매 무료배송이 적용되었습니다.</font>
					</td>
				</tr>
				</table>
				</div>
				
				<div style="height: 128px; width: 383px; float: right;">
					<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; border: 1px solid #bbbbbb;">
					<tr height="128px;">
						<td width="100px;" style="text-align: center;">
							<font style="font-size:12px; font-weight:600; color: gray;">기본배송비</font>
							<font style="font-size: 18px; font-weight:600;"><br>2500원</font>
						</td>
						<td><img src="../meat/image/minus.png" width="35px;" height="35px;"></td>
						<td width="100px;" style="text-align: center;">
							<font style="font-size: 12px; font-weight:600; color: gray;">신선할인</font>
							<font style="font-size: 18px; font-weight:600;"><br>2500원</font>
							</td>
						<td><img src="../meat/image/equal.png" width="35px;" height="35px;"></td>
						<td width="100px;" style="text-align: center;">
							<font style="font-size: 12px; font-weight:600; color: gray;">배송비 합계</font>
							<font style="font-size: 18px; font-weight:600; color: red;"><br>0원</font>
						</td>
					</tr>
					</table>
				</div>
			</div>
		</div>
		
		<div style="width: 980px; margin-top: 50px;" align="center">
			<button type="button" name="back" onclick="javascript:location.href='<%=cp %>/meatShop/payment.do?change=1&addrNum=${addrNum }';" style="width: 50%; height: 60px; cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: gray; border: 0;">이전단계</button>
			<button type="button" name="forward" onclick="show_deliever();" style="width: 50%; height: 60px; cursor:pointer; float: right; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">다음단계</button>
		</div>
			
	</div>
</div>

<br><br><br><br><br>




<div id="dark" style="width: 100%; height: 10000px; position: absolute; left: 0px; top:0px; z-index:9900; 
background-color: black; opacity: 60%" class="unvisable" onclick="hideBackground();"></div>

<div id="popup">
	<div id="deliever_ask" style="background:#ffffff; width: 680px; height: 550px; position: fixed; left:50%;
	 top:50%; z-index: 9999; margin: -340px 0 0 -275px;" class="unvisable" align="center">
	 	<div style="width: 100%; height: 100%;position: relative;" >
			<table style="margin-top: 20px;" height="" width="620px;" >
				<tr style="text-align: center" height="40px;">
					<td style="font-size: 16pt; font-weight: bold; text-align: center">새벽배송 요청사항</td>
				</tr>
				<tr>
					<td style="font-size:14px; font-weight:600; color: gray; text-align: center;">안전한 배송을 위해 정확히 입력해주세요.</td>
				</tr>
			</table>
			<div style="width: 575px; height: 350px;">
			<div style="width: 575px; margin-top: 28px; margin-bottom: 10px;">
				<div align="left" style="border: 1px solid #bbbbbb;">
					<div style="margin-top: 25px; margin-left: 20px;"><font color="red">*</font><font style="font-size: 13px;"> 공동현관 출입방법<br></font></div>
					<select name="deliver" id="selectBox" style="margin-bottom: 19px; margin-top: 10px; margin-left: 20px; width: 212px; height: 40px; border: 1px solid #000; font-size: 13px; padding-left: 9px;">
						<option value="">출입방법을 선택해주세요.</option>
						<option value="공동현관 비밀번호">공동현관 비밀번호</option>
						<option value="세대 호출">세대 호출</option>
						<option value="경비실 호출">경비실 호출</option>
						<option value="자유 출입 가능">자유 출입 가능</option>
						<option value="경비실로 배송">경비실로 배송</option>
						<option value="기타방법">기타방법</option>
					</select>
					
					<div class="layer1" align="left" style="margin-bottom: 19px; margin-left: 20px;">
						<input type="text" name="deliv_option" placeholder="예) # + 1004 + 종버튼" style="width: 388px; height: 29px; padding-left: 9px;outline:none; font-size: 13px; margin-top: 10px; margin-bottom:5px; border: 1px solid #e1dedf;"><br>
						<font style="font-size: 13px; color: #4a90e2;">눌러야 하는 전체 버튼(#,* 동 포함)을 입력해주세요.</font>
					</div>
					<div class="layer2" align="left" style="margin-bottom: 19px; margin-left: 20px;">
						<input type="text" name="deliv_option" placeholder="예) 호출 버튼 + 1004 + 종버튼" style="width: 388px; height: 29px; padding-left: 9px;outline:none; font-size: 13px; margin-top: 10px; margin-bottom:5px; border: 1px solid #e1dedf;"><br>
						<font style="font-size: 13px; color: #4a90e2;">세대 호출 방법을 입력해주세요.</font>
					</div>
					<div class="layer3" align="left" style="margin-bottom: 19px; margin-left: 20px;">
						<input type="text" name="deliv_option" placeholder="예) 관리실 버튼 + 호출 버튼" style="width: 388px; height: 29px; padding-left: 9px;outline:none; font-size: 13px; margin-top: 10px; margin-bottom:5px; border: 1px solid #e1dedf;"><br>
						<font style="font-size: 13px; color: #4a90e2;">경비실 호출 방법을 입력해주세요.</font>
					</div>
					<div class="layer4" style="margin-bottom: 19px; margin-left: 20px;"></div>
					<div class="layer5" align="left" style="margin-bottom: 19px; margin-left: 20px;">
						<input type="text" name="deliv_option" placeholder="예)203동 앞 경비실로 배송" style="width: 388px; height: 29px; padding-left: 9px;outline:none; font-size: 13px; margin-top: 10px; margin-bottom:5px; border: 1px solid #e1dedf;"><br>
						<font style="font-size: 13px; color: #4a90e2;">경비실의 정확한 위치를 입력해주세요.</font>
					</div>
					<div class="layer6" align="left" style="margin-bottom: 19px; margin-left: 20px;">
						<input type="text" name="deliv_option" style="width: 388px; height: 29px; outline:none; padding-left: 9px;font-size: 13px; margin-top: 10px; margin-bottom:5px;border: 1px solid #e1dedf;"><br>
						<font style="font-size: 13px; color: #4a90e2;">새벽배송 특성 상 배송 시 전화 또는 세대호출이 불가합니다.</font>
					</div>
				</div>
				<div style="font-size: 13px; color:#686868; text-align: left; margin-top: 10px;">- 공동현관 출입이 어려운 경우(ex. 비밀번호 오류, 경비원 부재) 및 엘리베이터 사용이 불가한 경우<br>&nbsp;&nbsp;공동현관 앞 혹은 경비실로 대응배송될 수 있습니다.<br>
				- 입력하신 정보는 배송 이외의 목적으로 절대 활용되지 않습니다.<br>
				- 배송 된 상품 분실 시 보상이 어려운 점 양해 부탁드립니다.<br>
				</div>
			</div>
			</div>
			<div style="width: 620px;">
			<button type="button" name="forward" onclick="sendIt();" style="width: 100%; height: 60px;cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">배송 요청사항 등록</button>
			</div>
			
		</div>
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