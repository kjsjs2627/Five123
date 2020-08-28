<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!doctype html>
<html>

<!-- 페이지 설정 부분 -->

<head>
<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우정게 알려준다. - ANSI(euc-kr), UTF-8 -->
<meta charset="utf-8" />
<!-- 스마트 장치에서의 해상도 균일화 처리 -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!--Bootstrap -->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"
	media="screen">
<!-- 외부 CSS 받아오기 -->
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assets/css/orderM.css" />
<link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />




<!-- 웹폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap"
	rel="stylesheet" />
<script src="assets/bootstrap/js/html5shiv.js"></script>
<script src="assets/bootstrap/js/respond.min.js"></script>

<!-- 브라우저에 표시될 문서 제목 -->
<title>결제</title>
<style type="text/css">
#wrap {
	display: none;
	border: 1px solid;
	width: 360px;
	height: 300px;
	margin: 5px 0;
	position: relative;
}

#addr1, #addr2 {
	margin: 5px 0 0 97px;
}

/* 우편번호 내용영역 위치 조절 */
#postcode {
	margin-left: 57px;
}

#saveUse {
	display: inline-block;
	text-align: right;
	margin: 0;
	width: 78%;
	height: 28px;
}
</style>


</head>
<!-- 브라우저에 보여질 부분 -->

<body>
	<div id="container">
		<!-- 헤더영역 -->
		<%@ include file="assets/inc/header.jsp"%>

		<div id="section" class="clearfix">
			<a href="#" class="pull-left" onclick="history.go(-1); return false;">
				<span id="back"><img src="assets/img/icon/back.png" /></span>
			</a>
			<div class="title pull-left">결제</div>
		</div>
		<div id="content">
			<div id="payCheck">
				<div id="deliveryLine">
					<div class="pLine pull-left">배송지 정보</div>
					<div class="pLine pull-right">
						<input id="commonA" type="checkbox" /> 기본 배송지
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- 내용 영역 -->
				<form id="deliveryInfo">
					<div class="form-info clearfix">
						<label for="user_name" class="pull-left">수령인<span>*</span></label>
						<div>
							<ul>
								<li><input type="text" name="user_name" id="user_name"
									value="" class="" placeholder=" 수령인을 입력하세요." /></li>
							</ul>
						</div>
					</div>
					<div class="form-info clearfix">
						<label class="pull-left">주소<span>*</span></label>
						<div id="addressDetail">
							<ul>
								<li><input type="text" name="postcode" id="postcode"
									value="" disabled="disabled" /><span><button
											id="postButton" class="btn btn-warning" type="button"
											data-addr1="#addr1" data-addr2="#addr2" onclick=post()>우편번호</button></span></li>
								<li><input type="text" id="addr1" name="addr2" value=""
									disabled="disabled" /></li>
								<li><input type="text" id="addr2" name="addr2" value="" /></li>
							</ul>
							<div id="wrap">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
									id="btnFoldWrap"
									style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
									onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
						</div>
					</div>
					<div class="form-info clearfix">
						<label class="pull-left">전화번호<span>*</span></label>
						<div>
							<ul>
								<li><input type="tel" name="tel" id="tel" class="" value=""
									placeholder=" '-'없이 숫자만 입력" /></li>
							</ul>
						</div>
					</div>
					<div class="form-info clearfix">
						<label class="pull-left">이메일<span>*</span></label>
						<div>
							<ul>
								<li id="payEmail"><input type="email" name="email" value=""
									id="email" class="" placeholder="" /></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<div id="saleInfo">
				<div class="pull-left">할인정보</div>
				<div class="pull-right">
					<input id="sale" type="text" placeholder="0 원" disabled="disabled" />
				</div>
			</div>
			<div id="saleDetail" class="clearfix">
				<form>
					<div id="couponUse" class="form-info">
						<label class="pull-left">쿠폰 적용</label>
						<div>
							<ul>
								<li id="coupon"><select id="couponUse">
										<option value="0">사용할 쿠폰을 선택 하세요.</option>
										<option value="10">10% 할인쿠폰</option>
										<option value="30">30% 할인쿠폰</option>
										<option value="50">50% 할인쿠폰</option>
								</select> <span><button id="couponButton" type="button"
											class="btn btn-warning">적용</button></span></li>
							</ul>
						</div>
					</div>
					<div id="save" class="form-info clearfix">
						<label class="pull-left">적립금</label>
						<div class="pull-right">
							<ul>
								<li>사용가능한 적립금<input id="savePossible" type="text"
									disabled="disabled" value="2000" />원
								</li>
							</ul>
							<ul>
								<li><span><input id="saveUse" type="text" value="0" /></span>
									<button id="saveButton" type="button" class="btn btn-warning">적용</button></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<div id="total">
				<form>
					<div id="totalMoney">
						<label>총 상품 금액</label>
						<div class="sumLine pull-right">
							<input id="allPay" type="text" value="150000"
								disabled="disabled" />원
						</div>
					</div>
					<div id="totalSale" class="form-info">
						<label>총 할인 금액</label>
						<div class="sumLine pull-right">
							<input id="allSale" class="sum" type="text" value="0"
								disabled="disabled" />원
						</div>
					</div>
					<div id="totalSum">
						<label>총 결제 금액</label>
						<div id="sumT" class="sumLine pull-right">
							<input id="realPay" type="text" value="150000"
								disabled="disabled" />원
						</div>
					</div>
				</form>
			</div>
			<div id="infoCheck" class="clearfix">
				<input id="payCheck" type="checkbox" /> 결제정보를 확인하였으며, 구매진행에 동의합니다.
				<span><button id="payButton" type="button"
						class="btn btn-warning">결제하기</button></span>
			</div>
		</div>

		<%@ include file="assets/inc/footer.jsp"%>
	</div>


	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

	<script src="assets/bootstrap/js/jquery.min.js"></script>

	<!-- Include all compiled plugins  (below), or include individual files as needed -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/postcode.js"></script>
	<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/regex.js"></script>
	<script type="text/javascript">
		
	$(document).ready(function(){
		$("#commonA").change(function() {
			if($("#commonA").is(":checked")){
				var first = "324-334";
				var second = "서울 특별시 강남구";
				var third = "EZEN IT 3층";
				var name = "홍길동";
				var tel = "01012345678";
				var email = "abcd@naver.com";
				
				$("#postcode").attr("value", first);
				$("#addr1").attr("value", second);
				$("#addr2").attr("value", third);
				$("#user_name").attr("value", name);
				$("#tel").attr("value", tel);
				$("#email").attr("value", email);
				
			}else{
				$("#postcode").attr("value", "");
				$("#addr1").attr("value", "");
				$("#addr2").attr("value", "");
				$("#user_name").attr("value", "");
				$("#tel").attr("value", "");
				$("#email").attr("value", "");
			}
		});
	});
	
	/* plus 버튼 기능 */

	$(function() {

	
		var total = parseInt(($("#allPay").attr("value")));
		
		var use = 0;
		var real = 0;
		
		
		$("#couponButton").click(
				function() {
					
					var coupon = parseInt(($("#couponUse option:selected").val()));
					
					use = total * (coupon / 100);
					real = total - use;
					if (coupon == 0) {
						use = 0;
						$("#allSale").attr("value", use);
						$("#realPay").attr("value", real);
					} else {
						$("#allSale").attr("value", use);
						$("#realPay").attr("value", real);
						
					}
						

					
				});

		$("#saveButton").click(
				function() {
					
					var sale = parseInt(($("#allSale").attr("value")));
					var save = parseInt($("#saveUse").val());
					
					
					use = sale + save;
					real = total - use;
					$("#allSale").attr("value", use);
					$("#realPay").attr("value", real);
					
					
				});

	});
	
	

	$(function() {
		
		$("#payButton").click(function(e) {
				
			e.preventDefault();
				
					

					  /** 이름 검사 */
		            if (!regex.value('#user_name', '수령인을 입력하세요.')) { return false; }
		            if (!regex.kor('#user_name', '수령인은 한글만 입력 가능합니다.')) { return false; }
		            if (!regex.min_length('#user_name', 2, '수령인은 최소 2자 이상 입력 가능합니다.')) { return false; }
		            if (!regex.max_length('#user_name', 10, '수령인은 최대 10자 까지만 입력 가능합니다.')) { return false; }

		            /** 이메일 검사 */
		            if (!regex.value('#email', '이메일 입력하세요.')) { return false; }
		            if (!regex.email('#email', '이메일 주소가 잘못되었습니다.')) { return false; }

		            /** 연락처 검사 */
		            if (!regex.value('#tel', '연락처를 입력하세요.')) { return false; }
		            if (!regex.phone('#tel', '연락처가 잘못되었습니다.')) { return false; }
					
		            /** 주소 검사 */
					if ($("input:checkbox[id=payCheck]").is(":checked") == false) {
						swal("결제정보 동의를 체크해 주세요.").then(function(result){
								($("#payCheck").focus());
						});
							
						return false;
					} else {
						location.href="payOk.jsp";
					}

					
	});
});
	
	</script>
</body>

</html>