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




<!-- 외부 CSS 받아오기 -->
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assets/css/menu.css"/>
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css"/>


<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap"
	rel="stylesheet" />


<title>withFiveBird</title>

<style type="text/css">
/** 검색창 부분 */
/* 수정 : padding-top값 줌 안하면 맨위에 있어서 */
div.container{
	margin:0;
	padding:0;
	width:100%;
}
body #content { 
 	padding-top: 130px; 
 	text-align: center; 
 	width:100%;
 	padding-left: 25px;
 	padding-right: 25px;
 }
    
.joinsuccess{
	font-size: 40px;
	font-weight: bold;
	padding-top : 20px;
}


.successp{
	height: 100px;
	font-size: 23px;
	margin: 0 25px;
}
.btn{
	margin: 30px 0;
	width: 100%;	
	font-size: 20px;
	color:#07031A;
	font-weight: bold;
}
#ok{
	font-size: 18px;
}
#section a{
	height: 62px;
}
</style>
</head>

<body>
	<div class="container">
		<!-- 헤더 영역-->
		<%@ include file="assets/inc/header.jsp" %>	
		<div id="section" class="clearfix">
		</div>
		<div id="content">
			<div class="joinsuccess">
				환영합니다!!!
			</div>
			<br/>		
			<div class="successp">
				<p>회원가입을 축하합니다!!!</p>
				<br/><br/>			
				<p id="ok">회원가입한 아이디로 로그인 해주세요.</p>
			</div>
			<button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/info_login.do'">로그인 하기</button>
		</div>
		
		<%@ include file="assets/inc/footer.jsp" %>
		

	</div>
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/scroll.js"></script>
	<script src="assets/js/menu.js"></script>
	<!-- 사용자 정의 스크립트 -->


</body>

</html>