<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
// 	request.setCharacterEncoding("UTF-8");
// 	String ans = request.getParameter("ans");
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
	width: 50%;
	text-align: left;
	font-weight: normal;
}
#paging span{
	color : black;
}
#paging #now_page{
	text-decoration:none;
    color:#07031A;
    font-weight:bold;
    background-color:#FFCB74;
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
        	<div class="title pull-left">${ans}</div> <!-- 검색하면 ans파라미터가 없어서 세션값 없음 -->
    	</div>
		<div id="content">

			<div class="clothscount">
				<span class="counttext">총 ${pageData.totalCount}개의 상품 있습니다. (${pageData.nowPage}/${pageData.totalPage} page)</span>
			</div>
			<form method="get" action="${pageContext.request.contextPath}/main_category.do">
				<div id="searchBox">
					
					<input type="search" name="keyword" id="keyword" value="${keyword}" placeholder="검색할 옷 이름을 입력하시오">
					<!--
        	            -->
					<button class="btn btn-danger" type="submit">검색</button>
				</div>
			</form>
			<div id="newGallery">
				<ul id="gallery">	
					<c:forEach var="item" items="${output}" varStatus="status">
						<%-- 출력을 위해 준비 --%>
						<c:set var="product_no" value="${item.product_no}" />
						<c:set var="product_img" value="${item.product_img}" />
						<c:set var="product_name" value="${item.product_name}" />
						<c:set var="product_content" value="${item.product_content}" />
						<c:set var="product_price" value="${item.product_price}" />
						<c:set var="product_sale" value="${item.product_sale}"/>
						<c:set var="product_sprice" value="${item.product_price / item.product_sale}" />
						<fmt:formatNumber value="${product_price}" type="number" var="number1" />
						<fmt:formatNumber value="${product_price/product_sale}" type="number" var="number2" />
						
						<%-- 검색어가 있다면 --%>
						<c:if test="${keyword != '' }">
							<%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
							<c:set var="mark" value="<mark>${keyword}</mark>" />	
						</c:if>
						<li>
							<a href="${pageContext.request.contextPath}/main_productDetails.do?index=${product_no}" >
								<span class="thumb"><img src="${product_img}" /></span>
								<span class="text">${product_name}</span>
								<span class="textdetail">${product_content}</span>
								
								<c:choose>
									<c:when test="${product_sale == null || product_sale == 0}">
										<span class="price">${number1}원</span>
									</c:when>
									<c:otherwise>
										
										<span class="price" style="color : #ccc; text-decoration : line-through; font-size:12px;" >${number1}원</span>
										<fmt:formatNumber value="${product_price-product_price/product_sale}" type="number" var="number1" />
										<span class="sale price clearfix" style="padding-bottom: 10px;">${number1}원
											<span class="test pull-right">(${number2}원)</span>
										</span>
									</c:otherwise>
								</c:choose>
			
							</a>
						</li>
					</c:forEach>	
					
				</ul>
			</div>
		</div>
		
		<nav class="pagemove">
			<ul class="pagination" id="paging">
				<!-- 페이지 번호 구현 -->
   		<%-- 이전 그룹에 대한 링크 --%>
    	<c:choose>
        	<%-- 이전 그룹으로 이동 가능하다면? --%>
        	<c:when test="${pageData.prevPage > 0}">
            	<%-- 이동할 URL 생성 --%>
            	<c:url value="/main_category.do?" var="prevPageUrl">
                	<c:param name="page" value="${pageData.prevPage}" />
            	</c:url>
            	<li><a href="${prevPageUrl}"><span>«</span></a></li>
        	</c:when>
        	<c:otherwise>
	            <li><span>«</span></li>
    	    </c:otherwise>
    	</c:choose>
    
    	<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
    	<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
        	<%-- 이동할 URL 생성 --%>
        	<c:url value="/main_category.do?" var="pageUrl">
            	<c:param name="page" value="${i}" />
        	</c:url>
        
        	<%-- 페이지 번호 출력 --%>
        	<c:choose>
            	<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
            	<c:when test="${pageData.nowPage == i}">
                	<li><span id="now_page">${i}</span></li>
            	</c:when>
            	<%-- 나머지 페이지의 경우 링크 적용함 --%>
            	<c:otherwise>
 	               <li><a href="${pageUrl}"><span>${i}</span></a><li>
    	        </c:otherwise>
        	</c:choose>
    	</c:forEach>
    
    	<%-- 다음 그룹에 대한 링크 --%>
    	<c:choose>
        	<%-- 다음 그룹으로 이동 가능하다면? --%>
        	<c:when test="${pageData.nextPage > 0}">
            	<%-- 이동할 URL 생성 --%>
            	<c:url value="/main_category.do?" var="nextPageUrl">
                	<c:param name="page" value="${pageData.nextPage}" />
            	</c:url>
            	<li><a href="${nextPageUrl}"><span>»</span></a></li>
        	</c:when>
        	<c:otherwise>
            	<li><span>»</span></li>
        	</c:otherwise>
    	</c:choose>
				
			</ul>
		</nav>
		<!-- 하단 영역 -->
		<%@ include file = "assets/inc/footer.jsp" %>
	</div>





	<script src="assets/bootstrap/js/jquery.min.js"></script>

	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/scroll.js"></script>
<!-- 	<script src="assets/js/pagination.js"></script> -->


	<!-- 사용자 정의 스크립트 -->

	<script type="text/javascript">
		/** Ajax로 JSON데이터를 가져와서 화면에 출력하는 함수 */
	
	
	$(function() {
		//paging(totalData, dataPerPage, pageCount, 1);
// 		$.getJSON('assets/api/${ans}.json', function(data) {
// 			var html = '';
// 			var json = data.item;
// 			$.each(json, function(index, entry) {
// 				html += '<li>';
// 				html += '<a href="${pageContext.request.contextPath}/main_productDetails.do?ans=${ans}&index='+index+'" id="'+ index + '">'
// 				html += '<span class="thumb">';
// 				html += '<img src="' + entry.img + '"></span>';
// 				html += '<span class="text">' + entry.cname + '</span>';
// 				html += '<span class="textdetail">' + entry.cdetail + '</span>';
					
// 				if(entry.sale=="true"){
// 					html += '<span class="price" style="color : #ccc; text-decoration : line-through; font-size:12px;" >' + entry.cprice + '원'+ '</span>';
// 					html += '<span class="sale price clearfix" style="padding-bottom: 10px;">' + (entry.cprice)*0.9 + '원' + '<span class="test pull-right">('+ (entry.cprice)*0.1+'원 할인)</span>'+ '</span>';
// 				}else{
// 					html += '<span class="price">' + entry.cprice + '원'+ '</span>';
// 				}
					
// 				html += '</a>';
// 				html += '</li>';
// 			});
// 			var $imageContainer = $("#gallery");
// 			$imageContainer.append(html);
// 		});
	});
		
	</script>

</body>

</html> 
