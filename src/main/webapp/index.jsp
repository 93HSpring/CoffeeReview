<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                      "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>
</head>
<body>
<center>
	<h1>게시판 프로그램</h1>
	<hr>
		<a href="getBoardList.do">글 목록 바로가기</a><br>
	<hr>
	
	<hr>
		<a href="login.do">네이버 로그인 바로가기</a><br>
	<hr>
	
	<hr>
		<a href="logout.do">로그아웃 하기</a><br>
	<hr>
	
	
	
	<form action="signup.jsp" method="post">
		<table>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입"/>
				</td>
			</tr>
		</table>
	</form>
	
</center>
</body>
</html>
