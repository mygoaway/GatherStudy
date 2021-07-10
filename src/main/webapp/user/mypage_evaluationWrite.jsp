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
			<form method="post" action="page_mypage_evaluationWrite.do" id="writeForm" >
		    	<table class="table" style="text-align: center;">
						<thead > 
							<tr class="active">
								<th colspan="3"	style="background-color: #eeeeee; text-align: center;"><font color="black" size="5pt">스터디 카페 후기 작성하기</font></th>
							</tr>
						</thead>
							
						<tbody>
							<tr>
								<td style="width: 20%;"><font color="black" size="4pt">스터디 카페명</font></td>
								<td><font color="black" size="4pt">${memberOrder.cafe_name}</font></td>

							</tr>
						
							<tr>
								<td style="width: 20%;"><font color="black" size="3pt">스터디 카페 평점</font></td>
								<td>
								   	  <select name="order_eval_score" id="order_eval_score" class="form-control" >
								          <option></option>
								          <option value="1">1점</option>
								          <option value="2">2점</option>
								          <option value="3">3점</option>
								          <option value="4">4점</option>
								          <option value="5">5점</option>
							          </select>   
								</td>
							</tr>
											
							<tr>
								<td style="width: 20%;"><font color="black" size="3pt">후기 제목</font></td>
								<td><input type="text" id="order_eval_title" name="order_eval_title" class="form-control" placeholder="ex) 공간이 넓어서 여러 사람들과 함께 스터디 하기 좋았습니다."></td>
							</tr>
			
							<tr>
								 <td><font color="black" size="3pt">후기 내용</font></td>	
								 <td><textarea id="order_eval_content" name="order_eval_content" class="form-control" rows="20" cols="50" placeholder="스터디 카페에 대한 솔직히 후기를 남겨주세요."></textarea></td>
							</tr>	
						</tbody>
				</table>
				<input type="hidden" name="member_id" value="${sessionScope.loginUser.member_id}">
				<input type="hidden" name="cafe_id" value="${memberOrder.cafe_id}">
				<input type="hidden" name="reser_number" value="${memberOrder.reser_number}">
				
				 <div class="col-md-2 col-md-offset-6">
				    	<input type="button" onclick="EvaluationWriteValidation()" class="btn-u btn-block btn-u-green" value="작성 하기 ">           
				 </div>
				 <div class="col-md-2">
				         <input type="reset" class="btn-u btn-block btn-u-green" value="초기화">                        
				  </div>
				  <div class="col-md-2">
					   	 <input type="button" class="btn-u btn-block btn-u-green" value="목록" onclick="location.href='${pageContext.request.contextPath}/user/mypage_evaluation.do?member_id=${sessionScope.loginUser.member_id}' ">   	
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
    });
    
    function EvaluationWriteValidation(){
    	var score = $("#order_eval_score").val();	
    	var title = $("#order_eval_title").val();
    	var content = $("#order_eval_content").val();
    	
    	if(!score){
    		alert("평점은 필수로 입력하셔야 입니다.");
    		$("#order_eval_score").focus();
    	}else if(!title){
    		alert("후기 제목은 필수로 입력하셔야 입니다.");
    		$("#order_eval_title").focus();
    	}else if(!content){
    		alert("후기 내용은 필수로 입력하셔야 합니다.");
    		$("#order_eval_content").focus();
    	}else {
    		EvaluationWrite();
    	}
    }
    
    function EvaluationWrite(){
    	$.ajax({		
    		url : "${pageContext.request.contextPath}/user/mypage_evaluationWrite.do",
    		type:'POST',
    		data :  $("#writeForm").serialize(),
    		success:function(data){
    			if(data == "success"){
    				alert("스터디 카페 후기가 등록되었습니다.^^");
    				location.href = "${pageContext.request.contextPath}/user/mypage_evaluation.do?member_id=${sessionScope.loginUser.member_id}";
    			}
    			return false;
    		}
    	})
    }  
</script>

</body>
</html>