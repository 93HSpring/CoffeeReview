<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | Registration Page</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	function checkForm() {
		if (document.signup.phonenum.value == "") {
			alert("전화번호를 입력하세요.");
			document.signup.phonenum.focus();
			return false;
		}
		
		if (document.signup.address.value == "") {
			alert("주소를 입력하세요.");
			document.signup.address.focus();
			return false;
		}
		
		alert("회원가입이 완료되었습니다. 가입한 아이디로 로그인해주세요.");
		document.signup.action = "signup";
		return true;
		
	}
</script>

<!-- id name nickname age gender email  -->


<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="index.jsp"><b>CoffeeReview</b>*^^*</a>
		</div>

		<div class="card">
			<div class="card-body register-card-body">
				<p class="login-box-msg">Register a new membership</p>

				<form name="signup" onsubmit="return checkForm()" method="post">
					<div class="input-group mb-3">
						<input type="hidden" class="form-control" name="id" value="${id }">
					</div>

					<div class="input-group mb-3">
						<input type="text" class="form-control" name="name" placeholder="Name" value="${name }">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>

					<div class="input-group mb-3">
						<input type="text" class="form-control" name="nickname" placeholder="Nickname" value="${nickname }">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>

					<div class="input-group mb-3">
						<input type="text" class="form-control" name="age" placeholder="Age">
					</div>

					<div class="input-group mb-3">
						<input type="text" class="form-control" name="gender" placeholder="Gender" value="${gender }">
					</div>

					<div class="input-group mb-3">
						<input type="text" class="form-control" name="phonenum" placeholder="PhoneNumber">
					</div>

					<div class="input-group mb-3">
						<input type="text" class="form-control" name="address" placeholder="Address">
					</div>


					<div class="input-group mb-3">
						<input type="email" class="form-control" name="email" placeholder="Email" value="${email }">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>



					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
								<input type="checkbox" id="agreeTerms" name="terms" value="agree"> <label for="agreeTerms"> I agree to the <a href="#">terms</a>
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">Register</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

				<a href="login.jsp" class="text-center">I already have a membership</a>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->

	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
</body>
</html>
