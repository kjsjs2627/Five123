<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>
<html>

<head>
	<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우정게 알려준다. - ANSI(euc-kr), UTF-8 -->
	<meta charset="utf-8" />
	<!-- 스마트 장치에서의 해상도 균일화 처리 -->
	<meta name="viewport" content="width=device-width,initial-scale=1.0,    minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
	<!-- IE의 호환성 보기 모드 금지 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<!--Bootstrap -->
	<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css"/>
	<!-- Sweet Alert 플러그인 참조 -->
    <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />
    
	<!-- 외부 CSS 받아오기 -->
	<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_picCommon.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_reviewCommon.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- [if lt IE 9] -->
	<script src="assets/bootstrap/js/html5shiv.js"></script>
	<script src="assets/bootstrap/js/respond.min.js"></script>

	<!-- 웹폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet">

    <title>상품 Q&amp;A</title>
    
    <style type="text/css">
    #content input {
    	width: 80%;
    	padding: 5px 0;
    	margin: 20px 0 10px 0;
    }
    
    #content label {
    	line-height: 30px;
    	margin-top: 20px;
    	padding-left: 10px;
    }

    /*** 문의상품 버튼영역 디자인 시작 ***/
    #problem button {
    	padding: 10px 0;h
    	margin: 10px 0;
    }
    
    #problem #submit {
        width: 46%;
        margin-right: 5%;
    }

    #problem #cancel {
        width: 46%;
    }
    /*** 문의상품 버튼영역 디자인 끝 ***/
    
    </style>
</head>
<body>

	<div id="container">

		<!-- 헤더영역 -->
		<%@ include file = "assets/inc/header.jsp" %>
		
		<div id="section" class="clearfix">
			<a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
				<span id="back"><img src="assets/img/icon/back.png" /></span>
			</a>
			<div class="title pull-left">상품 Q&amp;A</div>	
		</div>
		<div id="content">
            <div id="problem">
                <div id="problemTitle">
                    상품 Q&amp;A
                </div>
                <div class="order clearfix">
                    <div class="orderPic pull-left">
                        <img src="assets/img/clothings/4.jpg" alt="cloth" />
                    </div>
                    <div class="orderName padding pull-left">
                        상품이름
                    </div>
                    <div class="orderDesc pull-left">
                        <div class="orderMoney padding">50,000 원</div>
                    </div>
                </div>
                <div id="reviewWrite">질문작성</div>
                <label> 제목: </label>
                <input id="reviewTitle" type="text" class="pull-right" placeholder="제목을 입력해주세요."/>
                <textarea id="textbox" rows="10" class="problemChoice" placeholder="질문 내용을 입력해주세요."></textarea>
                <button value="submit" id="submit" class="btn btn-warning">등록</button>
                <button value="cancel" id="cancel" class="btn btn-light" onclick="location.href='main_productDetails.jsp'; return false;">취소</button>
            </div>
        </div>
        
        <%@ include file ="assets/inc/footer.jsp" %>
		
	</div>
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/menu.js"></script>
    <script src="js/scroll.js"></script>

	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$("#content #submit").click(function(e) { //등록버튼 클릭했을경우
    			e.preventDefault();
    			var hasTitle = $("#content #reviewTitle").val();
    			
    			if(!hasTitle) { //제목 안적어줬을시 예외처리
    				swal("제목 없음", "제목을 입력해주세요.", "error").then(function(result) {
    					$("#content #reviewTitle").focus(); //포커스처리
    				});
    				return;
    			}else {
    				var hasText = $("#content #textbox").val();
    				if(!hasText) { //내용 안적어줬을시 예외처리
    					swal("내용 없음", "내용을 입력해주세요.", "error").then(function(result) {
    						$("#content #textbox").focus(); //포커스처리
    					});
    					return;
    				}else if(hasText.length < 10) { //10자보다 미만일시 예외처리
    					swal("", "내용은 10자 이상 입력해주세요.", "warning").then(function(result) {
    						$("#content #textbox").focus(); //포커스처리
    					});
    					return;
    				} //end else if
    			} //end if~else
    			
    			swal("질문이 등록되었습니다.", "" ,"success").then(function(result){
    				history.back(); //등록후 전페이지로
    			});
    		});
    	});
    </script>
</body>
</html>