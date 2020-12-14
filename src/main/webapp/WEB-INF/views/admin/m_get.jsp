<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Message Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Message Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
			<form role="form" action="/admin/m_get" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="form-group">
					<label>Message_idx</label> <input class="form-control" name='message_idx'
						value='<c:out value="${message.message_idx }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>Content</label> <input class="form-control" name='content'
						value='<c:out value="${message.content}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>ID</label> <input class="form-control" name='id'
						value='<c:out value="${message.id }"/>' readonly="readonly">
				</div>


				<sec:authentication property="principal" var="pinfo" />
				<button data-oper='list' class="btn btn-info">List</button>				
				<button data-oper='remove' class="btn btn-info2">Delete</button>
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
         formObj.attr("action", "/admin/m_remove");         
       } else if (operation === 'list') {
			//move to list
			formObj.attr("action", "/admin/list").attr("method", "get");

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

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#message_idx").remove();
    operForm.attr("action","/admin/list")
    operForm.submit();
    
  });  
});
</script>
