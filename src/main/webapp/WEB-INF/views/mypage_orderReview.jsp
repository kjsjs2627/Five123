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

    <title>후기작성</title>
    <style type="text/css">
    
    /* 주문 배송상태 디자인 */
    .order .orderDesc #complete {
        color: #3FBC75;
        font-weight: bold;
    }
    
    /*** 문의상품 버튼영역 디자인 시작 ***/
    #problem button {
    	padding: 10px 0;
    	margin: 10px 0;
    }
    
    #problem #submit {
        width: 46%;
        margin-right: 5%;
    }

    #problem #cancel {
        width: 46%;
    }
    
    #problem form {
    	border-top: 1px solid #ccc;
    	padding: 10px 0;
    }
    
    #problem form span {
    	line-height: 40px;
    }
    
    #problem .reviewTitle {
    	width: 80%;
    	margin: 10px 0;
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
			<div class="title pull-left">후기작성</div>	
		</div>
		<div id="content">
            <div id="problem">
                <div id="problemTitle">
                    상품후기
                </div>
                <div class="order clearfix">
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
                <div id="reviewWrite">후기쓰기</div>
                <form method="post" action="${pageContext.request.contextPath }/mypage_orderReview_add.do">
                	<span>&nbsp; 제목: </span> 
                	<input type="text" name="title" class="reviewTitle pull-right" placeholder="후기제목을 써주세요."/>
                	<textarea id="textbox" name="textbox" rows="10" class="problemChoice" placeholder="상세한 후기를 써주세요."></textarea>
                	<button type="submit" id="submit" class="btn btn-warning">등록</button>
                	<button value="cancel" id="cancel" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/mypage_orderCheck.do'; return false;">취소</button>
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
		
	});
    </script>
</body>
</html>