<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Hello JSP</title>
</head>

<body>
    <div id="footer">
    	<a href="#" class="top"><img alt="위로가기 아이콘" src="assets/img/icon/up.png"></a>
		<div class="icon">
			<ul>
				<li><a href="${pageContext.request.contextPath}/mypage.do"> 
					<span class="thumb"> <img src="assets/img/icon/human_icon.png" alt="마이페이지" /></span> 
					<span class="text">마이페이지</span>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/main_noticeList.do">
					<span class="thumb"><img src="assets/img/icon/board_icon.png" alt="공지사항" /></span> 
					<span class="text">공지사항</span>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/main_basket.do"> 
					<span class="thumb"><img src="assets/img/icon/basket_icon.png" alt="장바구니" /></span> 
					<span class="text">장바구니</span>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/main_qnaList.do"> 
					<span class="thumb"><img src="assets/img/icon/qna_icon.png" alt="Q&A" /></span> 
					<span class="text">Q&amp;A</span>
				</a></li>
			</ul>
		</div>
		<div>
			<address>회사소개 상점명 (주) withFiveBird 대표이사 5조(김종선, 안이제, 유한울,
					윤수빈) 대표전화 070-1234-5678 주소 서울 서초구 서초대로 77길 55 에이프로스퀘어 3층</address>
		</div>
	</div>

</body>

</html>