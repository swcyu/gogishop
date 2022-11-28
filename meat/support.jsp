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






	
	
	

<div align="center">	
<div align="center" style="width: 1200px; text-align: left; margin-top: 100px;">
<font style="font-size: 22pt;">자주 묻는 질문</font>
</div>
<div align="center" style="width: 1200px; text-align: left; margin-top: 50px;">

<table>
<tr style="height: 45px">
<td style="width: 740px">
<ul class="nav nav-pills" id="support-tab" role="tablist" style="background-color: white;">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="product-tab" data-bs-toggle="pill" data-bs-target="#product" type="button" role="tab" aria-controls="product" aria-selected="true"
    style="">
    상품관련</button>
  </li>  
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="order_pay-tab" data-bs-toggle="pill" data-bs-target="#order_pay" type="button" role="tab" aria-controls="order_pay" aria-selected="false">
    주문/결제</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="delivery-tab" data-bs-toggle="pill" data-bs-target="#delivery" type="button" role="tab" aria-controls="delivery" aria-selected="false">
    배송</button>
  </li>
  
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="cancel_exchange_refund-tab" data-bs-toggle="pill" data-bs-target="#cancel_exchange_refund" type="button" role="tab" aria-controls="cancel_exchange_refund" aria-selected="false">
    취소/교환/환불</button>
  </li>
</ul>
</td>
<td style="width: 460px; text-align: center;">
<div style="width: 160px; height: 45px; background-color: #316afc; float: right; padding-top: 15px; cursor: pointer;"
onclick="oneoneQ()">
<font color="white" size="2pt">1:1 문의하러 가기</font></div>
</td>
</tr>
</table>


<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show active" id="product" role="tabpanel" aria-labelledby="product-tab">
  
  <!-- 상품관련 -->
  
<div align="center" style="width: 1200px; text-align: left; margin-top: 10px;">


<ul class="nav nav-pills" id="support-tab" role="tablist" style="background-color: white;">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="pork-tab" data-bs-toggle="pill" data-bs-target="#pork" type="button" role="tab" aria-controls="pork" aria-selected="true"
    style="">
    돼지</button>
  </li>  
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="cow-tab" data-bs-toggle="pill" data-bs-target="#cow" type="button" role="tab" aria-controls="cow" aria-selected="false">
    소</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="chicken-tab" data-bs-toggle="pill" data-bs-target="#chicken" type="button" role="tab" aria-controls="chicken" aria-selected="false">
    닭</button>
  </li>
  
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="susan-tab" data-bs-toggle="pill" data-bs-target="#susan" type="button" role="tab" aria-controls="susan" aria-selected="false">
    수산</button>
  </li>
  
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="mealkit-tab" data-bs-toggle="pill" data-bs-target="#mealkit" type="button" role="tab" aria-controls="mealkit" aria-selected="false">
    밀키트</button>
  </li>
  
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="milk-tab" data-bs-toggle="pill" data-bs-target="#milk" type="button" role="tab" aria-controls="milk" aria-selected="false">
    우유</button>
  </li>
  
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="egg-tab" data-bs-toggle="pill" data-bs-target="#egg" type="button" role="tab" aria-controls="egg" aria-selected="false">
    달걀</button>
  </li>
  
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="baby-tab" data-bs-toggle="pill" data-bs-target="#baby" type="button" role="tab" aria-controls="baby" aria-selected="false">
    이유식</button>
  </li>
  
  
</ul>

<div style="height: 20px"></div>

<!-- 상품관련 내용 -->
<div class="tab-content" id="pills-tabProductContent" style="border: 1px solid #c2c2c2">

  <div class="tab-pane fade show active" id="pork" role="tabpanel" aria-labelledby="pork-tab">
  <!-- 돼지 상품관련내용 -->

  <div class="accordion accordion-flush" id="proPork">
  <div class="accordion-item">
    <h2 class="accordion-header" id="fhPork1">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcPork1" aria-expanded="false" aria-controls="fcPork1">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 비계 없는 부분으로 주실 수 있나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcPork1" class="accordion-collapse collapse" aria-labelledby="fhPork1" data-bs-parent="#proPork" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      정육각에서는 비계 두께가 일정 수준 이상인 1등급 이상의 돼지만 판매하고 있습니다. 돼지고기의 풍미는 비계에서 나오고 등급이 높을수록 비계 층이 두꺼워지다보니 비계가 없는 부위로만 생산해드리기가 어려운 점 양해 부탁드립니다.<br><br>
      또한 최상의 품질을 유지하기 위해 동일한 농장에서 균일한 방법으로 기른 돼지고기만을 판매하고 있지만 식품 특성상 공산품과 같이 항상 똑같은 비계 두께를 유지하기는 어려워 개체의 차이에 따라 비계의 양이 다를 수 있습니다.<br><br>
      생산 시 가급적 부위별로 가장 맛있게 드실 수 있는 적절한 비계와 살코기 비율 범위 내의 상품을 보내드리고 있으며, 드셨을 때 만족하실 수 있는 상품만 보내드릴 수 있도록 최선을 다하겠습니다.  <br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="fhPork2">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcPork2" aria-expanded="false" aria-controls="fcPork2">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 그램(g) 수나 두께를 옵션 외의 것으로 변경해 주세요.
       </td></tr></table>
      </button>
    </h2>
    <div id="fcPork2" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#proPork" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      현재의 생산 시스템 하에서는 홈페이지/앱에 안내된 기준 무게 및 옵션(두께)의 형태 이외의 개별 맞춤 생산이 어려운 점 이용에 양해 부탁드립니다.<br><br>
      향후 보다 다양한 무게 및 옵션(두께) 형태를 제공해드릴 수 있도록 노력하겠습니다.<br>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="fhPork3">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcPork3" aria-expanded="false" aria-controls="fcPork3">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 고기 색깔이 이상해요.
       </td></tr></table>
      </button>
    </h2>
    <div id="fcPork3" class="accordion-collapse collapse" aria-labelledby="fhPork3" data-bs-parent="#proPork" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      정육각에서는 상품을 가장 신선하게 배송해드리기 위해 진공스킨포장 방식으로 상품을 포장해드립니다.<br/><br/>
	  진공 포장은 특성 상 산소 결합이 차단되어 고기의 색이 탁하게 변하지만, 공기 중에 15분 정도 꺼내어 놓으시면 원래의 선홍빛 색을 찾으니 안심하고 드셔도 됩니다.<br/>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="fhPork4">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcPork4" aria-expanded="false" aria-controls="fcPork4">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 유통기한은 언제까지인가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcPork4" class="accordion-collapse collapse" aria-labelledby="fhPork4" data-bs-parent="#proPork" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      냉장 보관 시 포장일로부터 5일까지이나, 포장을 개봉한 후에는 가급적 빨리 드시기 바랍니다.<br/><br/>
      개별 상품의 유통기한은 상품 라벨에 기재되어 있습니다.<br/>
      </div>
    </div>
  </div>
  
  
</div>
</div>
  <div class="tab-pane fade" id="cow" role="tabpanel" aria-labelledby="cow-tab">
   <!-- 소 상품관련내용 -->
   
  <div class="accordion accordion-flush" id="proCow">
  <div class="accordion-item">
    <h2 class="accordion-header" id="fhCow1">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcCow1" aria-expanded="false" aria-controls="fcCow1">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 왜 소고기는 숙성을 하나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcCow1" class="accordion-collapse collapse" aria-labelledby="fhCow1" data-bs-parent="#proCow" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      정육각에서는 판매 중인 상품 특성별로 고객님께서 가장 맛있게 드실 수 있는 때의 상품을 가장 신선하게 제공해드리고 있습니다.<br><br>
      이를 위해 갓 잡은 때 가장 맛있는 상품은 갓 잡아 보내드리고, 숙성을 했을 때 가장 맛있는 상품은 숙성을 통해 맛을 극대화시킨 뒤 보내 드리고 있습니다.<br><br>
      소고기는 돼지고기/닭고기와는 달리 촘촘한 단백질 조직 때문에 갓 도축한 상태일 때 바로 먹으면 질긴 특성이 있으며, 부드럽고 풍미 가득한 맛을 내어 먹기 좋은 상태로 만들기 위해 숙성이 필요합니다.<br><br>
      정육각에서는 소고기 부위별로 최고의 맛을 내는 숙성 기간을 찾아서 그 기간 동안 전문적인 숙성을 통해 신선함은 지키면서 고기가 가장 맛있는 상태일 때 고객님께 보내 드리고 있습니다.<br><br>
      숙성을 거치면 맛은 더욱 올라가지만, 숙성 기간 중에 신선도가 떨어지는 것은 아니니 안심하고 드셔도 됩니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
  <h2 class="accordion-header" id="fhCow2">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcCow2" aria-expanded="false" aria-controls="fcCow2">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 두께를 선택할 수 있나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcCow2" class="accordion-collapse collapse" aria-labelledby="fhCow2" data-bs-parent="#proCow" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
     판매중인 소고기 등심/안심 구이용 상품의 경우 옵션 선택을 통해 구이용(15mm), 스테이크용(30mm) 중 원하시는 두께를 선택하실 수 있습니다.<br><br>
     선호도 및 요리 용도에 맞게 선택하여 주시면 됩니다.<br> 
      </div>
    </div>
  </div>  
  <div class="accordion-item">
  <h2 class="accordion-header" id="fhCow3">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcCow3" aria-expanded="false" aria-controls="fcCow3">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 포장 개봉 시 시큼한 냄새가 나요.
       </td></tr></table>
      </button>
    </h2>
    <div id="fcCow3" class="accordion-collapse collapse" aria-labelledby="fhCow3" data-bs-parent="#proCow" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
     유통기한 이내의 상품 개봉 시 일시적으로 나타나는 냄새는 진공포장으로 인해 발생하는 것으로, 15~30분 후에 자연적으로 없어지니 안심하셔도 좋습니다.<br><br>
     하지만 보관 부주의 등으로 인한 상품 변질 시에는 시큼한 냄새가 사라지지 않으며 고기 표면이 끈적거리는 현상이 보입니다.<br><br>
     이런 경우 상품을 섭취하지 마시고 고객센터(1800-0658)로 문의해주시기 바랍니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
  <h2 class="accordion-header" id="fhCow4">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcCow4" aria-expanded="false" aria-controls="fcCow4">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 그램(g) 수나 두께를 옵션 외의 것으로 변경해 주세요.
       </td></tr></table>
      </button>
    </h2>
    <div id="fcCow4" class="accordion-collapse collapse" aria-labelledby="fhCow4" data-bs-parent="#proCow" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
     유통기한 이내의 상품 개봉 시 일시적으로 나타나는 냄새는 진공포장으로 인해 발생하는 것으로, 15~30분 후에 자연적으로 없어지니 안심하셔도 좋습니다.<br><br>
     하지만 보관 부주의 등으로 인한 상품 변질 시에는 시큼한 냄새가 사라지지 않으며 고기 표면이 끈적거리는 현상이 보입니다.<br><br>
     이런 경우 상품을 섭취하지 마시고 고객센터(1800-0658)로 문의해주시기 바랍니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
  <h2 class="accordion-header" id="fhCow5">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcCow5" aria-expanded="false" aria-controls="fcCow5">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 유통기한은 언제까지인가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcCow5" class="accordion-collapse collapse" aria-labelledby="fhCow5" data-bs-parent="#proCow" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
     냉장 보관 (-2~10℃) 시 포장일로부터 5일이나, 신선식품이므로 수령 후에는 가급적 빨리 드시기 바랍니다.<br><br>
     개별 상품의 유통기한은 상품 라벨에 기재되어 있습니다.<br> 
      </div>
    </div>
  </div>
  
   
  </div>
 </div>
  <div class="tab-pane fade" id="chicken" role="tabpanel" aria-labelledby="chicken-tab">
  <!-- 닭 상품관련내용 -->
  <div class="accordion accordion-flush" id="proChicken">
  <div class="accordion-item">
    <h2 class="accordion-header" id="fhChicken1">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcChicken1" aria-expanded="false" aria-controls="fcChicken1">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 붉은 빛이 도는데 괜찮은가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcChicken1" class="accordion-collapse collapse" aria-labelledby="fhChicken1" data-bs-parent="#proChicken" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      진공포장을 개봉한 후 15분 정도가 지나면 닭고기 본연의 색깔을 확인하실 수 있으며, 닭고기는 신선할수록 붉은 빛이 돕니다.<br><br>
      껍질이 하얗고 두껍게 변한 닭은 도계한 지 시간이 흐른 닭입니다.<br> 
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcChicken2" aria-expanded="false" aria-controls="fcChicken2">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 다진고기는 판매하지 않나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcChicken2" class="accordion-collapse collapse" aria-labelledby="fhChicken2" data-bs-parent="#proChicken" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      홈페이지/앱에서 판매중인 부위/옵션만 제공 가능하며, 현재는 다진 닭고기를 제공해드리지 못하는 점 너른 양해 부탁드립니다.<br> <br>
      향후 보다 다양한 상품 제공을 위해 노력하겠습니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcChicken3" aria-expanded="false" aria-controls="fcChicken3">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 수령 후 언제까지 먹어도 되나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcChicken3" class="accordion-collapse collapse" aria-labelledby="fhChicken3" data-bs-parent="#proChicken" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      닭고기는 신선도에 매우 민감하고 신선도 유지 기간이 짧기 때문에 수령하신 날 바로 드시는 걸 추천해 드리며, 당일 드시는 게 불가능한 경우 수령일 포함 2일까지는 냉장 보관을 하셔도 괜찮습니다.<br> <br>
      2일 이상 보관하게 되실 경우 냉동 보관 후 자연 해동 하시는 것을 권해드립니다.<br> 
      </div>
    </div>
  </div>
  
   
  </div>
  </div>
  
  
  <div class="tab-pane fade" id="susan" role="tabpanel" aria-labelledby="susan-tab">
  <!-- 수산 상품관련내용 -->
  <div class="accordion accordion-flush" id="proSusan">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcSusan1" aria-expanded="false" aria-controls="fcSusan1">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 다른 수산물은 판매하지 않나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcSusan1" class="accordion-collapse collapse" aria-labelledby="fhSusan1" data-bs-parent="#proSusan" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      고기샵에서는 보다 다양한 수산물을 제공하기 위해 많은 노력을 기울이고 있으며, 다른 수산물은 상품 준비가 완료되는 대로 홈페이지/앱을 통해 안내 도와드리겠습니다.<br><br>
      항상 가장 신선하고 좋은 상품만을 제공하기 위하여 노력하겠습니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcSusan2" aria-expanded="false" aria-controls="fcSusan2">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [전복] 수령 후 바로 먹지 못할 땐 어떻게 해야 하나요?(얼마나 보관할 수 있나요?)
       </td></tr></table>
      </button>
    </h2>
    <div id="fcSusan2" class="accordion-collapse collapse" aria-labelledby="fhSusan2" data-bs-parent="#proSusan" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      받아보신 전복은 가급적 빠른 섭취를 권장합니다.<br><br>
      수령 다음날까지 드시기 어려운 경우에는 꼼꼼하게 세척한 후 내장을 떼어내시고, 몸통과 내장을 각각 분리하여 냉동 보관 하시는 것을 권해드립니다. 자세한 전복 손질 방법은 상품 상세페이지에서 확인하실 수 있습니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcSusan3" aria-expanded="false" aria-controls="fcSusan3">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [전복] 전복이 살아있으면 회로 먹어도 되나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcSusan3" class="accordion-collapse collapse" aria-labelledby="fhSusan3" data-bs-parent="#proSusan" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      받아보신 전복은 가급적 빠른 섭취를 권장합니다.<br><br>
      전복회로 드실 경우 꼼꼼한 세척 및 내장 제거를 부탁드리며, 자세한 전복 손질 방법은 상품 상세페이지에서 확인하실 수 있습니다.<br> 
      </div>
    </div>
  </div>
  
  
  </div>
  </div>
  <div class="tab-pane fade" id="mealkit" role="tabpanel" aria-labelledby="mealkit-tab">
   <!-- 밀키트 상품관련내용 -->
  <div class="accordion accordion-flush" id="proMealkit">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcMealkit1" aria-expanded="false" aria-controls="fcMealkit1">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [고추장 닭볶음탕] 야채와 닭은 씻어서 사용해야 하나요??
       </td></tr></table>
      </button>
    </h2>
    <div id="fcMealkit1" class="accordion-collapse collapse" aria-labelledby="fhMealkit1" data-bs-parent="#proMealkit" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      닭은 포장을 뜯은 후 밑간 파우더에 5분 재운 다음 씻어주시고, 야채의 경우 세척이 되어 있으므로 포장을 뜯어 바로 사용하시면 됩니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcMealkit2" aria-expanded="false" aria-controls="fcMealkit2">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [한우 육사시미] 언제까지 먹어야하나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcMealkit2" class="accordion-collapse collapse" aria-labelledby="fhMealkit2" data-bs-parent="#proMealkit" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      한우 육사시미의 유통기한은 10℃ 이하 냉장 보관 시 포장일로부터 3일이지만, 상품의 특성상 수령 당일에 바로 드시는 것을 권장해 드립니다.<br><br>
      개별 상품의 유통기한은 상품 라벨에서 확인하실 수 있습니다<br> 
      </div>
    </div>
  </div>
   <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcMealkit3" aria-expanded="false" aria-controls="fcMealkit3">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [등심 돈까스] 남은 빵가루는 어떻게 보관해야 하나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcMealkit3" class="accordion-collapse collapse" aria-labelledby="fhMealkit3" data-bs-parent="#proMealkit" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
     등심 돈까스에 포함된 습식 빵가루는 개봉 전 상태인 경우 봉투에 표기된 유통기한까지 10℃ 이하 냉장 보관이 가능합니다.<br><br>
     다만 개봉 이후의 빵가루는 변질의 우려가 있어, 밀봉하여 보관하시더라도 가급적 빠른 시일 내 사용을 권장해 드립니다.<br> 
      </div>
    </div>
  </div>
   <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcMealkit4" aria-expanded="false" aria-controls="fcMealkit4">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [고추장 닭볶음탕] 몇 인분 인가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcMealkit4" class="accordion-collapse collapse" aria-labelledby="fhMealkit4" data-bs-parent="#proMealkit" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
     현재 상품의 개별 패키지에는 2~3인분으로 표기되어 있습니다. 다만 생고기 중량만 800~1,150g 정도이고 채소와 소스등을 합치면 1,600g 이상의 푸짐한 양이므로 다른 반찬과 함께 드시면 3~4인이서도 충분히 드실 수 있는 양입니다.<br> 
      </div>
    </div>
  </div>
  </div>
  </div>
  
  
  <div class="tab-pane fade" id="milk" role="tabpanel" aria-labelledby="milk-tab">
  <!-- 우유 상품관련내용 -->
  <div class="accordion accordion-flush" id="proMilk">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcMilk1" aria-expanded="false" aria-controls="fcMilk1">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 착유일과 제조일은 어떻게 지정되어지나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcMilk1" class="accordion-collapse collapse" aria-labelledby="fhMilk1" data-bs-parent="#proMilk" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      정육각 우유는 착유 완료 당일 제조되어 착유일과 제조일이 같으며, 병 상단부에 유통기한과 함께 표기되어 있습니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcMilk2" aria-expanded="false" aria-controls="fcMilk2">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 유통기한은 언제까지 인가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcMilk2" class="accordion-collapse collapse" aria-labelledby="fhMilk2" data-bs-parent="#proMilk" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      우유의 유통기한은 냉장 보관 시 제조일로부터 10일까지 입니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcMilk3" aria-expanded="false" aria-controls="fcMilk3">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 우유의 위생등급이란 어떤 건가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcMilk3" class="accordion-collapse collapse" aria-labelledby="fhMilk3" data-bs-parent="#proMilk" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      우유의 위생등급은 크게 두 가지로 분류됩니다.<br><br>
      세균 수 기준 우유 등급은 세균 수 3만 마리 미만일 때 최고 등급인 1A등급을 받을 수 있으며, 정육각의 우유는 세균 수 5천 마리 미만으로 1A등급입니다.<br><br>
      체세포 수 기준 우유 등급은 체세포 수 20만 미만일 때 최고 등급인 1등급을 받을 수 있으며, 정육각의 우유는 체세포 수 15만 미만으로 1등급입니다.<br><br>
      현재의 등급 기준의 최고 등급 기준보다 높은 품질 수준을 유지하고 있음을 안내드리며, 앞으로도 믿고 드실 수 있는 상품만 제공하겠습니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcMilk4" aria-expanded="false" aria-controls="fcMilk4">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 여름철 우유배달 괜찮을까요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcMilk4" class="accordion-collapse collapse" aria-labelledby="fhMilk4" data-bs-parent="#proMilk" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      온도에 민감한 상품인 만큼 자체 배송 테스트를 통해 기온 변동에 상관없이 포장 박스 내부 온도가 일정 수준 이하로 유지될 수 있는 포장 방법으로 배송해 드리고 있습니다.<br><br>
      따라서 여름철에도 배송 전 과정 최대 30시간 동안 7℃ 이하의 포장 내부 온도를 유지하여 배송이 가능합니다.<br> 
      </div>
    </div>
  </div>
  
  
  </div>
  </div>
  
  <div class="tab-pane fade" id="egg" role="tabpanel" aria-labelledby="egg-tab">
   <!-- 달걀 상품관련내용 -->
  <div class="accordion accordion-flush" id="proEgg">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcEgg1" aria-expanded="false" aria-controls="fcEgg1">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 유통기한은 언제까지인가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcEgg1" class="accordion-collapse collapse" aria-labelledby="fhEgg1" data-bs-parent="#proEgg" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      일반적으로 달걀의 유통기한은 서늘한 곳에서 보관 시 15일 정도이나 가급적이면 냉장 보관을 부탁드리며, 정육각에서 판매 중인 당일 산란 초신선 달걀은 바로 드실수록 더욱 신선함을 느끼실 수 있습니다.<br> 
      </div>
    </div>
  </div>
   <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcEgg2" aria-expanded="false" aria-controls="fcEgg2">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 배송과정에서 깨지지 않나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcEgg2" class="accordion-collapse collapse" aria-labelledby="fhEgg2" data-bs-parent="#proEgg" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      정육각의 초신선 무항생제 동물복지 유정란은 충격 흡수성이 매우 높은 PE포장재를 이용한 자체 개발 포장 박스를 이용하여 깨지지 않고 안전하게 배송되고 있습니다.<br> <br> 
      또한 유정란 포장에 사용되는 PE 포장재는 공인 시험검사기관에서 주기적인 검사를 통해 인체에 무해한 소재임을 확인하고 있어 안심하고 드실 수 있습니다.<br> 
      </div>
    </div>
  </div>       
  </div>
  </div>
  <div class="tab-pane fade" id="baby" role="tabpanel" aria-labelledby="baby-tab">
  <!-- 이유식 상품관련내용 -->
  <div class="accordion accordion-flush" id="proBaby">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcBaby1" aria-expanded="false" aria-controls="fcBaby1">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 조리 전 핏물을 제거해야하나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcBaby1" class="accordion-collapse collapse" aria-labelledby="fhBaby1" data-bs-parent="#proBaby" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      이유식 상품의 경우 상품 상세페이지에서도 확인하실 수 있듯이 신선한 고기로 핏물을 빼지 않아도 불순물이나 잡내가 전혀 없습니다.<br><br>
      오히려 핏물을 빼는 과정에서 철분 등 영양소 손실이 있을 수 있기에 상품 그대로 드시는 것을 권해드립니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcBaby2" aria-expanded="false" aria-controls="fcBaby2">
       <table><tr><td style="width: 250px"><b>
       상품관련
       </b></td>
       <td>
       [공통] 냉동 보관은 얼마나 가능한가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcBaby2" class="accordion-collapse collapse" aria-labelledby="fhBaby2" data-bs-parent="#proBaby" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      정육각에서 판매하고 있는 고기 상품은 모두 신선육으로 냉장 보관 기준 유통기한 안내가 가능하여, 냉동 보관 시의 유통기한을 별도로 안내해드리기 어려운 점 양해 부탁드립니다.<br><br>
      일반적으로 수령 직후부터 냉동 보관을 하시는 경우 냉장 보관보다 오랫동안 보관이 가능하지만 수령 후 가급적 빠른 시간 내에 드실 것을 권해 드립니다.<br>
      </div>
    </div>
  </div>
  
  </div>
  </div>
</div>

</div>
  
</div>
  
  <div class="tab-pane fade" id="order_pay" role="tabpanel" aria-labelledby="order_pay-tab" style="border: 1px solid #c2c2c2; margin-top: 55px;">
  <!-- 주문/결제 -->
  
  <div class="accordion accordion-flush" id="OP">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcOP1" aria-expanded="false" aria-controls="fcOP1">
       <table><tr><td style="width: 250px"><b>
       주문/결제
       </b></td>
       <td>
       결제 금액이 왜 주문 시 안내와 다른가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcOP1" class="accordion-collapse collapse" aria-labelledby="fhOP1" data-bs-parent="#OP" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      고기샵에서는 '신선페이'라는 자체 후불 결제 시스템을 제공합니다. 가장 신선한 상품 제공을 위하여 주문 후 발송 직전에 상품을 생산하고, 실제 발송될 상품의 정확한 무게에 해당하는 만큼만 선주문 후결제해드리고 있습니다.<br><br>
      고기 상품의 경우 특성 상 홈페이지에 안내된 기준 무게로부터 10% 내외(기준 무게가 300g 이하인 상품의 경우 20% 내외)의 무게 차이가 발생하다 보니 보다 정확한 결제를 위하여 주문 시점이 아닌 생산 완료 후에 받으실 상품의 실제 무게대로 결제하는 정육각만의 결제 시스템을 도입하게 된 것입니다.<br><br>
      더 정직하게, 결제 가격에 가감없이 상품을 판매하고자 하는 정육각만의 철학을 담아 운영하고 있습니다.<br> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcOP2" aria-expanded="false" aria-controls="fcOP2">
       <table><tr><td style="width: 250px"><b>
       주문/결제
       </b></td>
       <td>
       배송비 무료 혜택은 어떻게 받나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcOP2" class="accordion-collapse collapse" aria-labelledby="fhOP2" data-bs-parent="#OP" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      정육각에서는 우유 상품을 제외한 상품의 구매 수량별로 배송비를 할인해드리는 '신선할인' 제도를 운영하고 있습니다.<br><br>
      상품 2개 구매 시 배송비 10% 할인, 3개 구매 시 배송비 30% 할인, 4개 구매 시 배송비 60% 할인 혜택을 제공해드리고 있으며, 5개 이상 구매 시에는 배송비 무료로 상품을 보내드리고 있습니다.<br>
 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcOP3" aria-expanded="false" aria-controls="fcOP3">
       <table><tr><td style="width: 250px"><b>
       주문/결제
       </b></td>
       <td>
       무통장 환급은 언제 이루어지나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcOP3" class="accordion-collapse collapse" aria-labelledby="fhOP3" data-bs-parent="#OP" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      무통장 환급은 적립금 환급/계좌 환급 중 선택하시는 방법으로 처리되고 있습니다.<br><br>
      적립금 환급을 선택하시는 경우 결제금액 확정 직후 입금액과의 차액만큼 적립금을 지급해드리며, 계좌 환급을 선택하시는 경우 입력해주신 계좌로 결제금액 확정 후 최대 3영업일 이내에 이체됩니다.<br>
 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcOP4" aria-expanded="false" aria-controls="fcOP4">
       <table><tr><td style="width: 250px"><b>
       주문/결제
       </b></td>
       <td>
       무통장 입금은 왜 10%가 더 청구되나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcOP4" class="accordion-collapse collapse" aria-labelledby="fhOP4" data-bs-parent="#OP" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      정육각에서는 상품 생산 후 실제 무게대로 최종 결제금액을 계산하여 결제를 진행하는 '신선페이' 결제 시스템을 제공해드리고 있는데, 고기 상품의 경우 생산 과정에서 홈페이지에 안내 된 기준무게 대비 10% 내외의 무게 및 금액 차이가 발생할 수 있습니다.<br><br>
      한편 무통장입금으로 주문/결제하시는 경우 계좌이체가 완료되어야 주문이 확정될 수 있으나 이 때에는 실제 상품 생산 전이라 고객님께서 실제로 받으시게 될 상품의 무게에 따른 정확한 가격을 바로 안내해드리기 어려운 점이 있습니다.<br><br>
      따라서 최대 오차 범위인 10%에 해당하는 금액을 선급금 형태로 받은 후 최종결제금액과의 차액을 환급액으로 계산하여 고객님의 계좌로 다시 이체해드리거나 적립금으로 지급해드리고 있습니다.<br><br>
      무통장입금 주문이어서 수수료 명목으로 추가되는 금액이 아닌 실제 받으시게 될 상품 무게만큼 정확히 결제해드리기 위한 추가금인 점 이용에 참고 부탁드립니다.<br>
 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcOP5" aria-expanded="false" aria-controls="fcOP5">
       <table><tr><td style="width: 250px"><b>
       주문/결제
       </b></td>
       <td>
       주문자명과 입금자명이 달라도 입금 확인이 가능한가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcOP5" class="accordion-collapse collapse" aria-labelledby="fhOP5" data-bs-parent="#OP" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      주문자명과 입금자명이 일치하는 경우에만 자동으로 입금확인이 됩니다.<br><br>
      반드시 입금자명을 홈페이지에 가입하신 성함으로 기재해주시고, 부득이하게 주문자명과 입금자명이 일치하지 않는 경우 고객센터(1800-0658)로 연락 부탁드립니다<br>
 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcOP6" aria-expanded="false" aria-controls="fcOP6">
       <table><tr><td style="width: 250px"><b>
       주문/결제
       </b></td>
       <td>
       주문을 완료했는데 카드 결제 문자가 오지 않아요
       </td></tr></table>
      </button>
    </h2>
    <div id="fcOP6" class="accordion-collapse collapse" aria-labelledby="fhOP6" data-bs-parent="#OP" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      고기샵에서는 '신선페이'라는 자체 후불 결제 시스템을 제공합니다. 가장 신선한 상품 제공을 위하여 주문 후 발송 직전에 상품을 생산하고, 실제 발송될 상품의 무게만큼만 발송 시점에 결제해드리고 있습니다.<br><br>
      고기 상품의 경우 특성 상 홈페이지에 안내된 기준 무게 기준 10% 내외(기준 무게가 300g 이하인 상품의 경우 20% 내외)의 무게 차이가 발생하다보니 보다 정확한 결제를 위하여 주문 시점이 아닌 생산 완료 후에 받으실 상품의 실제 무게대로 결제하는 정육각만의 결제 시스템을 도입하게 된 것입니다.<br><br>
      따라서 '주문확정' 버튼을 누르셨다면 결제 문자와 상관없이 주문이 정상적으로 등록된 것으로 [마이페이지-주문내역]에서 주문하신 내역을 확인하실 수 있고, 결제 문자는 생산이 완료되면 발송됩니다.<br>
 
      </div>
    </div>
  </div>
  
  </div>
  </div>
  
  <div class="tab-pane fade" id="delivery" role="tabpanel" aria-labelledby="delivery-tab" style="border: 1px solid #c2c2c2; margin-top: 55px;">
  <!-- 배송 -->
  <div class="accordion accordion-flush" id="Delivery">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcDelivery1" aria-expanded="false" aria-controls="fcDelivery1">
       <table><tr><td style="width: 250px"><b>
       배송
       </b></td>
       <td>
       [우체국배송] 도서산간지역도 배송이 가능한가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcDelivery1" class="accordion-collapse collapse" aria-labelledby="fhDelivery1" data-bs-parent="#Delivery" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      제주도 지역을 제외한 도서 산간 지역의 경우 우체국택배 배송등록이 가능하지만 간혹 우체국 택배 기사님께서 매일 방문하지 않는 지역의 경우 발송 익일에 상품 수령하시는 것을 보장해드리기 어려울 수 있습니다.<br><br>
      해당 지역에서 상품을 받아보고자 하시는 경우 다소 번거로우시겠지만 주문 시 지역별 배송 일정을 지역 우체국을 통해 확인 부탁드립니다.<br>
      
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcDelivery2" aria-expanded="false" aria-controls="fcDelivery2">
       <table><tr><td style="width: 250px"><b>
       배송
       </b></td>
       <td>
       [새벽배송] 카드키로만 출입이 가능해요.
       </td></tr></table>
      </button>
    </h2>
    <div id="fcDelivery2" class="accordion-collapse collapse" aria-labelledby="fhDelivery2" data-bs-parent="#Delivery" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      비밀번호 입력이 아닌 카드키로 자택 공동현관 출입이 가능한 경우 경비실 호출을 통해 공동현관 출입을 요청드리지만, 경비 부재로 연결이 되지 않는 경우 공동현관 또는 경비실 앞에 대응배송 될 수 있습니다.<br><br>
      경비실 앞 등 기타 장소에 상품 보관이 가능한 경우 배송요청란에 입력해주시면 최대한 맞추어 배송 도와드리겠습니다.<br>
      
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcDelivery3" aria-expanded="false" aria-controls="fcDelivery3">
       <table><tr><td style="width: 250px"><b>
       배송
       </b></td>
       <td>
       [공통] 배송이 안 왔어요.
       </td></tr></table>
      </button>
    </h2>
    <div id="fcDelivery3" class="accordion-collapse collapse" aria-labelledby="fhDelivery3" data-bs-parent="#Delivery" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      우체국택배 배송의 경우 상품 발송 시 고객님께 안내해드린 등기번호로 배송상태를 조회하실 수 있으며, 각 배송 방법별로 안내해 드린 배송 시간 이내에 상품을 수령하지 못하신 경우 고객센터(1800-0658)로 문의 부탁드립니다.<br>
	 </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcDelivery4" aria-expanded="false" aria-controls="fcDelivery4">
       <table><tr><td style="width: 250px"><b>
       배송
       </b></td>
       <td>
       [공통] 방문 수령이 가능한가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcDelivery4" class="accordion-collapse collapse" aria-labelledby="fhDelivery4" data-bs-parent="#Delivery" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      현재는 오프라인 매장을 별도로 운영하고 있지 않고, 생산 공장은 외부인의 출입이 통제되고 있어 주문하신 상품의 방문 수령은 어렵습니다.<br>
	 </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcDelivery5" aria-expanded="false" aria-controls="fcDelivery5">
       <table><tr><td style="width: 250px"><b>
       배송
       </b></td>
       <td>
       [공통] 묶음 배송이 가능한가요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcDelivery5" class="accordion-collapse collapse" aria-labelledby="fhDelivery5" data-bs-parent="#Delivery" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      수령자 정보, 수령일이 같은 두 건 이상의 주문은 문의를 남겨주시면 한 건의 주문으로 묶음배송 처리를 도와드릴 수 있습니다. 단, 포장 및 결제 이전 시점까지만 가능하여, 결제 이후에 신청해주시는 건에 대해서는 도와드리기 어려운 점 양해 부탁드립니다.<br><br>
      또한 두 건 이상의 주문 각각에 혜택 쿠폰 등을 적용하신 경우 묶음배송 시 하나의 혜택 쿠폰만 선택하여 적용하실 수 있는 점 이용에 참고 부탁드립니다.<br>
	 </div>
    </div>
  </div>
  
  </div>
  </div>
  
  
  <div class="tab-pane fade" id="cancel_exchange_refund" role="tabpanel" aria-labelledby="cancel_exchange_refund-tab" style="border: 1px solid #c2c2c2; margin-top: 55px;">
  <!-- 취소/교환/환불 -->
  <div class="accordion accordion-flush" id="CER">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcCER1" aria-expanded="false" aria-controls="fcCER1">
       <table><tr><td style="width: 250px"><b>
       취소/교환/환불
       </b></td>
       <td>
       [공통] 배송 받은 상품/포장이 이상해요.
       </td></tr></table>
      </button>
    </h2>
    <div id="fcCER1" class="accordion-collapse collapse" aria-labelledby="fhCER1" data-bs-parent="#CER" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      받아보신 상품/포장에 문의 또는 이상이 있으신 경우 아래의 방법으로 연락해주시면 친절히 안내 도와드리겠습니다. 자세한 안내를 위해 문의 시 사진을 첨부해주시면 감사하겠습니다.<br><br>
      신선식품은 특성 상 회수 및 재판매가 불가하여 단순 변심 등 개인적인 사유로는 교환/환불이 불가합니다.<br><br>
      - 홈페이지/앱 1:1 문의<br>
	  - 고객센터 : 1800-0658(전화/문자)<br>
      
      </div>
    </div>
  </div>  
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcCER2" aria-expanded="false" aria-controls="fcCER2">
       <table><tr><td style="width: 250px"><b>
       취소/교환/환불
       </b></td>
       <td>
       [공통] 수령 희망일을 변경하고 싶어요.
       </td></tr></table>
      </button>
    </h2>
    <div id="fcCER2" class="accordion-collapse collapse" aria-labelledby="fhCER2" data-bs-parent="#CER" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      상품 배송 정보 변경은 주문하신 상품의 생산이 시작되기 전 시점까지에 한해 고객센터(1800-0658)를 통해 일자별 주문가능수량 확인 후 도와드리고 있습니다.<br><br>
      [마이페이지-주문내역]에서 주문내역을 누르시면 해당 주문의 생산 현황을 확인하실 수 있으며, 배송 정보 변경이 필요하신 경우 생산이 시작되기 전임을 확인하신 후 고객센터(1800-0658)로 연락 부탁드립니다.<br>
      
      </div>
    </div>
  </div> 
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcCER3" aria-expanded="false" aria-controls="fcCER3">
       <table><tr><td style="width: 250px"><b>
       취소/교환/환불
       </b></td>
       <td>
       [공통] 주문 취소는 어떻게 하나요?
       </td></tr></table>
      </button>
    </h2>
    <div id="fcCER3" class="accordion-collapse collapse" aria-labelledby="fhCER3" data-bs-parent="#CER" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      주문 취소는 주문하신 상품의 생산이 시작되기 전 시점까지 마이페이지를 통해 요청하실 수 있습니다.<br><br>
      [마이페이지-주문내역]에서 주문내역을 누르시면 주문 취소 버튼을 확인하실 수 있으며, 주문하신 상품의 생산이 시작된 경우 주문 취소 버튼을 누르실 수 없는 점 양해 부탁드립니다.<br>
      
      </div>
    </div>
  </div>    
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcCER4" aria-expanded="false" aria-controls="fcCER4">
       <table><tr><td style="width: 250px"><b>
       취소/교환/환불
       </b></td>
       <td>
       [공통] 주문한 상품을 추가/변경 하고 싶어요.
       </td></tr></table>
      </button>
    </h2>
    <div id="fcCER4" class="accordion-collapse collapse" aria-labelledby="fhCER4" data-bs-parent="#CER" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
      주문 상품 변경은 주문하신 상품의 생산이 시작되기 전 시점까지만 고객센터(1800-0658)를 통해 상품별 주문가능수량 확인 후 도와드리고 있습니다.<br><br>
      [마이페이지-주문내역]에서 주문내역을 누르시면 해당 주문의 생산 현황을 확인하실 수 있으며, 주문 상품 변경이 필요하신 경우 생산이 시작되기 전임을 확인하신 후 고객센터(1800-0658)로 연락 부탁드립니다.<br>
      
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcCER5" aria-expanded="false" aria-controls="fcCER5">
       <table><tr><td style="width: 250px"><b>
       취소/교환/환불
       </b></td>
       <td>
       [공통] 수령 정보(수령인,연락처,수령지)를 변경하고 싶어요.
       </td></tr></table>
      </button>
    </h2>
    <div id="fcCER5" class="accordion-collapse collapse" aria-labelledby="fhCER5" data-bs-parent="#CER" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
     상품 수령 정보 변경은 주문하신 상품의 포장 및 결제가 이루어지기 전 시점까지에 한해 1:1문의 / 고객센터(1800-0658) / 카카오톡 플러스친구 @정육각을 통해 도와드리고 있습니다.<br><br>
     [마이페이지-주문내역]에서 주문내역을 누르시면 해당 주문의 생산 현황을 확인하실 수 있으며, 배송 정보 변경이 필요하신 경우 포장 및 결제가 이루어지기 전임을 확인하신 후 연락 부탁드립니다.<br>
      
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#fcCER6" aria-expanded="false" aria-controls="fcCER6">
       <table><tr><td style="width: 250px"><b>
       취소/교환/환불
       </b></td>
       <td>
       [공통] 카드 결제 취소가 되지 않았어요.
       </td></tr></table>
      </button>
    </h2>
    <div id="fcCER6" class="accordion-collapse collapse" aria-labelledby="fhCER6" data-bs-parent="#CER" style="background-color:#f7f7f7 ">
      <div class="accordion-body">
     카드 결제 취소 신청 후 실제 승인시까지는 카드사에 따라 최대 3~5영업일 이상 소요될 수 있으며, 정확한 결제 취소 승인 시점은 각 카드사별 고객센터를 통해 확인하실 수 있습니다.<br>
      
      </div>
    </div>
  </div>
    
 </div>
 </div>  
  
  </div> 
  
</div>

</div>

<div style="height: 150px">
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