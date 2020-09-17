<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" style="height:auto;">

<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>Coffee Review | 메인 화면</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
</head>
<body class="hold-transition sidebar-mini layout-boxed" style="background: #f4f6f9;">
	<div class="wrapper">

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light"> 
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" data-widget="pushmenu" href="#" role="button">
						<i class="fas fa-bars"></i>
					</a
				></li>
				<li class="nav-item d-none d-sm-inline-block">
					<a href="index.jsp" class="nav-link">Home</a>
				</li>
				<li class="nav-item d-none d-sm-inline-block">
					<a href="#" class="nav-link">임시</a>
				</li>
			</ul>
	
			<!-- SEARCH FORM --> 
			<!-- 검색 부분 시작 -->
			<form class="form-inline ml-3" method="get" accept-charset="utf-8" action="getBoardList">
				<input type="hidden" name="cafe" value="All">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" name="keyword" type="search" placeholder="Menu Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-navbar" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form>
			<!-- 검색 부분 끝 --> 
			
			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link" data-toggle="dropdown" href="#">
						<i class="far fa-comments"></i> <span class="badge badge-danger navbar-badge">3</span>
					</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item">
							<!-- Message Start -->
							<div class="media">
								<img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Brad Diesel <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">Call me whenever you can...</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div>
							<!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<!-- Message Start -->
							<div class="media">
								<img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										John Pierce <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">I got your message bro</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div>
							<!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<!-- Message Start -->
							<div class="media">
								<img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Nora Silvester <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">The subject goes here</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div>
							<!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
					</div>
				</li>
	
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown">
					<a class="nav-link" data-toggle="dropdown" href="#">
						<i class="far fa-bell"></i> <span class="badge badge-warning navbar-badge">15</span>
					</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-header">15 Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="fas fa-envelope mr-2"></i> 4 new messages <span class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="fas fa-users mr-2"></i> 8 friend requests <span class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="fas fa-file mr-2"></i> 3 new reports <span class="float-right text-muted text-sm">2 days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
					</div>
				</li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4"> 
			<!-- Brand Logo --> 
			<a href="index.jsp" class="brand-link">
				<img src="resources/image/logo.png" alt="coffeereview.png" class="brand-image img-circle elevation-3" style="opacity: .8"> <span class="brand-text font-weight-light">CoffeeReview</span>
			</a> 
			
			<!-- Sidebar -->
			<div class="sidebar">
				<c:choose>
					<c:when test="${sessionId eq null }">
						<!-- Sidebar user panel (optional) (session is empty) -->
						<div class="user-panel mt-3 pb-3 mb-3 d-flex">
							<div class="image">
								<img src="dist/img/AdminLTELogo.png" class="img-circle elevation-2">
							</div>
							<div class="info">
								<a href="login" class="d-block">로그인하세요</a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<!-- Sidebar user panel (optional) -->
						<div class="user-panel mt-3 pb-3 mb-3 d-flex">
							<div class="image">
								<img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
							</div>
							<div class="info">
								<a href="userInfo" class="d-block">${sessionName }님</a>
								<!-- 회원정보로 가는 곳 -->
							</div>
							<div class="info">
								<a href="logout" class="d-flex" style="height: 100%; align-items: center;"> 
									<i class="fas fa-sign-out-alt"></i>
								</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
	
				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
						<!-- CAFES 메뉴 시작 -->
						<li class="nav-item nas-treeview menu-open">
							<a id="CAFE" href="#" class="nav-link">
								<i class="nav-icon fas fa-coffee"></i>
								<p>
									CAFE <i class="right fas fa-angle-left"></i>
								</p>
							</a> <!-- CAFE 목록 시작 -->
							<ul class="nav nav-treeview">
								<!-- STARBUCKS -->
								<li class="nav-item">
									<!-- 아무런 입력이 없으면 1 페이지로 가도록 함 BoardController의 getBoardList의 page 매개변수 참고 --> 
									<a id="STARBUCKS" href="getBoardList?cafe=STARBUCKS" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>STARBUCKS</p>
									</a>
								</li>
								<!-- COFFEEBEAN -->
								<li class="nav-item">
									<a id="COFFEEBEAN" href="getBoardList?cafe=COFFEEBEAN" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>COFFEEBEAN</p>
									</a>
								</li>
								<!-- TWOSOME -->
								<li class="nav-item">
									<a id="TWOSOME" href="getBoardList?cafe=TWOSOME" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>TWOSOME</p>
									</a>
								</li>
							</ul> 
							<!-- CAFE 목록 끝 -->
						</li>
						<!-- CAFES 메뉴 끝 -->
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar --> 
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0 text-dark">${cname}</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item">
									<a href="index.jsp">Home</a>
								</li>
								<li class="breadcrumb-item active">
									${cname}
								</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<!-- 음료 리스트(카페 별) -->
			<div class="content">
				<div class="card card-solid">
					<!-- 카페 음료 -->
					<!-- 카페 헤더 부분 -->
					<!-- 정렬 부분 -->
					<div class="card-header text-muted boader-bottom-0">
						<div class="input-group-prepend float-sm-right">
							<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"">정렬</button>
							<div class="dropdown-menu">
								<c:choose>
									<c:when test="${empty keyword}">
										<a class="dropdown-item" href="getBoardList?cafe=${cname}">별점 순</a>
										<a class="dropdown-item" href="getBoardList?cafe=${cname}&sort=caffeine">카페인 순</a>
										<a class="dropdown-item" href="getBoardList?cafe=${cname}&sort=kcal">칼로리 순</a>
										<a class="dropdown-item" href="getBoardList?cafe=${cname}&sort=sodium">나트륨 순</a>
										<a class="dropdown-item" href="getBoardList?cafe=${cname}&sort=sugars">당분 순</a>
									</c:when>
									<c:otherwise>
										<a class="dropdown-item" href="getBoardList?cafe=${cname}&keyword=${keyword}">별점 순</a>
										<a class="dropdown-item" href="getBoardList?cafe=${cname}&keyword=${keyword}&sort=caffeine">카페인 순</a>
										<a class="dropdown-item" href="getBoardList?cafe=${cname}&keyword=${keyword}&sort=kcal">칼로리 순</a>
										<a class="dropdown-item" href="getBoardList?cafe=${cname}&keyword=${keyword}&sort=sodium">나트륨 순</a>
										<a class="dropdown-item" href="getBoardList?cafe=${cname}&keyword=${keyword}&sort=sugars">당분 순</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<!-- 정렬 부분 끝 -->
					<!-- 카페 헤더 부분 끝 -->

					<!-- 카페 바디 부분 -->
					<div class="card-body pd-0">
						<div class="row align-items-stretch">
							<c:forEach items="${boardList }" var="board">
								<div class="col-6 col-md-3 align-items-stretch">
									<a href="getBoard?cafe=${board.cafename}&menu=${board.cid}">
										<div class="card bg-light" style="cursor: pointer; border-top-left-radius: 19px; border-top-right-radius: 19px;">
										
											<c:choose>
												<c:when test="${not empty keyword}">
													<div class="ribbon-wrapper ribbon-lg">
														<div class="ribbon bg-warning test-xl">${board.cafename}</div>
													</div>
													<img class="card-header img-fluid p-0" src="data/image/${board.cafename}/${board.menuname}.jpg" alt="${board.menuname}" style="padding-bottom: 6px;">
												</c:when>
												<c:otherwise>
													<img class="card-header img-fluid p-0" src="data/image/${board.cafename}/${board.menuname}.jpg" alt="${board.menuname}" style="padding-bottom: 6px;">
												</c:otherwise>
											</c:choose>
	
											<div class="card-body row text-center p-0" style="display: table; height:3em;">
												<div class="align-self-center" style="display: table-cell; vertical-align: middle;">
													<span style="font-size:0.8em; font-weight: bold; color: red;">커피</span>
													<br>
													<span style="font-weight: bold;">${board.menuname}</span>
												</div>
											</div>
											<div class="card-footer p-0" style="width=100%; height: 2.5em; display: table;">
												<div class="text-center" style="font-size: 1.3em; display: table-cell; vertical-align: middle;">
													<i class="fas fa-star" style="color: #FFC31E;"></i>
													<span id="sAvg">${board.starAvg}</span>
												</div>
											</div>																	
										</div>	
									</a>								
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- 카페 바디 부분 끝 -->
					<!-- 카페 음료 끝 -->

					<!-- 페이징 부분 -->
					<div class="card-footer">
						<nav aria-label="Contancts Page Navigation">
						<ul class="pagination justify-content-center m-0">
							<c:if test="${pagination.curRange ne 1 }">
								<li class="page-item">
									<a href="javascript:void(0);" class="page-link d-flex shadow-none" style="height: 100%; align-items: center;" onClick="fn_paging(1); return false;">
										<i class="fas fa-angle-double-left fa-sm"></i>
									</a>
								</li>
							</c:if>
							<c:if test="${pagination.curPage ne 1}">
								<li class="page-item previous">
									<a href="javascript:void(0);" class="page-link d-flex shadow-none" style="height: 100%; align-items: center;" onClick="fn_paging('${pagination.prevPage }'); return false;">
										<i class="fas fa-angle-left fa-sm"></i>
									</a>
								</li>
							</c:if>
							<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
								<c:choose>
									<c:when test="${pageNum eq  pagination.curPage}">
										<li class="page-item active" style="pointer-events: none;">
											<a href="javascript:void(0);" class="page-link d-flex shadow-none" onClick="fn_paging('${pageNum }'); return false;" style="height: 100%; align-items: center; font-weight: bold;"> ${pageNum } </a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a href="javascript:void(0);" class="page-link d-flex shadow-none" onClick="fn_paging('${pageNum }'); return false;" style="height: 100%; align-items: center; font-weight: bold;"> ${pageNum } </a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
								<li class="page-item">
									<a href="javascript:void(0);" class="page-link d-flex shadow-none" onClick="fn_paging('${pagination.nextPage }'); return false;" style="height: 100%; align-items: center;">
										<i class="fas fa-angle-right fa-sm"></i>
									</a>
								</li>
							</c:if>
							<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
								<li class="page-item">
									<a href="javascript:void(0);" class="page-link d-flex shadow-none" onClick="fn_paging('${pagination.pageCnt }'); return false;" style="height: 100%; align-items: center;">
										<i class="fas fa-angle-double-right fa-sm"></i>
									</a>
								</li>
							</c:if>
						</ul>
						</nav>
					</div>
					<!-- 페이징 부분 끝 -->
				</div>
			</div>

			<!-- 페이징 정보 부분 -->
			<!-- <div>
				현재 페이지 : ${pagination.curPage } / 총 페이지 : ${pagination.pageCnt } / 총 게시글 : ${pagination.listCnt }
				/ 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
			</div> -->
			<!-- 페이징 정보 부분 끝 -->
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark"> <!-- Control sidebar content goes here -->
			<div class="p-3">
				<h5>CoffeeReview</h5>
				<p>개인 메뉴 등</p>
			</div>
		</aside>
		<!-- /.control-sidebar -->

		<!-- Main Footer -->
		<footer class="main-footer"> <!-- To the right -->
			<div class="float-right d-none d-sm-inline">
				<b>Version</b> 1.0.1
			</div>
		
			<!-- Default to the left --> 
			<strong>Copyright &copy; 2020 
				<a href="https://github.com/93HSpring/CoffeeReview">93HSpring/CoffeeReview</a>.
			</strong> All rights reserved. 
		</footer>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->
	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
	<!-- Sidebar active를 위한 js -->
	<script type="text/javascript">
		$(document).ready(
				function() {
					/** add active class and stay opened when selected */
					var url = window.location;

					// for sidebar menu entirely but not cover treeview
					$('ul.nav-sidebar a').filter(function() {
						return $(this).attr('id') == "${param.cafe}";
					}).addClass('active');

					// for treeview
					$('ul.nav-treeview a').filter(function() {
						return $(this).attr('id') == "${param.cafe}";
					}).parentsUntil(".nav-sidebar > .nav-treeview").addClass(
							'menu-open').prev('a').addClass('active');
				})

		function fn_paging(curPage) {
			var keyword_param = getParam("keyword");
			var sort_param = getParam("sort");

			if (!keyword_param) {
				if (sort_param) {
					location.href = "/coffeereview/getBoardList?cafe=${param.cafe}&sort=${param.sort}&page=" + curPage;
				} else {
					location.href = "/coffeereview/getBoardList?cafe=${param.cafe}&page=" + curPage;
				}
			} else if (!sort_param) {
				if (keyword_param) {
					location.href = "/coffeereview/getBoardList?cafe=All&keyword=${param.keyword}&page=" + curPage;
				} else {
					location.href = "/coffeereview/getBoardList?cafe=${param.cafe}&page=" + curPage;
				}
			} else if (sort_param) {
				if (keyword_param) {
					location.href = "/coffeereview/getBoardList?cafe=All&keyword=${param.keyword}&sort=${param.sort}&page=" + curPage;
				}
			}
		}

		function getParam(sname) {
			var params = location.search
					.substr(location.search.indexOf("?") + 1);
			var sval = "";

			params = params.split("&");

			for (var i = 0; i < params.length; i++) {
				temp = params[i].split("=");
				if ([ temp[0] ] == sname) {
					sval = temp[1];
				}
			}

			return sval;
		}
	</script>
	<!-- TEST를 위한 js -->
	<script type="text/javascript">
		function callFunction(cafe) {
			if (cafe == "${ cafename}") {
				console.log("맞아")
			} else {
				console.log("아니야")
			}
		}
	</script>

</body>
</html>
