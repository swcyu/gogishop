<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/member/css/style.css"/>

<script type="text/javascript">

	function send() {
		
		var f = document.myForm;
		
		if(!f.userId.value){	
			alert("아이디를 입력하세요.")
			f.userId.focus();
			return;
		}
		
		if(!f.userPhone.value){	
			alert("전화번호를 입력하세요.")
			f.userPhone.focus();
			return;
		}
		
		f.action = "<%=cp%>/meatShop/aaa.do";
		f.submit();
		
	}


</script>

</head>
<body>

<form action="" method="post" name="myForm">

<table align="center" cellpadding="0" cellspacing="0">

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<tr height="30">
	<td colspan="2" align="center"><b>비밀번호 찾기</b></td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<tr height="25">
	<td width="80" bgcolor="#e6e4e6" align="center">아이디</td>
	<td width="120" style="padding-left: 5px;">
	<input type="text" name="userId" maxlength="50" style="width: 150px; height: 15px"/>
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<tr height="25">
	<td width="80" bgcolor="#e6e4e6" align="center">전화번호</td>
	<td width="120" style="padding-left: 5px;">
	<input type="text" name="userPhone" maxlength="30" style="width: 150px; height: 15px"/>
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<c:if test="${!empty message }">
<tr><td height="5px;"></td></tr>

<tr>
	<td align="center" colspan="2">
	<font style="font-size: 10pt; color: #4a90e2; font-weight: 700; padding-top: 5px; padding-bottom: 5px; ">${message }</font>
	</td>
</tr>
</c:if>



<tr height="30">
	<td colspan="2" align="center">
	<input type="button" value=" 확인 " class="btn2" onclick="send();"/>
	<input type="button" value=" 취소 " class="btn2" 
	onclick="self.close();"/>
	</td>
</tr>



</table>

</form>

</body>
</html>