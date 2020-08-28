<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css" /> 
	
	<link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />	
	
    <!-- 외부 CSS 받아오기 -->
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css"/>
	
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet"/>

    <title>main_article</title>
    <style type="text/css">
    body #content { 
 		padding-top: 170px; 
 		width:100%;
 		padding-left: 25px;
 		padding-right: 25px;
	}
	#out_result{
		width: 100%;
		margin-bottom: 30px;
		height: 30px;
	}
	.out_btn{
		margin: 30px 0;
	}
	.btn-out{
		width: 45%;
	}
	.btn-cancel{
		width:45%;
	}
    </style>
    
</head>

<body>
    <div id="container">
        <!-- 헤더영역 -->
		<%@ include file='assets/inc/header.jsp' %>
	<div id="section" class="clearfix">
    	<a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
        	<span id="back"><img src="assets/img/icon/back.png" /></span>
	    </a>
       	<div class="title pull-left">회원탈퇴</div>
    </div>
		
		
 		<!-- 내용영역 -->
    	<div id="content">
    		<form name = "form_info" method="post" id="out_form">
    			<fieldset>
      				<div>
                   		<select name="outResult" id="out_result" required="required" class="dropdown">
                        	<option value="0">--- 탈퇴사유를 선택해 주세요. ---</option>
                    	   	<option value="1">이용빈도 낮음</option>
                        	<option value="2">가격 불만</option>
                        	<option value="3">기타</option>
                    	</select>
      					<div class="out_content">
      						<textarea rows="15" name="user_content" id="user_content" class="form-control" placeholder="내용을 입력하세요." ></textarea>
      					</div>
      					<div class="out_btn clearfix">
      						<button type="submit" class="btn btn-warning pull-left btn-out">탈퇴</button>
      						<button type="button" class="btn btn-light pull-right btn-cancel" onclick="location.href='${pageContext.request.contextPath}/mypage.do'">취소</button>
      					</div>
      				</div>
      			</fieldset>
        	</form>
  		</div>
		<%@ include file='assets/inc/footer.jsp' %>
    </div>
    
	<script src="assets/bootstrap/js/jquery.min.js"></script>
    
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/menu.js"></script>
    <script src="assets/js/scroll.js"></script>
    <script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>	
    
	<script type="text/javascript">
		$(function(){
			$('#out_form').submit(function(e){
				e.preventDefault();
				var check = $('#out_result').val();
				if(check==0){
					swal({ // <-- 메시지 표시
						title : '에러',
						type : 'error',
						text : "탈퇴사유를 입력해주세요."
						
					});
				}
				else{
					swal({ // <-- 메시지 표시
						title : '확인',
						type : 'warning',
						text : "정말 탈퇴 하시겠습니까?",
						confirmButtonText: 'Yes',
						showCancelButton:true,
						cancelButtonText: 'No',
						
					}).then(function(result){
						if(result.value){
							swal({
								title :'탈퇴',
								type :'success',
								text : '저희 쇼핑몰을 이용해 주셔서 감사했습니다.'
							
							}).then(function(){
								
								location.href='${pageContext.request.contextPath}/index.do';
								
							});
						}else if(result.dismiss==='cancel'){
							swal('취소', '탈퇴가 취소되었습니다.', 'error');
						}
					});
				}
			});
		
		});
	</script>
</body>

</html>