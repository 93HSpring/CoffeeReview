<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C/DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>

<script>
	function checkForm(){
		if(document.insert.id.value == ""){
			alert("���̵� �Է��ϼ���");
			document.insert.id.focus();
			return false;
		}
		
		if(document.insert.pw.value == ""){
			alert("��й�ȣ�� �Է��ϼ���");
			document.insert.id.focus();
			return false;
		} else if(document.insert.pw.value != document.insert.pwc.value){
			alert("��ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է��ϼ���");
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
		<td bgcolor="orange" width="70">���̵�</td><td align="left">
		<input type="text" name="id"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">��й�ȣ</td><td align="left">
		<input type="password" name="pw" size="10"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">��й�ȣ Ȯ��</td><td align="left">
		<input type="password" name="pwc" size="10"></td>
	</tr>
	
	
	<tr>
		<td bgcolor="orange">�̸�</td><td align="left">
		<input type="text" name="uname" size="10"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">����</td><td align="left">
		<input type="text" name="sex" size="10"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">��ȭ��ȣ</td><td align="left">
		<input type="text" name="uphonenum" size="10"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">�̸���</td><td align="left">
		<input type="text" name="uemail" size="10"></td>
	</tr>
	
	<tr>
		<td bgcolor="orange">�ּ�</td><td align="left">
		<input type="text" name="uadr" size="10"></td>
	</tr>
	
	
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="ȸ�� ����"/></td>
	</tr>
</table>
</form>
<hr>
<a href="index.jsp">�ʱ� ȭ������ ����</a>
</center>
</body>
</html>