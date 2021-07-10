<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko"> 
<head>
	<title>GatherStudy</title>
	<jsp:include page="../common/GatherStudyDefault.jsp"></jsp:include>
</head>
<body>
<div class="wrapper">
  	<!-- Header 영역 -->
    <jsp:include page="../common/GatherStudyHeader.jsp"></jsp:include>
   
    <!-- 관리자 로그인 -->
    <div class="breadcrumbs">
        <div class="container">
            <h1 class="pull-left">관리자 로그인</h1>
            <ul class="pull-right breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
                <li class="active">관리자 로그인</li>
            </ul>
        </div>
    </div>

	<!--  로그인 구역 시작 -->
	<form method="post" action="user/adminLogin.do" id="loginform" >
	    <div class="container content">		
	    	<div class="row">
	            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
	                <form class="reg-page">
	                    <div class="reg-header">            
	                        <h2>관리자 로그인</h2>
	                    </div>
	
	                    <div class="input-group margin-bottom-20">
	                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
	                        <input type="text" id="admin_id" name="admin_id" placeholder="아이디" class="form-control">
	                    </div>                    
	                    <div class="input-group margin-bottom-10">
	                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
	                        <input type="password" id="pwd1" name="admin_pwd" placeholder="비밀번호" class="form-control">
	                    </div>                    
						<div class="row">
	                        <div class="col-md-12">	
	                            <label class="pull-left">	
	                            	<input type="checkbox" name="saveId"> 아이디 저장                  
	                        	</label>
	                        </div>                     
	            		</div>
						<input type="button" onclick="signInValidation()" class="btn-u btn-u-lg btn-block btn-u-blue" value="로그인">
	                    <hr>
	
	                </form>            
	            </div>
	        </div>
	    </div>		
    </form>

    <!-- Header 영역 -->
    <jsp:include page="../common/GatherStudyFooter.jsp"></jsp:include>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
    });
</script>

<script type="text/javascript">
	function signInValidation(){
		var userId = $("#admin_id").val();
		var userPw = $("#pwd1").val();
		
		if(!userId){
    		alert("아이디 입력은 필수입니다.");
    		$("#member_id").focus();
    	}else if(!userPw){
    		alert("비밀번호 입력은 필수입니다.");
    		$("#pwd1").focus();
    	}else {
    		signIn()
    	}
	}
	
    function signIn(){
    	$.ajax({		
    		url : "${pageContext.request.contextPath}/user/adminLogin.do",
    		type:'POST',
    		data : $("#loginform").serialize(),
    		success:function(data){
    			if(data == "success"){
    				alert("관리자 계정으로 접속하셨습니다.");
    				location.href = "${pageContext.request.contextPath}/main.do";
    			}else if(data == "idFail"){
    				alert("ID가 존재하지 않습니다");
    				return false;
    				
    			} else if(data == "pwdFail") {
    				alert("패스워드가 틀렸습니다. 비밀번호를 확이해주세요");
    				return false;		
    			}
    		}
    	})
    }
</script>

</body>
</html>