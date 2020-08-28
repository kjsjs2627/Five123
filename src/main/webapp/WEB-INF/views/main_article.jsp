<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우정게 알려준다. - ANSI(euc-kr), UTF-8 -->
    <meta charset="utf-8" />
    <!-- 스마트 장치에서의 해상도 균일화 처리 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,    minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
    <!-- IE의 호환성 보기 모드 금지 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css" />
    <script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

    <!-- 외부 CSS 받아오기 -->
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/main_article.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
   

    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet"/>

    <title>main_article</title>
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
         	<div class="title pull-left">게시판</div>   
        </div>
 	<!-- 내용영역 -->
    <div id="content">
        <div id="article" class="clearfix">
                        <div id="notice_qna" class="notice pull-left">
                            <a href="main_noticeList.jsp" class="a pull-left">
                                <img src="assets/img/icon/article_icon.png" class="img pull-left" alt="공지사항" />
                                <span class="article_list_a pull-left">공지사항</span>
                                <img src="assets/img/icon/next_icon.png"  class="next pull-right" />
                            </a>
                        </div>
                        <div id="notice_qna" class="notice pull-left">
                            <a href="main_qnaList.jsp" class="a pull-left">
                                <img src="assets/img/icon/article_icon.png" class="img pull-left" alt="qna" />
                                <span class="article_list_a pull-left">Q&amp;A</span>
                                <img src="assets/img/icon/next_icon.png"  class="next pull-right" />
                            </a>
                        </div>
       	 </div>
   </div>
		<!-- 하단 영역 -->
		<%@ include file = "assets/inc/footer.jsp" %>
		</div>
    	<script src="assets/js/menu.js"></script>
    	<script src="assets/js/scroll.js"></script>

</body>

</html>