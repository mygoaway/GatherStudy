<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko"> 
<head>
	<title>GatherStudy</title>
	<jsp:include page="../common/GatherStudyDefault.jsp"></jsp:include>
	<script type="text/javascript">
	    jQuery(document).ready(function() {
	      	App.init();
	        OwlCarousel.initOwlCarousel();        
	        ParallaxSlider.initParallaxSlider();
	    });
	</script>
</head>	

<body>
<div class="wrapper">
  	<!-- Header 영역 -->
    <jsp:include page="../common/GatherStudyHeader.jsp"></jsp:include>
    
    <!-- 슬라이더 설명 -->
    <div class="slider-inner">
        <div id="da-slider" class="da-slider">
            <div class="da-slide">
                <h2><i>Study from Anywhere</i> <br /> <i>원하는 곳에서 스터디하세요!</i> <br /></h2>
                <div class="da-img"></div>
            </div>
            <div class="da-slide">
                <h2><i>Study with the person you want</i> <br/> <i>원하는 사람과 스터디하세요!</i><br/></h2>
                <div class="da-img"></div>
            </div>
            <div class="da-arrows">
                <span class="da-arrows-prev"></span>
                <span class="da-arrows-next"></span>        
            </div>
        </div>
    </div>
	<!-- 슬라이더 설명 -->
    
    <div class="container content-md">
    
    	<!-- GatherStudy 핵심 설명 -->
    	<div class="row margin-bottom-30">
        	<div class="col-md-4">
        		<div class="service">
                    <i class="fa fa-compress service-icon"></i>
        			<div class="desc">
        				<h4>스터디 카페 예약 플랫폼</h4>
                        <p>예약이 편한 플랫폼으로,<br>
                        특화된 서비스를 만나보세요</p>
        			</div>
        		</div>	
        	</div>
        	<div class="col-md-4">
        		<div class="service">
                    <i class="fa fa-cogs service-icon"></i>
        			<div class="desc">
        				<h4>안전거래 보장</h4>
                        <p>에약 피해 시,<br>
                        예약비 전액을 환불해드립니다.</p>
        			</div>
        		</div>	
        	</div>
        	<div class="col-md-4">
        		<div class="service">
                    <i class="fa fa-rocket service-icon"></i>
        			<div class="desc">
        				<h4>스터디 커뮤니티 형성</h4>
                        <p>불편하게 여러 커뮤니티가 아닌,<br>
                        GatherStudy에서 편안하게</p>
        			</div>
        		</div>	
        	</div>			    
    	</div>
    	<!-- GatherStudy 핵심 설명 -->

    	<!-- 오늘의 추천 공간 -->
        <div class="headline"><h2>오늘의 추천 공간</h2></div>
        <div class="illustration-v2 margin-bottom-30">
            <ul class="list-inline owl-slider">
            <c:forEach var="recommendCafe" items="${recommendCafe}">
                <li class="item">
                    <div class="product-img">
                        <a href="${pageContext.request.contextPath}/cafe/detail.do?cafe_id=${recommendCafe.cafe_id}"><img class="full-width img-responsive" src="${pageContext.request.contextPath}/${recommendCafe.cafe_image1}" style="width:213px; height:150px;"></a>
                        <a class="add-to-cart" href="${pageContext.request.contextPath}/cafe/detail.do?cafe_id=${recommendCafe.cafe_id}"><i class="fa fa-shopping-cart"></i>예약하기</a>
                    </div>

                   <div class="product-description product-description-brd">
	                    <div class="overflow-h margin-bottom-5">
	                        <div class="pull-left">
	                            <h4 class="title-price" align="left" style="font-weight: bolder;"><a href="${pageContext.request.contextPath}/cafe/detail.do?cafe_id=${recommendCafe.cafe_id}">${recommendCafe.cafe_name}</a></h4>
	                       		<h6 align="left">${recommendCafe.cafe_hashtag1}  ${recommendCafe.cafe_hashtag2}</h6>
	                       		<h6 align="left">${recommendCafe.cafe_category1} - <fmt:formatNumber value="${recommendCafe.cafe_category1Price}" pattern="#,###" />/시간(인)</h6>
	                        </div>    
	                    </div>    
	                </div>
                </li>
            </c:forEach>
            </ul>
        </div>        
    	<!-- 오늘의 추천공간 -->
    	
    	<!-- 이용자 리뷰 -->
        <div class="headline"><h2>이용자 리뷰</h2></div>
        <div class="illustration-v2 margin-bottom-30">
            <ul class="list-inline owl-slider">
            <c:forEach var="evaluationList" items="${evaluationList}">
                <li class="item">
                    <div class="product-img">
                        <a href="${pageContext.request.contextPath}/cafe/detail.do?cafe_id=${evaluationList.cafe_id}"><img class="full-width img-responsive" src="${pageContext.request.contextPath}/${evaluationList.cafe_image1}" style="width:213px; height:150px;"></a>
                        <a class="add-to-cart" href="${pageContext.request.contextPath}/cafe/detail.do?cafe_id=${evaluationList.cafe_id}"><i class="fa fa-shopping-cart"></i>예약하기</a>
                    </div>

                   <div class="product-description product-description-brd">
	                    <div class="overflow-h margin-bottom-5">
	                        <div class="pull-left">
	                            <h4 class="title-price" align="center" style="font-weight: bolder;"><a href="${pageContext.request.contextPath}/cafe/detail.do?cafe_id=${evaluationList.cafe_id}"">${evaluationList.cafe_name}</a></h4>
	                            <h5 align="center">- ${evaluationList.member_id} -</h5>
	                            <div class="caption" align="center">	              
					                <c:if test="${evaluationList.order_eval_score==1}">
						               	<ul class="list-inline star-vote">
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star-o"></i></li>
						                      <li><i class="color-black fa fa-star-o"></i></li>
						                      <li><i class="color-black fa fa-star-o"></i></li>
						                      <li><i class="color-black fa fa-star-o"></i></li>
						                 </ul>
					                 </c:if>
					                 
					                <c:if test="${evaluationList.order_eval_score==2}">
						               	<ul class="list-inline star-vote">
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star-o"></i></li>
						                      <li><i class="color-black fa fa-star-o"></i></li>
						                      <li><i class="color-black fa fa-star-o"></i></li>
						                 </ul>
					                 </c:if>
					                 
					                <c:if test="${evaluationList.order_eval_score==3}">
						               	<ul class="list-inline star-vote">
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star-o"></i></li>
						                      <li><i class="color-black fa fa-star-o"></i></li>
						                 </ul>
					                 </c:if>       	                 
					                 
					                <c:if test="${evaluationList.order_eval_score==4}">
						               	<ul class="list-inline star-vote">
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star-o"></i></li>
						                 </ul>
					                 </c:if>
					                 
					                 <c:if test="${evaluationList.order_eval_score==5}">
						               	<ul class="list-inline star-vote">
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star"></i></li>
						                      <li><i class="color-black fa fa-star"></i></li>
						                 </ul>
					                 </c:if>	  
					                 <hr>               
					                <p>${evaluationList.order_eval_content}</p>
			                     </div>    
	                        </div>    
	                    </div>
	                </div>
                </li>
            </c:forEach>
            </ul>
        </div>        
    	<!-- 이용자 리뷰 -->

    </div>

    <!-- Header 영역 -->
    <jsp:include page="../common/GatherStudyFooter.jsp"></jsp:include>
</div>
</body>
</html>