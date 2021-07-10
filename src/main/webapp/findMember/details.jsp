<%@page import="org.springframework.web.context.request.RequestScope"%>
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
		    <div class="headline"><h2>멤버구하기</h2></div>
	    </div>
	    
	    <div class="row">
	    	<div class="col-md-10 col-md-offset-1">
				<table class="table" style="text-align: center;">
					<thead > 
						<tr class="active">
								<th colspan="3"	style="background-color: #eeeeee; text-align: center;"><font color="black" size="5pt">멤버구하기 보기</font></th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td style="width: 20%;"><font color="black" size="3pt">글제목</font></td>
							<td colspan="2"><font color="black" size="3pt">${find.find_title}</font></td>
						</tr>
						
						<tr>
							<td><font color="black" size="3pt">작성자</font></td>	
							<td colspan="2"><font color="black" size="3pt">${find.member_id}</font></td>
						</tr>
						
						<tr>
							<td><font color="black" size="3pt">작성일</font></td>	
							<td colspan="2"><font color="black" size="3pt">${find.find_regdate}</font></td>
						</tr>
						
						<tr>
							<td><font color="black" size="3pt">내용</font></td>	
							<td colspan="2" style="min-height: 200px; text-align: left;"><p style="white-space: pre-line;"><font color="black" size="3pt">${find.find_content}</font></p></td>
						</tr>
					</tbody>
				</table>
				
				<div class="col-md-2 col-md-offset-6">
					<input type="button" class="btn-u btn-block btn-u-green" value="목록" onclick="location.href='${pageContext.request.contextPath}/findMember/list.do' ">   	
				</div>
				
				<c:if test="${sessionScope.loginUser.member_id==find.member_id}">
					<div class="col-md-2">
						<input type="button" class="btn-u btn-block btn-u-green" value="수정" onclick="location.href='${pageContext.request.contextPath}/findMember/update.do?find_number=${find.find_number}' ">
					</div>		
					<div class="col-md-2">
						<input type="button" class="btn-u btn-block btn-u-green" value="삭제" onclick="del(${find.find_number})">
					</div>
				</c:if>
				
				<!-- 간격넓히기 -->
				<div class="margin-bottom-40"></div>
				<hr>
				
				<!-- 댓글 시작 --> 
	            <div id="accordion-v4" class="panel-group acc-v1">
	            	<div class="panel panel-default">
	                	<div class="panel-heading">
	                    	<h4 class="panel-title">
	                        	<a href="#collapse-v6-One" data-parent="#accordion-v6" data-toggle="collapse" class="accordion-toggle">댓글 [ ${count} ]</a>
	                        </h4>
	                    </div>
												                                    
	                    <div class="panel-collapse collapse in" id="collapse-v6-One">
	                  	  <div class="panel-body">
	                   		 				
			                 <!-- 레코드가 없다면 -->
							 <c:if test="${count==0}">
							     <div class="row-v4">
									 <h4>게시글에 작성된 댓글이 없습니다.</h4>
								 </div>
							 </c:if>
							                   		 											                                         
							 <div class="row-v4">
							 	<div class="col-md-pull pull-left">             
									<c:forEach var="replyList" items="${replyList}">
										<div class="row">
									    	<div class="col-sm-2">
									        	<img class="img-responsive rounded-x" src="${pageContext.request.contextPath}/assets/img/team/logo.png" >
									        </div>
									   		<div class="col-sm-10">
									        	<blockquote>
									            	<div class="row">
										            	<div class="col-md-2">
											            	<h2 style="font-weight: bolder;">${replyList.member_id}</h2>
											            </div>	
											            <c:if test="${sessionScope.loginUser.member_id==replyList.member_id}">	
												            <div class="col-md-1 col-md-offset-9">
																<input type="button" class="btn pull-right btn-success" value="삭제" onclick="replyDel(${replyList.find_reply_number})">
												            </div>	
											            </c:if>				                                     
										            </div>
									                <p>${replyList.find_reply_content}</p>
									                <h6 style="font-weight: lighter;">${replyList.find_reply_regdate}</h6>
									         	</blockquote> 
									         </div>
									     </div>
									     <hr>
								     </c:forEach>
								 </div>
							   </div>
	                         </div>
	                       </div>
	                 </div>
	            </div>
				<!-- 6 --> 
	                        
				<!-- 간격넓히기 -->
				<div class="margin-bottom-40"></div>
				
				<!-- 댓글 작성하기 -->
				<form id="replyWriteForm" name="replyWriteForm" method="post" action="findMember/replyWrite.do">
					<div>
						<table class="table">                    
		                    <tr>
		                        <td>
									<textarea id="find_reply_content" name="find_reply_content" class="form-control" rows="3" placeholder="댓글을 작성하세요"></textarea>      
		                            <br>
		                            <div>
		                            	<input type="hidden" name="find_number" value="${find.find_number}">
		                            	<input type="hidden" name="member_id" value="${sessionScope.loginUser.member_id}">
		                            	<input type="button" onclick="replyForm()" class="btn pull-right btn-success" type="button" value="등록">
		                            </div>
		                        </td>
		                    </tr>
		                </table>
	                </div>
	             </form>
	                
				<div class="margin-bottom-20"></div>

				<!-- 댓글 끝 -->
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
    
	function del(find_number) {
		var chk = confirm("삭제되면 복구할 수 없습니다. 정말 삭제 하시겠습니까?");
		if (chk) {
			location.href='${pageContext.request.contextPath}/findMember/delete.do?find_number='+find_number;
		}
	}
	
    function replyForm(){
    	var find_reply_content = $("#find_reply_content").val();

    	if(!find_reply_content){
    		alert("댓글 내용을 입력해주세요");
    		$("#find_reply_content").focus();
    	}else {
    		replyWrite()
    	}
    }
    
    function replyWrite(){
    	$.ajax({		
    		url : "${pageContext.request.contextPath}/findMember/replyWrite.do",
    		type:'POST',
    		data :  $("#replyWriteForm").serialize(),
    		success:function(data){
    			if(data == "success"){
    				alert("댓글이 등록됐습니다.^^");
    				location.href = "${pageContext.request.contextPath}/findMember/details.do?find_number=${find.find_number}"
    			} else if(data == "fail"){
    				alert("로그인 후 댓글 등록 부탁드립니다 ^^");
    				location.href = "${pageContext.request.contextPath}/user/login.do";
    			}
    		}
    	})
    }
	
	function replyDel(find_reply_number) {
		var chk = confirm("삭제되면 복구할 수 없습니다. 정말 삭제 하시겠습니까??");
		if (chk) {
			location.href='${pageContext.request.contextPath}/findMember/replyDelete.do?find_number=${find.find_number}&find_reply_number='+find_reply_number;
		}
	}
	
</script>

<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>