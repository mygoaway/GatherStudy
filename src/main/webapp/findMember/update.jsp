<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko"> 
<head>
	<title>GatherStudy</title>
	<jsp:include page="../common/GatherStudyDefault.jsp"></jsp:include>
</head>	

<body class="header-fixed">
<div class="wrapper">
    <!-- Header 영역 -->
    <jsp:include page="../common/GatherStudyHeader.jsp"></jsp:include>
    
	<!--=== Content Part ===-->
    <div class="container content-sm">
    <div class="col-md-10 col-md-offset-1">
	    <div class="headline">
	    	<h2>멤버구하기</h2>
	    </div>
    </div>
    <form method="post" action="findMmber/update.do" id="updateform" >
	    <div class="row">
	    	<div class="col-md-10 col-md-offset-1">
				<table class="table" style="text-align: center;">
					<thead > 
						<tr class="active">
								<th colspan="3"	style="background-color: #eeeeee; text-align: center;"><font color="black" size="5pt">글 수정하기</font></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;"><font color="black" size="3pt">글제목</font></td>
							<td><input type="text" id="find_title" name="find_title" value="${find.find_title}" class="form-control"></td>
						</tr>
						<tr>
							 <td><font color="black" size="3pt">내용</font></td>	
							 <td><textarea id="find_content" name="find_content" class="form-control" rows="50" cols="50">${find.find_content}</textarea></td>
						</tr>
					</tbody>
					<input type="hidden" name="find_number" value="${find.find_number}">
				</table>
				
	            <div class="col-md-2 col-md-offset-8">
	                <input type="button" onclick="findUpdateValidation()" class="btn-u btn-block btn-u-green" value="수정하기 ">           
	            </div>
	            <div class="col-md-2">
	                <input type="button" class="btn-u btn-block btn-u-green" value="목록" onclick="location.href='${pageContext.request.contextPath}/findMember/list.do' ">   	
			 	</div>
            </div>
		</div>
	</form>
    </div><!--/container content-sm-->
    <!-- End Content Part -->

    <!-- Footer 영역 -->
    <jsp:include page="../common/GatherStudyFooter.jsp"></jsp:include>
</div><!--/wrapper-->

<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();
    });
    
    function findUpdateValidation(){
    	var title = $("#find_title").val();
    	var content = $("#find_content").val();
    	
    	if(!title){
    		alert("글 제목은 필수로 입력하셔야 입니다.");
    		$("#find_title").focus();
    	}else if(!content){
    		alert("글 내용은 필수로 입력하셔야 합니다.");
    		$("#find_content").focus();
    	}else {
    		findUpdate();
    	}
    }
    
    function findUpdate(){
    	$.ajax({		
    		url : "${pageContext.request.contextPath}/findMember/update.do",
    		type:'POST',
    		data :  $("#updateform").serialize(),
    		success:function(data){
    			if(data == "success"){
    				alert("게시글이 수정되었습니다.^^");
    				location.href = "${pageContext.request.contextPath}/findMember/list.do"
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