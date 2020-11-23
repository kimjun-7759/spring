<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>

<script>
//썸네일 파일명을 가져오는 함수
function getThumbFileName(fullFilePath) {
   var arrString = fullFilePath.split("/");
   console.log(arrString);
   arrString.splice(-1, 1, "s_" + arrString[arrString.length - 1]);
   return arrString.join("/");
}
</script>
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Read   </h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
          <label>Bno</label> <input class="form-control" name='bno'
            value='<c:out value="${board.bno }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Title</label> <input class="form-control" name='title'
            value='<c:out value="${board.title }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Text area</label>
          <textarea class="form-control" rows="3" name='content'
            readonly="readonly"><c:out value="${board.content}" /></textarea>
        </div>

        <div class="form-group">
          <label>Writer</label> <input class="form-control" name='writer'
            value='<c:out value="${board.writer }"/>' readonly="readonly">
        </div>
        
        <!-- 업로드 이미지나 파일을 출력 -->
        <c:forEach var="i" begin="1" end="3">
         <c:set var="t" value="file_${i}" />
            <c:if test="${not empty board[t]}">
               <div class="form-group">
                   <label>이미지${i}</label>
                  <a href="/resources/upload/${board[t]}" target="_blank">
                  <img src="/resources/upload/${board[t]}" id="thumb_${i}"></a>
                 </div>
                 <script>
                 document.getElementById('thumb_${i}').src="/resources/upload/" + getThumbFileName('${board[t]}');
               </script>
              </c:if>
      </c:forEach>

<sec:authentication property="principal" var="pinfo"/>
<sec:authorize access="isAuthenticated()">
   <c:if test="${pinfo.username eq board.writer}">
      <button data-oper='modify' class="btn btn-default">Modify</button>
   </c:if>
</sec:authorize>
<button data-oper='list' class="btn btn-info">List</button>

<form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
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
           <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
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
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                      <label>Reply</label> 
                      <input class="form-control" name='reply' value='New Reply!!!!'>
               </div>      
               <div class="form-group">
                  <label>Replyer</label> 
                  <input class="form-control" name='replyer' value='replyer'>
               </div>
               <div class="form-group">
                  <label>Reply Date</label> 
                  <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
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
      
<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
$(document).ready(function () {
     
   var bnoValue = '<c:out value="${board.bno}"/>';
   var replyUL = $(".chat");
   
   showList(1);
   
   // 댓글 목록을 출력하는 함수
   function showList(page){
      
      // console.log("show list " + page);
       
      replyService.getList({bno:bnoValue, page: page|| 1 }, function(replyCnt, list) {
         
          // console.log("replyCnt: "+ replyCnt );
          // console.log("list: " + list);
          // console.log(list);
          
         if(page == -1){
            pageNum = Math.ceil(replyCnt/10.0);
            showList(pageNum);
            return;
         }
          
         var str="";
        
         if(list == null || list.length == 0){
            replyUL.html("");
            return;
         }
        
         for (var i = 0, len = list.length || 0; i < len; i++) {
            str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
            str +="  <div><div class='header'><strong class='primary-font'>["
               + list[i].rno+"] "+list[i].replyer+"</strong>"; 
            str +="    <small class='pull-right text-muted'>"
               + replyService.displayTime(list[i].replyDate)+"</small></div>";
            str +="    <p>"+list[i].reply+"</p></div></li>";
         }
        
         replyUL.html(str);
        
         showReplyPage(replyCnt);

    
      });//end function
        
   }//end showList

   // 댓글 페이징 처리
   var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
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
    var modalInputReplyDate = modal.find("input[name='replyDate']");
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
            bno:bnoValue
      };
      
      replyService.add(reply, function(result){
        
        alert(result);
        
        modal.find("input").val("");
        modal.modal("hide");
        
        showList(1);
      });
      
    });
    
   //댓글 조회 클릭 이벤트 처리 
    $(".chat").on("click", "li", function(e){
      
      var rno = $(this).data("rno");
      console.log(rno);
      
      replyService.get(rno, function(reply){
   
         modalInputReply.val(reply.reply);
         modalInputReplyer.val(reply.replyer);
         modalInputReplyDate.val(replyService.displayTime( reply.replyDate)).attr("readonly","readonly");
         modal.data("rno", reply.rno);
         
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
            rno:modal.data("rno"), 
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
          
      var rno = modal.data("rno");

      console.log("RNO: " + rno);
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
           
      replyService.remove(rno, originalReplyer, function(result){
                 
         alert(result);
         modal.modal("hide");
         showList(pageNum);
      });
   });
   
   /* 댓글 modal 창 동작 부분*/
   
});
</script>

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/admin/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/admin/list")
    operForm.submit();
    
  });  
});
</script>


<%@include file="../includes/footer.jsp"%>