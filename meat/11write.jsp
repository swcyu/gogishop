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
<title>문의 작성</title>

<style type="text/css">

#center{	
    width: 575px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 25px;


}

#aa{
    text-align: center;
    width: 119px;
    height: 30px;
    border: 1px solid #e1dedf;
    font-size: 13px;
}

#aa1{	
	float: left;
    width: 440px;
    height: 30px;
    border: 1px solid #e1dedf;
}

#enroll{	

	width: 556px;
    height: 60px;
    background-color: #000;
    border: none;
    color: #fff;
    font-size: 16px;
    font-weight: 700;
    position: absolute;
    bottom: 0;

}


</style>


<script type="text/javascript">

	function sendIt1() {
		
		var f = document.myForm2;
		

		alert("확인;")
		
			
		f.action = "<%=cp%>/meatShop/qnaWrite_ok.do";
		f.submit();
		
		window.opener.location.href = 'http://localhost:8080/study/meatShop/bbb.do';
		
		
	}
	

</script>

<!-- 
	window.opener.location.href = 'http://localhost:8080/study/meatShop/qnaList11.do';
	window.opener.location.href = 'http://localhost:8080/study/meatShop/qnaList.do';
		window.close();
 -->


</head>
<body>

<div id="center">

<p style="font-size: 13px; text-align: left;">문의 작성</p>


<form action="" method="post" name="myForm2" enctype="multipart/form-data">

<table>

<tr>
<td id="aa">제목</td>
<td>
<input type="text" name="qnaTitle" id="aa1"/>
</td>
</tr>

<tr>
<td style="text-align: center; width: 119px; height: 105px; border: 1px solid #e1dedf; font-size: 13px;">내용</td>
<td><textarea rows="10" cols="60" name="qnaContent" style="border: 1px solid #e1dedf;"></textarea>
</td>
</tr>

<tr>
<td id="aa">파일 업로드</td>
<td>
<input type="file" id="aa1" name="upload"/>
</td>
</tr>


</table>

<table style="text-align: center; margin: auto;">

<tr><td height="10px;"></td></tr>

<tr><td>
<input type="submit" value="등록하기" style="font-size: 13px; font-weight: 700; text-align: center;" onclick="sendIt1();"/>
<input type="button" value="취소" style="font-size: 13px; font-weight: 700; text-align: center;"
 onclick="self.close();"/>
</td></tr>
</table>

</form>

</div>

<script type="text/javascript">
${message }
</script>

</body>
</html>