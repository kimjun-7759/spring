<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">


<head>
<title>login</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<link rel="stylesheet" href="../../../resources/front/css/bootstrap.css">
<!-- Banner-Slider-CSS -->
<link rel="stylesheet"
	href="../../../resources/front/css/banner-style.css">
<link rel="stylesheet" href="../../../resources/front/css/aos.css">
<link href='../../../resources/front/css/aos-animation.css'
	rel='stylesheet prefetch' type="text/css" media="all" />
<!-- owl carousel -->
<link rel="stylesheet" href="../../../resources/front/css/style.css"
	type="text/css" media="all" />
<!-- Style-CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Font-Awesome-Icons-CSS -->
<link
	href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700"
	rel="stylesheet">
<!-- sing_up.CSS-->
<link rel="stylesheet" href="../../../resources/front/css/sing_up.css"
	type="text/css" media="all" />

</head>

<body>
	<section class="content-main-w3" id="home">
        <div class="login-wrap">
            <div class="login-html">
                <input id="tab-1" type="radio" name="tab" class="sign-up">
                <label for="tab-1" class="tab"></label>
                <input id="tab-2" type="radio" name="tab" class="sign-up" checked>
                <label for="tab-2" class="tab">Sign Up</label>

                <div class="login-form">
                    <form role="form" action="/front/sign_up" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div class="sign-up-htm">
                            <div class="group">
                                <label for="user" class="label">id</label> <input id="user" type="text" class="input"
                                    name="id">
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Password</label> <input id="pass" type="password"
                                    class="input" data-type="password" name="pwd">
                            </div>

                            <div class="group">
                                <label for="pass" class="label">Email</label> <input id="pass" type="text" name="email"
                                    class="input">
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Address</label> <input id="pass" type="text"
                                    name="address" class="input">
                            </div>
                            <div class="group">
                                <label for="tel" class="label">Tel</label> <input id="tel" type="text" name="tel"
                                    class="input">
                            </div>
                            <div class="group">
                                <input type="submit" class="button" value="Sign Up">
                            </div>


                            <div class="hr"></div>
                            <div class="foot-lnk">
                                <a href="#forgot">Already Member?</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
	<script src="../../../resources/front/js/jquery-2.2.3.min.js"></script>
	<script src='../../../resources/front/js/aos.js'></script>
	<script>
		AOS.init({
			easing : 'ease-out-back',
			duration : 1000
		});
	</script>

	<!--  light box js -->
	<script src="../../../resources/front/js/lightbox-plus-jquery.min.js">
		
	</script>
	<!-- //light box js-->
	<!--/ start-smoth-scrolling -->
	<script src="../../../resources/front/js/move-top.js"></script>
	<script src="../../../resources/front/js/easing.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
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
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!--// end-smoth-scrolling -->

	<!-- //js -->

	<script src="../../../resources/front/js/bootstrap.js"></script>


</body>

</html>