<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko"> 
<head>
	<title>GatherStudy</title>
	<jsp:include page="../common/GatherStudyDefault.jsp"></jsp:include>
	
    <!-- 스타일존 -->
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
		                             <li><a href="${pageContext.request.contextPath}/cafe_reservationList.do?cafe_id=${sessionScope.loginCafe.cafe_id}">예약내역조회/취소</a></li>
		                            <li><a href="${pageContext.request.contextPath}/cafe_evaluationList.do?cafe_id=${sessionScope.loginCafe.cafe_id}">구매후기작성/조회</a></li>
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
	                        <h3 class="panel-title"><i class="fa fa-user"></i>작성한 리뷰</h3>
	                    </div>
	                    
	                    <div class="panel-body">
							<div class="row-v4">
								<div class="col-md-pull pull-left">             
									<div class="row">
										<div class="col-sm-3">
									    	<img class="img-responsive rounded-x" src="${pageContext.request.contextPath}/assets/img/team/logo.png" style="width:180px; height:110px">
									     </div>
									     
									     <div class="col-sm-9">
									     	<blockquote>
									        	<div class="row">
										        	<div class="col-sm-2">
											        	<h2 style="font-weight: bolder;">${evaluation.member_id}</h2>
											        </div>

											        <c:if test="${evaluation.order_eval_score==1}">
											        <div class="col-sm-4 col-sm-offset-6">
												    	<ul class="list-inline star-vote">
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
														</ul>
												     </div>       
											         </c:if>   
											                            
											         <c:if test="${evaluation.order_eval_score==2}">
											         <div class="col-sm-4 col-sm-offset-6">
												     	<ul class="list-inline star-vote">
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
													  	</ul>
												      </div>       
											          </c:if>   
											                            											                            
											         <c:if test="${evaluation.order_eval_score==3}">
											         <div class="col-sm-4 col-sm-offset-6">
												     	<ul class="list-inline star-vote">
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
													  	</ul>
												      </div>       
											          </c:if>   
											          
											         <c:if test="${evaluation.order_eval_score==4}">
											         <div class="col-sm-4 col-sm-offset-6">
												     	<ul class="list-inline star-vote">
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star"></i></li>
															<li><i class="color-green fa fa-star-o"></i></li>
													  	</ul>
												      </div>       
											          </c:if>   
											          
											         <c:if test="${evaluation.order_eval_score==5}">
											         <div class="col-sm-4 col-sm-offset-6">
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
										        <h5>제목 : ${evaluation.order_eval_title}</h5>
										        <p>${evaluation.order_eval_content}</p>
										        <h6 style="font-weight: lighter;">${evaluation.order_eval_regdate}</h6>
									        </blockquote> 			                              
									     </div>
									</div>
									<hr>
								</div>
							</div>
	                    </div>                
	                </div>
	        	</div>
			</div>
			    
		<div class="col-md-10 col-md-offset-2">
			<form method="post" action="cafe_evaluationReplyWrite.do" id="writeForm" >
		    	<table class="table" style="text-align: center;">
						<thead > 
							<tr class="active">
								<th colspan="3"	style="background-color: #eeeeee; text-align: center;"><font color="black" size="5pt">후기에 대한 댓글 작성하기</font></th>
							</tr>
						</thead>
							
						<tbody>							
							<tr>
								 <td><textarea id="order_eval_reply_content" name="order_eval_reply_content" class="form-control" rows="20" cols="50" placeholder="고객이 남겨주신 소중한 후기에 대한 댓글을 남겨주세요."></textarea></td>
							</tr>	
						</tbody>
				</table>
				<input type="hidden" name="cafe_id" value="${sessionScope.loginCafe.cafe_id}">
				<input type="hidden" name="order_eval_id" value="${evaluation.order_eval_id}">
				
				 <div class="col-md-2 col-md-offset-6">
				    	<input type="button" onclick="EvaluationReplyWriteValidation()" class="btn-u btn-block btn-u-green" value="작성 하기 ">           
				 </div>
				 <div class="col-md-2">
				         <input type="reset" class="btn-u btn-block btn-u-green" value="초기화">                        
				  </div>
				  <div class="col-md-2">
					   	 <input type="button" class="btn-u btn-block btn-u-green" value="목록" onclick="location.href='${pageContext.request.contextPath}/cafe/reservationList.do?cafe_id=${sessionScope.loginCafe.cafe_id}' ">   	
				  </div>
				  </form>
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
    
    function EvaluationReplyWriteValidation(){
    	var content = $("#order_eval_reply_content").val();	
    	
    	if(!content){
    		alert("고객이 남겨주신 후기에 대해서 댓글 내용을 남겨주세요.");
    		$("#order_eval_reply_content").focus();
    	}else {
    		EvaluationRelpyWrite();
    	}
    }
    
    function EvaluationRelpyWrite(){
    	$.ajax({		
    		url : "${pageContext.request.contextPath}/cafe/evaluationReplyWrite.do",
    		type:'POST',
    		data :  $("#writeForm").serialize(),
    		success:function(data){
    			if(data == "success"){
    				alert("고객이 남겨주신 후기에 대해서 댓글을 등록했습니다.^^");
    				location.href = "${pageContext.request.contextPath}/cafe/evaluationList.do?cafe_id=${sessionScope.loginCafe.cafe_id}";
    			}
    			return false;
    		}
    	})
    }  
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>