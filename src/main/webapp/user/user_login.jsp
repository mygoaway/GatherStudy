<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko"> 
<head>
	<title>GatherStudy</title>
	<jsp:include page="../common/GatherStudyDefault.jsp"></jsp:include>
    <style type="text/css">
	    .reg-page {
	    	padding:20px;
	    }
   </style>  
</head>

<body>
<div class="wrapper">
    <!-- Header 영역 -->
    <jsp:include page="../common/GatherStudyHeader.jsp"></jsp:include>


    <!--=== Breadcrumbs ===-->
    <div class="breadcrumbs">
        <div class="container">
            <h1 class="pull-left">사용자 로그인</h1>
            <ul class="pull-right breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
                <li class="active">사용자 로그인</li>
            </ul>
        </div><!--/container-->
    </div><!--/breadcrumbs-->
    <!--=== End Breadcrumbs ===-->
<!--  
====================로그인 구역 시작========================
-->
	<!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
	<c:if test="${not empty cookie.user_check}">
		<c:set value="checked" var="checked"/>
	</c:if>
	
	<form method="post" action="/user/login.do" id="loginform" >
    <!--=== Content Part ===-->
    <div class="container content">		
    	<div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                <form class="reg-page">
                    <div class="reg-header">            
                        <h2>사용자 로그인</h2>
                    </div>

                    <div class="input-group margin-bottom-20">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" id="member_id" name="member_id" value="${cookie.user_check.value}" placeholder="아이디" class="form-control">
                    </div>                    
                    <div class="input-group margin-bottom-10">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" id="pwd1" name="member_pwd" placeholder="비밀번호" class="form-control">
                    </div>                    
					<div class="row">
                        <div class="col-md-12">	
                            <label class="pull-left">	
                            	<input type="checkbox" id="remember_us" name="remember_userId" ${checked}> 아이디 저장                  
                        	</label>
                        </div>                     
            		</div>
					<input type="button" onclick="signInValidation()" class="btn-u btn-u-lg btn-block btn-u-blue" value="로그인">
                    <hr>
					<div class="col-md-pull">
                    <p style="text-align:center;" class="color-blue">아직 회원이 아니신가요?</p>
                    </div>
                    <p><a href="${pageContext.request.contextPath}/user/register.do"><button class="btn-u btn-block btn-u-blue" type="button" >회원가입</button></a></p>
                    <div class="row">
                       <div class="col-md-12">
                            <span class="pull-left">
                               <a class="color-blue" href="${pageContext.request.contextPath}/user/idSearchForm.do">아이디 찾기</a>
                            </span>  
                            <span class="pull-right">
                               <a class="color-blue" href="${pageContext.request.contextPath}/user/memberChange.do">비밀번호 찾기</a>
                            </span>
                        </div>
                   </div> 
                </form>            
            </div>
        </div><!--/row-->
    </div><!--/container-->		
    <!--=== End Content Part ===-->
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
		var userId = $("#member_id").val();
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
    		url : "${pageContext.request.contextPath}/user/login.do",
    		type:'POST',
    		data : {
    			member_id : $("#member_id").val(),
    			member_pwd : $("#pwd1").val(),
				remember_userId : $("#remember_us").is(':checked')
			},
    		success:function(data){
    			if(data == "success"){
    				alert("로그인에 성공하셨습니다.");
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