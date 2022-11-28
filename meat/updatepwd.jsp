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

	function login() {
		
		var f = document.myForm;
		
		if(!f.userId.value){	
			alert("아이디를 입력하세요.")
			f.userId.focus();
			return;
		}
		
		str = f.userPwd.value;

		str = str.trim();

		if(!str){	

			alert("패스워드를 입력하세요.")

			f.userPwd.focus();

			return;

		}

		f.userPwd.value = str;

		

		if(!f.pwv.value){

			alert("필수 정보입니다. 비밀번호를 재확인 해주세요.");

			f.pwv.focus();

			return;

		}else if(f.userPwd.value!=f.pwv.value){

			alert("입력한 비밀번호와 다릅니다. 비밀번호를 다시 확인해 주세요.");

			f.pwv.focus();

			return;

		}//if
		
			
		f.action = "<%=cp%>/meatShop/insertPwd.do";
		f.submit();
		window.opener.location.href = 'http://localhost:8080/study/meatShop/login.do';
		
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
	<td colspan="3" align="center"><b>비밀번호 변경</b></td>
</tr>

<tr height="2">
	<td colspan="3" bgcolor="#cccccc"></td>
</tr>

<tr height="25">
	<td width="80" bgcolor="#e6e4e6" align="center">아이디</td>
	<td width="120" style="padding-left: 5px;">
	<input type="text" value="${userId }" name="userId" maxlength="50" style="width: 150px; height: 15px"/>
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<tr height="25">
	<td width="80" bgcolor="#e6e4e6" align="center">비밀번호</td>
	<td width="120" style="padding-left: 5px;">
	<input type="text" name="userPwd" maxlength="30" style="width: 150px; height: 15px"/>
	</td>
</tr>

<tr height="25">
	<td width="80" bgcolor="#e6e4e6" align="center">비밀번호 확인</td>
	<td width="120" style="padding-left: 5px;">
	<input type="text" name="pwv" maxlength="30" style="width: 150px; height: 15px"/>
	</td>
</tr>

<tr height="2">
	<td colspan="3" bgcolor="#cccccc"></td>
</tr>

<tr height="30">
	<td colspan="2" align="center">
	<input type="button" value=" 확인 " class="btn2" onclick="login();"/>
	<input type="button" value=" 취소 " class="btn2" 
	onclick="self.close();"/>
	</td>
</tr>



</table>

</form>
<script type="text/javascript">
${message }
</script>
</body>
</html>