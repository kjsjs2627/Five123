<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen" />

    <!-- 외부 CSS 받아오기 -->
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/main_noticeList.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
     <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />

    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet"/>

    <title>main_noticeList</title>
    
    <style type="text/css">
    	.container {
   				margin: 0;
    			padding: 0;
    			width: 100%;
   		 }
	</style>
</head>
<body>
    <div class="container">
		<!-- 헤더 영역-->
		<%@ include file = "assets/inc/header.jsp" %>
		<div id="section" class="clearfix">
         	<a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
            	<span id="back"><img src="assets/img/icon/back.png" /></span>
         	</a>
         	<div class="title pull-left">공지사항</div>   
        </div>
	<!-- 내용영역 -->
		<div id="content">
			<div id="notice">
				<div id="ntc">
					<ul id="ntc_list">
				   </ul>
			    </div>
			</div>
						
			<nav class="pagemove">
				<ul class="pagination" id="paging">

				</ul>
		    </nav>       	
        </div>
		<!-- 하단 영역 -->
		<%@ include file = "assets/inc/footer.jsp" %>
	</div>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/scroll.js"></script>
	<script src="assets/js/pagination.js"></script>
	<script type="text/javascript">
	$(function() {
			paging(totalData, dataPerPage, pageCount, 1);
			$.getJSON('assets/api/noticelist.json', function(data) {
				var html = '';
				var json = data.item;
				$.each(json, function(index, entry) {
					html += '<li class="notice_list">';
					html += '<a href="main_noticeDetails.jsp">';
					html += '<span class="notice_title">' + entry.title + '</span>';
					html += '<span class="nada clearfix">';
					html += '<span class="notice_name pull-left" title="작성자">' + entry.name + '</span>';
					html += '<span class="notice_data pull-left" title="작성일">' + entry.date+ '</span>';
					html += '<span class="notice_count pull-left">' + entry.count + '</span>';
					html += '</span>';
					html += '</a>';
					html += '</li>';
				});
				var $imageContainer = $("#ntc_list");

				$imageContainer.append(html);
			});
		});
	</script>
</body>

</html>