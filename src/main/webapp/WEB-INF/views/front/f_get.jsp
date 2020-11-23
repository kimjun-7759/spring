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
						<label>Board_idx</label> <input class="form-control" name='board_idx'
							value='<c:out value="${freeboard.board_idx }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'
							value='<c:out value="${freeboard.title }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'
							readonly="readonly"><c:out value="${freeboard.content}" /></textarea>
					</div>

					<div class="form-group">
						<label>id</label> <input class="form-control" name='id'
							value='<c:out value="${freeboard.id }"/>' readonly="readonly">
					</div>

					
					<c:forEach var="i" begin="1" end="3">
						<c:set var="t" value="image${i}" />
						<c:if test="${not empty freeboard[t]}">
							<div class="form-group">
								<label>이미지${i}</label> <a href="/resources/upload/${freeboard[t]}"
									target="_blank"> <img src="/resources/upload/${freeboard[t]}"
									id="thumb_${i}"></a>
							</div>
							<script>
                 document.getElementById('thumb_${i}').src="/resources/upload/" + getThumbFileName('${freeboard[t]}');
               </script>
						</c:if>
					</c:forEach>
					
					
					
					
					<sec:authentication property="principal" var="pinfo" />
					 <sec:authorize access="isAuthenticated()">
					<!-- 	<c:if test="${pinfo.username eq freeboard.id}">-->
							<button data-oper='modify' class="btn btn-default">Modify</button>
					<!--	</c:if>-->
						 
					</sec:authorize>
					<button data-oper='list' class="btn btn-info">List</button>

					<form id='operForm' action="/free_board/modify" method="get">
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
						<label>Reply</label> <input class="form-control" name='reply'
							value='New Reply!!!!'>
					</div>
					<div class="form-group">
						<label>Replyer</label> <input class="form-control" name='replyer'
							value='replyer'>
					</div>
					<div class="form-group">
						<label>Reply Date</label> <input class="form-control"
							name='replyDate' value='2018-01-01 13:13'>
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
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/admin/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#board_idx").remove();
    operForm.attr("action","/front/free_board")
    operForm.submit();
    
  });  
});
</script>

	<script src="../../../resources/front/js/jquery-2.2.3.min.js"></script>
	<script src='../../../resources/front/js/aos.js'></script>
	<script>
        AOS.init({
            easing: 'ease-out-back',
            duration: 1000
        });
    </script>
	<!--/ start-smoth-scrolling -->
	<script src="../../../resources/front/js/move-top.js"></script>
	<script src="../../../resources/front/js/easing.js"></script>
	<script>
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event) {
                event.preventDefault();
                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 900);
            });
        });
    </script>
	<script>
        $(document).ready(function() {
            /*
            						var defaults = {
            							  containerID: 'toTop', // fading element id
            							containerHoverID: 'toTopHover', // fading element hover id
            							scrollSpeed: 1200,
            							easingType: 'linear' 
            						 };
            						*/

            $().UItoTop({
                easingType: 'easeOutQuart'
            });

        });
    </script>
	<!--// end-smoth-scrolling -->

	<!-- //js -->

	<script src="../../../resources/front/js/bootstrap.js"></script>

</body>

</html>