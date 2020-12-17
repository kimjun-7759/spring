<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="zxx">
<script>
//썸네일 파일명을 가져오는 함수
function getThumbFileName(fullFilePath) {
   var arrString = fullFilePath.split("/");
   console.log(arrString);
   arrString.splice(-1, 1, "s_" + arrString[arrString.length - 1]);
   return arrString.join("/");
}
</script>
<body>
	<section class="content-main-w3 inner-page" id="home">
		<%@include file="header.jsp"%>
	</section>
	<!--/about-->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<!-- /.panel-heading -->
				<div class="panel-body">

					<div class="form-group">
						<label>Board_idx</label> <input class="form-control"
							name='board_idx' value='<c:out value="${freeboard.board_idx }"/>'
							readonly="readonly">
					</div>

					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'
							value='<c:out value="${freeboard.title }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'
							readonly="readonly"><c:out
								value="${freeboard.content}" /></textarea>
					</div>

					<div class="form-group">
						<label>id</label> <input class="form-control" name='id'
							value='<c:out value="${freeboard.userid }"/>' readonly="readonly">
					</div>


					<c:forEach var="i" begin="1" end="3">
						<c:set var="t" value="image${i}" />
						<c:if test="${not empty freeboard[t]}">
							<div class="form-group">
								<label>이미지${i}</label> <a
									href="/resources/upload/${freeboard[t]}" target="_blank"> <img
									src="/resources/upload/${freeboard[t]}" id="thumb_${i}"></a>
							</div>
							<script>
                 document.getElementById('thumb_${i}').src="/resources/upload/" + getThumbFileName('${freeboard[t]}');
               </script>
						</c:if>
					</c:forEach>




					<sec:authentication property="principal" var="pinfo" />
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.username eq freeboard.userid}">
							<button data-oper='f_modify' class="btn btn-default">Modify</button>
						</c:if>

					</sec:authorize>
					<button data-oper='list' class="btn btn-info">List</button>

					<form id='operForm' action="/front/f_modify" method="get">
						<input type='hidden' id='board_idx' name='board_idx'
							value='<c:out value="${freeboard.board_idx}"/>'> <input
							type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum}"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount}"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${cri.keyword}"/>'> <input
							type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
					</form>

				</div>
				<!--  end panel-body -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->

	<div class='row'>

		<div class="col-lg-12">

			<!-- /.panel -->
			<div class="panel panel-default">

				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i> Reply
					<sec:authorize access="isAuthenticated()">
						<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
							Reply</button>
					</sec:authorize>
				</div>


				<!-- /.panel-heading -->
				<div class="panel-body">
				
					<!-- 댓글 목록 출력 부분 -->
					<ul class="chat">
					<!-- start reply -->
					
					<!-- end reply -->
					</ul>
					<!-- ./ end ul -->
				</div>
				<!-- /.panel .chat-panel -->

				<div class="panel-footer"></div>


			</div>
		</div>
		<!-- ./ end row -->
	</div>



	<!-- 댓글 Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Comment</label> <input class="form-control" name='reply'
							value='New Comment!!!!'>
					</div>
					<div class="form-group">
						<label>Userid</label> <input class="form-control" name='replyer'
							value='replyer'>
					</div>
					<div class="form-group">
						<label>Comment Date</label> <input class="form-control"
							name='reg_date' value='2018-01-01 13:13'>
					</div>
				</div>

				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
					<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /댓글 modal -->

	<!--/footer-->
	<%@include file="footer.jsp"%>
	<!--//footer-->
	<script type="text/javascript" src="/resources/js/reply.js"></script>


<script type="text/javascript">
$(document).ready(function () {
	  
	var bnoValue = '<c:out value="${freeboard.board_idx}"/>';
	var replyUL = $(".chat");
	
	showList(1);
	
	// 댓글 목록을 출력하는 함수
	function showList(page){
		
		// console.log("show list " + page);
	    
		replyService.getList({board_idx:bnoValue, page: page|| 1}, function(commentCnt, list) {
	      
		    // console.log("replyCnt: "+ replyCnt );
		    // console.log("list: " + list);
		    // console.log(list);
	    	
			if(page == -1){
				pageNum = Math.ceil(commentCnt/10.0);
				showList(pageNum);
				return;
			}
 			
			var str="";
	     
			if(list == null || list.length == 0){
				replyUL.html("");
				return;
			}
	     
			for (var i = 0, len = list.length || 0; i < len; i++) {
				str +="<li class='left clearfix' data-comment_idx='"+list[i].comment_idx+"'>";
				str +="  <div><div class='header'><strong class='primary-font'>["
					+ list[i].comment_idx+"] "+list[i].replyer+"</strong>"; 
				str +="    <small class='pull-right text-muted'>"
					+ replyService.displayTime(list[i].reg_date)+"</small></div>";
				str +="    <p>"+list[i].reply+"</p></div></li>";
			}
	     
			replyUL.html(str);
	     
			showReplyPage(commentCnt);

	 
		});//end function
	     
	}//end showList

	// 댓글 페이징 처리
	var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(commentCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= commentCnt){
        endNum = Math.ceil(commentCnt/10.0);
      }
      
      if(endNum * 10 < commentCnt){
        next = true;
      }
      
      var str = "<ul class='pagination pull-right'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(var i = startNum ; i <= endNum; i++){
        
        var active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    }
     
    replyPageFooter.on("click","li a", function(e){
       e.preventDefault();
       console.log("page click");
       
       var targetPageNum = $(this).attr("href");
       
       console.log("targetPageNum: " + targetPageNum);
       
       pageNum = targetPageNum;
       
       showList(pageNum);
     });
 	// 댓글 페이징 처리 끝
 	
    
	/* 댓글 modal 창 동작 부분*/
	var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='reg_date']");
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");

 	// 댓글 인증 부분 추가
	var replyer = null;
    
    <sec:authorize access="isAuthenticated()">
    	var replyer = '<sec:authentication property="principal.username"/>';   
	</sec:authorize>
 
	const csrfHeaderName ="${_csrf.headerName}"; 
	const csrfTokenValue="${_csrf.token}";
    
    $("#modalCloseBtn").on("click", function(e){
    	modal.modal('hide');
    });
    
    $("#addReplyBtn").on("click", function(e){
		modal.find("input").val("");
		modal.find("input[name='replyer']").val(replyer);
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		$(".modal").modal("show");
    });

 	// Ajax Spring Security Header
    $(document).ajaxSend(function(e, xhr, options) { 
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	});
	
    // 댓글 등록
	modalRegisterBtn.on("click",function(e){
      
		var reply = {
			reply: modalInputReply.val(),
            replyer:modalInputReplyer.val(),
            board_idx:bnoValue
		};
      	console.log(bnoValue);
		replyService.add(reply, function(result){
        
        alert(result);
        
        modal.find("input").val("");
        modal.modal("hide");
        
        showList(1);
      });
      
    });
    
	//댓글 조회 클릭 이벤트 처리 
    $(".chat").on("click", "li", function(e){
      
		var comment_idx = $(this).data("comment_idx");
		console.log(comment_idx);
		
		replyService.get(comment_idx, function(reply){
	
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime( reply.reg_date)).attr("readonly","readonly");
			modal.data("comment_idx", reply.comment_idx);
			
			modal.find("button[id !='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
	});
	
 	// 댓글 수정 이벤트. security 적용 후
	modalModBtn.on("click", function(e){
		
		var originalReplyer = modalInputReplyer.val();
		
		var reply = {
				comment_idx:modal.data("comment_idx"), 
				reply: modalInputReply.val(),
				replyer: originalReplyer
				};
	  
		if(!replyer){
			alert("로그인후 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}

		console.log("Original Replyer: " + originalReplyer);
		
		if(replyer  != originalReplyer){
			alert("자신이 작성한 댓글만 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}
		  
		replyService.update(reply, function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});

	// 댓글 삭제 부분. security 적용 후
	modalRemoveBtn.on("click", function (e){
	  	  
		var comment_idx = modal.data("comment_idx");

		console.log("comment_idx: " + comment_idx);
		console.log("REPLYER: " + replyer);
	   	  
		if(!replyer){
			alert("로그인후 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
	   	  
		var originalReplyer = modalInputReplyer.val();
	   	  
		console.log("Original Replyer: " + originalReplyer);
	   	  
		if(replyer !== originalReplyer){
	   		  
			alert("자신이 작성한 댓글만 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
	   	  
		replyService.remove(comment_idx, originalReplyer, function(result){
	   	        
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	
	/* 댓글 modal 창 동작 부분*/
	
});

//아래 부분은 json data test용도이며 test 완료 후 모두 주석처리해야 한다.
// console.log("===============");
// console.log("JS TEST");

// var bnoValue = '<c:out value="${freeboard.board_idx}"/>';

//for replyService add test
/*
replyService.add(
		{reply:"JS Test", replyer:"tester", bno:bnoValue},
		function(result){ 
			alert("RESULT: " + result);
		},
		function(err_msg, err_code){ 
			alert("ERROR 내용: " + err_msg + "\nERROR code: " + err_code);
		});
 */
 
//reply List Test
/*
replyService.getList(
		{board_idx:bnoValue, page:1},
		function(list){
			for(var i = 0,  len = list.length||0; i < len; i++ ){
  				console.log(list[i]);
			}
		});
 */
 
//2번 댓글 삭제 테스트. 각자 존재하는 댓글 번호로 수정해야 함.
/* 
replyService.remove(2,
		function(count) {
			console.log(count);
			if (count === "success") {
				alert("REMOVED");
			}
		},
		function(err) {
			alert('ERROR...');
		});
 */
 
//3번 댓글 수정. 각자 존재하는 댓글 번호로 수정해야 함.
/* 
replyService.update(
	{rno : 3, bno : bnoValue, reply : "Modified Reply...." },
	function(result) {
		alert("수정 완료...");
	});  
 */
 
// 3번 댓글 내용 보기. 각자 존재하는 댓글 번호로 수정해야 함.
/* 
replyService.get(3, function(date) {
	console.log(date);
});
 */
</script>

	<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='f_modify']").on("click", function(e){
    
    operForm.attr("action","/front/f_modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#board_idx").remove();
    operForm.attr("action","/front/free_board")
    operForm.submit();
    
  });  
});
</script>

</body>

</html>