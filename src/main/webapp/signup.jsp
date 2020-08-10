<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C/DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>

<script>
	function checkForm(){
		if(document.insert.id.value == ""){
			alert("아이디를 입력하세요");
			document.insert.id.focus();
			return false;
		}
		
		if(document.insert.pw.value == ""){
			alert("비밀번호를 입력하세요");
			document.insert.id.focus();
			return false;
		} else if(document.insert.pw.value != document.insert.pwc.value){
			alert("암호가 일치하지 않습니다. 다시 입력하세요");
			document.insert.pw.value = "";
			document.insert.pwc.value = "";
			document.insert.pw.focus();
			return false;
		}
		
		document.insert.action = "insertUser.do";
		//document.insert.submit();
	}
	
	

</script>

</head>
<body>
<center>

<form name="insert" onsubmit="return checkForm()" method="post">
<table border="1" cellpadding="0" cellspacing="0">
	
	<tr>
		<td bgcolor="orange" width="70">아이디</td><td align="left">
		<input type="text" name="id"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">비밀번호</td><td align="left">
		<input type="password" name="pw" size="10"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">비밀번호 확인</td><td align="left">
		<input type="password" name="pwc" size="10"></td>
	</tr>
	
	
	<tr>
		<td bgcolor="orange">이름</td><td align="left">
		<input type="text" name="uname" size="10"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">성별</td><td align="left">
		<input type="text" name="sex" size="10"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">전화번호</td><td align="left">
		<input type="text" name="uphonenum" size="10"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">이메일</td><td align="left">
		<input type="text" name="uemail" size="10"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">주소</td><td align="left">
		<input type="text" name="uadr" size="10"></td>
	</tr>
	
	
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="회원 가입"/></td>
	</tr>
</table>
</form>
<hr>
<a href="index.jsp">초기 화면으로 가기</a>
</center>
</body>
</html>