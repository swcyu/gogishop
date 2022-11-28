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
		document.myForm2.action = "<%=cp%>/meatShop/login.do";
		document.myForm2.submit();
		return;
	}
	document.myForm.action = "<%=cp%>/meatShop/qnaList1.do";
	document.myForm.submit();	
}

function hideBackground(){
    document.body.classList.remove('hidden');
    document.getElementById("dark").className = "unvisable";
    document.getElementById("addr_list").className = "unvisable";
    document.getElementById("addr_list_add").className = "unvisable";
  
}

function show_Addr_list(){
	document.body.classList.add('hidden');
	document.getElementById("dark").className = "visable";
	document.getElementById("addr_list").className = "visable";
	document.getElementById("addr_list_add").className = "unvisable";
	
}

function show_Addr_list_add(){
	document.body.classList.add('hidden');
	document.getElementById("dark").className = "visable";
	document.getElementById("addr_list").className = "unvisable";
	document.getElementById("addr_list_add").className = "visable";
	
}

function add_Addr(){
	
	if(!document.addrForm.recvName.value){
		alert("받으시는 분을 입력하세요.");
		document.addrForm.recvName.focus();
		return;
	}
	if(!document.addrForm.recvPhone.value){
		alert("연락처를 입력하세요.");
		document.addrForm.recvPhone.focus();
		return;
	}
	if(!document.addrForm.zipcode.value){
		alert("우편번호를 입력하세요.");
		document.addrForm.zipcode.focus();
		return;
	}
	if(!document.addrForm.recvAddr1.value){
		alert("주소를 입력하세요.");
		document.addrForm.recvAddr1.focus();
		return;
	}
	if(!document.addrForm.recvAddr2.value){
		alert("상세주소를 입력하세요.");
		document.addrForm.recvAddr2.focus();
		return;
	}
	document.addrForm.action = "<%=cp%>/meatShop/addAddr.do";
	document.addrForm.submit();
}
function update_Addr(){
	document.addrForm.action = "<%=cp%>/meatShop/updateAddr.do";
	document.addrForm.submit();
}

function select_Addr(){
	
	var addrNum = '<c:out value="${dto.addrNum}"/>'
		
	document.select_addr_form.action = "<%=cp%>/meatShop/payment.do";
	document.select_addr_form.submit();
	
}

function sendIt(){
	
	var addrNum = '<c:out value="${dto.addrNum}"/>'
	
	if(!addrNum){
		alert("배송지를 선택하세요!");
		return;
	}

	document.check.action = "<%=cp %>/meatShop/payment2.do?change=1&addrNum=" + addrNum;
	document.check.submit();
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



</form>


<c:if test="${change==2 }">
<div id="dark" style="width: 100%; height: 10000px; position: absolute; left: 0px; top:0px; z-index:9900; 
background-color: black; opacity: 60%" class="visable" onclick="hideBackground();"></div>

<div id="popup">
	<div id="addr_list" style="background:#ffffff; width: 680px; height: 520px; position: fixed; left:50%;
	 top:50%; z-index: 9999 ; margin: -340px 0 0 -260px;" class="visable" align="center">
	 	<div style="width: 100%; height: 100%;position: relative;" >
			<table style="margin-top: 20px;" width="620px">
				<tr style="text-align: center" height="70px;">
					<td style="font-size: 14pt; font-weight: bold; padding-left: 90px;">주소선택
						<input type="button" value="+ 신규주소등록" style="cursor: pointer;outline: none;" id="btn2" onclick="show_Addr_list_add();"/>
					</td>
				</tr>
			</table>
			
			<form action="" name="select_addr_form" method="post">
			<table width="620px" style="border-collapse: collapse; border-color: e1dedf; margin-right: 17px;">
				<tr style="text-align: center;">
					<td width="160px;" style="font-weight: 700;" bgcolor="#f7f7f7">수령인 정보</td>
					<td width="300px;" style="font-weight: 700;" bgcolor="#f7f7f7" >주소지 정보</td>
					<td width="80px;" style="font-weight: 700;" bgcolor="#f7f7f7"></td>
				</tr>
			</table>
			<div style="overflow-x:hidden; overflow-y:scroll; width: 100%; height: 300px;">
			<div style="width: 620px; ">
			<table width="620px;">
				<tr style="text-align: center;">
					<td width="160px;"></td>
					<td width="300px;"></td>
					<td width="80px;"></td>
				</tr>
				<c:forEach var="adto" items="${addrlists }">
				<tr height="80px">	
					<td style="font-size: 13px;">
						&nbsp;<input type="radio" name="addrNum" value="${adto.addrNum }"/>&nbsp;&nbsp;${adto.recvName }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${adto.recvPhone }
					</td>
					<td style="font-size: 13px;">${adto.recvAddr1 }<br>${adto.recvAddr2 }</td>
					<td style="padding-top: 5px;">
						<input type="button" value="변경" style="cursor: pointer;outline: none;" id="btn4" onclick="javascript:location.href='<%=cp%>/meatShop/updateAddr.do?selectAddr=${adto.addrNum }&addrNum=${addrNum }';"/>
						<input type="button" value="삭제" style="cursor: pointer;outline: none;" id="btn4" onclick="javascript:location.href='<%=cp%>/meatShop/deleteAddr.do?addrNum=${adto.addrNum }';"/>
					</td>
				</tr>
				<tr><td colspan="3" style="border-top: 1px solid #e1dedf;"></td></tr>
				</c:forEach>
			</table>
			</div>
			<input type="hidden" name="change" value="1">
			</div>
			<div style="width: 620px; margin-top: 20px;">
			<button type="button" name="select" onclick="select_Addr();" style="width: 100%; height: 60px;cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">선택 주소 사용하기</button>
			</div>
			</form>
		</div>
	</div>
	<div id="addr_list_add" style="background:#ffffff; width: 680px; height: 550px; position: fixed; left:50%;
	 top:50%; z-index: 9999; margin: -340px 0 0 -275px;" class="unvisable" align="center">
	 	<div style="width: 100%; height: 100%;position: relative;" >
			<table style="margin-top: 20px;" width="620px;" >
				<tr style="text-align: center" height="70px;">
					<td style="font-size: 14pt; font-weight: bold; text-align: center">주소 입력
					</td>
				</tr>
			</table>
			<form action="" name="addrForm" method="post">
			<table border="1" bordercolor="#e1dedf" style="border-collapse: collapse; border-color: e1dedf;" width="620px">
				<tr>
					<td style="font-size: 13px; text-align: center;" width="140px;" height="60px;" bgcolor="#f7f7f7"><font color="red">*</font> 받으시는 분 이름</td>
					<td style="font-size: 13px;" width="480px;"><input type="text" name="recvName" style="outline:none; width: 420px; height: 30px; margin-left: 20px; border: 1px solid #e1dedf; padding-left: 20px;"></td>
				</tr>
				<tr>
					<td style="font-size: 13px; text-align: center;" height="60px;" bgcolor="#f7f7f7"><font color="red">*</font> 연락처</td>
					<td><input type="text" name="recvPhone" style="width: 420px; outline: none;height: 30px; margin-left: 20px; border: 1px solid #e1dedf; padding-left: 20px;"></td>
				</tr>
				<tr>
					<td style="font-size: 13px; text-align: center;" height="180px;" bgcolor="#f7f7f7"><font color="red">*</font> 주소</td>
					<td>
						<table>
						<tr>
							<td width="350px;"><input type="text" name="zipcode" style="outline: none;width: 310px; padding-left: 20px;height: 30px; margin-left: 18px; border: 1px solid #e1dedf;"></td>
							<td width="110px" align="right" style="padding-right: 20px;"><input type="button" value="우편번호 찾기" id="btn3" style="cursor:pointer;outline: none;" onclick="show_Addr_list();"/></td>
						</tr>
						</table>
						
						<input type="text" name="recvAddr1" style="outline: none;width: 420px; height: 30px; margin-left: 20px; margin-top: 15px;border: 1px solid #e1dedf;padding-left: 20px;">
						<input type="text" name="recvAddr2" style="outline: none;width: 420px; height: 30px; margin-left: 20px; margin-top: 15px;border: 1px solid #e1dedf;padding-left: 20px;">
					</td>
				</tr>
			</table>
			
			<div style="font-size: 13px; text-align: right; width: 620px; color: #4a90e2; padding-top: 10px;">* 배송 요청 메세지는 도착 희망일 설정 후 입력하실 수 있습니다.</div>
			<div style="width: 620px; margin-top: 40px;">
			<button type="button" name="back" onclick="add_Addr();" style="width: 100%; height: 60px;cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">등록</button>
			</div>
			</form>
		</div>
	</div>
</div>

<div class="wrap" align="center">
	<div align="center" style="width: 1180px;">
		<div style="height: 50px; font-size: 26px; text-align: center; margin-top: 100px;">주문하기</div>
		<div style="margin-top: 20px;"><img src="../meat/image/process1.png"></div>
			
			
		<div align="center" style="width: 980px; padding-top: 100px;">
			<table width="980px;" style="padding-top: 100px;">
				<tr>
					<td width="400px;" align="left" style="font-size: 14pt;">보내시는 분</td>
				</tr>
			</table>
			
			<table width="980px;" border="1" bordercolor="#e1dedf" style="border-color: #e1dedf;border-collapse:collapse; margin-top: 15px;">
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" width="155px;" height="50px;" style="font-size: 13px; padding-left: 25px;">이름</td>
					<td width="775px;" style="font-size: 13px; padding-left: 25px;">${mdto.userName }</td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="50px;" style="font-size: 13px; padding-left: 25px;">전화번호</td>
					<td style="font-size: 13px; padding-left: 25px;">${mdto.userPhone }</td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="50px;" style="font-size: 13px; padding-left: 25px;">이메일</td>
					<td style="font-size: 13px; padding-left: 25px;">${mdto.emailCheck }</td>
				</tr>
			</table>
			
			<table width="980px;" style="margin-top: 70px;">
				<tr>
					<td width="400px;" align="left" style="font-size: 14pt;">받으시는 분</td>
					<td width="580px;" align="right">
						<input type="button" value="주소선택" class="btn1" style="cursor:pointer; outline: none;" onclick="show_Addr_list();"/>
					</td>
				</tr>
			</table>
			<c:if test="${!empty dto }">
			<table width="980px;" border="1" bordercolor="#e1dedf" style="border-color: #e1dedf;border-collapse:collapse; margin-top: 15px;">
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" width="155px;" height="50px;" style="font-size: 13px; padding-left: 25px;">이름</td>
					<td width="775px;" style="font-size: 13px; padding-left: 25px;">${dto.recvName }</td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="50px;" style="font-size: 13px; padding-left: 25px;">전화번호</td>
					<td style="font-size: 13px; padding-left: 25px;">${dto.recvPhone }</td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="75px;" style="font-size: 13px; padding-left: 25px;">주소</td>
					<td style="font-size: 13px; padding-left: 25px;">${dto.recvAddr1 }&nbsp;${dto.recvAddr2 }</td>
				</tr>
			</table>
			</c:if>
			<c:if test="${empty dto }">
			<table width="980px;" border="1" bordercolor="#e1dedf" style="border-color: #e1dedf;border-collapse:collapse; margin-top: 15px;">
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" width="155px;" height="50px;" style="font-size: 13px; padding-left: 25px;">이름</td>
					<td width="775px;" style="font-size: 13px; padding-left: 25px;"></td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="50px;" style="font-size: 13px; padding-left: 25px;">전화번호</td>
					<td style="font-size: 13px; padding-left: 25px;"></td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="75px;" style="font-size: 13px; padding-left: 25px;">주소</td>
					<td style="font-size: 13px; padding-left: 25px;"></td>
				</tr>
			</table>
			</c:if>
		</div>
		<form name="check">
		<input type="hidden" name="addrNum" value="${dto.addrNum }">
		<div style="width: 980px; margin-top: 100px;">
			<button type="button" name="back" onclick="javascript:location.href='<%=cp %>/meatShop/wishList.do';" style="width: 50%; height: 60px; cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: gray; border: 0;">이전단계</button>
			<button type="button" name="forward" onclick="sendIt();" style="width: 50%; height: 60px; cursor:pointer; float: right; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">다음단계</button>
		</div>
		</form>
	</div>
</div>
 
<br><br><br><br><br><br><br><br><br><br><br><br>


</c:if>

<c:if test="${change==1 }">
<div id="dark" style="width: 100%; height: 10000px; position: absolute; left: 0px; top:0px; z-index:9900; 
background-color: black; opacity: 60%" class="unvisable" onclick="hideBackground();"></div>

<div id="popup">
	<div id="addr_list" style="background:#ffffff; width: 680px; height: 520px; position: fixed; left:50%;
	 top:50%; z-index: 9999; margin: -340px 0 0 -260px;" class="unvisable" align="center">
	 	<div style="width: 100%; height: 100%;position: relative;" >
			<table style="margin-top: 20px;" width="620px">
				<tr style="text-align: center" height="70px;">
					<td style="font-size: 14pt; font-weight: bold; padding-left: 90px;">주소선택
						<input type="button" value="+ 신규주소등록" style="cursor: pointer;outline: none;" id="btn2" onclick="show_Addr_list_add();"/>
					</td>
				</tr>
			</table>
			<form action="" name="select_addr_form" method="post">
			<table width="620px" style="border-collapse: collapse; border-color: e1dedf; margin-right: 17px;">
				<tr style="text-align: center;">
					<td width="160px;" style="font-weight: 700;" bgcolor="#f7f7f7">수령인 정보</td>
					<td width="300px;" style="font-weight: 700;" bgcolor="#f7f7f7" >주소지 정보</td>
					<td width="80px;" style="font-weight: 700;" bgcolor="#f7f7f7"></td>
				</tr>
			</table>
			<div style="overflow-x:hidden; overflow-y:scroll; width: 100%; height: 300px;">
			<div style="width: 620px;">
			<table width="620px;">
				<tr style="text-align: center;">
					<td width="160px;"></td>
					<td width="300px;"></td>
					<td width="80px;"></td>
				<c:forEach var="adto" items="${addrlists }">
				<tr style="height:80px;">	
					<td style="font-size: 13px;">
						&nbsp;<input type="radio" name="addrNum" value="${adto.addrNum }"/>&nbsp;&nbsp;${adto.recvName }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${adto.recvPhone }
					</td>
					<td style="font-size: 13px;">${adto.recvAddr1 }<br>${adto.recvAddr2 }</td>
					<td style="padding-top: 5px;">
						<input type="button" value="변경" style="cursor: pointer;outline: none;" id="btn4" onclick="javascript:location.href='<%=cp%>/meatShop/updateAddr.do?selectAddr=${adto.addrNum }&addrNum=${addrNum }';"/>
						<input type="button" value="삭제" style="cursor: pointer;outline: none;" id="btn4" onclick="javascript:location.href='<%=cp%>/meatShop/deleteAddr.do?addrNum=${adto.addrNum }';"/>
					</td>
				</tr>
				<tr><td colspan="3" style="border-top: 1px solid #e1dedf;"></td></tr>
				</c:forEach>
			</table>
			</div>
			</div>
			<input type="hidden" name="change" value="1">
			<div style="width: 620px; margin-top: 20px;">
			<button type="button" name="select" onclick="select_Addr();" style="width: 100%; height: 60px;cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">선택 주소 사용하기</button>
			</div>
			</form>
		</div>
	</div>
	<div id="addr_list_add" style="background:#ffffff; width: 680px; height: 550px; position: fixed; left:50%;
	 top:50%; z-index: 9900;margin: -340px 0 0 -275px;" class="unvisable" align="center">
	 	<div style="width: 100%; height: 100%;position: relative;" >
			<table style="margin-top: 20px;" width="620px;" >
				<tr style="text-align: center" height="70px;">
					<td style="font-size: 14pt; font-weight: bold; text-align: center">주소 입력
					</td>
				</tr>
			</table>
			<form action="" name="addrForm" method="post">
			<table border="1" bordercolor="#e1dedf" style="border-collapse: collapse; border-color: e1dedf;" width="620px">
				<tr>
					<td style="font-size: 13px; text-align: center;" width="140px;" height="60px;" bgcolor="#f7f7f7"><font color="red">*</font> 받으시는 분 이름</td>
					<td style="font-size: 13px;" width="480px;"><input type="text" name="recvName" style="outline:none; width: 420px; height: 30px; margin-left: 20px; border: 1px solid #e1dedf; padding-left: 20px;"></td>
				</tr>
				<tr>
					<td style="font-size: 13px; text-align: center;" height="60px;" bgcolor="#f7f7f7"><font color="red">*</font> 연락처</td>
					<td><input type="text" name="recvPhone" style="width: 420px; outline: none;height: 30px; margin-left: 20px; border: 1px solid #e1dedf; padding-left: 20px;"></td>
				</tr>
				<tr>
					<td style="font-size: 13px; text-align: center;" height="180px;" bgcolor="#f7f7f7"><font color="red">*</font> 주소</td>
					<td>
						<table>
						<tr>
							<td width="350px;"><input type="text" name="zipcode" style="outline: none;width: 310px; padding-left: 20px;height: 30px; margin-left: 18px; border: 1px solid #e1dedf;"></td>
							<td width="110px" align="right" style="padding-right: 20px;"><input type="button" value="우편번호 찾기" id="btn3" style="cursor:pointer;outline: none;" onclick="show_Addr_list();"/></td>
						</tr>
						</table>
						
						<input type="text" name="recvAddr1" style="outline: none;width: 420px; height: 30px; margin-left: 20px; margin-top: 15px;border: 1px solid #e1dedf;padding-left: 20px;">
						<input type="text" name="recvAddr2" style="outline: none;width: 420px; height: 30px; margin-left: 20px; margin-top: 15px;border: 1px solid #e1dedf;padding-left: 20px;">
					</td>
				</tr>
			</table>
			<div style="font-size: 13px; text-align: right; width: 620px; color: #4a90e2; padding-top: 10px;">* 배송 요청 메세지는 도착 희망일 설정 후 입력하실 수 있습니다.</div>
			<div style="width: 620px; margin-top: 40px;">
			<button type="button" name="back" onclick="add_Addr();" style="width: 100%; height: 60px;cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">등록</button>
			</div>
			</form>
		</div>
	</div>
</div>
<div class="wrap" align="center">
	<div align="center" style="width: 1180px;">
		<div style="height: 50px; font-size: 26px; text-align: center; margin-top: 100px;">주문하기</div>
		<div style="margin-top: 20px;"><img src="../meat/image/process1.png"></div>
			
			
		<div align="center" style="width: 980px; padding-top: 100px;">
			<table width="980px;" style="padding-top: 100px;">
				<tr>
					<td width="400px;" align="left" style="font-size: 14pt;">보내시는 분</td>
				</tr>
			</table>
			
			<table width="980px;" border="1" bordercolor="#e1dedf" style="border-color: #e1dedf;border-collapse:collapse; margin-top: 15px;">
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" width="155px;" height="50px;" style="font-size: 13px; padding-left: 25px;">이름</td>
					<td width="775px;" style="font-size: 13px; padding-left: 25px;">${mdto.userName }</td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="50px;" style="font-size: 13px; padding-left: 25px;">전화번호</td>
					<td style="font-size: 13px; padding-left: 25px;">${mdto.userPhone }</td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="50px;" style="font-size: 13px; padding-left: 25px;">이메일</td>
					<td style="font-size: 13px; padding-left: 25px;">${mdto.emailCheck }</td>
				</tr>
			</table>
			
			<table width="980px;" style="margin-top: 70px;">
				<tr >
					<td width="400px;" align="left" style="font-size: 14pt;">받으시는 분</td>
					<td width="580px;" align="right">
						<input type="button" value="주소선택" class="btn1" style="cursor:pointer; outline: none;" onclick="show_Addr_list();"/>
					</td>
				</tr>
			</table>
			<c:if test="${!empty dto }">
			<table width="980px;" border="1" bordercolor="#e1dedf" style="border-color: #e1dedf;border-collapse:collapse; margin-top: 15px;">
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" width="155px;" height="50px;" style="font-size: 13px; padding-left: 25px;">이름</td>
					<td width="775px;" style="font-size: 13px; padding-left: 25px;">${dto.recvName }</td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="50px;" style="font-size: 13px; padding-left: 25px;">전화번호</td>
					<td style="font-size: 13px; padding-left: 25px;">${dto.recvPhone }</td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="75px;" style="font-size: 13px; padding-left: 25px;">주소</td>
					<td style="font-size: 13px; padding-left: 25px;">${dto.recvAddr1 }&nbsp;${dto.recvAddr2 }</td>
				</tr>
			</table>
			</c:if>
			<c:if test="${empty dto }">
			<table width="980px;" border="1" bordercolor="#e1dedf" style="border-color: #e1dedf;border-collapse:collapse; margin-top: 15px;">
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" width="155px;" height="50px;" style="font-size: 13px; padding-left: 25px;">이름</td>
					<td width="775px;" style="font-size: 13px; padding-left: 25px;"></td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="50px;" style="font-size: 13px; padding-left: 25px;">전화번호</td>
					<td style="font-size: 13px; padding-left: 25px;"></td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="75px;" style="font-size: 13px; padding-left: 25px;">주소</td>
					<td style="font-size: 13px; padding-left: 25px;"></td>
				</tr>
			</table>
			</c:if>
		</div>
		<form name="check" method="post">
		<input type="hidden" name="addrNum" value="${dto.addrNum }">
		<div style="width: 980px; margin-top: 100px;">
			<button type="button" name="back" onclick="javascript:location.href='<%=cp %>/meatShop/wishList.do';" style="width: 50%; height: 60px; cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: gray; border: 0;">이전단계</button>
			<button type="button" name="forward" onclick="sendIt();" style="width: 50%; height: 60px; cursor:pointer; float: right; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">다음단계</button>
		</div>
		</form>
	</div>
</div>
 
<br><br><br><br><br><br><br><br><br><br><br><br>

</c:if>




<form action="" name="myForm2" method="post">




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