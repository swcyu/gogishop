<%@page import="com.meatShop.CustomInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" type="text/css" href="<%=cp%>/meat/css/wishList.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/meat/data/meat.css"/>
<link rel=icon type=image/x-icon href=https://yookgak.com/website/favicon.ico>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>


<script type="text/javascript">
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
    function popup(){
    	if(<%=check%>){
    		document.myForm.action = "<%=cp%>/meatShop/login.do";
    		document.myForm.submit();
    		return;
    	}
    	document.body.classList.add('hidden'); 
    	document.getElementById("dark").className = "visable";
    	document.getElementById("popup").className = "visable";
    }
    function popupCancle(){
        document.body.classList.remove('hidden');
        document.getElementById("dark").className = "unvisable";
        document.getElementById("popup").className = "unvisable";
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

span{
	color: #000000;
	font-size: 12pt;
	line-height: 150%;
}

</style>


</head>
<body>
<!-- 사이드메뉴 -->
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
<!-- 상단 이벤트 -->
<form action="" name="myForm" method="post">
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



<!-- 메인 메뉴바 -->
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
		<ul style="float: right;padding-top:15px;">
			<li><a class="m2" href="<%=cp%>/meatShop/notify.do">공지사항</a></li>
			<li style="border-right: 1px solid white; padding-right: 20px">
			<a class="m2" href="<%=cp%>/meatShop/support.do">고객센터</a></li>
			
			
			<c:choose> 
			<c:when test="${empty sessionScope.customInfo.userId }">
				<li style="padding-left: 5px">
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

<div id="dark" style="width: 100%; height: 5000px; position: absolute; left: 0px; top:0px; z-index:9900; 
background-color: black; opacity: 70%" class="unvisable" onclick="popupCancle();"></div>
<div id="popup" style=" width: 500px; height: 260px; position: fixed;transition: all 0.5s;left:700px;
	 top:300px; z-index: 9999; padding-top: 20px"   class="unvisable" align="center">
	<div style="width: 100%; height: 100%; background-color: #ffffff; border-radius: 3px"  >
		<table>
			<tr height="50px"><td width="100%" align="center" style="padding-top:40px;  font-size: 15pt; font-weight: 900;">최소 주문금액 안내</td></tr>
			<tr height="30px"><td align="center" style="font-size: 13pt;padding-top:20px;">상품금액 15,000원 이상 구매하셔야<br>첫구매 이벤트 상품 주문이 가능합니다.</td></tr>
			<tr height="120px"><td align="center" valign="middle">
			<input type="button" value="확인" style="height: 30px; width: 100px;padding-bottom:20px" onclick="popupCancle();">
			</td></tr>			
		</table>
	</div>
</div>

<!-- Subject -->
<div align="center" style="height: 100px; margin-top: 100px;">
<font style="font-size: 26pt; font-family: 맑은 고딕;">장바구니</font>
</div>

<!-- 장바구니에 물건이 있는경우 물건정보 출력 -->
<c:if test="${wish==false }">
<div align="center" style="margin-bottom: 250px;">
<form action="" name="myForm" method="post">
<table border="0">
<tr>
	<td style="padding-right: 40px;" valign="top">
		<table width="860px" border="0"  cellpadding="0" cellspacing="0">
		<tr><td colspan="6" style="border-top: 2px solid black;"></td></tr>
			<tr height="70px">
				<td width="500" align="center" colspan="3">상품정보</td>
				<td width="160" align="center">수량</td>
				<td width="120" align="center">가격</td>
				<td width="40"></td>
			</tr>
		<tr><td colspan="6" style="border-top: 1px solid #cccccc;"></td></tr>	
		
		<!-- 무료증정 출력 -->
			<c:forEach var="fdto" items="${flists }">
			<tr height="140px">
				<td colspan="6">
				<div style="position: relative;">
				<table width="860">
					<tr height="140px">
					<td style="padding-left: 10px;padding-right: 10px;"><a href="<%=cp%>/meatShop/desc.do?pNum=${fdto.pNum }">
					<img src="../meat/wish/${fdto.pImage}" width="100" height="100" /></a></td>
					<td><a href="<%=cp%>/meatShop/desc.do?pNum=${fdto.pNum }">${fdto.pName }</a><br>
					<font style="font-size:10pt; color: #a89bb5;">${fdto.pOption }</font></td>
					<td align="right" style="font-size: 11pt;color: #a89bb5">${fdto.unit } 기준</td>
					
					<td align="center" width="160px">
					<table style="border: 1px solid #dddddd;">
						<tr height="40px">
						<td width="30px" valign="middle" align="center" style="font-size: 17pt;padding-bottom: 2px; color: #555555; cursor: pointer ; " 
						<c:if test="${fdto.pCount>1 }">
						onclick="javascript:location.href='<%=cp%>/meatShop/minusCount.do?listNum=${fdto.listNum }';"
						</c:if>
						><b>-</b></td>
	
						<td ><input type="text" readonly="readonly" value="${fdto.pCount }" 
						style="border: 0px;font-size: 15pt ; width: 40px; text-align: center; "></td>
						<td width="30px" valign="middle" align="center" style="font-size: 17pt;padding-bottom: 2px; color: #555555;cursor: pointer ;" 
						onclick="javascript:location.href='<%=cp%>/meatShop/plusCount.do?listNum=${fdto.listNum }';"><b>+</b></td>
						</tr>
					</table>
					</td>
				
				<td align="center" width="120">
					<input type="hidden" value="${fdto.pPrice }">
					<input type="text" readonly="readonly" value="${fdto.commaPrice }" style="border: 0px;
					font-size: 14pt ; width: 100%; text-align:center;">
				</td>
				<td align="right" width="40"><a href="<%=cp%>/meatShop/wishDelete.do?listNum=${fdto.listNum }"><img alt="" src="../meat/image/x.jpg"></a> </td>
				</tr></table>
				<c:if test="${total<15000 }">
					<div style="position: absolute; top: 0px; left: 0px; background-color: #ffffff; opacity: 70%;width: 812px;height: 141px;
					color: red;font-weight:900; text-align:center; padding-top: 60px" > 15,000원 이상 주문 시 증정</div>
			
				</c:if>
				
				</div></td>
			</tr>
			<tr><td colspan="6" style="border-top: 1px solid #cccccc;"></td></tr>

			</c:forEach>
			
		<!-- 일반상품 출력 -->
			<c:forEach var="ndto" items="${nlists }">
			<tr height="140px">
				<td style="padding-left: 10px;padding-right: 10px;"><a href="<%=cp%>/meatShop/desc.do?pNum=${ndto.pNum }"><img src="../meat/wish/${ndto.pImage}" width="100" height="100" /></a></td>
				<td><a href="<%=cp%>/meatShop/desc.do?pNum=${ndto.pNum }">${ndto.pName }</a><br><font style="font-size:10pt; color: #a89bb5;">${ndto.pOption }</font></td>
				<td align="right" style="font-size: 11pt;color: #a89bb5">${ndto.unit } 기준</td>
				
				<td align="center">
				<table style="border: 1px solid #dddddd;">
					<tr height="40px">
					<td width="30px" valign="middle" align="center" style="font-size: 17pt;padding-bottom: 2px; color: #555555; cursor: pointer ; " 
					<c:if test="${ndto.pCount>1 }">
					onclick="javascript:location.href='<%=cp%>/meatShop/minusCount.do?listNum=${ndto.listNum }';"
					</c:if>
					><b>-</b></td>

					<td ><input type="text" readonly="readonly" value="${ndto.pCount }" 
					style="border: 0px;font-size: 15pt ; width: 40px; text-align: center; "></td>
					<td width="30px" valign="middle" align="center" style="font-size: 17pt;padding-bottom: 2px; color: #555555;cursor: pointer ;" 
					onclick="javascript:location.href='<%=cp%>/meatShop/plusCount.do?listNum=${ndto.listNum }';"><b>+</b></td>

					</tr>
				</table>
				</td>
				
				<td align="center">
					<input type="hidden" value="${ndto.pPrice }">
					<input type="text" readonly="readonly" value="${ndto.commaPrice }" style="border: 0px;
					font-size: 14pt ; width: 100%; text-align:center;"></td>
				</td>
				<td align="right"><a href="<%=cp%>/meatShop/wishDelete.do?listNum=${ndto.listNum }"><img alt="" src="../meat/image/x.jpg"></a> </td>
			</tr>
			<tr><td colspan="6" style="border-top: 1px solid #cccccc;"></td></tr>

			</c:forEach>
		</table>
	</td>
	<td valign="top" width="300px">
		<div align="center" style="background-color: #f8f8f8; width: 300px;  border-top: 2px solid black;padding-bottom: 25px;">
		<table  border="0"  cellpadding="0" cellspacing="0">
			<tr >
				<td align="left" style="height:39px;width:150px; border-bottom: 1px solid #e1dedf; padding-top: 15px; padding-bottom: 15px; 
				font-size: 11pt;">총 상품 금액</td>
				<td align="right" style="height:39px;width:70px; border-bottom: 1px solid #e1dedf; padding-top: 15px; padding-bottom: 15px; ">
				<input type="hidden" id="total" value="${total }" >
				<input type="text" readonly="readonly" id="totalPrice" value="${totalPrice }" style="border: 0px;
					font-size: 11pt ; width: 100%; text-align:right; background-color: #f8f8f8;"></td>				
			</tr>
			<tr >
				<td align="left" style="font-size: 11pt; padding-top: 15px;">총배송비</td>
				<td align="right" style="font-size: 11pt; padding-top: 15px;">${deliveryCost }</td>
			</tr>
			<tr>
				<td align="right" style="font-size: 9pt; padding-top: 15px; color:#9b9b9b;">기본 배송비</td>
				<td align="right" style="font-size: 9pt; padding-top: 15px; color:#9b9b9b;">2,500원</td>
			</tr>
			<c:if test="${delivery==0 }">
			<tr>
				<td align="right" style="font-size: 9pt; padding-top: 15px;border-bottom: 1px solid #e1dedf;padding-bottom: 15px;color: #4a90e2">첫구매 무료배송</td>
				<td align="right" style="font-size: 9pt; padding-top: 15px;border-bottom: 1px solid #e1dedf;padding-bottom: 15px;color: #4a90e2">-100%</td>
			</tr>
			<tr><td align="center" colspan="2" style="font-size: 9pt;padding-top: 15px; color: #4a90e2">첫구매 무료배송 혜택이 적용되었습니다.</td></tr>
			</c:if>
			<c:if test="${delivery>0 }">
			<tr>
				<td align="right" style="font-size: 9pt; padding-top: 15px;border-bottom: 1px solid #e1dedf;padding-bottom: 15px;color: #4a90e2"></td>
				<td align="right" style="font-size: 9pt; padding-top: 15px;border-bottom: 1px solid #e1dedf;padding-bottom: 15px;color: #4a90e2"></td>
			</tr>
			<tr><td align="center" colspan="2" style="font-size: 9pt;padding-top: 15px; color: #4a90e2"></td></tr>
			</c:if>
		</table>
		<table cellspacing="10px;" border="0" style="margin-top: 20px;">	
			<tr><td width="220px" align="right" style="font-size: 9pt;font-weight: 900;">예상 결제 금액<br>
			<input type="hidden" id="finalPrice" value="${finalPrice }" >
			<input type="text" readonly="readonly" id="totalPrice2" value="${commaFinalPrice }" style="border: 0px;
					font-weight:bolder; font-size: 18pt ; width: 100%; text-align:right; background-color: #f8f8f8; color: #d0021b;"></td>			
			</td></tr>
			<tr height="10px;"><td></td></tr>
			
			<c:if test="${free==false&&total<15000 }">
				<tr height="60px"><td align="center" valign="middle" style="background-color: #d0021b; cursor:pointer;
				font-size: 11pt;font-weight: 900; color: white;" onclick="popup();">전체상품 주문하기</td></tr>
			
			</c:if>
			
			<c:if test="${free==true||(free==false&&total>=15000) }">
				<tr height="60px"><td align="center" valign="middle" style="background-color: #d0021b; cursor:pointer;
				font-size: 11pt;font-weight: 900; color: white;" onclick="javascript:location.href='<%=cp%>/meatShop/payment.do?change=1&addrNum=0';">전체상품 주문하기</td></tr>
			
			</c:if>

			<tr height="10px;"><td></td></tr>
			<tr height="60px"><td align="center" valign="middle" style="background-color: #acacac; cursor:pointer; 
			font-size: 11pt;font-weight: 900; color: white;" onclick="javascript:location.href='<%=cp%>/meatShop/list.do';">쇼핑계속하기</td></tr>
		</table>
		
		</div>
	</td>
</tr>


</table>
</form>
</div>
</c:if>


<!-- 장바구니에 물건이 없는경우 출력화면 -->
<c:if test="${wish==true }">
<div align="center">
<table width="860px" border="0"  cellpadding="0" cellspacing="0">
	
<tr height="120px">
	<td width="1200px" style="padding-top:40px;  border-top: 2px solid black; color: #e1dedf; font-size: 28pt " align="center">장바구니에 담은 상품이 없습니다.
		
	</td>
</tr>
<tr height="180px">
	<td style="border-bottom: 1px solid #cccccc; padding-top: 40px;" align="center" valign="top">
		<div style="width: 260px; height: 75px; background-color: black; padding-top: 17px; cursor: pointer;" 
		onclick="javascript:location.href='<%=cp %>/meatShop/list.do';" >
			<font style="font-size: 12pt;  color: white;">쇼핑 계속하기</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<font style="font-size: 18pt; color: white; font-weight: 900">→</font>	
		</div>
		
	</td>
</tr>

</table>
</div>

</c:if>


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