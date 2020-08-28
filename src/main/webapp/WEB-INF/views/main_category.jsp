<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String ans = request.getParameter("ans");
	
	if(ans == null || ans.equals("") || !ans.equals("Top") && !ans.equals("Bottom") && !ans.equals("Dress") && !ans.equals("Outer") && !ans.equals("Acc")&& !ans.equals("Best") && !ans.equals("Sale") && !ans.equals("New") ){
		String script="<script>";
		script += "alert('값이 없습니다.');";
		script += "history.back();";
		script += "</script>";
	
		out.print(script);
	}
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap"
	rel="stylesheet" />

<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<!-- 외부 CSS 받아오기 -->
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assets/css/gallery.css" />
<link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />



<title>Category</title>

<style type="text/css">
/** 검색창 부분 */
/* 수정 : padding-top값 줌 안하면 맨위에 있어서 */
#gallery .sale{
	margin-top: 5px;
	text-align: right;
	
}
#gallery .test{
	width: 60%;
	text-align: left;
	font-weight: normal;
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
        	<div class="title pull-left">${ans}</div>
    	</div>
		<div id="content">

			<div class="clothscount">
				<span class="counttext">총 14개의 상품 있습니다. (1/1 page)</span>
			</div>
			<div id="searchBox">
				<input type="text" placeholder="검색할 옷 이름을 입력하시오">
				<!--
                    -->
				<button class="btn btn-danger">검색</button>
			</div>
			<div id="newGallery">
				<ul id="gallery">

				</ul>
			</div>
		</div>

		<nav class="pagemove">
			<ul class="pagination" id="paging">

			</ul>
		</nav>
		<!-- 하단 영역 -->
		<%@ include file = "assets/inc/footer.jsp" %>
	</div>





	<script src="assets/bootstrap/js/jquery.min.js"></script>

	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/scroll.js"></script>
	<script src="assets/js/pagination.js"></script>


	<!-- 사용자 정의 스크립트 -->

	<script type="text/javascript">
		/** Ajax로 JSON데이터를 가져와서 화면에 출력하는 함수 */
	
	
	$(function() {
		paging(totalData, dataPerPage, pageCount, 1);
		$.getJSON('assets/api/${ans}.json', function(data) {
			var html = '';
			var json = data.item;
			$.each(json, function(index, entry) {
				html += '<li>';
				html += '<a href="${pageContext.request.contextPath}/main_productDetails.do?ans=${ans}&index='+index+'" id="'+ index + '">'
				html += '<span class="thumb">';
				html += '<img src="' + entry.img + '"></span>';
				html += '<span class="text">' + entry.cname + '</span>';
				html += '<span class="textdetail">' + entry.cdetail + '</span>';
					
				if(entry.sale=="true"){
					html += '<span class="price" style="color : #ccc; text-decoration : line-through; font-size:12px;" >' + entry.cprice + '원'+ '</span>';
					html += '<span class="sale price clearfix" style="padding-bottom: 10px;">' + (entry.cprice)*0.9 + '원' + '<span class="test pull-right">('+ (entry.cprice)*0.1+'원 할인)</span>'+ '</span>';
				}else{
					html += '<span class="price">' + entry.cprice + '원'+ '</span>';
				}
					
				html += '</a>';
				html += '</li>';
			});
			var $imageContainer = $("#gallery");
			$imageContainer.append(html);
		});
	});
		
	</script>

</body>

</html> 
