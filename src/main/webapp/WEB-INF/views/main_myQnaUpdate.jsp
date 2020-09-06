<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우정게 알려준다. - ANSI(euc-kr), UTF-8 -->
    <meta charset="utf-8" />
    <!-- 스마트 장치에서의 해상도 균일화 처리 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,    minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
    <!-- IE의 호환성 보기 모드 금지 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <!-- Bootstrap -->
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css" />
    <script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>

    <!-- 외부 CSS 받아오기 -->
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/main_myQnaUpdate.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
     <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" /> 

    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet"/>

    <title>main_myQnaUpdate</title>
<style type="text/css">
    	.container {
   				margin: 0;
    			padding: 0;
    			width: 100%;
   		 }
	</style>
</head>
<body>
<!-- reset 안먹힘  -->
   <div class="container">
		<!-- 헤더 영역-->
		<%@ include file = "assets/inc/header.jsp" %>
		<div id="section" class="clearfix">
         <a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
            <span id="back"><img src="assets/img/icon/back.png" /></span>
         </a>
         <div class="title pull-left">Q&amp;A</div>   
      </div>
 	<!-- 내용영역 -->
    <div id="content">
      	<form method="post" action="${pageContext.request.contextPath}/main_myQnaUpdate_ok.do" id="myqna_form">
        		<% /* action 페이지에서 사용할 WHERE 조건값을 hidden 필드로 숨겨서 전송한다. */ %>
        		<input type="hidden" name="qna_no" value="${output.qna_no}" />
        		<div id="user_title" class="clearfix">
            		<label for="qna_title" class="qna_w_title pull-left">제목</label>
            		<input type="text" name="qna_title" id="qna_title" class="pull-left" value="${output.qna_title}" />
        		</div>
        		<div id="qna_w_content">
            		<label for="qna_content"></label>
            		<textarea name="qna_content" id="qna_content" value="${output.qna_content}" rows=10></textarea>
        		</div>
        				<label for="user_no"></label>
      					<input type="hidden" id="user_no" name="user_no" value="${output.user_no}" />
        				<label for="qna_reg_date"></label>
      					<input type="hidden" id="qna_reg_date" name="qna_reg_date" value="${output.qna_reg_date}" />
      					<label for="qna_edit_date"></label>
      					<input type="hidden" id="qna_edit_date" name="qna_edit_date" value="${output.qna_edit_date}" />
      					<label for="qna_hit"></label>
      					<input type="hidden" id="qna_hit" name="qna_hit" value="${output.qna_hit}" />  
        		<div id="btn">
        			<button type="submit" class="btn btn-warning">수정</button>
        			<button type="button" class="btn btn-light" id="cancel" onclick="history.go(-1); return false;">취소</button>
      				<a href="${pageContext.request.contextPath}/delete_ok.do?qna_no=${output.qna_no}" id="#delete" class="btn btn-danger">삭제</a>
      			</div>
      	</form>
   </div>
<!-- 하단 영역 -->
		<%@ include file = "assets/inc/footer.jsp" %>
		</div>
    	<script src="assets/js/menu.js"></script>
    <script src="assets/js/scroll.js"></script>
    <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script src="assets/plugins/validate/jquery.validate.min.js"></script>
    <script src="assets/plugins/validate/additional-methods.min.js"></script>
<!--     <script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script> -->
    <script type="text/javascript">   
    $(function() {  	
			$('#delete').click(function(e){
				e.preventDefault();
    			swal({
    				title: "삭제 확인",
    				text: "정말 후기를 삭제하시겠습니까?",
    				type: "warning",
    				confirmButtonText: "삭제", //삭제확인버튼 표시 문구
    				showCancelButton: true, //취소버튼 표시 여부
    				cancelButtonText: "취소" //취소버튼 표시 문구
    			}).then(function(result) { //버튼이 눌러졋을 경우의 콜백 연결
    				if(result.value) { //삭제확인 버튼이 눌러졌을 경우
    					swal("삭제", "성공적으로 삭제되었습니다.", "success").then(function(result) {
    				        	window.location = 'main_qnaList.do';
    				    });
    				} else {
    					swal("취소", "삭제가 취소되었습니다.", "warning");
    				}
    			});
			});

	    		$("#content #update").click(function(e) {
	    			e.preventDefault();
	    			var hasText = $("#content #qna_title").val();
	    			if(!hasText) {
	    				swal("제목", "제목을 입력해주세요.", "error").then(function(result) {
	    					$("#content #qna_title").focus();
	    				});
	    				return;
	    			}else if(hasText.length < 4) {
	    				swal("", "제목은 4글자 이상 입력해주세요.", "warning").then(function(result) {
	    					$("#content #qna_title").focus();
	    				});
	    				return;
	    			}else {
	    				var hasContent = $("#content #qna_content").val();
	    				if(!hasContent) {
	    					swal("내용", "내용을 입력해주세요.", "error").then(function(result) {
	    						$("#content #qna_content").focus();
	    					});
	    					return;
	    				}else if(hasContent.length < 10) {
		    				swal("", "내용은 10글자 이상 입력해주세요.", "warning").then(function(result) {
		    					$("#content #qna_title").focus();
		    				});
		    				return;
	    				}
	    			}
	    			
	    			swal("문의가 수정되었습니다.", "" ,"success");
	    		});
	    	
			
		});
    </script>
	
	
</body>

</html>