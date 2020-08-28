<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!doctype html>
<html>

<!-- 페이지 설정 부분 -->

<head>
<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우정게 알려준다. - ANSI(euc-kr), UTF-8 -->
<meta charset="utf-8" />
<!-- 스마트 장치에서의 해상도 균일화 처리 -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,    minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!--Bootstrap -->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"
	media="screen">
<!-- 슬라이드 플러그인 CSS 참조 -->
<link rel="stylesheet"
	href="assets/plugins/superslides/stylesheets/superslides.css">
<!-- 외부 CSS 받아오기 -->
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
<link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
<link rel="stylesheet" type="text/css" href="assets/css/orderSearchN.css" />
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />

<!-- 웹폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap"
	rel="stylesheet">

<!-- 브라우저에 표시될 문서 제목 -->
<title>결제완료</title>
<style type="text/css">
#section .title {
	margin-left: 86px;
}

</style>
</head>
<!-- 브라우저에 보여질 부분 -->

<body>
	<div id="container">
		<!-- 헤더 영역-->
		<%@ include file="assets/inc/header.jsp"%>
		<div id="section" class="clearfix">
			<!-- <div class="back pull-left">
				<a href="#" onclick="history.go(-1); return false;"> <span id="back"><img src="img/icon/back.png" /></span></a>
			</div>	 -->
			<div class="title pull-left">결제완료</div>
		</div>
		<div id="content">
			<div id="payFirst">
				<input id="payDate" class="payInput" type="text"
					value="[2020-06-19]" disabled="disabled" /> <label>주문번호
					-&nbsp;</label><input id="payNum" type="text" class="payInput"
					value="P237623646186" disabled="disabled" />
			</div>
			<!-- <div class="payDiv">
				<div class="pull-left" id="payI">
					<span class="payImg"><img
						src="assets/img/bottom/bottom5.jpg" alt="이미지1" /></span>
				</div>
				<div id="payDetail" class="pull-left">
					<input class="payInput" type="text" value="제품이름" /> <input
						class="payInput" type="text" value="50,000" /><label id="payWon">원</label>
				</div>
			</div> -->
			<div class="clearfix"></div>

			<form id="basketForm">
				<div id="basketProduct" class="basketProduct clearfix">
					<span onclick="location.href='main_productDetails.jsp'" id="imgBox"
						class="pull-left"><img src="assets/img/dress/dress1.gif" /></span>
					<div id="clothesName" class="pull-left">
						<input type="text" value="하늘하늘원피스" disabled="disabled" /> 
					</div>
					<div id="basketColor" class="pull-right clearfix">
						<input class="pull-left" type="text" value="[Indian pink]"
							disabled="disabled" />
					</div>
					<div id="basketNum" class="pull-left">
					<input type="text" value="2개" />
						<label
							class="won pull-right">원</label><input type="text"
							class="num pull-right" value="70000" disabled="disabled" />
					</div>
				</div>
			</form>
			<div id="payCheck"></div>

		</div>
		<!-- 하단 영역 -->
		<%@ include file="assets/inc/footer.jsp"%>
	</div>

	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<!-- Include all compiled plugins  (below), or include individual files as needed -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/menu.js"></script>
	<script type="text/javascript">
		
	</script>
</body>

</html>