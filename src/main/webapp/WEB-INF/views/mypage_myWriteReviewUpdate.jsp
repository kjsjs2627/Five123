<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	
	<!-- Sweet Alert 플러그인 CSS 참조 -->
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

    <title>내가 쓴 후기수정</title>
    
    <style type="text/css">
    
    /* 주문 배송상태 디자인 */
    .order .orderDesc #complete {
        color: #3FBC75;
        font-weight: bold;
    }
    
    /* 사진첨부 영역 */
    #content #upload {
    	margin: 20px 0;
    	padding: 20px 0;
    	border-top: 2px solid #ccc;
    	border-bottom: 2px solid #ccc;
    }
    
    #content #upload span {
    	line-height: 20px;
    	margin-right: 10px;
    }
    
    #content #upload input {
    	font-size: 13px;
    }
    
    /*** 문의상품 버튼영역 디자인 시작 ***/
    #problem button {
    	padding: 10px 0;
    	margin: 10px 0;
    }
    
    #problem #submit {
        width: 30%;
        margin-right: 2%;
    }
    
    #problem #cancel {
    	width: 30%;
    	margin-right: 2%;
    }

    #problem #delete {
        width: 30%;
    }
    /*** 문의상품 버튼영역 디자인 끝 ***/
    
    #content .bold {
    	font-weight: bold;
    }
    
    #content form p {
    	padding-top: 5px;
    	line-height: 20px;
    	font-size: 12px;
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
			<div class="title pull-left">후기수정</div>	
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
                <form method="post" action="${pageContext.request.contextPath }/mypage_myWriteReviewUpdate_edit.do">
                	<% /* action 페이지에서 사용할 WHERE 조건값을 hidden 필드로 숨겨서 전송한다. */ %>
                	<input type="hidden" name="reviewNo" value="${output.product_review_no }" />
                	<span>&nbsp; 제목: </span> 
                	<input type="text" name="title" class="reviewTitle pull-right" value="${output.product_review_title }" placeholder="후기제목을 써주세요."/>
                	<textarea id="textbox" name="content" class="problemChoice" value="${output.product_review_content }" rows="10" placeholder="상세한 후기를 써주세요."></textarea>
                	<div id="upload" class="clearfix">
                		<span class="bold pull-left">사진첨부</span>
                		<input type="file" id="file" class="pull-left"/>
                	</div>
                	<span class="bold">리뷰 작성 전 확인해주세요!</span>
                	<p>
                	1. 포토 리뷰 작성: <span class="bold text-danger">500원</span>/텍스트 리뷰 작성: <span class="bold text-danger">100원</span> <br/>
                	2. 등록된 리뷰는 <span class="bold">한달 후에 삭제</span> 가능합니다. <br/>
                	3. 동일 상품에 대해 포인트 지급은 <span class="bold">1회</span>로 한정 됩니다. <br/>
                	</p>
                	<button type="submit" id="submit" class="btn btn-warning">수정</button>
                	<button value="cancel" id="cancel" class="btn btn-light" onclick="location.href='mypage_myWriteReview.do'; return false;">취소</button>
                	<button type="button" id="delete" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/mypage_myWriteReviewUpdate_delete.do?reviewNo=${output.product_review_no }'; return false;">삭제</button>
                	
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