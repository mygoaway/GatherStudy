<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko"> 
<head>
	<title>GatherStudy</title>
	<jsp:include page="../common/GatherStudyDefault.jsp"></jsp:include>
	<style>    
	    #RPath{
			color:#2ecc71;
		}
	    #CTitle{
			font-size:30px;
			    
	    }
	</style>
</head>	

<body>
<div class="wrapper">
    <!-- Header 영역 -->
    <jsp:include page="../common/GatherStudyHeader.jsp"></jsp:include>
    
	<div class="breadcrumbs">
        <div class="container">
            <h1 class="pull-left" id="RPath"><b>My 예약</b></h1>
        </div>
    </div>
    
    <!-- 중단 시작 -->
     <div class="container content">		
    	<div class="row blog-page"> 
    	   <div class="col-md-2  hidden-xs related-search">
				<div class=" s-results margin-bottom-50">
       				<div class="row">
                   			<div class="col-md-12 col-sm-4">
		                        <h3 id="RPath">My 예약</h3>
		                        <ul class="list-unstyled">
		                            <li><a href="${pageContext.request.contextPath}/user/mypage_reservation.do?member_id=${sessionScope.loginUser.member_id}">예약내역조회/취소</a></li>
		                            <li><a href="${pageContext.request.contextPath}/user/mypage_evaluation.do?member_id=${sessionScope.loginUser.member_id}">구매후기작성/조회</a></li>
		                            <li><a href="#">장바구니</a></li>   
		                       </ul>
		                       <hr>
	                    	</div>       

                    		<div class="col-md-12 col-sm-4">
	                        	<h3 id="RPath">My 정보</h3>
                       		<ul class="list-unstyled">
                            	<li><a href="${pageContext.request.contextPath}/user/mypage_info.do?member_id=${sessionScope.loginUser.member_id}">개인정보확인/수정</a></li>       
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
	                        <h3 class="panel-title"><i class="fa fa-user"></i>My 예약</h3>
	                    </div>
	                    <div class="panel-body">
	                        <table class="table table-hover" style="text-align: center;">
	                            <thead>
	                                <tr class="active">
	                                    <td width="8%">예약번호</td>
	                                    <td width="15%">스터디 카페명</td>
	                                    <td width="6%">공간</td>
	                                    <td width="10%">예약 날짜</td>
	                                    <td width="10%">예약 시간</td>
	                                    <td width="9%">사용 시간</td>
	                                    <td width="8%">사용 인원</td>
	                                    <td width="9%">결제 금액</td>
	                                    <td width="8%">예약 상태</td>
	                                    <td width="17%">후기 작성</td>
	                                </tr>
	                            </thead>
	                            
	                            <!-- 레코드가 없다면 -->
								<c:if test="${count==0}">
								    <tr>
								       <td colspan="11" align="center">
								          사용하신 예약 내역이 없습니다.
								       </td>
								    </tr>
								</c:if>
						
	                            <tbody>
	                            	<c:forEach var="OrderList" items="${OrderList}">  
	                               		 <tr>
	                                	   <td width="8%">${OrderList.reser_number}</td>
		                                   <td width="15%">${OrderList.cafe_name}</td>
		                                   <td width="6%">${OrderList.reser_category}</td>
		                                   <td width="10%">${OrderList.reser_date}</td>
		                                   <td width="10%">${OrderList.reser_time}</td>
		                                   <td width="9%">${OrderList.reser_usertime}시간</td>
		                                   <td width="8%">${OrderList.reser_person}명</td>
		                                   <td width="9%"><fmt:formatNumber value="${OrderList.reser_price}" pattern="#,###" />원</td>
		                                   <td width="8%">${OrderList.reser_status}</td>
		                                   <c:if test="${OrderList.reser_evaluationCheck=='YES'}">
		                                 	  <td width="17%"><input type="button" class="btn-u btn-u-sm btn-u-red" value="후기 작성 완료" disabled></td>
										   </c:if>
										   <c:if test="${OrderList.reser_evaluationCheck=='NO'}">
		                                 	  <td width="17%"><input type="button" class="btn-u btn-u-sm btn-u-green" value="후기 작성 하기" onclick="location.href='${pageContext.request.contextPath}/user/mypage_evaluationWrite.do?reser_number=${OrderList.reser_number}' "></td>
										   </c:if>
		                                   </tr>
	                                </c:forEach>
	                            </tbody>
	                        </table>
	                    </div>                      
	                </div>
	        	</div>
			</div>
		
			<div class="col-md-10 col-md-offset-2">
		    	<div class="tab-pane fade in active" id="home-1">
	            	<div class="panel panel-green margin-bottom-40">
	                    <div class="panel-heading">
	                        <h3 class="panel-title"><i class="fa fa-user"></i>작성한 리뷰</h3>
	                    </div>
	                    <div class="panel-body">
							<div class="row-v4">
								<div class="col-md-pull pull-left">             
									<c:forEach var="evaluation_list" items="${evaluationList}">
									<div class="row">
										<div class="col-sm-2">
									    	<img align="middle" class="img-responsive" src="${pageContext.request.contextPath}/${evaluation_list.cafe_image1}" style="width:500px; height:110px">
									     </div>
									     
									     <div class="col-sm-10">
									     	<blockquote>
									        	<div class="row">
										        	<div class="col-sm-4">
											        	<h2 style="font-weight: bolder;">${evaluation_list.cafe_name}</h2>
											        </div>

											        <c:if test="${evaluation_list.order_eval_score==1}">
											        <div class="col-sm-4 col-sm-offset-4">
												    	<ul class="list-inline star-vote">
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
														</ul>
												     </div>       
											         </c:if>   
											                            
											         <c:if test="${evaluation_list.order_eval_score==2}">
											         <div class="col-sm-4 col-sm-offset-4">
												     	<ul class="list-inline star-vote">
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
													  	</ul>
												      </div>       
											          </c:if>   
											                            											                            
											         <c:if test="${evaluation_list.order_eval_score==3}">
											         <div class="col-sm-4 col-sm-offset-4">
												     	<ul class="list-inline star-vote">
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
													  	</ul>
												      </div>       
											          </c:if>   
											          
											         <c:if test="${evaluation_list.order_eval_score==4}">
											         <div class="col-sm-4 col-sm-offset-4">
												     	<ul class="list-inline star-vote">
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
													  	</ul>
												      </div>       
											          </c:if>   
											          
											         <c:if test="${evaluation_list.order_eval_score==5}">
											         <div class="col-sm-4 col-sm-offset-4">
												     	<ul class="list-inline star-vote">
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
													  	</ul>
												      </div>       
											          </c:if>   											          											          											                           					                                     
										        </div>
										        <p>${evaluation_list.order_eval_content}</p>
										        <h6 style="font-weight: lighter;">${evaluation_list.order_eval_regdate}</h6>
									        </blockquote> 
									              
									        <blockquote>
										    	<c:forEach var="replyList" items="${replyList}">
											    	<c:if test="${evaluation_list.order_eval_id==replyList.order_eval_id}">
												    	<h2 style="color: purple; font-weight: bolder;">호스트의 답글</h2>
												        <p>${replyList.order_eval_reply_content}</p>
												        <h6 style="font-weight: lighter;">${replyList.order_eval_reply_regdate}</h6>
											        </c:if>
										        </c:forEach>
									        </blockquote>									                              
									     </div>
									</div>
									<hr>
								    </c:forEach>
								</div>
							</div>
	                    </div>                      
	                </div>
	        	</div>
			</div>
		</div>
	</div>
 	<div class="margin-bottom-30"></div>
 	
 	<!-- Footer 영역 -->
    <jsp:include page="../common/GatherStudyFooter.jsp"></jsp:include>
</div>
<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();
    });
</script>

</body>
</html>