<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css"/>
	
    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap-theme.css" />

    <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />
	
    <!-- 외부 CSS 받아오기 -->
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_myCoupon.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
     <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />

    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet"/>
   

    <title>mypage_myCoupon</title>
    
    <style type="text/css">
    	.container {
   				margin: 0;
    			padding: 0;
    			width: 100%;
   		 }
	</style>
</head>
<body>
    <div class="container">
		<!-- 헤더 영역-->
		<%@ include file = "assets/inc/header.jsp" %>
		<div id="section" class="clearfix">
         	<a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
            	<span id="back"><img src="assets/img/icon/back.png" /></span>
         	</a>
         	<div class="title pull-left">쿠폰</div>   
        </div>
		<!-- 내용 영역 -->
    <div id="content">
        <div id="coupon">
            <p id="num">쿠폰인증번호 등록하기</p><br />
            <form id="coupon_form" method="post" name="coupon_form">
            	<input type="text" name="user_coupon" id="user_coupon" placeholder=" purplerose"/>
            	<button type="submit" id="ok" class="ok btn btn-warning" >인증</button>
            	
            	<div id="result"></div>
            </form>
            <div id="notice">
            	<span class="warning clearfix">
            		<img class="img_warning pull-left" src="assets/img/icon/warning.png" alt="경고"/>
                  	10~35자 일련번호 "_" 제외 
                </span>
                <span class="notice">쇼핑몰에서 발행한 쿠폰번호만 입력해주세요.</span>          	 	
            </div> 
        </div>
        <div id="my_coupon">
            <div class="coupon_list clearfix">
            	<p class="my_coupon_list pull-left">마이쿠폰 목록</p>
            </div>
            <div id="my_coupon_list">
            	<div id="bin">사용가능한 쿠폰이 없습니다.</div>      	
            	<ul class="mycoupon">
            		
                </ul>
                <div id="bin_a"></div>
            </div>            
       </div>
   </div>
		<!-- 하단 영역 -->
		<%@ include file = "assets/inc/footer.jsp" %>
	</div>
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/scroll.js"></script>
	<script src="assets/js/pagination.js"></script>
	
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

   <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script type="text/javascript">
	$(function() {
        $("#ok").click(function(e) {
           e.preventDefault();
           var userCoupon = $("#user_coupon").val();
           
           var coupon_img = "";
           	coupon_img += "<li>";
			coupon_img += "<span class='user_date'>[2020-07-17 ~ 2020-07-23]</span>";
			coupon_img += '<div class="coupon_img clearfix">'; 
			coupon_img += '<img class="img pull-left" src="assets/img/icon/coupon_icon.png"></span>'; 
			coupon_img += '<span class="coupon_detail pull-left">[회원쿠폰] 10,000원 할인</span>'; 
			coupon_img += '<span class="coupon_up pull-left">20,000원 이상 구매 시 사용가능</span>'; 
			coupon_img += '</div>'; 
			coupon_img += '</li>';
			 
		   var coupon_bin = "";
		   	coupon_bin += "<div class='bin_aa'></bin>";
			      	   
           if(!userCoupon) {
              swal("에러", "쿠폰번호를 입력해주세요.", "error").then(function(result) {
                 $("#user_coupon").focus();
              });
              return;
           }else if (userCoupon == "purplerose"){
        	   swal("확인", "쿠폰이 등록되었습니다.", "success").then(function(result) {
        		   $("#bin").remove();
        		   $(".mycoupon").append(coupon_img);
        		   $("#bin_a").append(coupon_bin);
        		   $("#user_coupon").val("");
				   $("#user_coupon").focus();
                });
           } else {
        	   swal("에러", "잘못된  쿠폰번호입니다.", "error");
           } 
        });
     });
		</script>
</body>

</html>