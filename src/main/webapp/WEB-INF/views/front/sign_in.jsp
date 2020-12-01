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
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked>
				<label for="tab-1" class="tab">Sign In</label> <input id="tab-2"
					type="radio" name="tab" class="sign-up"> <label for="tab-2"
					class="tab"></label>
				<div class="login-form">
					<div class="login-form">
						<div class="sign-in-htm">
							<form role="form" method='post' action="/login">
								<fieldset>
									<div class="group">
										<label for="user" class="label">Id</label> <input id="user"
											type="text" name="username" class="input">
									</div>
									<div class="group">
										<label for="pass" class="label">Password</label> <input
											id="pass" name="password" type="password" class="input" data-type="password"
											>
									</div>


									<div class="group">
										<label for="check"><input id="check" type="checkbox">
											Keep me Signed in</label>
									</div>
									<div class="group">
										<input type="button" class="button" id="btn_success" value="Sign In">
									</div>
									<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
									<div class="hr"></div>
									
								</fieldset>
								
								
							</form>
							<div class="group">
										<!-- <input type="submit" class="button" value="Sign up"> -->
										<a href="sign_up"><input type="submit" class="button"
											value="Sign up"></a>
									</div>
									<div class="foot-lnk">
									<a href="#forgot">Forgot Password?</a>
								</div>
						</div>
					</div>
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

	<script>
		$("#btn_success").on("click", function(e) {

			e.preventDefault();
			$("form").submit();

		});
	</script>
 <!-- 
  	<c:if test="${param.logout != null}">
		<script>
			$(document).ready(function() {
				alert("로그아웃하였습니다.");
			});
		</script>
	</c:if>
	  -->
</body>

</html>