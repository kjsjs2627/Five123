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

    <!-- Bootstrap -->
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css" />
    <script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>

    <!-- 외부 CSS 받아오기 -->
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/main_myQna.css" />

    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet"/>

    <title>main_myQna</title>
<style type="text/css">
    	.container {
   				margin: 0;
    			padding: 0;
    			width: 100%;
   		 }
	</style>
</head>
<body>
<!-- reset 안먹힘  -->
   <div class="container">
		<!-- 헤더 영역-->
		<%@ include file = "assets/inc/header.jsp" %>
		<div id="section" class="clearfix">
         <a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
            <span id="back"><img src="assets/img/icon/back.png" /></span>
         </a>
         <div class="title pull-left">Q&amp;A</div>   
      </div>
		<!-- 내용영역 -->
    <div id="content">
			<form name="qna_form" method="post" id="qna_form">
    		<fieldset>
    		<div id="myQna">
    			<div id="qna">
		            <div class="qna_top clearfix">
						<div class="qna_title pull-left">플라워원피스 재입고 궁금해요</div>
						<div class="update_top pull-right">
							<input type="button" class="update btn btn-danger pull-right" onclick="location.href='${pageContext.request.contextPath}/main_myQnaUpdate.do'" value="수정">
						</div>
					</div>
					<div class="qna_ndc clearfix">
						<span class="qna_name pull-left" title="작성자">안이제 </span>				
						<span class="qna_date pull-left" title="작성일">2020-01-01</span>
						<span class="qna_count pull-left" title="조회수"><strong>조회</strong> 5555</span>
					</div>			
				</div>
				<div id="qna_content">
				    주문한지 10일이 넘었는데 아직도 안와요. 무슨일이죠..?
				 <br />
				 상품 언제 받을 수 있는지 궁금합니다.
				 <br />
				 이번 주 안에 받고 싶어요.
				</div>
			</div>
    		</fieldset>
    		</form>
    		<div class="show_list clearfix">
				<button type="button" class="show btn btn-light pull-right" onclick="location.href='${pageContext.request.contextPath}/main_qnaList.do'">목록</button>
			</div>
   </div>
<!-- 하단 영역 -->
		<%@ include file = "assets/inc/footer.jsp" %>
		</div>
    	<script src="assets/js/menu.js"></script>
    	<script src="assets/js/scroll.js"></script>

</body>

</html>