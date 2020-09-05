<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
	<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우정게 알려준다. - ANSI(euc-kr), UTF-8 -->
	<meta charset="utf-8" />
	<!-- 스마트 장치에서의 해상도 균일화 처리 -->
	<meta name="viewport" content="width=device-width,initial-scale=1.0,    minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
	<!-- IE의 호환성 보기 모드 금지 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<!--Bootstrap -->
	<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<!-- 슬라이드 플러그인 CSS 참조 -->
	<link rel="stylesheet" href="assets/plugins/superslides/stylesheets/superslides.css">

	<!-- 외부 CSS 받아오기 -->
	<link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/gallery.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/main.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/scroll.css"/> 

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- [if lt IE 9] -->
	<script src="assets/bootstrap/js/html5shiv.js"></script>
	<script src="assets/bootstrap/js/respond.min.js"></script>

	<!-- 웹폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet">

    <title>Hello JSP</title>
    
    <style type="text/css">
    body #content{
    	padding: 0;
    }
	 #slide-container { width: 100%; height: 60%;
            position: absolute;

    }
    </style>
</head>

<body>

	<div id="container">

		<!-- 헤더영역 -->
		<%@ include file ="assets/inc/header.jsp" %>
		
		<div id="content">
			<!-- 슬라이드 영역 -->
			<div id="slide-container">
				<div id="slides">
					<ul class="slides-container">
						<!-- 슬라이드 1 -->
						<li><img src="assets/img/clothings/slide1.jpg" /></li>
						<!-- 슬라이드 2 -->
						<li><img src="assets/img/clothings/slide2.jpg" /></li>
						<!-- 슬라이드 3 -->
						<li><img src="assets/img/clothings/slide3.jpg" /></li>
						<!-- 슬라이드 4 -->
						<li><img src="assets/img/clothings/slide4.jpg" /></li>
					</ul>
				</div>
			</div>
			<div id="body">
				<div id="searchBox">
					<input type="text" placeholder="검색할 옷 이름을 입력하시오">
					<button class="btn btn-danger">검색</button>
				</div>
				<div id="mainButton">
					<ul class="btnlist">
						<li><a href="${pageContext.request.contextPath}/main_category.do?ans=New" class="special">New</a></li><!--
                    --><li><a href="${pageContext.request.contextPath}/main_category.do?ans=Best" class="special">Best</a></li><!--
                    --><li><a href="${pageContext.request.contextPath}/main_category.do?ans=Sale">Sale</a></li><!--
                    --><li><a href="${pageContext.request.contextPath}/main_category.do?ans=Outer">Outer</a></li><!--
                    --><li><a href="${pageContext.request.contextPath}/main_category.do?ans=Top">Top</a></li><!--
                    --><li><a href="${pageContext.request.contextPath}/main_category.do?ans=Bottom">Bottom</a></li><!--
                    --><li><a href="${pageContext.request.contextPath}/main_category.do?ans=Dress">Dress</a></li><!--
                    --><li><a href="${pageContext.request.contextPath}/main_category.do?ans=Acc">Acc</a></li><!--
                    -->
					</ul>
				</div>
				<div id="newItem">
					<ul>
						<li>
							<div class="pull-left">newItem</div> <a href="${pageContext.request.contextPath}/main_category.do?ans=New">more</a>
						</li>
					</ul>
				</div>
				<div id="newGallery">
					  <ul id="gallery">
                        <li>
                            <a href="${pageContext.request.contextPath}/main_productDetails.do?index=68">
                                <span class="thumb"><img src="assets/img/new/new1.gif" alt="이미지1" /></span>
                                <span class="text">코지 파자마</span>
                                <span class="textdetail">오래 입고 있어도 가슬거림 없는 부드러운 소재로 제작했어요</span>
								<span class="price">32,200원</span>                                                            
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/main_productDetails.do?index=1">
                                <span class="thumb"><img src="assets/img/new/new2.gif" alt="이미지2" /></span>
                                <span class="text">노엘 린넨하프</span>
                                <span class="textdetail">린넨의 까슬거림 없이 부드럽게 가공된 린넨 + 코튼 혼방소재의 메이드 하프자켓</span>
                                <span class="price">42,750원</span>
                                
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/main_productDetails.do?index=2">
                                <span class="thumb"><img src="assets/img/new/new3.gif" alt="이미지3" /></span>
                                <span class="text">크림 린넨</span>
                                <span class="textdetail">여름에 입을 시원하고 부드러운 긴바지를 찾으셨다면, 적극추천 :)</span>
                                <span class="price">23,650원</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/main_productDetails.do?index=1">
                                <span class="thumb"><img src="assets/img/new/new4.gif" alt="이미지4" /></span>
                                <span class="text">콜 슬라브 데님</span>
                                <span class="textdetail">시원하고 청량한 연중청 컬러에 더운 여름에 입기 좋은 얇고 부드러운 데님</span>
                                <span class="price">24,600원</span>
                                
                            </a>
                        </li>
                    </ul>
				</div>
				<div id="bestItem">
					<ul>
						<li>
							<div class="pull-left">bestItem</div> <a href="${pageContext.request.contextPath}/main_category.do?ans=Best">more</a>
						</li>
					</ul>
				</div>
				<div id="bestGallery">
					  <ul id="gallery">
					  	<li>
                            <a href="${pageContext.request.contextPath}/main_productDetails.do?ans=Top&index=0">
                                <span class="thumb"><img src="assets/img/top/top1.gif" alt="이미지3" /></span>
                                <span class="text">스토리지 - made tee</span>
                                <span class="textdetail">여리여리 루즈핏이 특징인 여름용 긴팔 티셔츠!</span>
                                <span class="price">18,000원</span>
                                
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/main_productDetails.do?ans=Top&index=1">
                                <span class="thumb"><img src="assets/img/top/top2.gif" alt="이미지1" /></span>
                                <span class="text">페이지크롭 tee </span>
                                <span class="textdetail">면 100% 원단의 크롭티 티셔츠</span>
                                <span class="price">13,000원</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/main_productDetails.do?ans=Bottom&index=4">
                                <span class="thumb"><img src="assets/img/bottom/bottom4.gif" alt="이미지2" /></span>
                                <span class="text">리틀 cotton pants</span>
                                <span class="textdetail">지금부터 초가을까지 쭉 입기 좋은 깔끔한 무드로 완성된 코튼 팬츠</span>
                                <span class="price">39,000원</span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/main_productDetails.do?ans=Top&index=12">
                                <span class="thumb"><img src="assets/img/best/best4.gif" alt="이미지4" /></span>
                                <span class="text">베리스 shirt</span>
                                <span class="textdetail">올 여름시즌 더욱 추천드리는 시원하게 입기 좋은 오픈카라 셔츠!</span>
                                <span class="price">38,000원</span>
                            </a>
                        </li>
                    </ul>
				</div>
			</div>
		</div>
		<%@ include file ="assets/inc/footer.jsp" %>
		
	</div>

	
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<!-- Include all compiled plugins  (below), or include individual files as needed -->
	<!-- <script src="js/bootstrap.min.js"></script> -->
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/scroll.js"></script>
	
	<!-- 슬라이드 플러그인 JS 참조 -->
	<script src="assets/plugins/superslides/jquery.easing.1.3.js"></script>
	<script src="assets/plugins/superslides/jquery.superslides.min.js"></script>


	<script type="text/javascript">
		/* superSlide */
		$(function() {
			/** `#slides`요소에 대해 플러그인 적용 */
			$('#slides').superslides({
				inherit_width_from : '#slide-container', // 슬라이드의 넓이를 구성할 부모 요소
				inherit_height_from : '#slide-container', // 슬라이드의 높이를 구성할 부모 요소
				play : 4000
			// 재생시간 (1/1000초 단위). 미지정시 자동재생 안됨.

			});
		});
	</script>
</body>

</html>