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
	    <div class="col-md-9 col-md-offset-1">
		    <div class="headline"><h2>멤버구하기</h2></div>
	    </div>

	    <div class="row">
	    	<form role="form" action="list.do" name="search" method="get">
		    	<div class="form-group col-md-2 col-md-offset-3">
			    	<select class="form-control" name="keyField">
						<option value="title">제목</option>
						<option value="content">내용</option>		
						<option value="all">전체</option>	
					</select>
		    	</div>
		    	
		    	<div class="form-group col-md-3">
					<input type="text" class="form-control" placeholder="검색어를 입력해주세요" name="keyWord" value="${keyWord}">
		    	</div>    	
		    	
		    	<div class="form-group col-md-1">
					<input type="submit" class="form-control" value="검색">
				</div>
				
				<c:if test="${!empty sessionScope.loginUser}">
			    	<div class="form-group col-md-1 col-md-offset-1">
			    		<input type="button" class="form-control" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/findMember/write.do' ">   	
					</div>			
				</c:if>	
	    	</form>
	
	    	
	    	<div class="col-md-10 col-md-offset-1">
				<table class="table table-hover" style="text-align: center;">
					<thead > 
						<tr class="active">
							<td width="10%">순 서</td>
							<td width="53%">제 목</td>
							<td width="10%">작성자</td>
							<td width="17%">작성일</td>
							<td width="10%">조회수</td>
						</tr>
					</thead>
					
					<!-- 레코드가 없다면 -->
					<c:if test="${count==0}">
					    <tr>
					       <td colspan="4" align="center">
					          등록된 게시물이 없습니다.
					       </td>
					    </tr>
					</c:if>
	
					<c:forEach var="list" items="${list}">
						<tr>
							<td width="10%">${list.find_number}</td>
							<td width="53%" align="left"><a href="${pageContext.request.contextPath}/findMember/details.do?find_number=${list.find_number}">${list.find_title}</a></td>
							<td width="10%">${list.member_id}</td>
							<td width="17%">${list.find_regdate}</td>
							<td width="10%">${list.find_hit}</td>
						</tr>
					</c:forEach>
						<tr><!-- 링크문자열  -->
							<td align="center" colspan="5">${pagingHtml}</td>
						</tr>
				</table>
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
    
</script>

</body>
</html>