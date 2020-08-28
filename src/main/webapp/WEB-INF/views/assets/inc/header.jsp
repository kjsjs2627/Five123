<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet">
    <title>Hello JSP</title>
</head>

<body>
    <div id="header">
			<div id="headerGallery" class="clearfix">
				<ul>
					<li class="pull-left"><a
						href="javascript:openModal('modal1');" class="modal-open"> <img
							src="assets/img/icon/menu.png" id="메뉴" />
					</a></li>
					<li class="pull-left"><a href="${pageContext.request.contextPath}/index.do" id="title"> with<span
							class="bold">FiveBird</span>
					</a></li>
					<li class="pull-left"><a href="${pageContext.request.contextPath}/main_basket.do"> <img id="basket"
							class="pull-right" src="assets/img/icon/basket.png" alt="장바구니" />
					</a></li>
				</ul>
			</div>
				
		</div>
		<!-- 모달 메뉴 -->
		<div id="modal"></div>
		<div id="menuAll" class="modal-con modal1">
			<div id="menuTitle">
				<span class="modal_title">with</span><span
							class="bold">FiveBird</span>
				
			</div>
			<div>
				<button class="btn btn-warning" type="button" onclick="location.href='${pageContext.request.contextPath}/info_login.do'">로그인</button>
				<button class="btn btn-warning" type="button" onclick="location.href='${pageContext.request.contextPath}/info_join.do'">회원가입</button>
			</div>
			<div class="icon">
				<ul>
					<li><a href="${pageContext.request.contextPath}/mypage.do"> <span class="thumb"><img
								src="assets/img/icon/menuMypage.png" alt="마이페이지" /></span> <span class="text">마이페이지</span>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/main_basket.do"> <span class="thumb"><img
								src="assets/img/icon/menubasket.png" alt="장바구니" /></span> <span class="text">장바구니</span>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage_like.do"> <span class="thumb"><img
								src="assets/img/icon/menuHeart.png" alt="찜목록" /></span> <span class="text">찜목록</span>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/main_article.do"> <span class="thumb"><img
								src="assets/img/icon/menuborad.png" alt="게시판" /></span> <span class="text">게시판</span>
					</a></li>
				</ul>
			</div>
			<div id="menuCategory">
				<ul>
					<li>카테고리</li>
                    <li><a href="${pageContext.request.contextPath}/main_category.do?ans=New" class="special">New</a></li>
                    <li><a href="${pageContext.request.contextPath}/main_category.do?ans=Best" class="special">Best</a></li>
                    <li><a href="${pageContext.request.contextPath}/main_category.do?ans=Sale">Sale</a></li>
                    <li><a href="${pageContext.request.contextPath}/main_category.do?ans=Outer">Outer</a></li>
                    <li><a href="${pageContext.request.contextPath}/main_category.do?ans=Top">Top</a></li>
                    <li><a href="${pageContext.request.contextPath}/main_category.do?ans=Bottom">Bottom</a></li>
                    <li><a href="${pageContext.request.contextPath}/main_category.do?ans=Dress">Dress</a></li>
                    <li><a href="${pageContext.request.contextPath}/main_category.do?ans=Acc">Acc</a></li>
				</ul>
			</div>
		</div>
</body>

</html>