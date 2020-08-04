<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title> <decorator:title /> </title>
    <!-- Bootstrap -->
    <link href="${path }/css/bootstrap.min.css" rel="stylesheet">
    <!-- Style CSS -->
    <link href="${path }/css/style.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i%7CPT+Serif:400,400i,700,700i" rel="stylesheet">
    <!-- Owl Carousel CSS -->
    <link href="${path }/css/owl.carousel.css" rel="stylesheet">
    <link href="${path }/css/owl.theme.default.css" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" type="text/css" href="${path }/css/fontello.css">
    <link href="${path }/css/font-awesome.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<script type="text/javascript">
 	var path = '${path}';
	console.log(path);
</script>
<decorator:head />
<body>
    <!-- top-header-section-->
    <div class="top-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                    <p class="welcome-text">구해독 페이지에 오신걸 환영합니다.</p>
                </div>
                <div class="col-lg-4 col-md-5 col-sm-6 col-xs-12">
                    <ul>
                    <c:if test="${!empty sessionScope.loginmem}">
                    	<a style="color: white;" href="../member/login.dog">로그인</a>&nbsp;|&nbsp; <a href="../member/memberSignup.dog" style="color: white;">회원가입</a>
                    </c:if>
                    <c:if test="${empty sessionScope.loginmem}">
                    	${sessionScope.loginmem.member_name}님 반갑습니다.&nbsp;|&nbsp; <a href="../member/memberSignup.dog" style="color: white;">마이페이지</a>
                    </c:if>
                    <c:if test="${!empty sessionScope.loginshelter}">
                    	<a style="color: white;" href="../member/login.dog">로그인</a>&nbsp;|&nbsp; <a href="../member/memberSignup.dog" style="color: white;">회원가입</a>
                    </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="menu-toggel">
        <a href="#" id="dots" class="dots-icon"><i class="fa fa-ellipsis-v visible-xs"></i></a>
    </div>
    <!-- /.top-header-section-->
    <!-- header-section-->
    <div class="header-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2 col-md-4 col-sm-6 col-xs-12" style="margin-left: 10%; width: 15%; float: left;">
                    <div class="logo">
                        <a href="../main.dog"><img src="${path}/images/logo.png" style="width: 50%; height: 50%;"> </a>
                    </div>
                </div>
                <div class="col-lg-10 col-md-8 col-sm-12 col-xs-12" style="width: 75%; float: right;" >
                    <!-- navigations-->
                    <div class="navigation">
                        <div id="navigation" style="margin-right: 10%;">
                           <ul>
                                <li class="active"><a href="index.html">입양</a></li>
                                  <li class="has-sub"><a href="#">후원</a>
                                    <ul>
                                        <li><a href="blog-default.html">펀딩</a></li>
                                        <li><a href="blog-single.html">쇼핑</a></li>
                                    </ul>
                                </li>
                                <li class="active"><a href="index.html">봉사</a></li>
                              	<li class="active"><a href="index.html">정보</a></li>
                                 <li class="has-sub"><a href="#">커뮤니티</a>
                                    <ul>
                                        <li><a href="blog-default.html">Q&A게시판</a></li>
                                        <li><a href="blog-single.html">입양 후기 게시판</a></li>
                                    </ul>
                                </li>
                               
                            </ul>
                        </div>
                    </div>
                    <!-- /.navigations-->
                </div>
            </div>
        </div>
    </div>
    <!-- /. header-section-->
    <!-- slider -->
    <div class="slider" style="width: 100%; height: 20%;">
        <div class="owl-carousel owl-one owl-theme">
            <div class="item">
                <div class="slider-img"> <img src="${path }/images/dogadopt.jpg" style="width: 80%; height: 20%; margin-left : 10%;" ></div>
                <div class="container">
                 
                </div>
            </div>
            <div class="item">
                <div class="slider-img"> <img src="${path }/images/dogitem.jpg" style="width: 80%; height: 20%; margin-left : 10%;"></div>
                <div class="container">
                </div>
            </div>
            <div class="item">
                <div class="slider-img"> <img src="${path }/images/dogvwork.jpg" style="width: 80%; height: 20%; margin-left : 10%;"></div>
                <div class="container">
                    
                </div>
            </div>
        </div>
    </div>
    <!-- /.slider -->
    <!-- coachservice-section -->
    <div class="space-medium">
        <decorator:body />
    </div>
    <!-- video-section -->
    <!-- footer -->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb60">
                    <div class="footer-social">
                        <div class="">
                            <a href="#" class="btn-social-rectangle btn-facebook"><i class="fa fa-facebook"></i></a>
                            <a href="#" class="btn-social-rectangle btn-twitter"><i class="fa fa-twitter"></i></a>
                            <a href="#" class="btn-social-rectangle btn-googleplus"><i class="fa fa-google-plus"></i></a>
                            <a href="#" class="btn-social-rectangle btn-instagram"><i class="fa fa-instagram"></i></a>
                            <a href="#" class="btn-social-rectangle btn-linkedin"><i class="fa fa-linkedin"></i></a>
                            <a href="#" class="btn-social-rectangle btn-youtube"><i class="fa fa-youtube"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <!-- footer-contact links -->
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="ft-logo"><img src="${path }/images/ft_logo.png" alt=""></div>
                    <div class="footer-widget">
                        <div class="contact-info">
                            <span class="contact-text">951 Meadow View Drive Bristol,USA06010 </span>
                        </div>
                        <div class="contact-info">
                            <span class="contact-text">+180-123-4567</span>
                        </div>
                    </div>
                </div>
                <!-- /.footer-useful links -->
                <!-- footer-company-links -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="footer-widget">
                        <h3 class="footer-title">Quick Links</h3>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <ul>
                                    <li><a href="#">Home </a></li>
                                    <li><a href="#">Coaching</a></li>
                                    <li><a href="#">About</a></li>
                                    <li><a href="#">Article</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <ul>
                                    <li><a href="#">Podcast</a></li>
                                    <li><a href="#">Books</a></li>
                                    <li><a href="#">Ask me</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.footer-services-links -->
                <!-- newsletter -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="footer-widget">
                        <h3 class="footer-title">Join Our Newsletter!</h3>
                        <p>Get inspiration and education delivered to your inbox.</p>
                        <form>
                            <!-- input-group -->
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search Here" aria-describedby="basic-addon2">
                                <span class="input-group-addon" id="basic-addon2">
                                                    <i class="fa fa-paper-plane"></i></span>
                            </div>
                            <!-- /.input-group -->
                        </form>
                    </div>
                </div>
                <!-- /.newsletter -->
            </div>
            <!-- tiny-footer -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                    <div class="tiny-footer">
                        <p>Copyright © All Rights Reserved 2020 Template Design by
                            <a href="https://easetemplate.com/" target="_blank" class="copyrightlink">EaseTemplate</a></p>
                    </div>
                </div>
                <!-- /. tiny-footer -->
            </div>
        </div>
    </div>
    <!-- /.footer -->
    <a href="javascript:" id="return-to-top"><i class="fa fa-angle-up"></i></a>


<!-- ICON NEEDS FONT AWESOME FOR CHEVRON UP ICON -->

  
</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/menumaker.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.sticky.js"></script>
    <script type="text/javascript" src="js/sticky-header.js"></script>
    <script type="text/javascript" src="js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="js/multiple-carousel.js"></script>
   
    <script type="text/javascript">
    $("#dots").click(function() {
        $(".top-header").toggle("slow", function() {
            // Animation complete.
        });
    });
    </script>
    <script type="text/javascript">
    $(document).ready(function() {
        $('.btn-vertical-slider').on('click', function() {
            if ($(this).attr('data-slide') == 'next') {
                $('#myCarousel').carousel('next');
            }
            if ($(this).attr('data-slide') == 'prev') {
                $('#myCarousel').carousel('prev')
            }
        });
    });
    </script>
    <script type="text/javascript" src="js/video-play.js">
    </script>


<script type="text/javascript" src="js/return-to-top.js">     
</script>

</body>

</html>