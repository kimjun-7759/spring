<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>        

<sec:authentication var="principal" property="principal"/>  

<!DOCTYPE html>
<html lang="en">
<head>
<title>Photowall Photo Gallery Category Bootstrap Responsive Template | About :: W3layouts</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content="Photowall Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script>
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta tag Keywords -->

    <!-- Custom-Files -->
    <link rel="stylesheet" href="../../../resources/front/css/bootstrap.css">
    <!-- Banner-Slider-CSS -->
    <link rel="stylesheet" href="../../../resources/front/css/banner-style.css">
    <link rel="stylesheet" href="../../../resources/front/css/aos.css">
    <link rel="stylesheet" href="../../../resources/front/css/lightbox.css">
    <link href='../../../resources/front/css/aos-animation.css' rel='stylesheet prefetch' type="text/css" media="all" />
    <!-- owl carousel -->
    <link rel="stylesheet" href="../../../resources/front/css/style.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- Font-Awesome-Icons-CSS -->
    <link href="http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">

</head>

        <div id="info_login">
        <sec:authorize access="isAnonymous()">
            <a href="/front/sign_in">로그인</a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            <a href="/front/logout">${principal.username}님 <br>로그아웃</a>
            </sec:authorize>
        </div>

        <!--/nav-->
        <div class="header_top_w3ls">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <button class="navbar-toggler navbar-toggler-right mx-auto" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/front/about">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/front/team">Photographers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/front/free_board">Board</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/front/contact">Contact</a>
                        </li>

                    </ul>
                </div>

            </nav>
            <div class="logo-wthree text-center">
                <a class="navbar-brand" href="/">
                    Photo <span> Make Memories</span></a>
            </div>

        </div>
        <!--//nav-->
        
       <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		