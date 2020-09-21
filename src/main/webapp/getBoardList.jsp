<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" style="height:auto;">

<%@ include file="WEB-INF/include/head.jsp" %>

<body class="hold-transition sidebar-mini layout-boxed" style="background: #f4f6f9;">
	<div class="wrapper">
	
	<!-- Navbar -->
	<%@ include file="WEB-INF/include/navbar.jsp" %>
	<!-- /.navbar -->
	
	<!-- Main Sidebar Container -->
	<%@ include file="WEB-INF/include/main_sidebar.jsp" %>
	
	<!-- Control Sidebar -->
	<%@ include file="WEB-INF/include/control_sidebar.jsp" %>
	
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
		
		<!-- Main Footer -->
		<%@ include file="WEB-INF/include/main_footer.jsp" %>
	</div>
	<!-- ./wrapper -->
	
	<%@ include file="WEB-INF/include/plugin_js.jsp" %>
</body>
</html>
