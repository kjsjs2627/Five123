<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!doctype html>
<html>

<!-- 페이지 설정 부분 -->

<head>
<meta charset="utf-8" />
<!-- 스마트 장치에서의 해상도 균일화 처리 -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,    minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- bootstrap -->
<!-- <link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" /> -->
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap/css/bootstrap.min.css" />
<!-- <link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap-theme.min.css" /> -->
<!-- 슬라이드 플러그인 CSS 참조 -->
<link rel="stylesheet"
	href="assets/plugins/superslides/stylesheets/superslides.css">
<!-- 외부 CSS 받아오기 -->
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
<link rel="stylesheet" type="text/css" href="assets/css/main_basket.css" />
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
<!-- 웹폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap"
	rel="stylesheet">

<!-- 브라우저에 표시될 문서 제목 -->
<title>장바구니</title>
<style type="text/css">
</style>
</head>
<body>
	<div id="container">
		<!-- 헤더영역 -->
		<%@ include file="assets/inc/header.jsp"%>

		<div id="section" class="clearfix">
			<a href="#" class="pull-left" onclick="history.go(-1); return false;">
				<span id="back"><img src="assets/img/icon/back.png" /></span>
			</a>
			<div class="title pull-left">장바구니</div>
		</div>
		<!-- 내용영역 -->
		<div id="content">
			<div id="basketTop">
				<ul>
					<li><button id="checkAll" type="button"
							class="btn btn-warning pull-right" onclick="allselect()">전체선택</button></li>
					<li><button id="select_delete" type="button"
							class="btn btn-warning pull-right">선택삭제</button></li>
				</ul>
			</div>
			<form id="basketForm">
				<div id="basketProduct" class="basketProduct clearfix">
					<span onclick="location.href='main_productDetails.jsp'" id="imgBox"
						class="pull-left"><img src="assets/img/dress/dress1.gif" /></span>
					<div id="clothesName" class="pull-left">
						<input type="text" value="하늘하늘원피스" disabled="disabled" /> <input
							type="checkbox" name="chk" class="pull-right" />
					</div>
					<div id="basketColor" class="pull-right clearfix">
						<input class="pull-left" type="text" value="[Indian pink]"
							disabled="disabled" />
					</div>
					<div id="basketNum" class="pull-left">
						<input id="amount" type="text" value="0" /> <img id="plus"
							src="assets/img/icon/plus.png"> <img id="minus"
							src="assets/img/icon/minus.png"> <label class="won pull-right">원</label><input
							type="text" class="num pull-right" value="35000"
							disabled="disabled" />
					</div>
				</div>
				<div id="basketProduct" class="basketProduct clearfix">
					<span onclick="location.href='main_productDetails.jsp'" id="imgBox"
						class="pull-left"><img src="assets/img/dress/dress2.gif" /></span>
					<div id="clothesName" class="pull-left">
						<input type="text" value="여신핏데일리원피스" disabled="disabled" /> <input
							type="checkbox" name="chk" class="pull-right" />
					</div>
					<div id="basketColor" class="pull-right clearfix">
						<input class="pull-left" type="text" value="[Romance Blue]"
							disabled="disabled" />
					</div>
					<div id="basketNum" class="pull-left">
						<input id="amount1" type="text" value="0" /> <img id="plus1"
							src="assets/img/icon/plus.png"> <img id="minus1"
							src="assets/img/icon/minus.png"> <label class="won pull-right">원</label><input
							type="text" class="num1 pull-right" value="35000"
							disabled="disabled" />
					</div>
				</div>
				<div id="basketProduct" class="basketProduct clearfix">
					<span onclick="location.href='main_productDetails.jsp'" id="imgBox"
						class="pull-left"><img src="assets/img/dress/dress3.gif" /></span>
					<div id="clothesName" class="pull-left">
						<input type="text" value="여행필수원피스" disabled="disabled" /> <input
							type="checkbox" name="chk" class="pull-right" />
					</div>
					<div id="basketColor" class="pull-right clearfix">
						<input class="pull-left" type="text" value="[Pale Citrus]"
							disabled="disabled" />
					</div>
					<div id="basketNum" class="pull-left">
						<input id="amount2" type="text" value="0" /> <img id="plus2"
							src="assets/img/icon/plus.png"> <img id="minus2"
							src="assets/img/icon/minus.png"> <label class="won pull-right">원</label><input
							type="text" class="num2 pull-right" value="35000"
							disabled="disabled" />
					</div>
				</div>
				<div id="basketTotal">
					<ul>
						<li><label class="pull-left">총결제금액</label><label
							class="pull-right">원</label><input class="pull-right" type="text"
							value="100000" disabled="disabled" /></li>
					</ul>
				</div>
				<div id="basketOrder" class="clearfix">
					<ul>
						<li><button onclick="location.href='orderM.jsp'"
								class="btn btn-warning" type="button">선택 상품 주문</button></li>
					</ul>
				</div>
			</form>
			<ul id="like_li">

			</ul>


		</div>
		<!-- 하단 영역 -->
		<%@ include file="assets/inc/footer.jsp"%>
	</div>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="assets/js/menu.js"></script>
	<script type="text/javascript">
		function allselect() {
			if ($("input:checkbox[name='chk']").is(":checked") == false) {
				$("input:checkbox[name='chk']").prop("checked", true);
			} else {
				$("input:checkbox[name='chk']").prop("checked", false);
			}

		}

		$(function() {
			$("#checkDelete")
					.click(
							function() {
								swal({
									title : '확인',
									text : "정말 선택하신 항목을 삭제하시겠습니까?",
									type : 'warning',
									confirmButtonText : 'Yes',
									showCancelButton : true,
									cancelButtonText : 'No',
								})
										.then(
												function(result) {
													if (result.value) {
														swal(
																'삭제',
																'성공적으로 삭제되었습니다.',
																'success');
														$("#basketForm")
																.remove();
														var tmpHtml = "";
														tmpHtml = tmpHtml
																+ "<div class='add'>장바구니가 비었습니다.</div>"
														$("#like_li").append(
																tmpHtml);
													} else if (result.dismiss === 'cancel') {
														swal('취소',
																'삭제가 취소되었습니다.',
																'error');
														return false;
													}
												});

							});

			$("#select_delete").click(function() {
				if ($("input:checkbox[name='chk']").is(":checked") == true) {

					swal({
						title : '확인',
						text : "정말 선택하신 항목을 삭제하시겠습니까?",
						type : 'warning',
						confirmButtonText : 'Yes',
					}).then(function(result) {
						if (result.value) {
							$("input[name=chk]:checked").each(function() {

								$(this).parents('.basketProduct').remove();
								swal('삭제', '성공적으로 삭제되었습니다.', 'success');
								if ($(".basketProduct") == null) {
									var tmpHtml = "";
									
									tmpHtml = tmpHtml
											+ "<div class='add'>장바구니가 비었습니다.</div>"
									$("#like_li").append(
											tmpHtml);
								}
							});
						} else if (result.dismiss === 'cancel') {
							swal('취소', '삭제가 취소되었습니다.', 'error');
							return false;
						}
					});
				} else {
					swal({
						title : '상품을 선택하세요.',
						text : "선택된 상품이 존재 하지 않습니다.",
						type : 'warning',
						confirmButtonText : '확인',
						showCancelButton : false,
						cancelButtonText : null,
					});
				}
			});

		});

		/* plus 버튼 기능 */

		$(function() {
			$("#plus")
					.click(
							function() {
								var number = ($("#amount").attr("value"));
								var plus_num = 0;
								var sum = 35000;
								if (number == 9) { // 숫자가 9이상이라면 초기화}
									$("#amount").attr("value", "0");
									$("#num")
											.attr("value",
													"선택상품금액(수량)                            0원");

								} else {

									plus_num = parseInt(number) + 1;
									$("#amount").attr("value", plus_num);
									sum = 35000 * plus_num;
									$(".num").attr("value", sum);

								}
							});

			$("#minus").click(function() {
				var number = ($("#amount").attr("value"));
				var minus_num = 0;
				var sum = 35000;

				if (number <= 1) { // 0이하라면 초기화}
					$("#amount").attr("value", "0");
					$(".num").attr("value", sum);
				} else {

					minus_num = parseInt(number) - 1;
					$("#amount").attr("value", minus_num);
					sum = 35000 * minus_num;

					$("#num").attr("value", sum);

				}
			});

		});

		/* 1 */

		$(function() {
			$("#plus1")
					.click(
							function() {
								var number = ($("#amount1").attr("value"));
								var plus_num = 0;
								var sum = 35000;
								if (number == 9) { // 숫자가 9이상이라면 초기화}
									$("#amount1").attr("value", "0");
									$("#num1")
											.attr("value",
													"선택상품금액(수량)                            0원");

								} else {

									plus_num = parseInt(number) + 1;
									$("#amount1").attr("value", plus_num);
									sum = 35000 * plus_num;
									$(".num1").attr("value", sum);

								}
							});

			$("#minus1").click(function() {
				var number = ($("#amount1").attr("value"));
				var minus_num = 0;
				var sum = 35000;

				if (number <= 1) { // 0이하라면 초기화}
					$("#amount1").attr("value", "0");
					$(".num1").attr("value", sum);
				} else {

					minus_num = parseInt(number) - 1;
					$("#amount1").attr("value", minus_num);
					sum = 35000 * minus_num;

					$("#num1").attr("value", sum);

				}
			});

		});

		/* 2 */

		$(function() {
			$("#plus2")
					.click(
							function() {
								var number = ($("#amount2").attr("value"));
								var plus_num = 0;
								var sum = 35000;
								if (number == 9) { // 숫자가 9이상이라면 초기화}
									$("#amount2").attr("value", "0");
									$("#num2")
											.attr("value",
													"선택상품금액(수량)                            0원");

								} else {

									plus_num = parseInt(number) + 1;
									$("#amount2").attr("value", plus_num);
									sum = 35000 * plus_num;
									$(".num2").attr("value", sum);

								}
							});

			$("#minus2").click(function() {
				var number = ($("#amount2").attr("value"));
				var minus_num = 0;
				var sum = 35000;

				if (number <= 1) { // 0이하라면 초기화}
					$("#amount2").attr("value", "0");
					$(".num2").attr("value", sum);
				} else {

					minus_num = parseInt(number) - 1;
					$("#amount2").attr("value", minus_num);
					sum = 35000 * minus_num;

					$("#num2").attr("value", sum);

				}
			});

		});
	</script>
</body>

</html>