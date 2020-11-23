<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Access Error Error</title>
    <link href="https://fonts.googleapis.com/css?family=Encode+Sans+Semi+Condensed:100,200,300,400" rel="stylesheet">
    <link href="/resources/css/accessError.css" rel="stylesheet" type="text/css" />

</head>

<body class="loading">
<div class="error-502__container">
	<div class="error-502">
		<div class="error-502__text">
			<h1><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/> <b>:(</b></h1>
			<h2><c:out value="${msg}"/></h2>
			<h2><p>메인페이지로 이동 <a href="/">Homepage</a>.</p></h2>
		</div>
	</div>
</div>
<div class="gears">
    <div class="gear one">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
    </div>
    <div class="gear two">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
    </div>
    <div class="gear three">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
    $(function() {
        setTimeout(function(){
            $('body').removeClass('loading');
        }, 1000);
    });
</script>
</body>
</html>

