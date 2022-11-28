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

function tab1(){
	
	alert("tab1")
	document.getElementById("tab1").className = "visable";
	document.getElementById("tab2").className = "unvisable";
	document.getElementById("tab3").className = "unvisable";
	document.getElementById("tab4").className = "unvisable";
	document.getElementById("tab5").className = "unvisable";
		
}//tab1

function tab2(){
	alert("tab2")
	document.getElementById("tab1").className = "unvisable";
	document.getElementById("tab2").className = "visable";
	document.getElementById("tab3").className = "unvisable";
	document.getElementById("tab4").className = "unvisable";
	document.getElementById("tab5").className = "unvisable";
		
}//tab2

function tab3(){
	alert("tab3")
	document.getElementById("tab1").className = "unvisable";
	document.getElementById("tab2").className = "unvisable";
	document.getElementById("tab3").className = "visable";
	document.getElementById("tab4").className = "unvisable";
	document.getElementById("tab5").className = "unvisable";
		
}//tab3

function tab4(){
	alert("tab4")
	document.getElementById("tab1").className = "unvisable";
	document.getElementById("tab2").className = "unvisable";
	document.getElementById("tab3").className = "unvisable";
	document.getElementById("tab4").className = "visable";
	document.getElementById("tab5").className = "unvisable";
		
}//tab4


function tab5(){
	alert("tab5")
	document.getElementById("tab1").className = "unvisable";
	document.getElementById("tab2").className = "unvisable";
	document.getElementById("tab3").className = "unvisable";
	document.getElementById("tab4").className = "unvisable";
	document.getElementById("tab5").className = "visable";
		
}//tab5

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




<table style="margin-top: 100px; width: 980px; margin-left: auto; margin-right: auto;">
<tr>

<td style="font-size: 32px; line-height: 26px; text-align: center; ">마이페이지</td>
</tr>
<tr style="height: 50px;"><td></td></tr>
</table>

    

<table style="width: 980px; margin: auto; text-align: center;">

<tr>

<td style="float: left; font-size: 24px; font-weight: 700; line-height: 24px;">
<b>Hello, ${sessionScope.customInfo.userName }님</b>
<input style="cursor:pointer; margin-top: 9px; margin-left: 40px; background-color: #fff; height: 24px; border: none; border-bottom: 1px solid #cbcbcb; font-size: 16px; font-weight: 700; color: #cbcbcb" 
type="button" value="로그아웃"
 onclick="javascript:location.href='<%=cp%>/meatShop/logout.do'"/>
</td>
<td style="float: right;">
<input style="cursor:pointer; float: rigth; height: 45px; border: none; background-color: #000; color: #fff; font-size: 14px; font-weight: 700; margin-bottom: 10px;" type="button" value="내질문보기" 
onclick="javascript:location.href='<%=cp%>/meatShop/qnaList.do'">
</td>

</tr>

<tr style="width: 100%; height: 2px; background-color: #000; margin-top: 12px;"><td></td></tr>

<tr style="text-align: center;margin: auto;">

<td style="float:left; width: 19.75%; font-size: 24px; font-weight: 400; line-height: 24px; color: #000; margin-top: 10px;">
회원등급<br/>
<font color="#cbcbcb" size="3" >[${sessionScope.customInfo.gName }]</font>
</td>

<td style="float:left; width: 19.75%; font-size: 24px; font-weight: 400; line-height: 24px; color: #000; margin-top: 10px; ">
적립금<br/>
<font color="#cbcbcb" size="3" >[${sessionScope.customInfo.totalPoint }원]</font>
</td>

<td style="float:left; width: 19.75%; font-size: 24px; font-weight: 400; line-height: 24px; color: #000; margin-top: 10px;">
쿠폰<br/>
<font color="#cbcbcb" size="3" >[0개]</font>
</td>

<td style="float:left; width: 19.75%; font-size: 24px; font-weight: 400; line-height: 24px; color: #000; margin-top: 10px;">
구매<br/>
<font color="#cbcbcb" size="3" >[0건]</font>
</td>

<td style="float:left; width: 19.75%; font-size: 24px; font-weight: 400; line-height: 24px; color: #000; margin-top: 10px;">
회원번호<br/>
<font color="#cbcbcb" size="3">[${sessionScope.customInfo.userNum }]</font>
</td>

</tr>


<tr style="height: 40px;"><td></td></tr>


<tr style="text-align: center;margin: auto;">

<td onclick="tab1();" style="float:left; width: 17%; font-size: 20px; font-weight: 700; line-height: 23px; color: #cbcbcb; cursor:pointer;">
주문내역<br/>

</td>

<td onclick="tab2();" style="float:left; width: 17%; font-size: 20px; font-weight: 700; line-height: 23px; color: #cbcbcb; cursor:pointer;">
적립금내역<br/>

</td>

<td onclick="tab3();" style="float:left; width: 17%; font-size: 20px; font-weight: 700; line-height: 23px; color: #cbcbcb; cursor:pointer;">
쿠폰관리<br/>

</td>

<td onclick="tab4();" style="float:left; width: 17%; font-size: 20px; font-weight: 700; line-height: 23px; color: #cbcbcb; cursor:pointer;">
신선플랜<br/>

</td>

<td onclick="tab5();" style="float:left; width: 17%; font-size: 20px; font-weight: 700; line-height: 23px; color: #cbcbcb; cursor:pointer;">
개인정보관리<br/>

</td>

</tr>

 
</table>

<div id ='tab1' class="visable" align="center">
<table style="width: 980px; margin: auto; text-align: center;">

<tr style="width: 120%; height: 2px; background-color: #000; margin-top: 12px;"><td></td></tr>

<tr style="height: 80px;"><td></td></tr>
<tr>
<td style="font-size: 38px; color: #dbdbdb; margin-top: 120px; text-align: center;"> 주문한 내역이 없습니다</td>
</tr>
<tr style="height: 70px;"><td></td></tr>


<tr>
<td><input type="button" style="cursor:pointer; width: 260px; height: 70px; background-color: #000; color: #fff; font-size: 16px; 
font-weight: 700; border: none; display: block; margin-left: auto; margin-right: auto;" value="쇼핑하러가기          →"></td>
</tr>

<tr style="height: 90px;"><td></td></tr>
<tr style="width: 100%; height: 1px; background-color: #e1dedf; margin-top: 69px;"><td></td></tr>

</table>
</div>


<div id ='tab2' class="unvisable" align="center">
<table style="width: 980px; margin: auto; text-align: center;">

<tr style="width: 120%; height: 2px; background-color: #000; margin-top: 12px;"><td></td></tr>

<tr style="height: 80px;"><td></td></tr>
<tr>
<td style="font-size: 38px; color: #dbdbdb; margin-top: 120px; text-align: center;"> 적립금 내역이 없습니다.</td>
</tr>
<tr style="height: 70px;"><td></td></tr>



<tr style="height: 90px;"><td></td></tr>
<tr style="width: 100%; height: 1px; background-color: #e1dedf; margin-top: 69px;"><td></td></tr>

</table>
</div>

<div id ='tab3' class="unvisable" align="center">
<table style="width: 980px; margin: auto; text-align: center;">

<tr style="height: 80px;"><td></td></tr>


<tr>
<td>
<input type="text" value="쿠폰코드" name="couponCode" style="width: 455px; height: 44px; 
background-color: #f7f7f7; border: 1px solid #e1dedf; padding-left: 23px; font-size: 15px; font-weight: 700;"/>
<input type="button" value="등록" style="width: 81px; height: 46px; background-color: #fff;
border: 1px solid #e1dedf; font-size: 13px; font-weight: 700; margin-left: 14px;"/>
 </td>
</tr>
<tr style="height: 40px;"><td></td></tr>

<tr style="width: 120%; height: 2px; background-color: #000; margin-top: 12px;"><td></td></tr>

<tr style="height: 80px;"><td></td></tr>
<tr>
<td style="font-size: 38px; color: #dbdbdb; margin-top: 120px; text-align: center;"> 보유하고 계신 쿠폰이 없습니다.</td>
</tr>
<tr style="height: 70px;"><td></td></tr>



<tr style="height: 90px;"><td></td></tr>
<tr style="width: 100%; height: 1px; background-color: #e1dedf; margin-top: 69px;"><td></td></tr>

</table>
</div>


<div id ='tab4' class="unvisable" align="center">
<table style="width: 980px; margin: auto; text-align: center;">

<tr style="width: 120%; height: 2px; background-color: #000; margin-top: 12px;"><td></td></tr>

<tr style="height: 80px;"><td></td></tr>
<tr>
<td style="margin-top: 21px; font-size: 18px; font-weight: 700; margin-left: 16px;">
보유하신 신선플랜이 없습니다.<br/><br/>
<font style="font-size: 14px; color: #4a90e2; margin-top: 10px;">한 번 배송비로 매주 무료배송 받아보실 수 있는<br/>
신선플랜을 경험해보세요!<br/><br/><br/></font>
</td>
</tr>

<tr>
<td style="color: #18baab;">
<input type="button" name="freshBuy" value="신선플랜 구매" style="width: 120px; height: 40px; color: #18baab; font-size: 14px; 
border: 1px solid #18baab; background-color: #fff; border-radius: 2px; display: block; margin-top: 28px; margin-left: 16px; margin: auto; text-align: center;"/>
</td>
</tr>


<tr style="height: 70px;"><td></td></tr>



<tr style="height: 90px;"><td></td></tr>
<tr style="width: 100%; height: 1px; background-color: #e1dedf; margin-top: 69px;"><td></td></tr>

</table>
</div>

<div id ='tab5' class="unvisable" align="center">
<table style="width: 980px; margin: auto; text-align: center;">

<tr style="width: 120%; height: 2px; background-color: #000; margin-top: 12px;"><td></td></tr>

<tr style="height: 80px;"><td></td></tr>

<tr>
<td style="font-size: 15px; color: #999; text-align: center;">
비밀번호 확인
</td>
</tr>

<tr style="height: 5px;"><td></td></tr>

<tr>
<td>
<font style="color: #00bdc8; font-size: 13px; font-weight: 700;">개인 정보 보호를 위해 한번 더 로그인해주시기 바랍니다.</font>
</td>
</tr>

<tr style="height: 15px;"><td></td></tr>
<tr>
<td>
<input type="text" name="userPwd"  onclick="" style="width: 380px; height: 44px; background-color: #f7f7f7 ; 
border: 1px solid #e1dedf; padding-left: 23px; font-size: 15px; font-weight: 700; color: #888;">
<input type="button" value="확인" style="width: 81px; height: 46px; background-color: #fff; 
border: 1px solid #e1dedf; font-size: 13px; font-weight: 700; margin-left: 20px;">
</td>
</tr>

<tr style="height: 70px;"><td></td></tr>



<tr style="height: 90px;"><td></td></tr>
<tr style="width: 100%; height: 1px; background-color: #e1dedf; margin-top: 69px;"><td></td></tr>

</table>
</div>





<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naver_id_login"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->


<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("1vCqf3AZHS04V5QPiz84", "http://www.localhost:8080/study/meatShop/login.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
<!-- //네이버아디디로로그인 초기화 Script -->


<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
	
	}
	
	console.log(naver_id_login.getProfileData('email'));

	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	
	
	
	 console.log(response['email']);
	 console.log(response['ninkname']);
	
	
</script>
<!-- //네이버아디디로로그인 Callback페이지 처리 Script -->






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