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
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_orderProblem.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_picCommon.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- [if lt IE 9] -->
	<script src="assets/bootstrap/js/html5shiv.js"></script>
	<script src="assets/bootstrap/js/respond.min.js"></script>

	<!-- 웹폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet">

    <title>문의하기</title>
</head>
<body>

	<div id="container">

		<!-- 헤더영역 -->
		<%@ include file = "assets/inc/header.jsp" %>
		
		<div id="section" class="clearfix">
			<a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
				<span id="back"><img src="assets/img/icon/back.png" /></span>
			</a>
			<div class="title pull-left">문의하기</div>	
		</div>
		<div id="content">
            <div id="problem">
                <div id="problemTitle">
                    문의상품
                </div>
                <div class="order padding clearfix">
                    <div class="orderNumber padding">[2020-06-19] 주문번호 - P237623646186</div>
                    <div class="orderPic pull-left">
                        <img src="assets/img/clothings/4.jpg" alt="cloth" />
                    </div>
                    <div class="orderName padding pull-left">
                        상품이름
                    </div>
                    <div class="orderDesc pull-left">
                        <div id="complete" class="padding">[배송완료]</div>
                        <div class="orderMoney padding">50,000 원</div>
                    </div>
                </div>
                <form id="frm" role="form" method="post">
                	<fieldset>
                		<select id="selectBox" class="problemChoice padding">
                    		<option value="">--- 선택하세요 ---</option>
                    		<option value="exchange">교환문의</option>
                    		<option value="return">반품문의</option>
                    		<option value="else">취소문의</option>
                		</select>
                		<textarea id="textbox" rows="10" class="problemChoice" placeholder="문의 내용을 입력해주세요."></textarea>
                		<button type="submit" id="submit" class="btn btn-warning">등록</button>
                		<button value="cancel" id="cancel" class="btn btn-light" onclick="location.href='mypage_orderCheck.jsp'; return false;">취소</button>
                	</fieldset>
                </form>
            </div>
        </div>
        
        <%@ include file ="assets/inc/footer.jsp" %>
		
	</div>
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/menu.js"></script>
    <script src="assets/js/scroll.js"></script>

	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$("#content #submit").click(function(e) { //등록버튼 눌렀을 경우
    			e.preventDefault();
    			var isSelected = $("#content #selectBox option:selected").val();
    			
    			if(!isSelected) { //선택사항 없을시 예외처리
    				swal("선택사항 없음", "문의 종류를 선택해주세요.", "error").then(function(result) {
    					$("#content #selectBox").focus(); //포커스처리
    				});
    				return;
    			}else { 
    				var hasText = $("#content #textbox").val();
    				if(!hasText) { //내용 없을시 예외처리
    					swal("내용 없음", "내용을 입력해주세요.", "error").then(function(result) {
    						$("#content #textbox").focus(); //포커스처리
    					});
    					return;
    				}else if(hasText.length < 10) { //내용 10자 미만일시 예외처리
    					swal("", "내용은 10자 이상 입력해주세요.", "warning").then(function(result) {
    						$("#content #textbox").focus(); //포커스처리
    					});
    					return;
    				} //end else if
    			} //end if
    			swal("문의가 등록되었습니다.", "" ,"success").then(function(result){
    				history.back(); //등록 후 전페이지로
    			});
    		}); //end click
    	});
    </script>
</body>
</html>