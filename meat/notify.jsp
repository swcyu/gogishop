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
	
	int pg=1;	
	int maxPg=2;
	
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

function rightbtn(){
	
	
	if(<%=pg%>>=<%=maxPg%>){		
		return;
	}
	
	<%pg++;%>
	
	document.getElementById("p1").className = "unvisable";
	document.getElementById("p2").className = "visable";
	
}

function leftbtn(){
	
	if(<%=pg%><2){
		return;
	}
	<%pg--;%>
	
	
	document.getElementById("p2").className = "unvisable";
	document.getElementById("p1").className = "visable";
	
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


.visable{
	visibility: visible;
}
.unvisable{
	display: none;
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

<div style="height: 100px; background-color:#292929;"></div>

<!-- p1 -->
<div id="p1">
<div style="height: 590px; background-color: #292929" align="center">		
	<div style="width: 1200px; height: 570px; display: table;" align="center" >
		<div style="width: 380px; height: 570px; cursor: pointer; margin-left: 10px; margin-right: 10px; float: left;" 
		onclick="location.href='<%=cp %>/meatShop/notice.do?target=8'">
			<div style="width: 380px; height: 210px; position: relative;">
  			<img src="https://firebasestorage.googleapis.com/v0/b/jyg-custom.appspot.com/o/p%2Fm%2F1564980218537_%EC%BA%98%EB%A6%B0%EB%8D%94.png?alt=media&token=6f11e5da-a5fc-4b1f-83a0-a8df95a1359f" 
  			style="width: 380px; height: 210px;">
  			<div style="font-size: 11pt; color: white; position: relative; top: -30px;left:-135px ">
  			<b>2021-04-26</b></div>
  			</div>
  			<div style="width:380px; height: 360px; background-color: white; padding: 30px; text-align: left;">
    		<h5 style="color: black;"><b>코로나19 확진 관련 배송스케줄 안내</b></h5>
    		<font style="color: #9b9b9b;">코로나 확진 관련 배송스케줄</font>    	  	
  			</div>
		</div>
		
		<div style="width: 380px; height: 570px; cursor: pointer; margin-left: 10px; margin-right: 10px; float: left;" 
		onclick="location.href='<%=cp %>/meatShop/notice.do?target=7'">
			<div style="width: 380px; height: 210px; position: relative;">
  			<img src="https://firebasestorage.googleapis.com/v0/b/jyg-custom.appspot.com/o/p%2Fm%2F1564980218537_%EC%BA%98%EB%A6%B0%EB%8D%94.png?alt=media&token=6f11e5da-a5fc-4b1f-83a0-a8df95a1359f" 
  			style="width: 380px; height: 210px;">
  			<div style="font-size: 11pt; color: white; position: relative; top: -30px;left:-135px ">
  			<b>2020-08-25</b></div>
  			</div>
  			<div style="width:380px; height: 360px; background-color: white; padding: 30px; text-align: left;">
    		<h5 style="color: black;"><b>배송 지연 공지</b></h5>
    		<font style="color: #9b9b9b;">코로나 확산으로 인한 배송 지연 가능성 안내입니다.</font>    	  	
  			</div>
		</div>
		
		<div style="width: 380px; height: 570px; cursor: pointer; margin-left: 10px; margin-right: 10px; float: left;" 
		onclick="location.href='<%=cp %>/meatShop/notice.do?target=6'">
			<div style="width: 380px; height: 210px; position: relative;">
  			<img src="https://firebasestorage.googleapis.com/v0/b/jyg-custom.appspot.com/o/p%2Fm%2F1553063952339_pc_thumbnail.png?alt=media&token=6fb505da-e87e-4729-9351-a784c2666669" 
  			style="width: 380px; height: 210px;">
  			<div style="font-size: 11pt; color: white; position: relative; top: -30px;left:-135px ">
  			<b>2021-04-26</b></div>
  			</div>
  			<div style="width:380px; height: 360px; background-color: white; padding: 30px; text-align: left;">
    		<h5 style="color: black;"><b>정육각 앱 론칭 소식</b></h5>
    		<font style="color: #9b9b9b;">정육각 앱이 드디어 출시되었습니다!</font>    	  	
  			</div>
		</div>			
	</div>
	<div style="height: 20px; background-color:#292929;"></div>
</div>

<!-- 1페이지 둘째줄 -->
<div style="height: 590px; background-color: #292929" align="center" class="visable">		
	<div style="width: 1200px; height: 570px; display: table;" align="center" >
		<div style="width: 380px; height: 570px; cursor: pointer; margin-left: 10px; margin-right: 10px; float: left;" 
		onclick="location.href='<%=cp %>/meatShop/notice.do?target=5'">
			<div style="width: 380px; height: 210px; position: relative;">
  			<img src="https://firebasestorage.googleapis.com/v0/b/jyg-custom.appspot.com/o/p%2Fm%2F1564980218537_%EC%BA%98%EB%A6%B0%EB%8D%94.png?alt=media&token=6f11e5da-a5fc-4b1f-83a0-a8df95a1359f" 
  			style="width: 380px; height: 210px;">
  			<div style="font-size: 11pt; color: white; position: relative; top: -30px;left:-135px ">
  			<b>2021-08-12</b></div>
  			</div>
  			<div style="width:380px; height: 360px; background-color: white; padding: 30px; text-align: left;">
    		<h5 style="color: black;"><b>8월 연후 배송 일정</b></h5>
    		<font style="color: #9b9b9b;">8/17(월) 임시공휴일 관련 배송 일정 안내입니다.</font>    	  	
  			</div>
		</div>
		
		<div style="width: 380px; height: 570px; cursor: pointer; margin-left: 10px; margin-right: 10px; float: left;" 
		onclick="location.href='<%=cp %>/meatShop/notice.do?target=4'">
			<div style="width: 380px; height: 210px; position: relative;">
  			<img src="https://firebasestorage.googleapis.com/v0/b/jyg-custom.appspot.com/o/p%2Fm%2F1564980218537_%EC%BA%98%EB%A6%B0%EB%8D%94.png?alt=media&token=6f11e5da-a5fc-4b1f-83a0-a8df95a1359f" 
  			style="width: 380px; height: 210px;">
  			<div style="font-size: 11pt; color: white; position: relative; top: -30px;left:-135px ">
  			<b>2020-04-29</b></div>
  			</div>
  			<div style="width:380px; height: 360px; background-color: white; padding: 30px; text-align: left;">
    		<h5 style="color: black;"><b>5월 연휴 배송 일정 안내</b></h5>
    		<font style="color: #9b9b9b;">5월 첫째 주 연휴로 인해 배송 형태에 따라 배송 가능일이 제한됩니다. 자세한 사항을 확인하세요!</font>    	  	
  			</div>
		</div>
		
		<div style="width: 380px; height: 570px; cursor: pointer; margin-left: 10px; margin-right: 10px; float: left;" 
		onclick="location.href='<%=cp %>/meatShop/notice.do?target=3'">
			<div style="width: 380px; height: 210px; position: relative;">
  			<img src="https://firebasestorage.googleapis.com/v0/b/jyg-custom.appspot.com/o/p%2Fm%2F1581914630284_Web_Notice_760x420.png?alt=media&token=36e06fb9-8d59-4990-9754-555a6d0bbb9a" 
  			style="width: 380px; height: 210px;">
  			<div style="font-size: 11pt; color: white; position: relative; top: -30px;left:-135px ">
  			<b>2020-02-17</b></div>
  			</div>
  			<div style="width:380px; height: 360px; background-color: white; padding: 30px; text-align: left;">
    		<h5 style="color: black;"><b>매진 안내</b></h5>
    		<font style="color: #9b9b9b;">한우 일부 상품이 주문 폭주로 빠른 수령이 어렵습니다. 자세한 내용을 확인해주세요!</font>    	  	
  			</div>
		</div>			
	</div>
	<div style="height: 20px; background-color:#292929;"></div>
</div>


<div style="height: 55px; background-color:#292929;"></div>
<div style="height: 200px; background-color:#292929; text-align: center; color:#484848; font-size: 18pt" >

<a style="cursor: pointer; margin-right: 50px;font-size: 18pt" onclick="leftbtn()">&#x02AA6;</a>

<a id="page" style="color: white;font-size: 18pt;">1</a><font style="margin-left: 10px; margin-right: 10px;">|</font><%=maxPg %>

<a style="cursor: pointer; margin-left: 50px; font-size: 18pt" onclick="rightbtn()">&#x02AA7;</a>

</div>



</div>

<!-- p2 -->

<div id="p2" class="unvisable">
<div style="height: 590px; background-color: #292929" align="center">		
	<div style="width: 1200px; height: 570px; display: table;" align="center" >
		<div style="width: 380px; height: 570px; cursor: pointer; margin-left: 10px; margin-right: 10px; float: left;" 
		onclick="location.href='<%=cp %>/meatShop/notice.do?target=2'">
			<div style="width: 380px; height: 210px; position: relative;">
  			<img src="https://firebasestorage.googleapis.com/v0/b/jyg-custom.appspot.com/o/p%2Fm%2F1564376358182_pc-01.png?alt=media&amp;token=220fe7e4-9773-49a8-88f6-d7593a8fcec4" 
  			style="width: 380px; height: 210px;">
  			<div style="font-size: 11pt; color: white; position: relative; top: -30px;left:-135px ">
  			<b>2020-01-20</b></div>
  			</div>
  			<div style="width:380px; height: 360px; background-color: white; padding: 30px; text-align: left;">
    		<h5 style="color: black;"><b>패키지 업그레이드 안내</b></h5>
    		<font style="color: #9b9b9b;">육류 전 상품에 가장 선진화된 포장 방식인 스킨 포장을 도입하였습니다.</font>    	  	
  			</div>
		</div>
		
		<div style="width: 380px; height: 570px; cursor: pointer; margin-left: 10px; margin-right: 10px; float: left;" 
		onclick="location.href='<%=cp %>/meatShop/notice.do?target=1'">
			<div style="width: 380px; height: 210px; position: relative;">
  			<img src="https://firebasestorage.googleapis.com/v0/b/jyg-custom.appspot.com/o/jyg%2Fsupport_notice_pc_3.png?alt=media&token=6a364873-277c-4411-adea-957871788183" 
  			style="width: 380px; height: 210px;">
  			<div style="font-size: 11pt; color: white; position: relative; top: -30px;left:-135px ">
  			<b>2020-01-19</b></div>
  			</div>
  			<div style="width:380px; height: 360px; background-color: white; padding: 30px; text-align: left;">
    		<h5 style="color: black;"><b>회원등급안내</b></h5>
    		<font style="color: #9b9b9b;">정육각을 사랑해주시는 고객님께 등급별로 신선플랜 할인 혜택을 드립니다.</font>    	  	
  			</div>
		</div>
		
				
	</div>
	<div style="height: 20px; background-color:#292929;"></div>
</div>




<div style="height: 55px; background-color:#292929;"></div>
<div style="height: 200px; background-color:#292929; text-align: center; color:#484848; font-size: 18pt" >

<a style="cursor: pointer; margin-right: 50px;font-size: 18pt" onclick="leftbtn()">&#x02AA6;</a>

<a id="page" style="color: white;font-size: 18pt;">2</a><font style="margin-left: 10px; margin-right: 10px;">|</font><%=maxPg %>

<a style="cursor: pointer; margin-left: 50px; font-size: 18pt" onclick="rightbtn()">&#x02AA7;</a>



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