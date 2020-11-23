<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>Photowall Photo Gallery Category Bootstrap Responsive Template | Contact :: W3layouts</title>
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
    <link rel="stylesheet" href="../../../resources/front/css/aos.css">
    <link href='../../../resources/front/css/aos-animation.css' rel='stylesheet prefetch' type="text/css" media="all" />
    <link rel="stylesheet" href="../../../resources/front/css/style.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- Font-Awesome-Icons-CSS -->
    <link href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">

</head>

<body>

    <section class="content-main-w3 inner-page" id="home">
        <!--/nav-->
        <%@include file="header.jsp"%>

        <!--//nav-->
    </section>
    <!-- contact -->
    <section class="banner-bottom-w3layouts pt-lg-5 pt-md-3 pt-3">
        <div class="inner-sec-w3ls pt-md-5 pt-md-3 pt-3">
            <h4 class="sub-tittle text-uppercase text-center">Find us</h4>
              <h2 class="title-wthree text-center mb-lg-5 mb-3">Contact</h2>
            <div class="container">
                <div class="address row mb-5">
                    <div class="col-lg-4 address-grid-w3ls">
                        <div class="row address-info" data-aos="fade-up">
                            <div class="col-md-3 address-left text-center">
                                <i class="far fa-map"></i>
                            </div>
                            <div class="col-md-9 address-right text-left">
                                <h6 class="ad-info text-uppercase mb-2">Address</h6>
                                <p> California, USA

                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 address-grid-w3ls">
                        <div class="row address-info" data-aos="fade-up">
                            <div class="col-md-3 address-left text-center">
                                <i class="far fa-envelope"></i>
                            </div>
                            <div class="col-md-9 address-right text-left">
                                <h6 class="ad-info text-uppercase mb-2">Email</h6>
                                <p>Email :
                                    <a href="mailto:example@email.com"> mail@example.com</a>
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-4 address-grid-w3ls">
                        <div class="row address-info" data-aos="fade-up">
                            <div class="col-md-3 address-left text-center">
                                <i class="fas fa-mobile-alt"></i>
                            </div>
                            <div class="col-md-9 address-right text-left">
                                <h6 class="ad-info text-uppercase mb-2">Phone</h6>
                                <p>+1 234 567 8901</p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7691.993989134025!2d128.58809719667713!3d35.84691714106852!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x69d67ee91bc24d0!2z7JiB64Ko7J206rO164yA7ZWZ6rWQ!5e0!3m2!1sko!2skr!4v1603855153818!5m2!1sko!2skr" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>

                    </div>
                    <div class="col-lg-6 main_grid_contact">
                        <div class="form">
                            <h4 class="mb-4 text-left">Send us a message</h4>
                            <form action="#" method="post">
                                <div class="form-group">
                                    <label class="my-2">Name</label>
                                    <input class="form-control" type="text" name="Name" placeholder="" required="">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input class="form-control" type="email" name="Email" placeholder="" required="">
                                </div>
                                <div class="form-group">
                                    <label>Message</label>
                                    <textarea id="textarea" placeholder=""></textarea>
                                </div>
                                <div class="input-group1">
                                    <input class="form-control" type="submit" value="Submit">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //contact -->


    <!--/footer-->
    <%@include file="footer.jsp"%>
    <!--//footer-->

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