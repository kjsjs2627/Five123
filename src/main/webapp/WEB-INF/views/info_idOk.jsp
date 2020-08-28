<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 설정 부분 -->

<head>
<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우정게 알려준다. - ANSI(euc-kr), UTF-8 -->
<meta charset="utf-8" />
<!-- 스마트 장치에서의 해상도 균일화 처리 -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,    minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap"
	rel="stylesheet" />

<!-- bootstrap -->
   <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css"/>

<!-- ajax helper -->

<!-- 외부 CSS 받아오기 -->
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />



<style type="text/css">

body #content {
	padding: 150px 25px 0 25px;
	
}
.id-search{
	font-size:18px;
	margin: 50px 0;
	text-align: center;
	height: 80px;
}
.login-back{
	width: 100%;
	margin: 50px 0;
	height : 40px;
	font-size: 20px;
}

</style>

<!-- 브라우저에 표시될 문서 제목 -->
<title>아이디 찾기</title>
</head>
<body>
<div id="container">
	<%@ include file="assets/inc/header.jsp" %>
	<div id="section" class="clearfix">
   
    </div>
	<div id="content">
		<div class="id-search">회원가입시 사용한 아이디는 ...입니다.</div>
		<button type="button" class="login-back btn btn-warning" onclick="location.href='info_login.jsp'">로그인 하기</button>
	</div>
	<%@ include file="assets/inc/footer.jsp" %>
</div>	

	
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/scrool.js"></script>
	

	<script type="text/javascript">
	
	</script>
</body>
</html>