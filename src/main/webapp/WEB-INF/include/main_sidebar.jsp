<%@page contentType="text/html; charset=UTF-8"%>
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