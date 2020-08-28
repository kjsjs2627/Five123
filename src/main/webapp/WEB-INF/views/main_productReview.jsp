<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("review");
	
	if(title == null || title.equals("")){
		String script="<script>";
		script += "alert('값이 없습니다.');";
		script += "history.back();";
		script += "</script>";
		
		out.print(script);
		return; //현재 페이지 강제 종료
	}
	if(title.equals("상품QNA")){
		title="상품Q&A";
	}
	System.out.println(title);
%>
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

	<!-- 외부 CSS 받아오기 -->
	<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_picCommon.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_myWriteCommon.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- [if lt IE 9] -->
	<script src="assets/bootstrap/js/html5shiv.js"></script>
	<script src="assets/bootstrap/js/respond.min.js"></script>

	<!-- 웹폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet">

    <title>상품후기</title>
    
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style type="text/css">
    	/* 후기이미지 */
    	#content #problemIs span {
    		width: 100%;
    		display: block;
    		padding: 20px 40px;
    	}
    	
    	#content #problemIs {
    		line-height: 30px;
    	}
    	
    	#content #problemIs span img {
    		margin: auto;
    		width: 100%;
    	}
    	
    	.order button {
    		display: none;
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
			<div class="title pull-left"><%=title %></div>	
		</div>
		<div id="content">
        
        	<div class="order clearfix">
                    <div class="orderPic pull-left">
                        <img src="assets/img/clothings/4.jpg" alt="cloth" />
                    </div>
                    <div class="orderName padding pull-left">
                        상품이름
                    </div>
                    <button value="수정" id="update" class="btn btn-light" onclick="location.href='mypage_myWriteReviewUpdate.jsp'; return false;">수정</button>
            </div>
            <div id="problemTitle">
            	친구들이 다 어디서 샀냐고 물어봐요.
            </div>
            
            <div id="problemIs">
            	<span>
            		<img src="assets/img/clothings/4.jpg" alt="reviewCloth" />
            	</span>
            	진짜 너무너무 마음에 들어요. 요새 맨날 이거만 입고 입을때마다 기분좋아요. 모두들 사세요!! 후회안합니다.
            </div>
        </div>
        
        <%@ include file ="assets/inc/footer.jsp" %>
		
	</div>
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/menu.js"></script>
    <script src="assets/js/scroll.js"></script>
</body>
</html>