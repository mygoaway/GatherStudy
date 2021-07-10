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

	<div class="breadcrumbs">
        <div class="container">
            <h1 class="pull-left" id="RPath"><b>My 예약</b></h1>
        </div>
    </div><!--/breadcrumbs-->
    
    <!-- 중단 시작 -->
     <div class="container content">		
    	<div class="row blog-page"> 
    	   <div class="col-md-2  hidden-xs related-search">
			<div class=" s-results margin-bottom-50">
       			<div class="row">
                   			<div class="col-md-12 col-sm-4">
		                        <h3 id="RPath">스터디 카페 예약</h3>
		                        <ul class="list-unstyled">
		                            <li><a href="${pageContext.request.contextPath}/cafe/reservationList.do?cafe_id=${sessionScope.loginCafe.cafe_id}">예약내역조회/취소</a></li>
		                            <li><a href="${pageContext.request.contextPath}/cafe/evaluationList.do?cafe_id=${sessionScope.loginCafe.cafe_id}">구매후기작성/조회</a></li>
		                       </ul>
		                        <hr>
	                    	</div>       

                    		<div class="col-md-12 col-sm-4">
                        	<h3 id="RPath">스터디 카페 정보</h3>
                       		<ul class="list-unstyled">
                            	<li><a href="#">정보확인/수정</a></li>       
                        	</ul>
                        	<hr>
                    		</div>                                                                      		        
            		</div>
            	</div>
            </div>
		<div class="col-md-10">
	    	<div class="tab-pane fade in active" id="home-1">
            	<div class="panel panel-green margin-bottom-40">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-user"></i>예약 내역 조회/취소</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover" style="text-align: center;">
                            <thead>
                                <tr class="active">
                                    <td width="8%">예약번호</td>
                                    <td width="14%">회원 아이디</td>
                                    <td width="6%">공간</td>
                                    <td width="10%">예약 날짜</td>
                                    <td width="10%">예약 시간</td>
                                    <td width="9%">사용 시간</td>
                                    <td width="9%">사용 인원</td>
                                    <td width="9%">결제 금액</td>
                                    <td width="8%">예약 상태</td>
                                    <td width="8%">주문 일시</td>
                                    <td width="9%">예약 취소</td>
                                </tr>
                            </thead>
                            
                            <!-- 레코드가 없다면 -->
							<c:if test="${count==0}">
							    <tr>
							       <td colspan="11" align="center">
							          예약하신 내역이 없습니다.
							       </td>
							    </tr>
							</c:if>
					
                            <tbody>
                            	<c:forEach var="OrderList" items="${OrderList}">  
                               		 <tr>
                                	   <td width="8%">${OrderList.reser_number}</td>
	                                   <td width="14%">${OrderList.member_id}</td>
	                                   <td width="6%">${OrderList.reser_category}</td>
	                                   <td width="10%">${OrderList.reser_date}</td>
	                                   <td width="10%">${OrderList.reser_time}</td>
	                                   <td width="9%">${OrderList.reser_usertime}시간</td>
	                                   <td width="9%">${OrderList.reser_person}명</td>
	                                   <td width="9%"><fmt:formatNumber value="${OrderList.reser_price}" pattern="#,###" />원</td>
	                                   <td width="8%">${OrderList.reser_status}</td>
	                                   <td width="8%">${OrderList.reser_orderDate}</td>
	                                   <c:if test="${OrderList.reser_status=='READY'}">
	                                 	  <td width="9%"><input type="button" class="btn-u btn-u-sm btn-u-green" value="취소요청" onclick="cancel(${OrderList.reser_number})"></td>
									   </c:if>
									   <c:if test="${OrderList.reser_status=='CANCEL'}">
	                                 	  <td width="9%"><input type="button" class="btn-u btn-u-sm btn-u-red" disabled value="취소완료"></td>
									   </c:if>
									   <c:if test="${OrderList.reser_status=='USED'}">
	                                 	  <td width="9%"><input type="button" class="btn-u btn-u-sm btn-u-blue" disabled value="사용완료"></td>
									   </c:if>
									 </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                  	  </div>                      
             	   </div>
        		</div>
			</div>
		</div>
	</div>
	 <div class="margin-bottom-50"></div>

    <!-- Footer 영역 -->
    <jsp:include page="../common/GatherStudyFooter.jsp"></jsp:include>
    </div>

<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();
        OwlCarousel.initOwlCarousel();        
        ParallaxSlider.initParallaxSlider();
    });
    
	function cancel(reser_number) {
		var chk = confirm("예약을 취소하시겠습니까?");
		if (chk) {
			location.href = "${pageContext.request.contextPath}/cafe/reservationCancel.do?cafe_id=${sessionScope.loginCafe.cafe_id}&reser_number="+reser_number;
		}
	}
	
</script>

</body>
</html>