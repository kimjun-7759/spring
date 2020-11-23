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
    <h1 class="page-header">Board Modify</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Modify</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/admin/modify" method="post" enctype="multipart/form-data">
         <!--
          controller에서 파라미터 수집시 upload file은 uploadFile 이름으로 server로 넘어간다.(binary data로)
          하지만 BoardVO에서는 file_1,file_2,file_3의 이름으로 setter를 해줘야 한다.
          따라서 file_1,file_2,file_3를 hidden으로 넘겨서 controller에서 file이 upload가 안됐을 경우에도
          파라미터 수집이 되도록(값은 null로 됨) 하기위해 hidden으로 값을 넘긴다.
          -->
      <c:forEach var="i" begin="1" end="3">
         <c:set var="t" value="file_${i}" />
         <c:choose>
            <c:when test="${not empty board[t]}">
                  <input type="hidden" name="file_${i}" value="${board[t]}">
              </c:when>
              <c:otherwise>
               <input type="hidden" name="file_${i}" value="">      
              </c:otherwise>
         </c:choose>
      </c:forEach>
      
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
       <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
      <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
      <input type='hidden' name='bno' value='<c:out value="${board.bno }"/>'>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 

<div class="form-group">
  <label>Title</label> 
  <input class="form-control" name='title' 
    value='<c:out value="${board.title }"/>' >
</div>

<div class="form-group">
  <label>Text area</label>
  <textarea class="form-control" rows="3" name='content' ><c:out value="${board.content}"/></textarea>
</div>

<div class="form-group">
  <label>Writer</label> 
  <input class="form-control" name='writer'
    value='<c:out value="${board.writer}"/>' readonly="readonly">            
</div>

<c:forEach var="i" begin="1" end="3">
   <c:set var="t" value="file_${i}" />
   <div class="form-group">
   <label>이미지${i}</label>
      <c:if test="${not empty board[t]}">
         <a href="/resources/upload/${board[t]}" target="_blank"><img src="/resources/upload/${board[t]}" id="thumb_${i}"></a>
         <script>
              document.getElementById('thumb_${i}').src="/resources/upload/" + getThumbFileName('${board[t]}');
         </script>
      </c:if>
      <input type="file" class="form-control" name='uploadFile'>
   </div>
</c:forEach>

    <sec:authentication property="principal" var="pinfo"/>
   <sec:authorize access="isAuthenticated()">
      <c:if test="${pinfo.username eq board.writer}">
         <button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
         <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
      </c:if>
   </sec:authorize>
     <button type="submit" data-oper='list' class="btn btn-info">List</button>
</form>


      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {


     var formObj = $("form");

     $('button').on("click", function(e){
       
       e.preventDefault(); 
       
       var operation = $(this).data("oper");
       
       console.log(operation);
       
       if(operation === 'remove'){
         formObj.attr("action", "/admin/remove");
         
       }else if(operation === 'list'){
         //move to list
         formObj.attr("action", "/admin/list").attr("method","get");

         var pageNumTag = $("input[name='pageNum']").clone();
         var amountTag = $("input[name='amount']").clone();
         var keywordTag = $("input[name='keyword']").clone();
         var typeTag = $("input[name='type']").clone();      
         
         formObj.empty();
         
         formObj.append(pageNumTag);
         formObj.append(amountTag);
         formObj.append(keywordTag);
         formObj.append(typeTag);
       }
       
       formObj.submit();
     });

});
</script>
  




<%@include file="../includes/footer.jsp"%>