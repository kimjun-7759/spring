<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="zxx">
<body>
    <section class="content-main-w3 inner-page" id="home">
        <%@include file="header.jsp"%>
    </section>
    <!--/about-->
    <section class="banner-bottom-w3layouts py-lg-5 py-md-5 py-3">
        <div class="container">
            <div class="inner-sec-w3ls py-lg-5 py-3">
                 <h2 class="title-wthree text-center mb-lg-5 mb-3">About</h2>
                <div class="row">
                    <div class="col-lg-6 about-img" data-aos="flip-right">
                        <img class="img-fluid" src="../../../resources/img/ab.jpg" alt="">
                    </div>
                    <div class="col-lg-6 about-right mt-lg-4" data-aos="flip-left">
                        <h4 class="sub-tittle">Who We Are</h4>
                        <h3 class="tittle text-uppercase">Simply dummy text of the printing industry.</h3>
                        <p class="my-4">Lorem ipsum dolor sit amet Neque porro quisquam est qui dolorem Lorem int ipsum dolor sit amet when an unknown printer took a galley of type.Vivamus id tempor felis.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.Lorem ipsum dolor sit amet Neque porro quisquam est qui dolorem Lorem int ipsum dolor sit amet.</p>

                        <ul class="author d-flex">
                            <li><img class="img-fluid" src="../../../resources/img/author.jpg" alt=""></li>
                            <li><span>Expample Name</span>Photographer</li>
                        </ul>
                    </div>
                </div>
                <div class="row mt-lg-5 stats-con">
                    <div class="col-sm-3 col-6 stats_info counter_grid" data-aos="fade-up">

                        <i class="far fa-lightbulb"></i>
                        <p class="counter">645</p>
                        <h4>Projects Done</h4>

                    </div>
                    <div class="col-sm-3 col-6 stats_info counter_grid1" data-aos="fade-up">

                        <i class="far fa-heart"></i>
                        <p class="counter">563</p>
                        <h4>Satisfied Clients</h4>

                    </div>
                    <div class="col-sm-3 col-6 stats_info counter_grid" data-aos="fade-up">

                        <i class="fas fa-magic"></i>
                        <p class="counter">1145</p>
                        <h4>Awards</h4>

                    </div>
                    <div class="col-sm-3 col-6 stats_info counter_grid2" data-aos="fade-up">

                        <i class="far fa-smile"></i>
                        <p class="counter">1045</p>
                        <h4>Happy Clients</h4>

                    </div>
                </div>
        <p class="my-4" data-aos="fade-up">Lorem ipsum dolor sit amet Neque porro quisquam est qui dolorem Lorem int ipsum dolor sit amet when an unknown printer took a galley of type.Vivamus id tempor felis.Lorem ipsum dolor sit amet Neque porro quisquam est qui dolorem Lorem int ipsum dolor sit amet when an unknown printer took a galley of type.Vivamus id tempor felis.Lorem ipsum dolor sit amet Neque porro quisquam est qui dolorem Lorem int ipsum dolor sit amet when an unknown printer took a galley of type.Vivamus id tempor felis.Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.Lorem ipsum dolor sit amet Neque porro quisquam est qui dolorem Lorem int ipsum dolor sit amet.</p>
            </div>
        </div>
    </section>
    <!--//about-->
    
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