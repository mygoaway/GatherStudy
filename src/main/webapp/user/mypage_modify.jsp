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
                            <form action="/user/mypage_infoModify.do" id="updateform" class="sky-form" method="post">
                                <header>회원정보 수정하기</header>
                                
                                <fieldset>
                                	<div>                  
                                        <i class="fa fa-user">&ensp;</i><b>아이디</b> : ${member.member_id}
                                    </div>
                                    <p>
                                    <hr>
                                    <div>                  
                                        <i class="fa fa-lock">&ensp;</i><b>비밀번호</b>
                                        <input type="password" class="form-control" id="pwd1" name="member_pwd" placeholder="Password">
                                    </div>
                                    <p>
                                    <div>                  
                                        <i class="fa fa-lock">&ensp;</i><b>비밀번호 재입력</b>
                                        <input type="password" class="form-control" id="pwd2" placeholder="Password">
                                    </div>
                                    <p>
                                    <hr>
                                    <div>                  
                                        <i class="fa fa-user">&ensp;</i><b>이름</b>
                                        <input type="text" id="member_name" name="member_name" class="form-control" placeholder="이름을 입력해주세요" value="${member.member_name}">
                                    </div>
                                    <p>
                                    <hr>
                                    <div>                  
                                        <i class="fa fa-envelope">&ensp;</i><b>이메일</b>
                                        <input type="email" class="form-control" id="member_email" name="member_email" placeholder="예시) aaa@aaa.com" value="${member.member_email}" >
                                    </div>
                                    <p>
                                    <hr>
                                    <div>                  
                                        <i class="fa fa-phone-square">&ensp;</i><b>전화번호</b>                                        
                                        <input type="text" id="member_phone" name="member_phone" class="form-control" placeholder="전화번호 ex)01012345678" value="${member.member_phone}">
                                    	<input type="hidden" id="member_id" name="member_id" value="${sessionScope.loginUser.member_id}">
                                    </div>
                                    <p>
                                </fieldset>
                                <footer class="pull">
	                                	<div class="pull-left">
	                                		<a type="submit" class="btn-u btn-u-blue" onclick="updateValidation()">수정완료</a>&ensp;&ensp;&ensp;
	                                		<a type="submit" class="btn-u btn-u-yellow" href="${pageContext.request.contextPath}/user/mypage_info.do?member_id=${sessionScope.loginUser.member_id}">취소하기</a>
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
    
    function updateValidation(){
    	var userPw = $("#pwd1").val();	
    	var userPwCheck = $("#pwd2").val();
    	var name = $("#member_name").val();
    	var email = $("#member_email").val();
    	var phone = $("#member_phone").val();
    	
		if(!userPw){
    		alert("비밀번호 입력은 필수입니다.");
    		$("#pwd1").focus();
    	}else if(!userPwCheck){
    		alert("비밀번호 확인 입력은 필수입니다.");
    		$("#pwd2").focus();
    	}else if(userPw != userPwCheck){
    		alert("비밀번호가 맞지 않습니다.");
    		$("#userPwCheck").focus();		
    	}else if(!email){
    		alert("이메일 입력은 필수입니다.");
    		$("#member_email").focus();
    	}else if(!phone){
    		alert("핸드폰 번호 입력은 필수입니다.");
    		$("#member_phone").focus();
    	}else {
    		update()
    	}
    }
    
    function update(){
    	$.ajax({		
    		url : "${pageContext.request.contextPath}/user/mypage_infoModify.do",
    		type:'POST',
    		data :  $("#updateform").serialize(),
    		success:function(data){
    			if(data == "success"){
    				alert("회원수정이 완료됐습니다.^^");
    				location.href = "${pageContext.request.contextPath}/user/mypage_info.do?member_id=${sessionScope.loginUser.member_id}"
    			}
    		}
    	})
    }
</script>

<script>
// 핸드폰 번호 하이픈 자동 입력
$(document).ready(function(){ 
    $("input#member_phone").blur(function(){
    	var num = $("#member_phone").val();
    	blur(num)
    });

    $("input#member_phone").click(function(){
    	var num = $("#member_phone").val();
    	focus(num);
    });
});

function focus(num) {
	num = num.replace(/[^0-9]/g, '');
	$("#member_phone").val(num);
}

function blur(num) {
	num = num.replace(/[^0-9]/g, '');
	var tmp = '';
	tmp += num.substr(0, 3);
	tmp += '-';
	tmp += num.substr(3, 4);
	tmp += '-';
	tmp += num.substr(7);
	$("#member_phone").val(tmp);
}
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>