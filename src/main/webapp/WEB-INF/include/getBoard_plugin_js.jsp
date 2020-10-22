<%@page contentType="text/html; charset=UTF-8"%>
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
</script>

	<!-- 리뷰 목록 처리를 위한 템플릿 코드 -->
	<!-- handlebars -->
	<script id="replyTemplate" type="text/x-handlebars-template">
    {{#each.}}
    <div class="post replyDiv" data-replyNo={{rid}} data-starNum={{starNum}}>
        <div class="user-block">
            <%--리뷰 작성자 프로필사진--%>
            <img class="img-circle img-bordered-sm" src="image/logo.png" alt="u">
            <%--리뷰 작성자--%>
			
            <span class="username">
                <%--작성자 이름--%>
				<a href="#">{{{regName uid}}}</a>
				{{#eqReplyUid uid}}
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
				{{/eqReplyUid}}
            </span>
			<%--리뷰 작성일자--%>
			<span class="description">{{prettifyDate updateDate}}</span>
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
    	// 세션아이디가 다를 경우 수정 삭제를 못하게 막아주는 함수
    	Handlebars.registerHelper("eqReplyUid", function (replyUid, block) {
            var accum = "";
            
            if (replyUid === "${sessionId}") {
                accum += block.fn();
            }
            return accum;
        });
        
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
        
        // 유저의 id를 통해 유저닉네임을 출력시켜주는 함수
        Handlebars.registerHelper("regName", function (uid) {
        	var uid = Handlebars.Utils.escapeExpression(uid);
      
        	var userName;
        	
        	$.ajax({
                type: "get",
                url: "/coffeereview/replies/getUserName/" + uid,
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "GET"
                },
                dataType: "text",
                // 비동기에서 동기식으로 바꾸어 유저 닉네임을 출력시키기 위함
                async: false,
                success: function (result) {
                    userName = result;
                }
            });        	
        	
        	return new Handlebars.SafeString(userName); 
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
            var replyUid = "${sessionId}";
            var replyText = replyTextObj.val();
            
        	// 세션 아이디가 없다면 로그인을 안한상태이므로
        	if ("${sessionId}" === "")
        	{
        		alert("로그인을 해주세요.");
        		starNum = 0; // 별점을 0으로 초기화
                $('.make_star i').css({color: '#000'}); // 별점 입력창 공백처리
                getReplies("/coffeereview/replies/" + cid + "/" + replyPageNum); // 리뷰 목록 호출
                getStarNum("/coffeereview/replies/" + cid);
                replyTextObj.val("");   // 리뷰 입력창 공백처리
                $('#messagebyte').text(0); // 리뷰 입력창 글자수 초기화
        		return;
        	}            
            
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
                    uid: replyUid,
                    starNum: starNum,
                    replyText: replyText
                }),
                success: function (result) {
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
                        getStarNum("/coffeereview/replies/" + cid);
                        replyTextObj.val("");   // 리뷰 입력창 공백처리
                        $('#messagebyte').text(0); // 리뷰 입력창 글자수 초기화
                    }
                }
            });
        });
        
     	// 리뷰 별점 입력 함수
        var modalStarNum = 0;
        // 리뷰 수정을 위해 modal창에 선택한 리뷰의 값들을 세팅
        $(".repliesDiv").on("click", ".replyDiv", function (event) {
            var reply = $(this);
            $(".replyNo").val(reply.attr("data-replyNo"));
            $("#modalReplyText").val(reply.find(".oldReplyText").text());
            
            // 별점 값 세팅
            modalStarNum = reply.attr("data-starNum");
            $('.make_modal_star i').css({color: '#000'});
			$('.make_modal_star i:nth-child(-n+' + modalStarNum + ')').css({color: '#F00'});
            
			// 기존 글자 수 세팅
            var totalByte = 0;
            var replyText = $("#modalReplyText").val();
            
            for(var i =0; i < replyText.length; i++) {
    			var currentByte = replyText.charCodeAt(i);
    			if(currentByte > 128) 
    				totalByte += 1;
    			else totalByte++;
    		}
    		
    		// 현재 입력한 문자의 바이트 수를 체크하여 표시
    		$('#modalMessagebyte').text(totalByte);
        });
        
        // Modal의 TextArea 글자수 검사
     	// 리뷰 글자수의 최대 크기
    	var limitByte = 1000;
        $("#modalReplyText").keyup(function() {
        	var totalByte = 0;
    		var replyText = $("#modalReplyText").val();
    		
    		for(var i =0; i < replyText.length; i++) {
    			var currentByte = replyText.charCodeAt(i);
    			if(currentByte > 128) 
    				totalByte += 1;
    			else totalByte++;
    		}
    		
    		// 현재 입력한 문자의 바이트 수를 체크하여 표시
    		$('#modalMessagebyte').text(totalByte);
    		
    		// 입력된 바이트 수가 limitByet를 초과 할 경우 경고창 
    		if(totalByte > limitByte) {
    			alert( limitByte + "글자까지 작성 가능합니다.");
    			$("#modalReplyText").val(replyText.substring(0,limitByte));
    			$('#modalMessagebyte').text(limitByte);
    		}
        });
        
     	// 모달의 별점 값 클릭 이벤트
        $(function() {
			$('.make_modal_star i').click(function() {
				var targetNum = $(this).index() + 1;
				modalStarNum = targetNum;
				$('.make_modal_star i').css({color: '#000'});
				$('.make_modal_star i:nth-child(-n+' + targetNum + ')').css({color: '#F00'});
			});
		});
        
        // modal 창의 리뷰 수정버튼 클릭 이벤트
        $(".modalModBtn").on("click", function () {
            var replyNo = $(".replyNo").val();
            var replyText = $("#modalReplyText").val();
            $.ajax({
                type: "put",
                url: "/coffeereview/replies/" + replyNo,
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "PUT"
                },
                dataType: "text",
                data: JSON.stringify({
                    replyText: replyText,
                    starNum: modalStarNum
                }),
                success: function (result) {
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
	
	// 리뷰 등록 textarea에 입력된 문자의 바이트 수를 체크
	function checkRegByte(frm) {
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
