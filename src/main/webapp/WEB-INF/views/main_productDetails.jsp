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
		return; //현재 페이지 강제 종료
	}
	
	//String index = request.getParameter("index");
	
%>
<!doctype html>
<html>

<!-- 페이지 설정 부분 -->

<head>
<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우정게 알려준다. - ANSI(euc-kr), UTF-8 -->
<meta charset="utf-8" />
<!-- 스마트 장치에서의 해상도 균일화 처리 -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,    minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- bootstrap -->
   <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css"/>

<!-- 슬라이드 플러그인 CSS 참조 -->
<link rel="stylesheet"
	href="assets/plugins/superslides/stylesheets/superslides.css">
<!-- 외부 CSS 받아오기 -->
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
<link rel="stylesheet" type="text/css"
	href="assets/css/main_product_details.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/scroll.css" /> 
<!-- 웹폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap"
	rel="stylesheet">

<!-- 브라우저에 표시될 문서 제목 -->
<title>제품상세</title>
<style type="text/css">

#gallery li {
    width: 50%;
    float: left;
    padding: 10px 0;
}

#gallery li a {
    display: block;
    width: auto;
}

#gallery li a span {
    overflow: hidden;
    display: block;
    width: 90%;
    margin: auto;
}

#gallery .thumb img {
    width: 100%;

}

/** new gallery text 크기 지정 */
#gallery .text {
    width: 95%;
    height: 30px;
    margin: auto;
    text-align: center;
    padding-top: 5px;
    font-size: 12px;
}

#gallery:after {
    content: '';
    display: block;
    float: none;
    clear: both;
}
/* .removed {
 	margin: 12px 24px 0 3px;
    padding: 5px;
    border:0;
    width: 15%;
    height: 25px;
    text-align: center;
    line-height: 5px;
    	
} */

.p_status{
	width: 55%;
	
}
.p_price{
	width: 30%;
}
.p_price input{
	width : 90%;
}
.p_remove{
	width: 15%;
}
.p_count{
	width: 30%;
	border: 0;
}
#add{ 
	padding: 20px 25px 0 25px;
}
.pChange{
	line-height: 300%;
	padding-right: 20px;
}
.addProduct{
	line-height: 150%;
	border-bottom : 1px solid #ccc;
	padding-bottom : 15px;
	margin-bottom: 15px;
}
.addProduct:last-child{
	border:0;
	margin: 0;
}
.removed{
	margin-top : 7px;
}
#productName{
	width : 100%;
	padding : 10px 23px 30px 23px;
}
#productName div:first-child{
	border-bottom: 1px solid #ccc;
	padding:0 0 10px 0;
	
}
</style>
</head>
<!-- 브라우저에 보여질 부분 -->

<body>
	<div id="container">
		<!-- 헤더영역 -->
		<%@ include file = "assets/inc/header.jsp" %>
		
		<div id="section" class="clearfix">
			<a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
				<span id="back"><img src="assets/img/icon/back.png" /></span>
			</a>
			<div class="title pull-left">제품상세</div>	
		</div>
		<!-- 내용영역 -->
		<div id="content">
			<!-- 슬라이드 영역 -->
			<div id="slide-container">
				<div id="slides">
					<ul class="slides-container">
						<!-- 슬라이드 1 -->
						<li><img src="assets/img/bottom/bottom2.jpg" /></li>
						<!-- 슬라이드 2 -->
						<li><img src="assets/img/bottom/bottom3.jpg" /></li>
						<!-- 슬라이드 3 -->
						<li><img src="assets/img/bottom/bottom6.jpg" /></li>
						<!-- 슬라이드 4 -->
						<li><img src="assets/img/bottom/bottom7.jpg" /></li>
					</ul>
				</div>
			</div>
			<div id="body">
				<!-- 제품이름 설정 -->
				<div id="productName">
					<div>
						<!-- [재입고/누적판매수량6,000장]<br /> 베일ops -->
					</div>
					<p>
						<br />new ! 내츄럴베이지 추가<br /> 핀턱이 잡혀있어 허리라인이 뜨지 않아요<br /> 3년째
						사랑받는 기획특가 원피스
					</p>
				</div>
				<!-- 제품 상세 설정 (색상) -->
				<form id="pColor">
					<div class="purchase clearfix">
						<label class="dropText">컬러 &nbsp;</label> <select
							name="productColor" id="productColor" required="required"
							class="dropdown pull-right">
							<option value="0">&nbsp;&nbsp;[필수] 컬러선택</option>
							<option value="Red">Red</option>
							<option value="Blue">Blue</option>
							<option value="Purple">Purple</option>
						</select>
					</div>

					<!-- <!-- 제품 상세 설정 (사이즈) -->

					<div class="purchase clearfix">
						<label class="dropText">사이즈 &nbsp;</label> <select
							name="p
                    roductSize" id="productSize"
							required="required" class="dropdown pull-right">
							<option value="0">&nbsp;&nbsp;[필수] 사이즈 선택</option>
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
						</select>

					</div>

					<!-- 제품 상세 설정 (수량) -->

					<div id="amount">
						<div class="purchase">
							<label class="dropText pull-left">수량 &nbsp;</label> <input id="amountt"
								class="pull-left" type="text" value="0" /> <img src="assets/img/icon/plus.png" id="plus" />
							<img src="assets/img/icon/minus.png" id="minus" />
							<button id="addCreat" class="btn btn-danger pull-right" type="button" >추가</button>
						</div>
					</div>

					<!-- 추가 기능 부분 -->
					<div id="add" class="clearfix">
						<!-- <div class="addAll">
							<label class="pull-right">수량</label> <input id=""
								class="pull-right" type="text" value="3" disabled="disabled" />
							<label class="pull-right">사이즈</label> <input id="addSize"
								class="pull-right" type="text" value="M" disabled="disabled" />
							<label class="pull-right">컬러</label> <input id="addColor"
								class="pull-right" type="text" value="Red" disabled="disabled" />
						</div> -->
					</div>
					<!-- <div id="sum" class="purchase">
						<span><input id="num" type="text" disabled="disabled"
							value="선택상품금액(수량)                         0   원" /></span>
				
					</div> -->
					<div id="sum_total" class="purchase clearfix">
								<!-- 테스트중 -->
								<span id="totalSum">
									<label class="pull-left">총 상품 금액</label>
									<label class="pull-right">원</label><input class="pull-right" onload="plus();" id="total" type="text" value="0" />
								</span>
					</div>
					<div id="button" class="clearfix">
						<a href="main_basket.jsp"> <input id="addBasket"class="btn btn-warning" type="button" value="장바구니" /></a> 
						<a href="mypage_like.jsp"><input id="addLike" class="btn btn-warning" type="button" value="찜하기" /></a> 
						<a href="info_login.jsp"><input id="addPurchase" class="btn btn-danger"  type="button" value="구매하기" /></a>
					</div>
				</form>
				<!-- 탭의 전체 박스 -->
				<div class="tab">
					<!-- 탭 버튼 영역 -->
					<ul class="tab-button clearfix">
						<li class="tab-button-item pull-left"><a
							class="tab-button-item-link selected" href="#tab-page-1" style="background-color:#fff; color:#4F8A8B; text-decoration: none; border-top : 1px solid #ccc;">상세정보</a>
						</li>
						<li class="tab-button-item pull-left"><a
							class="tab-button-item-link" href="#tab-page-2">배송안내</a></li>
						<li class="tab-button-item pull-left"><a
							class="tab-button-item-link" href="#tab-page-3">상품후기</a></li>
						<li class="tab-button-item pull-left"><a
							class="tab-button-item-link" href="#tab-page-4">상품Q&amp;A</a></li>
					</ul>
					<!-- 내용영역 -->
					<div class="tab-panel clearfix">
						<div id="tab-page-1">
							<div id="newGallery">
								<ul id="gallery">
									<li><span class="thumb"><img
												src="assets/img/bottom/bottom2.jpg" alt="이미지1" /></span> <span
											class="text">세련된 디자인</span>
									</li>
									<li><span class="thumb"><img
												src="assets/img/bottom/bottom3.jpg" alt="이미지2" /></span> <span
											class="text">강렬한 디자인</span>
									</li>
									<li><span class="thumb"><img
												src="assets/img/bottom/bottom4.jpg" alt="이미지3" /></span> <span
											class="text">차분한 디자인</span>
									</li>
									<li> <span class="thumb"><img
												src="assets/img/bottom/bottom5.jpg" alt="이미지4" /></span> <span
											class="text">격식있는 디자인</span>
									</li>
								</ul>
							</div>
						</div>
						<div id="tab-page-2" class="hide">
							<div>
							<ul>
							<li><h3> 배송안내 </h3></li>
							<li>
							<p>
								1. 주문하신 상품의 배송은 결제가 확인되는 대로 배송 준비가 이루어집니다.<br/><br/>
								2. 당일 배송은 오후2시(14시)까지의 입금에 한하여 이루어집니다.<br/><br/>
								3. 배송기간은 서울, 경기지역 2~4일 내외, 그 외 지역 3~5일 내외로 소요됩니다.(단, 택배사의 사정에 따라 기간이 조정될 수 있습니다.)
								출고지 : 경기도 광주 물류센터 (일부 라이센스 상품 제외)<br/>
								결제확인된 다음 날 상품이 발송됩니다. (※금요일 및 주말 결제건은 월요일에 출고됩니다.)<br/>
								출고일에는 '배송 준비 중' 상태이며, 출고 당일 오후에 택배사에서 송장번호 받은 후 입력해드리면 '배송 중' 상태로 변경됩니다.<br/>
								배송조회는 출고일 다음 날 택배사에서 확인가능합니다.<br/>
								택배사의 배송일정은 영업소별로 차이가 있을 수 있기 때문에 저희가 배송 받으실 날짜를 확답드리기 어려우니 이점 양해 부탁드립니다.
							</p>
							</li>
							</ul>
							</div>
						</div>
						<div id="tab-page-3" class="hide">
							
							<ul id="reply">
								<li><a href="${pageContext.request.contextPath}/main_productReview.do?review=상품후기"> <!-- 이미지, 제목, 요약글 --> <span
										class="thumb"><img src="assets/img/bottom/bottom1.jpg"
											alt="이미지1" /></span> <span class="text"> <span class="titles">핏이
												정말 딱 떨어지네요</span><br/> <span class="desc">모델분이랑 비슷한 사이즈로 샀는데 너무
												잘맞아요</span>
									</span>
								</a></li>
								<li><a href="${pageContext.request.contextPath}/main_productReview.do?review=상품후기"> <!-- 이미지, 제목, 요약글 --> <span
										class="thumb"><img src="assets/img/bottom/bottom2.jpg"
											alt="이미지2" /></span> <span class="text"> <span class="titles">생각보다
												길이가 너무 짧네요</span><br/><span class="desc">제가 다리가 긴편이라 치마가 좀 짧게
												느껴지네요.</span>
									</span>
								</a></li>
								<li><a href="${pageContext.request.contextPath}/main_productReview.do?review=상품후기"> <!-- 이미지, 제목, 요약글 --> <span
										class="thumb"><img src="assets/img/bottom/bottom3.jpg"
											alt="이미지3" /></span> <span class="text"> <span class="titles">정말
												만족 합니다.</span><br/> <span class="desc">주말에 데이트 나갈건데 최고</span>
									</span>
								</a></li>
								<li><a href="${pageContext.request.contextPath}/main_productReview.do?review=상품후기"> <!-- 이미지, 제목, 요약글 --> <span
										class="thumb"><img src="assets/img/bottom/bottom4.jpg"
											alt="이미지4" /></span> <span class="text"> <span class="titles">강추합니다
												!!!</span><br/> <span class="desc">색감도 좋고 너무 만족합니다.</span>
									</span>
								</a></li>
								<li><a href="${pageContext.request.contextPath}/main_productReview.do?review=상품후기"> <!-- 이미지, 제목, 요약글 --> <span
										class="thumb"><img src="assets/img/bottom/bottom5.jpg"
											alt="이미지5" /></span> <span class="text"> <span class="titles">색이
												조금 마음에 안드네요.</span><br/> <span class="desc">실제로 받아보니 색이 좀 연하네요.</span>
									</span>
								</a></li>
								<li><a href="${pageContext.request.contextPath}/main_productReview.do?review=상품후기"> <!-- 이미지, 제목, 요약글 --> <span
										class="thumb"><img src="assets/img/bottom/bottom6.jpg"
											alt="이미지6" /></span> <span class="text"> <span class="titles">주름이
												생각보다 없습니다.</span><br/> <span class="desc">주름이 사진보다 많이 없어서 아쉽네요.</span>
									</span>
								</a></li>
							</ul>
						</div>
						<div id="tab-page-4" class="hide">
						<div><button type="button" class="pull-right btn btn-warning" onclick="location.href='main_productQna.jsp'" >글쓰기</button></div>
							<ul id="reply" class="clearfix">
								<li><a href="${pageContext.request.contextPath}/main_productReview.do?review=상품QNA"> <!-- 이미지, 제목, 요약글 --> <span
										class="thumb"><img src="assets/img/bottom/bottom1.jpg"
											alt="이미지1" /></span> 
											<span class="text"> 
												<span class="titles">교환문의</span><br/>
												<span class="desc">사이즈가 작은것같아서 교환합니다.</span>
											</span>
									</a>
								</li>
								<li><a href="${pageContext.request.contextPath}/main_productReview.do?review=상품QNA"> <!-- 이미지, 제목, 요약글 --> <span
										class="thumb"><img src="assets/img/bottom/bottom2.jpg"
											alt="이미지2" /></span> 
											<span class="text"> 
												<span class="titles">반품문의</span><br/> 
												<span class="desc">사진색깔과 달라서 반품합니다.</span>
											</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file ="assets/inc/footer.jsp" %>
	</div>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- 슬라이드 플러그인 JS 참조 -->
	<script src="assets/plugins/superslides/jquery.easing.1.3.js"></script>
	<script src="assets/plugins/superslides/jquery.superslides.min.js"></script>
	<!-- sweetalert 참조 -->
	
	<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="assets/js/menu.js"></script>

	<!-- 동적으로 생성될 HTML의 기본 틀 -->
	<script type="text/x-handlebars-template" id="add-item">
	<div class="clearfix addProduct">
		<div class="pull-left p_status">	
			<div class="test">
				<span class="ptitle">{{{cname}}}</span><br>
				<span>{{{color1}}} / {{{size1}}} / <input id="{{{addAmount1}}}" class="p_count" value="{{{amount1}}}개" disabled="disabled" /> </span>					
			</div>
		</div>
		<div class="p_price pull-left clearfix">
			<span class="pChange pull-right">{{price}}원</span>
		</div>
		<div class="p_remove pull-left">
			<button id="{{rmbutton}}" class="removed btn btn-danger" value="button">삭제</button>
		</div>
	</div>			
	
					
	</script>
					<!--  	<div class="addAll">
							<button id="{{rmbutton}}" class="removed pull-right btn btn-danger" value="button">삭제</button>
							<label id="addNum" class="pull-right">수량</label> <input id="{{{addAmount1}}}" 
								class="sum pull-right" type="text" value="{{{amount1}}}" disabled="disabled" />
							<label class="pull-right">사이즈</label> <input id="addSize"
								class="pull-right" type="text" value="{{{size1}}}" disabled="disabled" />
							<label class="pull-right">컬러</label> <input id="addColor"
								class="pull-right" type="text" value="{{{color1}}}" disabled="disabled" />
							
						</div>-->
	<script src="assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
	<script type="text/javascript">
	/* 옷 추가 */
	
		$(function() {
			index = ${index};
			console.log(index);
			
			var cname ="";
			var cdetail = "";
			var cprice = "";
			$.getJSON('assets/api/${ans}.json', function(data) {
				var json = data.item;
				
				$.each(json, function(i, entry) {
					
					if(index==i){
						cname = entry.cname;
						cdetail = entry.cdetail;
						cprice = entry.cprice;
					}
				});
				
				c_price = Number(cprice);
				
				console.log(cname);
				console.log(cdetail);
				console.log(cprice);
				var c_name = '<span>'+cname+'</span>';
				//$(".test").after(c_name);
				
				//$(".ptitle").text(cname);
				$("#productName").html('<div>' + cname+ '</div><br /><p>' + cdetail + '</p><br/><p>'+cprice+'원</p>');
			});
			//$(".ptitle").text(cname);
			
			var total = 0;
			
			var i = 1;
			$("#addCreat").click(function(e) {
				
				var color = ($("#productColor option:selected").val());
				var size = ($("#productSize option:selected").val());
				var number1 = ($("#amountt").attr("value"));
				var amount = 0;
				amount = parseInt(number1);
				$("amountt").attr("value", amount);
				
				if (color == 0){
					($("#productColor").focus());
					alert("색상을 선택하세요");
		
					return false;
				} else if (size == 0) {
					($("#productSize").focus());
					alert("사이즈를 선택하세요");
					
					return false;
				} else if (number1 == 0) {
					($("#amountt").focus());
					alert("수량을 선택하세요");
					
					return false;
				}
				/* i증가안함 */
				
				var addAmount ="addAmount"+ i;
				var price = number1 * c_price;

				
				var content =
				{	addAmount1:addAmount,
					color1:color,
					size1:size,
					amount1:number1,
					rmbutton: "rmbutton"+i,
					price : price,
					cname : cname
				};
				i++;
				//원래 코드 !!
				var template = Handlebars.compile($("#add-item").html());
				var html = template(content);
				
				$("#add").append(html);
				console.log("색상"+color+" 사이즈"+size+" 수량"+number1+""+addAmount);
				
				var sum = parseInt($('.sum').val());
				
				console.log(number1);
				console.log(total);
				total += number1 * c_price;
				
				$("#total").attr("value", total);
				// 초기화
				$("#amountt").attr("value", 0);
				($("#productColor option:eq(0)").prop("selected", true));
				($("#productSize option:eq(0)").prop("selected", true));
				$("#num").attr("value","선택상품금액(수량)                            0원");
			});
			 var sum = 0;
			$(document).on("click", ".removed", function() {
				var idCheck = $(this).attr('id');
				var idNum=idCheck.substring(8);
				console.log(idNum);
				var minus = parseInt($('#addAmount'+idNum).val());
		        
		         var cMinus = minus * c_price;
		         sum = parseInt(total) - cMinus;
		         console.log(minus+""+total+""+sum);
		         total = sum;
		         $("#total").attr("value", sum)
				// 클릭된 버튼 상위요소인 `.item`찾아서 제거한다.
		         //$(this).parents('.addAll').remove();
		         $(this).parents('.addProduct').remove();
		         
		     });
			
		});
	
		
		/* plus 버튼 기능 */

		$(function() {
			$("#plus").click(
					function() {
						var number = ($("#amountt").attr("value"));
						var plus_num = 0;
						var sum = c_price;
						if (number == 9) { // 숫자가 9이상이라면 초기화}
							alert("너무 많이 선택하셨습니다.");
// 							$("#amountt").attr("value", "0");
// 							$("#num").attr(
// 									"value",
// 									"선택상품금액(수량)                            0원");

						} else {

							plus_num = parseInt(number) + 1;
							$("#amountt").attr("value", plus_num);
							sum = c_price * plus_num;
							$("#num").attr(
									"value",
									"선택상품금액(" + plus_num
											+ ")                         " + sum
											+ "원");

						}
					});

			$("#minus").click(
					function() {
						var number = ($("#amountt").attr("value"));
						var minus_num = 0;
						var sum = c_price;

						if (number <= 1) { // 0이하라면 초기화}
							$("#amountt").attr("value", "0");
							$("#num").attr(
									"value",
									"선택상품금액(수량)                            0원");
						} else {

							minus_num = parseInt(number) - 1;
							$("#amountt").attr("value", minus_num);
							sum = c_price * minus_num;
							
							$("#num").attr(
									"value",
									"선택상품금액(" + minus_num
											+ ")                         " + sum
											+ "원");

						}
					});

		});
		
		/* 찜하기, 장바구니, 구매하기 버튼 클릭 */
		$(function() {
			
			$("#addBasket").click(
					function() {
						var total1 = $("#total").val();
						var color = ($("#productColor option:selected").val());
						var size = ($("#productSize option:selected").val());
						var number1 = ($("#amountt").attr("value"));
						var amount = 0;
						amount = parseInt(number1);
						$("amountt").attr("value", amount);
						
						if (total1 == 0){
							($("#productColor").focus());
							alert("제품을 선택하세요");
				
							return false;
						} 
					});

			$("#addLike").click(
					function() {
						var total1 = $("#total").val();
						var color = ($("#productColor option:selected").val());
						var size = ($("#productSize option:selected").val());
						var number1 = ($("#amountt").attr("value"));
						var amount = 0;
						amount = parseInt(number1);
						$("amountt").attr("value", amount);
						
						if (total1 == 0){
							($("#productColor").focus());
							alert("제품을 선택하세요");
				
							return false;
						} 
					});
			
			$("#addPurchase").click(
					function() {
						var total1 = $("#total").val();
						var color = ($("#productColor option:selected").val());
						var size = ($("#productSize option:selected").val());
						var number1 = ($("#amountt").attr("value"));
						var amount = 0;
						amount = parseInt(number1);
						$("amountt").attr("value", amount);
						
						if (total1 == 0){
							($("#productColor").focus());
							alert("제품을 선택하세요");
				
							return false;
						} 
					});

		});

		/* 슬라이드 기능 */
		$(function() {
			/** `#slides`요소에 대해 플러그인 적용 */
			$('#slides').superslides({
				inherit_width_from : '#slide-container', // 슬라이드의 넓이를 구성할 부모 요소
				inherit_height_from : '#slide-container', // 슬라이드의 높이를 구성할 부모 요소
				play : 4000
			// 재생시간 (1/1000초 단위). 미지정시 자동재생 안됨.

			});
		});

		$(function() {
			/** 탭 버튼의 클릭 처리 */
			$(".tab-button-item-link").click(function(e) {
				// 페이지 이동 방지
				e.preventDefault();

				// 클릭된 요소를 제외한 나머지에게 selected 클래스 제거 --> 배경이미지 원상복구됨
				$(".tab-button-item-link").not(this).removeClass("selected");

				// 클릭된 요소에게 selected 클래스 적용 --> 배경이미지 변경됨
				$(this).addClass("selected");

				var target = $(this).attr('href');
				$(target).removeClass('hide');
				$(".tab-panel > div").not($(target)).addClass('hide');
				
				
				$(".tab-button-item-link").css({
					'background-color':'#4F8A8B',
					'color' : '#fff',
					'border' : '0'
				});
				$(".selected").css({
					'background-color':'#fff',
					'color' : '#4F8A8B',
					'text-decoration': 'none',
					'border-top' : '1px solid #ccc'

				});
				/* if($(this).hasClass('selected')){
					$(".selected").css({
						'background-color':'#fff',
						color : '#4F8A8B',
						'text-decoration' : "none"
					});
				} */
			});
		});
	</script>
</body>

</html>