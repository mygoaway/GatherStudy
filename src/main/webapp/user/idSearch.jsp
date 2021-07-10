<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <h1 class="pull-left">아이디 찾기</h1>
            <ul class="pull-right breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
                <li class="active">아이디 찾기</li>
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
   
   <form id="idSearchform" >
    <!--=== Content Part ===-->
    <div class="container content">      
       <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                    <div class="reg-header">            
                        <h2>아이디 찾기</h2>
                    </div>

               <h5 align="center">회원 가입시 입력하신 이름과 휴대폰 번호를 입력해주세요</h5>
               <br>
               
                    <div class="input-group margin-bottom-20">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" id="member_name" name="member_name" value="${cookie.user_check.value}" placeholder="이름을 입력해주세요" class="form-control">
                    </div>                    
                    
                    <div class="input-group margin-bottom-10">
                        <span class="input-group-addon"><i class="fa fa-phone-square"></i></span>
                        <input type="text" id="member_phone" name="member_phone" placeholder="휴대폰 번호를 입력해주세요" class="form-control">
                    </div>                    
               <br>

               <div class="input-group margin-bottom-10">
                  <input type="checkbox" id="checkbox_01" class="form-checkbox">
                  <label for="checkbox_01"> 개인정보 이용 등에 관한 제반법률에 동의하십니까?</label>
               </div>
               <br>
               
               <div class="joinAr">
                   </div>   
              
                 <div class="btnAreaC ">
                  <input type="button" onclick="signInValidation()" class="btn-u btn-u-lg btn-block btn-u-blue" value="아이디 찾기">
                       <hr>  
                    </div>
            </div>
        </div><!--/row-->
    </div><!--/container-->      
    <!--=== End Content Part ===-->
    </form>

    <!-- Footer 영역 -->
    <jsp:include page="../common/GatherStudyFooter.jsp"></jsp:include>
   
</div><!--/wrapper--><!-- 전체를 하나로 감싸주는 역할? -->

<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        });
</script>

<script type="text/javascript">
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

   function signInValidation(){
      var userName = $("#member_name").val();
      var userPhone = $("#member_phone").val();
      var PrivacyPolicyAgree = $("input:checkbox[id='checkbox_01']").is(":checked");
      
      
      if(!userName || userName.lenght <= 0){
          alert("필수입력사항입니다. 이름을 입력해주세요.");
          $("#member_id").focus();
          return;
      }
      
      if(!userPhone || userPhone.lenght <= 0){
          alert("필수입력사항입니다. 핸드폰 번호를 입력 해주세요.");
          $("#pwd1").focus();
          return;
      }
      
      if(PrivacyPolicyAgree == false){
         alert('개인정보 이용등에 관한 제반법률에 대해 동의해주세요.')
         return;
      }
      
      idSearch(userName, userPhone);
   }
   
    function idSearch(){
       $.ajax({      
          url : "${pageContext.request.contextPath}/user/idSearch.do",
          type:'POST',
          data : {
             member_name : $("#member_name").val(),
             member_phone : $("#member_phone").val(),
         },
         
          success:function(data){
             if(data.result == "success"){
                   var HTML1 = '';
                   HTML1 += '   <h3 align="center">회원님의 아이디는';
                   HTML1 += '   <span>' + data.id + '</span> 입니다.';
                   HTML1 += '   </h3><br>';

                   var HTML2 = '';
                   HTML2 += ' <button type="button" class="btn-u btn-u-lg btn-block btn-u-blue" onclick="location.href=';
                   HTML2 += " 'login.do' " 
                   HTML2 += ' "> 로그인 하러가기 </button>';

             } else if(data == "idFail"){
               alert("사용자의 이름으로 가입된 회원정보가 없습니다.");

            } else if(data == "phoneFail"){
               alert("아이디와 핸드폰번호가 일치하는 아이디가 존재하지 않습니다.");

            } else{
                alert("ERROR");
             }
             
             $('.joinAr').html(HTML1);
             $('.btnAreaC').html(HTML2);
          }
       })
    }
</script>

</body>
</html>