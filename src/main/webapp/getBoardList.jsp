<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coffee Review</title>

<!-- Theme style -->
<link rel="stylesheet" href="resources/dist/css/adminlte.min.css" >
</head>
<body>
<center>
<h1>Coffee Review</h1>
<!-- LoginController에서 저장한 사용자 이름을 사용 -->
<h5>${userName}님 게시판에 오신걸 환영합니다... <a href="logout.do" class="btn btn-danger" >Log-out</a></h5>

<!-- 카페 선택 부분 -->
<div style="width:600px;">
	<div class="btn-group w-100 mb-2">
		<a class="btn btn-info" href="getBoardList.do?cafe=Starbucks" style="width:200px;">스타벅스</a>
		<a class="btn btn-info" href="getBoardList.do?cafe=Coffeebean" style="width:200px;">커피빈</a>
		<a class="btn btn-info" href="getBoardList.do?cafe=Twosome" style="width:200px;">투썸</a>
	</div>
</div>
<!-- 카페 선택 부분 끝 -->

<!-- 음료 리스트(카페 별) -->
<div class="col-12" style="width:1005px;">
	<!-- 스타벅스 음료 -->
	<div class="card card-success">
		<!-- 스타벅스 헤더 부분 -->
		<div class="card-header">
			<div class="card-title">
				<h2><c:out value="${ param.cafe}" default="Starbucks" /></h2>
			</div>
			<!-- 검색 부분 -->
			<div class="float-right">
				<form action="getBoardList.do" method="post">
					<div class="row" style="width:250px; height:50px;">
						<select name="searchCondition" class="custom-select custom-select-sm form-control form-control-sm" style="width:65px; height:50px;">
						<c:forEach items="${conditionMap}" var="option">
							<option value="${option.value}">${option.key}
						</c:forEach>
						</select>
						<div class="input-group input-group-sm" style="width:150px;">
							<input name="serchKeyword" type="text" class="form-control" style="height:50px;" />
							<div class="input-group-append">
								<input type="submit" value="검색" class="btn btn-default" />
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- 검색 부분 끝 -->
		</div>
		<!-- 스타벅스 헤더 부분 끝 -->
		
		<!-- 스타벅스 바디 부분 -->
		<div class="card-body">
			<div class="row">
				<c:forEach items="${boardList }" var="board">
					<div class="col-sm-2">
						<a href="getBoardList.do?cafe=${board.cname }">
							<img src="http://localhost:8090/coffeereview/data/image/${board.cname }/${board.id }.jpg">
							<!-- <img src="${pageContext.request.contextPath}/resources/image/${board.cname }/${board.id }.jpg"> -->
						</a>
						<div>
							<span>커피</span>
							<h4>${board.id }</h4>
						</div>
						<div>
							<h4>${board.savg }</h4>
						</div>
					</div>					
				</c:forEach>
			</div>
		</div>
		<!-- 스타벅스 바디 부분 끝 -->
		
	</div>
	<!-- 스타벅스 음료 끝 -->
</div>
<!-- 음료 리스트(카페 별) 끝 -->
<br>
<a href="insertBoard.jsp" class="btn btn-success" >새글 등록</a>
</center>
</body>
</html>
