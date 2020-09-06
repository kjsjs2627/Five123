<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <title>main_qnaList</title>
    
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
			<div>
				<c:choose>
				<%-- 조회결과가 없는 경우 --%>
				<c:when test="${output == null || fn:length(output) == 0}">
					<div id="null">
						<span>[ ${keyword} ] 검색 결과가 없습니다.</span>
					</div>
				</c:when>
				<%-- 조회결과가 있는 경우 --%>
				<c:otherwise>
					<%-- 조회 결과에 따른 반복 처리 --%>
					<c:forEach var="item" items="${output}" varStatus="status">
						<%-- 출력을 위해 준비한 학과이름과 위치 --%>
						<c:set var="notice_title"    value="${item.notice_title}" />
						<c:set var="notice_content"  value="${item.notice_content}" />
						<c:set var="notice_hit"      value="${item.notice_hit}" />
						<c:set var="notice_reg_date" value="${item.notice_reg_date}" />
						
						
						<%--검색어가 있다면? --%>
						<c:if test="${keyword != ''}">
							<%-- 검색어에 <mark> 태그를 적용하여 형관펜 효과 준비 --%>
							<c:set var="mark" value="<mark>${keyword}</mark>" />
							<%-- 출력을 위해 준비한 제목과 작성자에서 검색어와 일치하는 단어를 형관펜 효과로 변경 --%>
							<c:set var="notice_title" value="${fn:replace(notice_title, keyword, mark)}" />
							<c:set var="user_name" value="${fn:replace(user_name, keyword, mark)}" /> 
						</c:if>
						
						<%-- 상세페이지로 이동하기 위한 URL --%>
						<c:url value="/main_noticeDetails.do" var="viewUrl">
							<c:param name="notice_no" value="${item.notice_no}" />
						</c:url>
						
						<div id="notice">
							<div class="notice_title">
								<span><a href="${viewUrl}">${notice_title}</a></span>
							</div>
							<div class="name_day_hit clearfix">
								<span class="notice_name pull-left">${user_name}</span>
								<span class="date pull-left">${notice_reg_date}</span>
								<span class="hit pull-left">조회 ${notice_hit}</span>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	</div>
											
	<!-- 페이지 번호 구현 -->
	<%-- 이전 그룹에 대한 링크 --%>
	<div class="p">
	<c:choose>
		<%-- 이전 그룹으로 이동 가능하다면? --%>
		<c:when test="${pageData.prevPage > 0}">
			<%-- 이동할 URL 생성 --%>
			<c:url value="/main_noticeList.do" var="prevPageUrl">
				<c:param name="page" value="${pageData.prevPage}" />
				<c:param name="keyword" value="${keyword}" />
			</c:url>
			<a href="${prevPageUrl}">[이전]</a>
			</c:when>
			<c:otherwise>
				[이전]
			</c:otherwise>
	</c:choose>
	
	<%-- 페이지 번호 (시작 페이지부터 끝 페이지까지 반복) --%>
	<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
		<%-- 이동할 url 생성 --%>
		<c:url value="main_noticeList.do" var="pageUrl">
			<c:param name="page" value="${i}" />
			<c:param name="keyword" value="${keyword}" />
		</c:url>
		
		<%-- 페이지 번호 출력 --%>
		<c:choose>
			<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함  --%>
			<c:when test="${pageData.nowPage == i}">
				<strong>[${i}]</strong>
			</c:when>
			<%-- 나머지 페이지의 경우 링크 적용함 --%>
			<c:otherwise>
				<a href="${pageUrl}">[${i}]</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<%-- 다음 그룹에 대한 링크 --%>
	<c:choose>
		<%-- 다음 그룹으로 이동 가능하다면? --%>
		<c:when test="${pageData.nextPage > 0}">
			<%-- 이동할 URL 생성 --%>
			<c:url value="/main_noticeList.do" var="nextPageUrl">
				<c:param name="page" value="${pageData.nextPage}" />
				<c:param name="keyword" value="${keyword}" />
			</c:url>
			<a href="${nextPageUrl}">[다음]</a>
		</c:when>
		<c:otherwise>
			[다음]
		</c:otherwise>
	</c:choose>
	</div>
			    <!-- 검색폼  -->
		    <div id="form" class="clearfix">
         		<form method="get" id="search" class="pull-left" action="${pageContext.request.contextPath}/main_noticeList.do">
         			<label for="keyword"></label>
        			<input type="search" name="keyword" id="keyword" class="search_text pull-left" placeholder=" 검색어 입력" value="${keyword}">
        			<button type="submit" class="search btn btn-warning pull-left">검색</button>
        		</form>
        	</div>     	
        </div>
		<!-- 하단 영역 -->
		<%@ include file = "assets/inc/footer.jsp" %>
	</div>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/scroll.js"></script>
</body>

</html>