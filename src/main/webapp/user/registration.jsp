<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"> 
<head>
    <title>GatherStudy</title>
	<jsp:include page="../common/GatherStudyDefault.jsp"></jsp:include>
	
    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/page_log_reg_v2.css">    

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
<!-- 초기화  -->
<form method="post" action="/user/register.do" id="registerform" >
<!--=== Content Part ===-->    
<div class="container">
    <!--Reg Block-->
    
    <div class="reg-block">
        <div class="reg-block-header">
        	<center>
            <a  class="logo" href="${pageContext.request.contextPath}/main.do">
                <img src="${pageContext.request.contextPath}/assets/logoimg/MainLogo.png" alt="Logo" width="180">
            </a>
            </center>
            <h2>회원가입</h2>
            <p> 이미 가입 하셨나요?<br><a class="color-green" href="${pageContext.request.contextPath}/user/login.do"><font color="green">로그인</font></a>을 클릭하여 계정에 로그인하십시오.</p>
        </div>
        
		<!-- 아이디 -->
		<div id="temp"></div>
        <div class="input-group margin-bottom-20">
            <span class="input-group-addon"><i class="fa fa-user"></i></span>
            <input type="text" id="member_id" name="member_id" class="form-control" placeholder="아이디" autofocus>
        </div>
        
        <!-- 비밀번호 -->
        <div class="input-group margin-bottom-20">
            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
            <input type="password" id="pwd1" name="member_pwd" class="form-control" placeholder="비밀번호">
        </div>
        
        <!-- 비밀번호 재입력 -->
        <div class="input-group margin-bottom-20">
            <span class="input-group-addon"><i class="fa fa-key"></i></span>
            <input type="password" id="pwd2" class="form-control" placeholder="비밀번호 재입력">
        </div>

		<!-- 이름 -->
		<div class="input-group margin-bottom-20">
            <span class="input-group-addon"><i class="fa fa-user"></i></span>
            <input type="text" id="member_name" name="member_name" class="form-control" placeholder="이름">
        </div>
        
        <!-- 이메일 -->
         <div class="input-group margin-bottom-20">
            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
            <input type="text" id="member_email" name="member_email" class="form-control" placeholder="이메일">
        </div>
        
        <!-- 전화번호 -->
        <div class="input-group margin-bottom-30">
            <span class="input-group-addon"><i class="fa fa-phone-square"></i></span>
            <input type="text" id="member_phone" name="member_phone" class="form-control" placeholder="전화번호 ex)01000000000">
        </div>
        <hr>

        <div class="checkbox">            
            <label>
                <input type="checkbox" id="term_check" name="term_check" value="" onClick="termCheck()"> 
                <a target="_blank">이용약관</a>을 읽었습니다.
            </label>
        </div>
                                
       <div class="row">
            <div class="col-md-8">
                <input type="button" onclick="signUpValidation()" class="btn-u btn-block" value="가입하기 ">           
            </div>
            <div class="col-md-4">
                <input type="reset" class="btn-u btn-block" value="초기화">     
            </div>
        </div>
    </div>
    <!--End Reg Block-->
</div><!--/container-->
</form>
<!--=== End Content Part ===-->

<!-- JS Global Compulsory -->           
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script> 

<!-- JS Implementing Plugins -->           
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/backstretch/jquery.backstretch.min.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        });
</script>

<!-- 회원가입 뒷배경 슬라이드쇼 -->
<script type="text/javascript">
    $.backstretch([
      "${pageContext.request.contextPath}/assets/img/bg/19.jpg",
      "${pageContext.request.contextPath}/assets/img/bg/18.jpg",
      ], {
        fade: 1000,
        duration: 7000
    });

    function signUpValidation(){
    	var userId = $("#member_id").val();
    	var userPw = $("#pwd1").val();	
    	var userPwCheck = $("#pwd2").val();
    	var name = $("#member_name").val();
    	var email = $("#member_email").val();
    	var phone = $("#member_phone").val();

    	if(!userId){
    		alert("아이디 입력은 필수입니다.");
    		$("#member_id").focus();
    	}else if(!userPw){
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
    	}else if($("#term_check").is(":checked") == false){
    		alert("이용약관을 동의해주세요.");
    	}else {
    		signUp()
    	}
    }
    
    function signUp(){
    	$.ajax({		
    		url : "${pageContext.request.contextPath}/user/register.do",
    		type:'POST',
    		data :  $("#registerform").serialize(),
    		success:function(data){
    			if(data == "success"){
    				alert("회원가입이 완료됐습니다.^^");
    				location.href = "${pageContext.request.contextPath}/user/login.do"
    			}else if(data == "fail"){
    				alert("이미 존재하는 아이디입니다.");
    				return false;
    			}
    		}
    	})
    }
    
    function termCheck(){
    	 url="${pageContext.request.contextPath}/user/registration_term.do"
   		 //1.불러올 문서명 2.창의 제목 3.창의 옵션!!
   		 window.open(url,"get","left=450,top=150,width=1100,height=2000")
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

</body>
</html>