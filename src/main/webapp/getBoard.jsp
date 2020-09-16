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
								<a href="userinfo" class="d-block">${sessionName }님</a>
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
							<h1 class="m-0 text-dark">${board.cafename}</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item">
									<a href="index.jsp">Home</a>
								</li>
								<li class="breadcrumb-item">
									<a href="getBoardList?cafe=${board.cafename}">${board.cafename}</a>
								</li>
								<li class="breadcrumb-item active">
									${board.menuname}
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
			<!-- 메뉴 상세 정보 -->
			<div class="content">
				<div class="card card-solid">
					<div class="card-header boader-bottom-0">
						<div class="row">
							<!-- 메뉴 이미지 -->
							<div class="col-12 col-sm-6" style="padding-bottom:10px; margin-bottom:15px;">
								<img class="card-img" src="data/image/${board.cafename}/${board.menuname}.jpg" style="border-radius:.25rem;" alt="${board.menuname}">
							</div>
							<!-- 메뉴 이름 -->
							<div class="col-12 col-sm-6">	
								<h2 class="text-center" style="font-weight: bold; padding-top: 25px; padding-bottom: 15px; margin-bottom:45px; border-bottom:2px solid; border-top:1px solid rgba(0, 0, 0, .2);" >						
									${board.menuname}
								</h2>				
								<!-- 메뉴 상세 정보 -->				
								<div class="row col-12 mx-auto text-muted" style="padding-bottom: 35px;">
									<div class="col-12" style="">
										<ul>
											<li>
												<dl>
													<dt style="font-weight:normal; font-size:1.3em">칼로리 (kcal)</dt>
													<dd style="font-size:1.1em;">${board.kcal}</dd>
												</dl>
											</li>
											<li>
												<dl>
													<dt style="font-weight:normal; font-size:1.3em">카페인 (mg)</dt>
													<dd style="font-size:1.1em;">${board.caffeine}</dd>
												</dl>
											</li>
										</ul>
										<ul>
											<li>
												<dl>
													<dt style="font-weight:normal; font-size:1.3em">나트륨 (mg)</dt>
													<dd style="font-size:1.1em;">${board.sodium}</dd>
												</dl>
											</li>
											<li>
												<dl>
													<dt style="font-weight:normal; font-size:1.3em">당류 (g)</dt>
													<dd style="font-size:1.1em;">${board.sugars}</dd>
												</dl>
											</li>											
										</ul>
									</div>
								</div>								
							</div>							
						</div>
					</div>
					<!-- 메뉴의 총 별점 -->
					<div class="card-body pd-0">
						<div class="col-12 text-center" style="font-size:3em;">
							<i class="fas fa-star" style="color: #FFC31E; padding-right:0.2em;"></i>
							<!-- <i class="fas fa-star" style="color: #FFC31E;"></i>
							<i class="fas fa-star" style="color: #FFC31E;"></i>
							<i class="fas fa-star-half-alt" style="color: #FFC31E;"></i>
							<i class="far fa-star" style="color: #FFC31E;"></i>
							<br>		 -->
							<span id="sAvg"></span>
						</div>
					</div>
					<!-- Comment 등록  -->
					<div class="card-footer" style="border-top:1px solid rgba(0, 0, 0, .2); border-bottom:1px solid rgba(0, 0, 0, .2);">
						<form class="form-horizontal">
							<div class="row">
								<!-- 별점 등록 -->
								<div class="col-12 align-self-center" style="padding-bottom:5px; padding-top:5px;">
									<div class="make_star text-center" style="height: 100%; align-items: center; font-size: 2em;">
										<!-- <input class="star" type="hidden" name="star" value="1"> -->
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>	
									</div>	
								</div>
								<!-- 리뷰 등록 -->
								<div class="col-12 input-group input-group-sm mb-0" style="padding:5px;">
									<textarea id="newReplyText" class="form-control form-control-sm form-control-md col-11" rows="3" onKeyUp="checkByte(this.form);" placeholder="리뷰와 별점을 작성해주세요." style="resize: none;"></textarea>
									<div class="input-group-append col-2" style="padding-right:0;">
										<button type="button" class="btn btn-danger replyAddBtn" style="width:100%;">등록</button>
									</div>
								</div>	
									<p class="data_count col-12 m-0">
										<em id="messagebyte">0</em> / 1000
									</p>		
							</div>
						</form>
					</div>
					<!-- Comment 등록 부분 끝 -->
				</div>
				
				<div class="card card-success card-outline">
				    <%--리뷰 유무 / 리뷰 갯수 / 리뷰 펼치기, 접기--%>
				    <div class="card-header">	
				    	<h3 class="card-title text-muted">
				    		<i class="fas fa-comments replyCount"></i>
				    	</h3>
				        <div class="card-tools">
				            <a href="#" class="btn-tool" data-card-widget="collapse">
				                <i class="fa fa-minus"></i>
				            </a>
				        </div>
				    </div>
				    <%--리뷰 목록--%>
				    <div class="card-body repliesDiv">
						
				    </div>
				    <%--리뷰 페이징--%>
				    <div class="card-footer">
				        <div class="text-center">
				            <ul class="pagination justify-content-center m-0">
								
				            </ul>
				        </div>
				    </div>
				</div>
				
				<%--리뷰 수정 modal 영역--%>
				<div class="modal fade" id="modModal">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header align-self-center">				                
				                <h4 class="modal-title">리뷰 수정</h4>
				            </div>
				            <div class="modal-body">
				                <input type="hidden" class="replyNo"/>
				                <%--<input type="text" id="replytext" class="form-control"/>--%>
				                <textarea class="form-control" id="replyText" rows="3" style="resize: none"></textarea>
				            </div>
				            <div class="modal-footer align-self-center">
				                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
				                <button type="button" class="btn btn-primary modalModBtn">수정</button>
				            </div>
				        </div>
				    </div>
				</div>
				
				<%--리뷰 삭제 modal 영역--%>
				<div class="modal fade" id="delModal">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header align-self-center">				                
				                <h4 class="modal-title">리뷰 삭제</h4>
				                <input type="hidden" class="rno"/>
				            </div>
				            <div class="modal-body align-self-center">
				                <p>리뷰를 삭제하시겠습니까?</p>
				                <input type="hidden" class="rno"/>
				            </div>
				            <div class="modal-footer align-self-center">
				                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
				                <button type="button" class="btn btn-primary modalDelBtn">삭제</button>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
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
			<div class="float-right d-none d-sm-block">
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
	<%--Handlebars--%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
	
	<!-- Sidebar active를 위한 js -->
	<script type="text/javascript">
		$(document).ready(function() {
			/** add active class and stay opened when selected */
			var url = window.location;

			// for sidebar menu entirely but not cover treeview
			$('ul.nav-sidebar a').filter(function() {
				return $(this).attr('id') == "${param.cafe}";
			}).addClass('active');

			// for treeview
			$('ul.nav-treeview a').filter(function() {
				return $(this).attr('id') == "${param.cafe}";
			}).parentsUntil(".nav-sidebar > .nav-treeview").addClass('menu-open').prev('a').addClass('active');
		});

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
	
	<!-- 리뷰 목록 처리를 위한 템플릿 코드 -->
	<!-- handlebars -->
	<script id="replyTemplate" type="text/x-handlebars-template">
    {{#each.}}
    <div class="post replyDiv" data-replyNo={{rid}}>
        <div class="user-block">
            <%--리뷰 작성자 프로필사진--%>
            <img class="img-circle img-bordered-sm" src="image/logo.png" alt="u">
            <%--리뷰 작성자--%>
			
            <span class="username">
                <%--작성자 이름--%>
                <a href="#">{{id}}</a>
				<%--리뷰 삭제 버튼--%>
				<div class="float-right">
				<a href="#" class="btn-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
                	<i class="fa fa-times"> 삭제</i>
            	</a>
				<%--리뷰 수정 버튼--%>
				<a href="#" class="btn-tool replyModBtn" data-toggle="modal" data-target="#modModal">
                	<i class="fa fa-edit"> 수정</i>
            	</a>
				</div>
            </span>
			<%--리뷰 작성일자--%>
            <span class="description">{{prettifyDate regDate}}</span>
        </div>
        <%--리뷰 내용--%>
		<div class="oldReplyStar">
			{{{regStar starNum}}}
		</div>
		</br>
        <div class="oldReplyText">{{{escape replyText}}}</div>
        <br/>
    </div>
    {{/each}}
	</script>

	<script>	
    $(document).ready(function () {
    	
    	<%--Handlebars.registerHelper("eqReplyWriter", function (replyWriter, block) {
            var accum = "";
            if (replyWriter === "${login.userId}") {
                accum += block.fn();
            }
            return accum;
        });--%>
        
        // 리뷰 별점 입력 함수
        var starNum = 0;
        
        $(function() {
			$('.make_star i').click(function() {
				var targetNum = $(this).index() + 1;
				starNum = targetNum;
				$('.make_star i').css({color: '#000'});
				$('.make_star i:nth-child(-n+' + targetNum + ')').css({color: '#F00'});
			});
		});
        
        var cid = "${board.cid}";  // 현재 게시글의 cid
        var replyPageNum = 1; // 리뷰 페이지 번호 초기화
        
     	// 별점 평균 출력 처리 
        getStarNum("/coffeereview/replies/"  + cid);
        
     	// 별점 평균 출력 함수
        function getStarNum(getStarUri) {
            $.getJSON(getStarUri, function (data) {
            	// 소수점 한자리수까지 출력
            	$('#sAvg').html(data.toFixed(1));
            });
        }
        
     	// 리뷰 별점 : 출력처리
        Handlebars.registerHelper("regStar", function (starNum) {
            var oldStarNum = Handlebars.Utils.escapeExpression(starNum);
            var result = '';
            var i;
            for (i = 1; i <= 5; i++) {
            	if (i <= oldStarNum) {
            		result += `<i class='fas fa-star' style='color:#f00;'></i>`;
            	}
            	else {
            		result += `<i class='fas fa-star'></i>`;
            	}
            }
            return new Handlebars.SafeString(result);
        });
        
     	// 리뷰 내용 : 줄바꿈/공백처리
        Handlebars.registerHelper("escape", function (replyText) {
            var text = Handlebars.Utils.escapeExpression(replyText);
            text = text.replace(/(\r\n|\n|\r)/gm, "<br/>");
            text = text.replace(/( )/gm, "&nbsp;");
            return new Handlebars.SafeString(text);
        });

        // 리뷰 등록일자 : 날짜/시간 2자리로 맞추기
        Handlebars.registerHelper("prettifyDate", function (timeValue) {
            var dateObj = new Date(timeValue);
            var year = dateObj.getFullYear();
            var month = dateObj.getMonth() + 1;
            var date = dateObj.getDate();
            var hours = dateObj.getHours();
            var minutes = dateObj.getMinutes();
            // 2자리 숫자로 변환
            month < 10 ? month = '0' + month : month;
            date < 10 ? date = '0' + date : date;
            hours < 10 ? hours = '0' + hours : hours;
            minutes < 10 ? minutes = '0' + minutes : minutes;
            return year + "-" + month + "-" + date + " " + hours + ":" + minutes;
        });
        
        // 리뷰 목록 함수 호출
        getReplies("/coffeereview/replies/" + cid + "/" + replyPageNum);
        
     	// 리뷰 목록 함수
        function getReplies(repliesUri) {
            $.getJSON(repliesUri, function (data) {
                printReplyCount(data.pageMaker.totalCount);
                printReplies(data.replies, $(".repliesDiv"), $("#replyTemplate"));
                printReplyPaging(data.pageMaker, $(".pagination"));
            });
        }

        // 리뷰 갯수 출력 함수
        function printReplyCount(totalCount) {

            var replyCount = $(".replyCount");
            var collapsedBox = $(".collapsed-box");

            // 리뷰가 없으면
            if (totalCount === 0) {
                replyCount.html(" 리뷰가 없습니다. 리뷰를 남겨주세요");
                collapsedBox.find(".btn-tool").remove();
                return;
            }

            // 리뷰이 존재하면
            replyCount.html(" 리뷰 목록 (" + totalCount + ")");
            collapsedBox.find(".card-tools").html(
                "<a href='#' class='btn-tool' data-card-widget='collapse'>"
                + "<i class='fa fa-plus'></i>"
                + "</a>"
            );

        }

        // 리뷰 목록 출력 함수
        function printReplies(replyArr, targetArea, templateObj) {
            var replyTemplate = Handlebars.compile(templateObj.html());
            var html = replyTemplate(replyArr);
            $(".replyDiv").remove();
            targetArea.html(html);
        }

        // 리뷰 페이징 출력 함수
        function printReplyPaging(pageMaker, targetArea) {
            var str = "";
            if (pageMaker.prev) {
                str += "<li class='page-item'><a class='page-link d-flex' style='height: 100%; align-items: center;' href='" + (pageMaker.startPage - 1) + "'><i class='fas fa-angle-left fa-sm'></i></a></li>";
            }
            for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
                var strClass = pageMaker.criteria.page == i ? "active " : "";
                str += "<li class='" + strClass +  "page-item'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
            }
            if (pageMaker.next) {
                str += "<li class='page-item'><a class='page-link d-flex' style='height: 100%; align-items: center;' href='" + (pageMaker.endPage + 1) + "'><i class='fas fa-angle-right fa-sm'></i></a></li>";
            }
            targetArea.html(str);
        }

        
        // 리뷰 페이지 번호 클릭 이벤트
        $(".pagination").on("click", "li a", function (event) {
            event.preventDefault();
            replyPageNum = $(this).attr("href");
            getReplies("/coffeereview/replies/" + cid + "/" + replyPageNum);
            getStarNum("/coffeereview/replies/"  + cid);
        });

        // 리뷰 저장 버튼 클릭 이벤트
        $(".replyAddBtn").on("click", function () {
        	
            // 입력 form 선택자
            <%--var replyWriterObj = $("#newReplyWriter");--%>
            var replyTextObj = $("#newReplyText");
            var replyWriter = "관리자";
            var replyText = replyTextObj.val();
            
            // 리뷰 입력처리 수행
            $.ajax({
                type: "post",
                url: "/coffeereview/replies/",
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "POST"
                },
                dataType: "text",
                data: JSON.stringify({
                    cid: cid,
                    id: replyWriter,
                    starNum: starNum,
                    replyText: replyText
                }),
                success: function (result) {
                    //console.log("result : " + result);
                    if (result === "textLongFail") {
                    	alert("1000 글자까지 작성 가능합니다.");
                    	replyTextObj.val(replyText.substring(0, limitByte));
                    }
                    else if (result === "starNumFail") {
                    	alert("별점 하나 이상 선택해주세요.");
                    }
                    else if (result === "textSpaceFail") {
                    	alert("리뷰는 공백을 제외하고 한 글자 이상 써주세요.");
                    }
                    else if (result === "regSuccess") {
                        alert("리뷰가 등록되었습니다.");
                        replyPageNum = 1;  // 페이지 1로 초기화
                        starNum = 0; // 별점을 0으로 초기화
                        $('.make_star i').css({color: '#000'}); // 별점 입력창 공백처리
                        getReplies("/coffeereview/replies/" + cid + "/" + replyPageNum); // 리뷰 목록 호출
                        getStarNum("/coffeereview/replies/"  + cid);
                        replyTextObj.val("");   // 리뷰 입력창 공백처리
                        $('#messagebyte').text(0); // 리뷰 입력창 글자수 초기화
                    }
                }
            });
        });
        
        // 리뷰 수정을 위해 modal창에 선택한 리뷰의 값들을 세팅
        $(".repliesDiv").on("click", ".replyDiv", function (event) {
            var reply = $(this);
            $(".replyNo").val(reply.attr("data-replyNo"));
            $("#replyText").val(reply.find(".oldReplyText").text());
        });
        
        // modal 창의 리뷰 수정버튼 클릭 이벤트
        $(".modalModBtn").on("click", function () {
            var replyNo = $(".replyNo").val();
            var replyText = $("#replyText").val();
            $.ajax({
                type: "put",
                url: "/coffeereview/replies/" + replyNo,
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "PUT"
                },
                dataType: "text",
                data: JSON.stringify({
                    replyText: replyText
                }),
                success: function (result) {
                    console.log("result : " + result);
                    if (result === "modSuccess") {
                        alert("리뷰가 수정되었습니다.");
                        getReplies("/coffeereview/replies/" + cid + "/" + replyPageNum); // 리뷰 목록 호출
                        getStarNum("/coffeereview/replies/"  + cid);                        
                        $("#modModal").modal("hide"); // modal 창 닫기
                    }
                }
            })
        });
        
        // modal 창의 리뷰 삭제버튼 클릭 이벤트
        $(".modalDelBtn").on("click", function () {
            var replyNo = $(".replyNo").val();
            $.ajax({
                type: "delete",
                url: "/coffeereview/replies/" + replyNo,
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "DELETE"
                },
                dataType: "text",
                success: function (result) {
                    console.log("result : " + result);
                    if (result === "delSuccess") {
                        alert("리뷰가 삭제되었습니다.");
                        getReplies("/coffeereview/replies/" + cid + "/" + replyPageNum); // 리뷰 목록 호출
                        getStarNum("/coffeereview/replies/"  + cid);
                        $("#delModal").modal("hide"); // modal 창 닫기
                    }
                }
            });
        });
    });
    
 	// 리뷰 글자수의 최대 크기
	var limitByte = 1000;
	
	// textarea에 입력된 문자의 바이트 수를 체크
	function checkByte(frm) {
		var totalByte = 0;
		var replyText = frm.newReplyText.value;
		
		for(var i =0; i < replyText.length; i++) {
			var currentByte = replyText.charCodeAt(i);
			if(currentByte > 128) 
				totalByte += 1;
			else totalByte++;
		}
		
		// 현재 입력한 문자의 바이트 수를 체크하여 표시
		$('#messagebyte').text(totalByte);
		
		// 입력된 바이트 수가 limitByet를 초과 할 경우 경고창 
		if(totalByte > limitByte) {
			alert( limitByte + "글자까지 작성 가능합니다.");
			frm.newReplyText.value = replyText.substring(0,limitByte);
			$('#messagebyte').text(limitByte);
		}
	}
	</script>
</body>
</html>
