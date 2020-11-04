<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" style="height:auto;">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Coffee Review | 회원 정보</title>
  
  
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini sidebar-mini layout-boxed">
<div class="wrapper">
  		<!-- Navbar -->
		<%@ include file="WEB-INF/include/navbar.jsp" %>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<%@ include file="WEB-INF/include/main_sidebar.jsp" %>
  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Profile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
              <li class="breadcrumb-item active">User Profile</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="dist/img/user4-128x128.jpg"
                       alt="User profile picture">
                </div>

                <h3 class="profile-username text-center">${userInfo.name }</h3> <!-- 20200903 -->

                <p class="text-muted text-center">${userInfo.email }</p> 

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>작성한 리뷰 수</b> <a class="float-right">500,000</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link active" href="#profile" data-toggle="tab">Profile</a></li>
                  <li class="nav-item"><a class="nav-link" href="#review" data-toggle="tab">Review</a></li>
                  <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">Timeline</a></li>
                  
                </ul>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">                
                <div class="active tab-pane" id="profile">
                    <form class="form-horizontal" name="modifyProfile" onsubmit="return checkForm()" method="post">
                       <div class="input-group mb-3">
						<input type="hidden" class="form-control" name="uid" value="${userInfo.uid }">
				      </div>  
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">Name</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="name" placeholder="Name" value="${userInfo.name }">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputNickName" class="col-sm-2 col-form-label">NickName</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="nickname" placeholder="Nickname" value="${userInfo.nickname }">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputAge" class="col-sm-2 col-form-label">Age</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="age" placeholder="Age" value="${userInfo.age }">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputGender" class="col-sm-2 col-form-label">Gender</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="gender" placeholder="Gender" value="${userInfo.gender }">
                        </div>
                      </div>
                       <div class="form-group row">
                        <label for="inputPhoneNum" class="col-sm-2 col-form-label">PhoneNum</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phonenum" placeholder="PhoneNum" value="${userInfo.phonenum }">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="address" placeholder="Address" value="${userInfo.address }">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" name="email" placeholder="Email" value="${userInfo.email }">
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <div class="checkbox">
                            <label>
                              <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <button type="submit" class="btn btn-danger">Submit</button>
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="review">
                    <!-- Post --> <!-- 리뷰 -->
	                    <c:forEach items="${userReply}" var="ReplyVO">
	                    <div class="post">
	                      <div class="user-block">
	                        <img class="img-circle img-bordered-sm" src="dist/img/user1-128x128.jpg" alt="user image"> <!-- 커피사진 -->
	                        <span class="username">
	                          <a href="#">${ReplyVO.cid}</a> <!-- 커피 메뉴 이름 -> cid에 맞는 menuname -->
	                          <!--<a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>  X표인데, 이건 없애도 될듯 -->
	                        </span>
	                        <span class="description">Starbucks</span> <!-- 카페 이름 띄우자 -> 지금은 스벅 -->
	                      </div>
	                      <!-- /.user-block -->
	                      <p>
	                           	${ReplyVO.cid} <!-- 리뷰 내용, 별점 -->
	                      </p>
	
	                      <p>
	                        <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> 수정</a> 
	                        <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> 삭제</a> <!-- 여기서 수정, 삭제 필요없지않나? -->
	                        <span class="float-right">
	                          <a href="#" class="link-black text-sm">
	                            <i class="far fa-comments mr-1"></i> 작성글 바로가기 <!-- 해당 cid의 메뉴로 getboard 하게끔 -->
	                          </a>
	                        </span>
	                      </p>
	                    </div>
                    </c:forEach>
                    <!-- /.post -->

                   
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="timeline">
                    <!-- The timeline -->
                    <div class="timeline timeline-inverse">
                      <!-- timeline time label -->
                      <div class="time-label">
                        <span class="bg-danger">
                          10 Feb. 2014
                        </span>
                      </div>
                      <!-- /.timeline-label -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-envelope bg-primary"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 12:05</span>

                          <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                          <div class="timeline-body">
                            Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                            weebly ning heekya handango imeem plugg dopplr jibjab, movity
                            jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                            quora plaxo ideeli hulu weebly balihoo...
                          </div>
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-primary btn-sm">Read more</a>
                            <a href="#" class="btn btn-danger btn-sm">Delete</a>
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-user bg-info"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 5 mins ago</span>

                          <h3 class="timeline-header border-0"><a href="#">Sarah Young</a> accepted your friend request
                          </h3>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-comments bg-warning"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 27 mins ago</span>

                          <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                          <div class="timeline-body">
                            Take me to your leader!
                            Switzerland is small and neutral!
                            We are more like Germany, ambitious and misunderstood!
                          </div>
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-warning btn-flat btn-sm">View comment</a>
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline time label -->
                      <div class="time-label">
                        <span class="bg-success">
                          3 Jan. 2014
                        </span>
                      </div>
                      <!-- /.timeline-label -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-camera bg-purple"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 2 days ago</span>

                          <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                          <div class="timeline-body">
                            <img src="http://placehold.it/150x100" alt="...">
                            <img src="http://placehold.it/150x100" alt="...">
                            <img src="http://placehold.it/150x100" alt="...">
                            <img src="http://placehold.it/150x100" alt="...">
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <div>
                        <i class="far fa-clock bg-gray"></i>
                      </div>
                    </div>
                  </div>
                  <!-- /.tab-pane -->

                  
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.nav-tabs-custom -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.0.5
    </div>
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- function -->
<script>
	function checkForm() {
		console.log("성표쿤~~~~");
		if (document.modifyProfile.name.value == "") {
			alert("이름을 입력하세요.");
			document.modifyProfile.name.focus();
			return false;
		}
		
		if (document.modifyProfile.nickname.value == "") {
			alert("닉네임을 입력하세요.");
			document.modifyProfile.nickname.focus();
			return false;
		}
		
		if (document.modifyProfile.age.value == "") {
			alert("나이를 입력하세요.");
			document.modifyProfile.age.focus();
			return false;
		}
		
		if (document.modifyProfile.gender.value == "") {
			alert("성별을 입력하세요.");
			document.modifyProfile.gender.focus();
			return false;
		}
		
		if (document.modifyProfile.phonenum.value == "") {
			alert("전화번호를 입력하세요.");
			document.modifyProfile.phonenum.focus();
			return false;
		}
		
		if (document.modifyProfile.address.value == "") {
			alert("주소를 입력하세요.");
			document.modifyProfile.address.focus();
			return false;
		}
		
		if (document.modifyProfile.email.value == "") {
			alert("이메일주소를 입력하세요.");
			document.modifyProfile.email.focus();
			return false;
		}
		
		alert("회원 정보가 수정되었습니다.");
		document.modifyProfile.action = "modifyProfile";
		return true;
		
	}
</script>

</body>
</html>
