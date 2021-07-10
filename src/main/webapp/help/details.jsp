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
    <div class="headline"><h2>도움말</h2></div>
    </div>
    <div class="row">
    	<div class="col-md-10 col-md-offset-1">
			<table class="table" style="text-align: center;">
				<thead > 
					<tr class="active">
							<th colspan="3"	style="background-color: #eeeeee; text-align: center;"><font color="black" size="5pt">도움말 보기</font></th>
					</tr>
				</thead>
					<tbody>
						<tr>
							<td style="width: 20%;"><font color="black" size="3pt">글제목</font></td>
							<td colspan="2"><font color="black" size="3pt">${help.help_title}</font></td>
						</tr>

						<tr>
							<td><font color="black" size="3pt">작성일</font></td>	
							<td colspan="2"><font color="black" size="3pt">${help.help_regdate}</font></td>
						</tr>
						<tr>
							<td><font color="black" size="3pt">내용</font></td>	
							<td colspan="2" style="min-height: 200px; text-align: left;"><p style="white-space: pre-line;"><font color="black" size="3pt">${help.help_content}</font></p></td>
						</tr>
					</tbody>
			</table>
			
			<div class="col-md-2 col-md-offset-6">
				<input type="button" class="btn-u btn-block btn-u-green" value="목록" onclick="location.href='${pageContext.request.contextPath}/help/list.do' ">   	
			</div>
			<c:if test="${!empty sessionScope.loginAdmin}">
				<div class="col-md-2">
					<input type="button" class="btn-u btn-block btn-u-green" value="수정" onclick="location.href='${pageContext.request.contextPath}/help/update.do?help_number=${help.help_number}' ">
				</div>		
				<div class="col-md-2">
					<input type="button" class="btn-u btn-block btn-u-green" value="삭제" onclick="del(${help.help_number})">
				</div>
			</c:if>	

		</div>	
	</div>
    </div><!--/container content-sm-->
    <!-- End Content Part -->

       <!-- Footer 영역 -->
    <jsp:include page="../common/GatherStudyFooter.jsp"></jsp:include>
</div><!--/wrapper-->

<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();
    });
    
	function del(help_number) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='${pageContext.request.contextPath}/help/delete.do?help_number='+help_number;
		}
	}
    
</script>

</body>
</html>