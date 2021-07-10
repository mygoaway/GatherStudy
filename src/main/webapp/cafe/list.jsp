<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko"> 
<head>
	<title>GatherStudy</title>
	<jsp:include page="../common/GatherStudyDefault.jsp"></jsp:include>
</head>	

<body class="header-fixed">
<div class="wrapper">
    <!-- Header 영역 -->
    <jsp:include page="../common/GatherStudyHeader.jsp"></jsp:include>
    
	<!--=== 현재페이지 이름과 경로 보여주기 입니다!! ===-->
    <div class="breadcrumbs">
        <div class="container">
            <h1 class="pull-left">카페 구경하기</h1>
            <ul class="pull-right breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.do">Home</a></li>
                <li class="active">카페 구경하기</li>
            </ul>
        </div>
    </div><!--/breadcrumbs-->
    <!--=== End Breadcrumbs ===-->
    
    <!--=== Content Part ===-->
    <div class="container content-md">
    	 <!-- Recent Works -->
        <div class="heading heading-v1 margin-bottom-20">
            <h2>새로 오픈한 스터디 카페</h2>
        </div>
        
        <!--=== Illustration v2 ===-->
        <div class="illustration-v2 margin-bottom-60">
            <ul class="list-inline owl-slider">
            <c:forEach var="newList" items="${newList}">
                <li class="item">
                    <div class="product-img">
                        <a href="${pageContext.request.contextPath}/cafe/detail.do?cafe_id=${newList.cafe_id}"><img class="full-width img-responsive" src="${pageContext.request.contextPath}/${newList.cafe_image1}" style="width:213px; height:150px;"></a>
                        <a class="add-to-cart" href="${pageContext.request.contextPath}/cafe/detail.do?cafe_id=${newList.cafe_id}"><i class="fa fa-shopping-cart"></i>예약하기</a>
                    	<div class="shop-rgba-dark-green rgba-banner">New</div>
                    </div>

                   <div class="product-description product-description-brd">
	                    <div class="overflow-h margin-bottom-5">
	                        <div class="pull-left">
	                            <h4 class="title-price" align="left" style="font-weight: bolder;"><a href="${pageContext.request.contextPath}//cafe/detail.do?cafe_id=${newList.cafe_id}">${newList.cafe_name}</a></h4>
	                       		<h6 align="left">${newList.cafe_hashtag1}  ${newList.cafe_hashtag2}</h6>
	                       		<h6 align="left">${newList.cafe_category1} - <fmt:formatNumber value="${newList.cafe_category1Price}" pattern="#,###" />/시간(인)</h6>
	                        </div>    
	                    </div>    
	                </div>
                </li>
            </c:forEach>
            </ul>
        </div> 
        <!--=== 신규 스터디카페 끝==-->
    	
    
        <div class="heading heading-v1 margin-bottom-40">
            <h2>스터디 카페</h2>
        </div>

        <!--=== 스터디룸 ===-->
        <div class="illustration-v2 margin-bottom-60">
        	<c:forEach var="cafe" items="${list}">
	            <div class="col-md-3 col-sm-6 md-margin-bottom-30">
	                <div class="product-img">
	                    <a href="${pageContext.request.contextPath}/cafe/detail.do?cafe_id=${cafe.cafe_id}"><img class="full-width img-responsive" src="${pageContext.request.contextPath}/${cafe.cafe_image1}" style="width:273px; height:200px;"></a>
	                    <a class="add-to-cart" href="${pageContext.request.contextPath}/cafe/detail.do?cafe_id=${cafe.cafe_id}"><i class="fa fa-shopping-cart"></i>예약하기</a>
	                </div>
	                <div class="product-description product-description-brd">
	                    <div class="overflow-h margin-bottom-5">
	                        <div class="pull-left">
	                            <h4 class="title-price" style="font-weight: bolder;"><a href="${pageContext.request.contextPath}/cafe/detail.do?cafe_id=${cafe.cafe_id}">${cafe.cafe_name}</a></h4>
	                            <span class="gender text-uppercase">${cafe.cafe_category1} / ${cafe.cafe_category2}</span>   
	                       		<h6>${cafe.cafe_hashtag1}  ${cafe.cafe_hashtag2}</h6>
	                       		<h6><fmt:formatNumber value="${cafe.cafe_category1Price}" pattern="#,###" /> ~ / 시간(인)</h6>
	                        </div>    
	                    </div>    
	                </div>
	            </div>
            </c:forEach>
        </div> 
        <!--=== 추천 스터디룸 ===-->
	</div>

    <!--===========================
    
  	   Footer 하단시작이요오
  
    =============================-->
    <div id="footer-v2" class="footer-v2">
        <div class="footer">
            <div class="container">
                <div class="row">
                    <!-- About -->
                    <div class="col-md-3 md-margin-bottom-40">
                        <a class="logo" href="${pageContext.request.contextPath}/main.do">
                		<img src="${pageContext.request.contextPath}/assets/logoimg/MainLogo.png" alt="Logo" width="180">
            			</a>
                        <p class="margin-bottom-20"><p>Study from Anywhere!<br> 원하는 곳에서 스터디 하세요.<br>
                        	GatherStudy는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 GatherStudy는 공간 거래정보 및 거래에 대해 책임지지 않습니다.</p>                
                    </div>
                    <!-- End About -->
                    
                    <!-- Link List -->
                    <div class="col-md-3 md-margin-bottom-40">
                        <div class="headline"><h2 class="heading-sm">Useful Links</h2></div>
                        <ul class="list-unstyled link-list">
                            <li><a href="${pageContext.request.contextPath}/main.do">HOME</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="${pageContext.request.contextPath}/notice/list.do">공지 사항</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="${pageContext.request.contextPath}/cafe/list.do">카페 구경하기</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="${pageContext.request.contextPath}/findMember/list.do">멤버 구하기</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="${pageContext.request.contextPath}/help/list.do">도움말</a><i class="fa fa-angle-right"></i></li>
                        </ul>
                    </div>
                    <!-- End Link List -->                   

                    <!-- Blog Tweets -->
                    <div class="col-md-3 md-margin-bottom-40">
                        <div class="latest-tweets">
                            <div class="headline"><h2 class="heading-sm">Latest Tweets</h2></div>
                            <div class="latest-tweets-inner">
                                <i class="fa fa-twitter"></i>
                                <p>
                                    <a href="#">@htmlstream</a> 
                                    예약이 간편해서 좋았습니다.
                                    <a href="#">http://t.co/sBav7dm</a> 
                                    <small class="twitter-time">2 hours ago</small>
                                </p>    
                            </div>
                            <div class="latest-tweets-inner">
                                <i class="fa fa-twitter"></i>
                                <p>
                                    <a href="#">@user</a> 
                                    후기가 좋았고 스터디원을 구하기 편했습니다.
                                    <a href="#">http://t.co/sBav7dm</a> 
                                    <small class="twitter-time">4 hours ago</small>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- End Latest Tweets -->    

                    <!-- Address -->
                    <div class="col-md-3 md-margin-bottom-40">
                        <div class="headline"><h2 class="heading-sm">Contact Us</h2></div>                         
                        <address class="md-margin-bottom-40">
                            <i class="fa fa-home"></i>서울특별시 강남구 테헤란로11 세경빌딩 3층 <br />
                            <i class="fa fa-phone"></i>Phone: 010 1234 5678 <br />
                            <i class="fa fa-globe"></i>Website: <a href="#">www.GatherStudy.com</a> <br />
                            <i class="fa fa-envelope"></i>Email: <a href="GatherStudy@naver.com">GatherStudy@naver.com</a> 
                        </address>
                    </div>
                    <!-- End Address -->
                </div>
            </div> 
        </div><!--/footer-->

        <div class="copyright">
            <div class="container">
                <p class="text-center">2015 &copy; All Rights Reserved. Unify Theme by <a target="_blank" href="https://twitter.com/htmlstream">Htmlstream</a></p>
            </div> 
        </div><!--/copyright--> 
    </div>
    <!--=======================
    
     				Footer 하단끝끝

	========================--> 
</div><!--/wrapper-->

<!-- JS Global Compulsory -->			
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/parallax-slider/js/modernizr.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/parallax-slider/js/jquery.cslider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/owl-carousel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/parallax-slider.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();
        OwlCarousel.initOwlCarousel();        
        ParallaxSlider.initParallaxSlider();
    });
    
</script>


<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>