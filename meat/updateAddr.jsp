<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문하기</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/meat/data/payment.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<script type="text/javascript">

	function update_Addr(){
		var addrNum = '<c:out value="${addrNum}"/>'
		document.updateForm.action = "<%=cp%>/meatShop/updateAddr_ok.do?addrNum="+addrNum;
		document.updateForm.submit();
	}
	
</script>
</head>
<body>

<div id="dark" style="width: 100%; height: 10000px; position: absolute; left: 0px; top:0px; z-index:100; 
background-color: black; opacity: 60%" class="visable" onclick="javascript:location.href='<%=cp%>/meatShop/payment.do?change=1&addrNum=0';"></div>

<div id="popup">
	<div id="addr_list_update" style="background:#ffffff; width: 680px; height: 550px; position: fixed; left:50%;
	 top:50%; z-index: 300; margin: -340px 0 0 -275px;" class="visable" align="center">
	 	<div style="width: 100%; height: 100%;position: relative;" >
			<table style="margin-top: 20px;" width="620px;" >
				<tr style="text-align: center" height="70px;">
					<td style="font-size: 14pt; font-weight: bold; text-align: center">주소 입력
					</td>
				</tr>
			</table>
			<form action="" name="updateForm" method="post">
			<table border="1" bordercolor="#e1dedf" style="border-collapse: collapse; border-color: e1dedf;" width="620px">
				<tr style="border: 1px solid #e1dedf">
					<td style="font-size: 13px; text-align: center;" width="140px;" height="60px;" bgcolor="#f7f7f7"><font color="red">*</font> 받으시는 분 이름</td>
					<td style="font-size: 13px;" width="480px;">
						<input type="text" name="recvName" value="${dto.recvName }" style="outline:none; width: 420px; height: 30px; margin-left: 20px; border: 1px solid #e1dedf; padding-left: 20px;">
					</td>
				</tr>
				<tr>
					<td style="font-size: 13px; text-align: center;" height="60px;" bgcolor="#f7f7f7"><font color="red">*</font> 연락처</td>
					<td>
						<input type="text" name="recvPhone" value="${dto.recvPhone }" style="width: 420px; outline: none;height: 30px; margin-left: 20px; border: 1px solid #e1dedf; padding-left: 20px;">
					</td>
				</tr>
				<tr>
					<td style="font-size: 13px; text-align: center;" height="180px;" bgcolor="#f7f7f7"><font color="red">*</font> 주소</td>
					<td>
						<table>
						<tr>
							<td width="350px;">
								<input type="text" name="zipcode" value="${dto.zipcode }" style="outline: none;width: 310px; padding-left: 20px;height: 30px; margin-left: 18px; border: 1px solid #e1dedf;">
							</td>
							<td width="110px" align="right" style="padding-right: 20px;"><input type="button" value="우편번호 찾기" id="btn3" style="cursor:pointer;outline: none; mar" onclick="show_Addr_list();"/></td>
						</tr>
						</table>
						<input type="hidden" name="selectAddr" value="${dto.addrNum }">
						<input type="text" name="recvAddr1" value="${dto.recvAddr1 }" style="outline: none;width: 420px; height: 30px; margin-left: 20px; margin-top: 15px;border: 1px solid #e1dedf;padding-left: 20px;">
						<input type="text" name="recvAddr2" value="${dto.recvAddr2 }" style="outline: none;width: 420px; height: 30px; margin-left: 20px; margin-top: 15px;border: 1px solid #e1dedf;padding-left: 20px;">
					</td>
				</tr>
			</table>
			<div style="font-size: 13px; text-align: right; width: 620px; color: #4a90e2; padding-top: 10px;">* 배송 요청 메세지는 도착 희망일 설정 후 입력하실 수 있습니다.</div>
			<div style="width: 620px; margin-top: 40px;">
			<button type="button" name="back" onclick="update_Addr();" style="width: 100%; height: 60px;cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">등록</button>
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
			
			<table width="980px;" border="1" bordercolor="#e1dedf" style="border-color: #e1dedf;border-collapse:collapse; margin-top: 15px;">
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" width="155px;" height="50px;" style="font-size: 13px; padding-left: 25px;">이름</td>
					<td width="775px;" style="font-size: 13px; padding-left: 25px;">${dto2.recvName }</td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="50px;" style="font-size: 13px; padding-left: 25px;">전화번호</td>
					<td style="font-size: 13px; padding-left: 25px;">${dto2.recvPhone }</td>
				</tr>
				<tr style="border: 1px solid #e1dedf">
					<td bgcolor="#f7f7f7" height="75px;" style="font-size: 13px; padding-left: 25px;">주소</td>
					<td style="font-size: 13px; padding-left: 25px;">${dto2.recvAddr1 }&nbsp;${dto2.recvAddr2 }</td>
				</tr>
			</table>
		</div>
		<div style="width: 980px; margin-top: 100px;">
			<button type="button" name="back" style="width: 50%; height: 60px; cursor:pointer; float: left; font-size: 16px;font-weight: 700; color: #fff; background: gray; border: 0;">이전단계</button>
			<button type="button" name="forward" style="width: 50%; height: 60px; cursor:pointer; float: right; font-size: 16px;font-weight: 700; color: #fff; background: black; border: 0;">다음단계</button>
		</div>
	</div>
</div>
 
<br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>