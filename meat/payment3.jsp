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

	function hideBackground(){
	    document.body.classList.remove('hidden');
	    document.getElementById("dark").className = "unvisable";
	    document.getElementById("coupon_list").className = "unvisable";
	    document.getElementById("use_point").className = "unvisable";
	}
	
	function show_Coupon(){
		document.body.classList.add('hidden');
		document.getElementById("dark").className = "visable";
		document.getElementById("coupon_list").className = "visable";
		document.getElementById("use_point").className = "unvisable";
	}
	
	function show_Point(){
		document.body.classList.add('hidden');
		document.getElementById("dark").className = "visable";
		document.getElementById("coupon_list").className = "unvisable";
		document.getElementById("use_point").className = "visable";
	}
	
	function select_Coupon(){
		
		var userPoint = '<c:out value="${userPoint}"/>';
		
		document.myForm.action = "<%=cp%>/meatShop/payment3.do?userPoint=" + userPoint;
		document.myForm.submit();
		
	}

	function use_Point() {
		
		var userPoint = '<c:out value="${mdto.userPoint}"/>';
		var cNum = '<c:out value="${cNum}"/>';
		var total = '<c:out value="${total}"/>';
		
		alert(document.myForm.userPoint.value);
		if(parseInt(document.myForm.userPoint.value) > parseInt(userPoint)){
			alert("사용가능한 적립금을 입력하세요.");
			document.myForm.point.focus();
			return;
		}
		if(parseInt(document.myForm.userPoint.value) > parseInt(total)){
			alert("적립금이 상품금액을 초과합니다.");
			document.myForm.point.focus();
			return;
		}
		
		var usePoint = document.myForm.userPoint.value;
		
		document.myForm.action = "<%=cp%>/meatShop/payment3.do?cNum=" + cNum;
		document.myForm.submit();

	}
	
	function usePointAll() {
		
		var userPoint = '<c:out value="${mdto.userPoint}"/>';
		document.getElementById("userPoint").value = userPoint;
	
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




<input type="hidden" name="change" value="1">
<input type="hidden" name="addrNum" value="${addrNum }">
<input type="hidden" name="calendar" value="${calendar }">


<div id="dark" style="width: 100%; height: 10000px; position: absolute; left: 0px; top:0px; z-index:100; 
background-color: black; opacity: 60%" class="unvisable" onclick="hideBackground();"></div>

<div id="popup">
	<div id="coupon_list" style="background:#ffffff; width: 680px; height: 460px; position: fixed; left:50%;
	 top:50%; z-index: 9999 ; margin: -340px 0 0 -230px;" class="unvisable" align="center">
	 	<div style="width: 100%; height: 100%;position: relative;" >
	 	
			<table style="margin-top: 20px;" width="620px">
				<tr style="text-align: center" height="70px;">
					<td style="font-size: 16pt; font-weight: bold; text-align: center">쿠폰선택</td>
				</tr>
			</table>
			<div style="overflow: auto; width: 100%; height: 300px;">
			<div style="width: 620px; height: 298px; border: 1px solid #e1dedf; overflow: auto;overflow-x:hidden;">
			<table width="620px;">
				<tr style="text-align: center;">
					<td width="120px;"></td>
					<td width="210px;"></td>
					<td width="210px"></td>
				</tr>
				<c:forEach var="dto" items="${vCoupon }">
				<tr height="70px">	
					<td style="font-size: 13px;">
						&nbsp;<input type="radio" id="useCoupon" name="cNum" value="${dto.cNum }"/>&nbsp;&nbsp;${dto.cName }
					</td>
					<td style="font-size: 13px;">쿠폰 발급일 : ${dto.cStartDate }</td>
					<td style="font-size: 13px;">쿠폰 만료일 : ${dto.cEndDate }</td>
				</tr>
				<tr><td colspan="3" style="border-top: 1px solid #e1dedf;"></td></tr>
				</c:forEach>
			</table>
			</div>
			</div>
			<div style="width: 200px; margin-top: 18px;">
				<input type="button" value="사용" id="btn6" style="float:left; cursor: pointer; outline: none;" onclick="select_Coupon();"/>
				<input type="button" value="사용안함" id="btn6" style="float:right; cursor: pointer; outline: none;" onclick="hideBackground();"/>
			</div>
		</div>
	</div>
	<div id="use_point" style="background:#ffffff; width: 680px; height: 320px; position: fixed; left:50%;
	 top:50%; z-index: 9999 ; margin: -340px 0 0 -160px;" class="unvisable" align="center">
	 	<div style="width: 100%; height: 100%;position: relative;" >
	 	
			<table style="margin-top: 20px;" width="620px">
				<tr style="text-align: center" height="70px;">
					<td style="font-size: 16pt; font-weight: bold; text-align: center">적립금 입력</td>
				</tr>
			</table>
			
			<div align="left" style="margin-top: 30px;">
			<div style="margin-left: 100px; width: 580px;">
				<input type="text" id="userPoint" name="userPoint" value="0" style="border: 1px solid #d3d3d3; font-size:21px; outline: none; padding-left: 20px; width: 358px; height: 44px;"/>
				<input type="button" value="모두 사용" style="cursor: pointer; outline: none; width: 90px; height: 44px; font-size: 12px; font-weight: 700; 
					border-radius: 5px; background-color: #ffffff; border: 1px solid #d3d3d3;margin-bottom:5px; margin-left: 19px;" onclick="usePointAll();"/>
			</div>
		
			<div style="text-align: left; margin-left: 100px; margin-top: 13px;">
				<font style="font-size:16px; font-weight:600; color: #ccc;">사용가능 적립금 : ${mdto.userPoint }원</font></div>
			</div>
			
			<div style="width: 620px; margin-top: 30px;">
				<input type="button" value="확인" id="btn6" style="cursor: pointer; outline: none;" onclick="use_Point();"/>
			</div>
		</div>
	</div>
</div>

<div class="wrap" align="center">
	<div align="center" style="width: 1180px;">
		<div style="height: 50px; font-size: 26px; text-align: center; margin-top: 100px;">주문하기</div>
		<div style="margin-top: 20px;"><img src="../meat/image/process3.png"></div>
		
		
		<div style="width: 980px; height: 120px; margin-top: 117px; margin-bottom: 80px;">
			<div style="width: 478px; height: 118px; border: 1px solid #e1dedf; float: left; margin-right: 20px;">
				<table>
				<tr height="118px;">
					<td width="350px;" style="padding-left: 29px;">
						<font style="font-size:18px; font-weight:600;">쿠폰<br></font>
						<c:if test="${cNum==0 }">
							<div style="margin-top: 8px; font-size: 14px;">쿠폰을 선택해주세요</div>
						</c:if>
						<c:if test="${cNum!=0 }">
							<div style="margin-top: 8px; font-size: 14px;">${vdto.cName }</div>
						</c:if>
					</td>
					<td width="120px;" style="padding-right: 22px;">
						<input type="button" value="쿠폰 선택" id="btn3" style="cursor: pointer; outline: none;" onclick="show_Coupon();"/>
					</td>
				</tr>
				</table>
			</div>
			
			<div style="width: 478px; height: 118px; border: 1px solid #e1dedf; float: left;">
				<table>
				<tr height="118px;">
					<td width="350px;" style="padding-left: 29px;">
						<font style="font-size:18px; font-weight:600;">적립금<br></font>
						<div style="margin-top: 8px; font-size: 14px;">적용: ${userPoint }원 ㅣ 사용가능 적립금: ${mdto.userPoint }원</div>
					</td>
					<td width="120px;" style="padding-right: 22px;">
						<input type="button" value="적립금 사용" id="btn3" style="cursor: pointer; outline: none;" onclick="show_Point();"/>
					</td>
				</tr>
				</table>
			</div>
		</div>
			
		<div style="width: 980px;" align="center">
			<button type="button" name="back" onclick="javascript:location.href='<%=cp %>/meatShop/payment2.do?change=1&addrNum=${addrNum }';" style="width: 50%; height: 60px; cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: gray; border: 0;">이전단계</button>
			<button type="button" name="forward" onclick="javascript:location.href='<%=cp %>/meatShop/payment4.do?change=1&addrNum=${addrNum }&cNum=${cNum }&userPoint=${userPoint }&calendar=${calendar }';" style="width: 50%; height: 60px; cursor:pointer; float: right; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">다음단계</button>
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