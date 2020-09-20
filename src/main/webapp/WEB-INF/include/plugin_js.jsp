<%@page contentType="text/html; charset=UTF-8"%>
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