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
            <h1 class="pull-left" id="RPath"><b>회원 정보</b></h1>
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
                            <form action="#" class="sky-form">
                                <header>회원정보</header>
                                
                                <fieldset>
                                	<div>                  
                                        <i class="fa fa-user">&ensp;</i><b>아이디</b> : ${member.member_id}
                                    </div>
                                    <p>
                                    <hr>
                                    <div>                  
                                        <i class="fa fa-user">&ensp;</i><b>이름</b> : ${member.member_name}
                                    </div>
                                    <p>
                                    <hr>
                                    <div>                  
                                        <i class="fa fa-envelope">&ensp;</i><b>이메일</b> : ${member.member_email}
                                    </div>
                                    <p>
                                    <hr>
                                    <div>                  
                                        <i class="fa fa-phone-square">&ensp;</i><b>전화번호</b> : ${member.member_phone}
                                    </div>
                                    <p>
                                    <hr>
                                    <div>                  
                                        <i class="fa fa-history">&ensp;</i><b>가입날짜</b> : ${member.member_joindate}                           
                                    </div>
                                    <p>
                                </fieldset>
                                <footer class="pull">
	                                	<div class="pull-left">
	                                		<a type="submit" class="btn-u" href="${pageContext.request.contextPath}/user/mypage_infoModify.do?member_id=${sessionScope.loginUser.member_id}">수정하기</a>
	                                	</div>
										<div class="pull-right">
	                                		<a type="submit" class="btn-u btn-u-red" href="${pageContext.request.contextPath}/user/mypage_infoDelete.do?member_id=${sessionScope.loginUser.member_id}">탈퇴하기</a>
	                                	</div>
                                </footer>
                            </form>
                            <!--/ Success states for elements -->
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
    });
</script>

</body>
</html>