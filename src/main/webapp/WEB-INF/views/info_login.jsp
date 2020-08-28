<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css" href="assets/css/info_login.css">
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />    

    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet">
      
    <!-- ajax-helper -->
	<link rel="stylesheet" href="assets/plugins/ajax/ajax_helper.css" />
	<script src="assets/plugins/ajax/ajax_helper.js"></script>
	
	<!-- ajaxform -->
	<script src="assets/plugins/ajax-form/jquery.form.min.js"></script>
	<script src="assets/plugins/validate/jquery.validate.min.js"></script>
    <title>info_login</title>
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
         	<div class="title pull-left">로그인</div>   
        </div>
    <!-- 내용 영역 -->
    <div id="content">
        <form id="login-form" class="form-inline" method="post" action="api/login_ok.do">
            <input type="text" name="user_id" id="user_id" class="form-control" placeholder="   아이디" />
            <input type="password" name="user_pw" id="user_pw" class="form-control" placeholder="   비밀번호" />           

            <div class="thumb clearfix">
            	<p class="thumb pull-right">보안접속</p>
            	<img src="assets/img/icon/lock_icon.png"  alt="보안접속" class="thumb pull-right">          	
            </div>
            
            <button type="submit" class="btn btn-warning" id="btn_login">로그인</button>
            <button type="button" onclick="location.href='${pageContext.request.contextPath}/info_loginNo.do'" id="btn_N" class="btn btn-light">비회원</button>
            
            <!-- 결과를 출력하기 위한 HTML -->
            <div id="result"></div>
        </form>
        
        <div id="notice_show">
        	<p id=notice>
            	!회원이 되시면 다양한 혜택이 있습니다.<br/>
            	!아직도 회원이 아니시라면 지금 바로 가입하세요
        	</p>
        </div>
        
        <div id="find">
            <button type="button" class="join btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/info_join.do'">회원가입 ></button>
            <button type="button" class="ids btn btn-light" onclick="location.href='${pageContext.request.contextPath}/info_idSearch.do'">아이디찾기 ></button>
            <button type="button" class="pws btn btn-light" onclick="location.href='${pageContext.request.contextPath}/info_pwSearch.do'">비밀번호 찾기 ></button>
        </div>
    </div>
    
		<!-- 하단 영역 -->
		<%@ include file = "assets/inc/footer.jsp" %>
		</div>
    	<script src="assets/js/menu.js"></script>
    	<script src="assets/js/scroll.js"></script>
	<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
  <script type="text/javascript">	
	$(function() {
		$("#login-form").validate({
			onkeyup: false,
			onclick: false,
			onfocusout: false,
			showErrors: function(errorMap, errorList) {
				if (errorList.length < 1) {
					return;
				}
				swal(errorList[0].message); return false;
			},
			// 검사규칙 정의
			rules: {
				user_id: "required",
				user_pw: "required"
			},
			// 검사 조건을 충족하지 않을 경우의 메시지 내용
			messages: {
				user_id: "아이디를 입력하세요.", 
				user_pw: "비밀번호를 입력하세요."
			}
		});
		$("#login-form").ajaxForm({
			// submit 전에 호출된다.
			beforeSubmit: function (arr, form, options) {
				return $(form).valid();
			},
			success: function(json) {
				if (json.result == "FAIL") {
					swal("", "아이디나 비밀번호를 확인하세요.", "error");
					return false;
				}
				
				swal("", "로그인 되셨습니다.", "success").then(function(json) {
					history.back();
				});
				
			}
		}); //end ajaxForm
	});
</script>  

</body>

</html>
