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
    	#Dstyle{
    		text-align: center;
    	}
    	#Dtext{
    		font-size: 24px;
    	}
    	#DDDtext{
    		color:#FF5050;
    	}
    	#userF{
    		color:#52C6F3;
    	}
	</style>
</head>	

<body>
<div class="wrapper">
  	<!-- Header 영역 -->
    <jsp:include page="../common/GatherStudyHeader.jsp"></jsp:include>
    
	<div class="breadcrumbs">
        <div class="container">
            <h1 class="pull-left" id="RPath"><b>마이페이지</b></h1>
        </div>
    </div>
    
    <!-- 중단 시작 -->
     <div class="container content">		
    	<div class="row blog-page"> 
			<div id="Dstyle">
	    		<div class="tab-pane fade in active" id="home-1">
                            <form action="/user/mypage_infoDelete.do" method="post"  class="sky-form" id="deleteform">
                                <header>회원탈퇴</header>
                                
                                <fieldset>
                                	<div id="Dtext">                  
                                        <b id="userF">${member.member_id}</b> 라는 아이디를 쓰고계신                 
                                        <i class="fa fa-user">&ensp;</i><b id="userF"> ${member.member_name}</b>님!!<br>
                                        정말로 회원을 탈퇴하실껀가요????
                                    </div>
                                    <p>
                                    <div id="DDDtext">
                                   	※회원 탈퇴시 모든정보가 삭제 되며 복구가 불가능하오니 참고바랍니다.
                                   	</div>
                                    <p>
                                    <div class="col-md-offset-4 col-md-4 col-md-offset-4">
                                    	<i class="fa fa-lock">&ensp;</i><b>비밀번호</b>
                                    	<input type="password" class="form-control" id="pwd1" name="member_pwd" placeholder="Password"><br>
                                    	<input type="hidden" name="member_id" value="${sessionScope.loginUser.member_id}">
                                    	<i class="fa fa-lock">&ensp;</i><b>비밀번호 확인</b>
                                    	<input type="password" class="form-control" id="pwd2" placeholder="Password">
                                    </div>
                                </fieldset>
                                <footer class="pull">
	                                	<div class="pull-left">
	                                		<a type="button" class="btn-u btn-u-red" onclick="DeleteUpValidation()">탈퇴하기</a>
	                                	</div>
										<div class="pull-right">
	                                		<a type="button" class="btn-u" href="${pageContext.request.contextPath}/user/mypage_info.do?member_id=${sessionScope.loginUser.member_id}">탈퇴 취소 하기</a>
	                                	</div>
                                </footer>
                            </form>
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
        OwlCarousel.initOwlCarousel();        
        ParallaxSlider.initParallaxSlider();
    });
    
    function DeleteUpValidation(){
    	var userPw = $("#pwd1").val();	
    	var userPwCheck = $("#pwd2").val();
		if(!userPw){
    		alert("비밀번호 입력은 필수입니다.");
    		$("#pwd1").focus();
    	}else if(!userPwCheck){
    		alert("비밀번호 확인 입력은 필수입니다.");
    		$("#pwd2").focus();
    	}else if(userPw != userPwCheck){
    		alert("비밀번호가 맞지 않습니다.");
    		$("#userPwCheck").focus();		
    	}else {
    		DeleteUp();
    	}
    }
    
    function DeleteUp(){
    	$.ajax({		
    		url : "${pageContext.request.contextPath}/user/mypage_infoDelete.do",
    		type:'POST',
    		data :  $("#deleteform").serialize(),
    		success:function(data){
    			if(data == "success"){
    				alert("회원이 탈퇴가 완료되었습니다.");
    				location.href = "${pageContext.request.contextPath}/main.do"
    			} else if(data == "pwdFail"){
    				alert("회원정보에 등록된 패스워드가 틀립니다!!");
    			}
    			return false
    		}
    	})
    }
    
</script>
</body>
</html>