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
	<%@ include file="WEB-INF/include/main_footer.jsp" %>
	</div>
	<!-- ./wrapper -->
	
	<%@ include file="WEB-INF/include/getBoard_plugin_js.jsp" %>
</body>
</html>
