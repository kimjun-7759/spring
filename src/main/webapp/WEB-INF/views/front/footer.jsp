<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!--/footer-->
   <footer class="pt-lg-5 inner-page-footer">
        <div class="social_media_w3layouts text-center">
           <ul class="social-icons justify-content-center mt-md-5 mt-3">
                                <li class="mr-1"><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                                <li class="mx-1"><a href="#"><span class="fab fa-twitter"></span></a></li>
                                <li class="mx-1"><a href="#"><span class="fab fa-google-plus-g"></span></a></li>
                                <li class="mx-1"><a href="#"><span class="fab fa-linkedin-in"></span></a></li>
                            </ul>
            <p class="copy-right-w3ls my-3">© 2018 PhotoWall. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
        </div>
    </footer>
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
