<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

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
	<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css"/>

	<!-- 외부 CSS 받아오기 -->
	<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_orderCheck.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_dateCommon.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
    
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- [if lt IE 9] -->
	<script src="assets/bootstrap/js/html5shiv.js"></script>
	<script src="assets/bootstrap/js/respond.min.js"></script>

	<!-- 웹폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet">

    <title>주문조회</title>
    
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
    <script src="assets/js/order.js"></script>
    <script type="text/javascript">
    
		$(function() {
    		handleOrders(); //주문들 넣어주기
    		dropBox(); //선택사항 선택시
    		btn(); //버튼들 클릭시
    	});
		
		/**
		* order.js에서 handlebar로 json데이터 주문조회에 넣는 메서드
		*/
		function handleOrders(){
			var template = Handlebars.compile($("#list-item-tmpl").html());
    		var html = template(order);
    		$("#bottom").append(html);
		} 
		
		/**
		* 드롭박스 선택시 전체주문, 배송, 교환상품 나눠서 보여주는 메서드 
		*/
		function dropBox() {
			$("#content select.choice").change(function() { //선택사항 바꼈을떄
    			$("#content .order").addClass("hidden");
    			$("#content .orderList").addClass("hidden"); //모든 주문 hidden 처리
    			
    			var index = $("select.choice").prop("selectedIndex"); // 선택된 index
    			if(index < 1) { //선택사항 없을때
    				$("#content .order").removeClass("hidden");
    				$("#content .orderList").removeClass("hidden"); //모든 주문 띄워주기
        		} else if(index == 1){ //배송중사항 선택시
        			$(".orderDesc .shipping").parents(".order").removeClass("hidden");
        			$(".orderDesc .shipping").parents(".orderList").removeClass("hidden"); //배송중인 주문 띄워주기
        		} else if(index == 2){ //교환사항 선택시
        			$(".orderDesc .exchange").parents(".order").removeClass("hidden");
        			$(".orderDesc .exchange").parents(".orderList").removeClass("hidden"); //교환된 주문 띄워주기
        		} //end if
    		}); //end change
		} //end dropBox()
    	
		/**
		* 오늘, 1개월, 3개월, 6개월 버튼을 눌렀을때나
		* 날짜 조회 버튼을 눌렀을때 실행되는 메서드
		*/
    	function btn() {
    		var date = new Date();
    		var yy = date.getFullYear();
    		var mm = date.getMonth()+1;	
    		var dd = date.getDate();
    		var today = yy + "-" + monthStr(mm) + "-" + dd; //오늘 날짜 문자열
    		
    		$("#cal #current").val(today);  // 페이지 시작하자마자 날짜 오른쪽 input에 오늘날짜 띄우기
    		 
    		$("#cal input").attr("max", today); // 오늘날짜 다음으로 선택 못하게

    		/** 오늘, 1개월 3개월 6개월 버튼 눌렀을때 */
    		$(".choice button").click(function() {
    			$("#content .order").addClass("hidden"); 
    			$("#content .orderList").addClass("hidden"); // 모든 주문 안보이게
    			
    			if($(this).val() == "today") { //오늘 버튼 클릭시
    				$("#cal #when").val(today); //날짜 왼쪽 input 오늘날짜 띄우기
    				$("#cal #current").val(today); //날짜 오른쪽 input 오늘날짜 띄우기
    				/** 모든 주문 날짜 반복으로 검색 */
    				$(".orderInfo .orderDate").each(function(){
    					if($(this).html() == today){ //오늘날짜랑 일치하는 주문날짜 찾아서
    						$(this).parents(".order").removeClass("hidden");
    		    			$(this).parents(".order").find(".orderList").removeClass("hidden"); //일치하는 주문 띄워주기
    					}
    				}); //end each

    			} else if($(this).val() == "1") { // 1개월 버튼 클릭시
    				
    				date = new Date(yy, mm-1, dd-30); //오늘날짜 기준 1개월전 날짜
    				
    				var month = date.getMonth() + 1;
    				var howLong = date.getFullYear() + "-" + monthStr(month) + "-" + date.getDate(); //1개월전 날짜 문자열
    				$("#cal #when").val(howLong); //날짜 왼쪽 input에 1개월전 날짜 띄우기
    				$("#cal #current").val(today); //날짜 오른쪽 input 오늘날짜 띄우기
    				
    				/** 모든 주문 날짜 반복으로 검색 */
    				$(".orderInfo .orderDate").each(function(){
    					var current = getTime($(this).html()); //각 날짜시간 TimeStamp
    					
    					if(current >= date.getTime()) { //1개월전TimeStamp보다 큰 주문날짜TimeStamp 찾아서 
    						$(this).parents(".order").removeClass("hidden");
    		    			$(this).parents(".order").find(".orderList").removeClass("hidden"); //일치하는 주문 띄워주기
    					}
    				}); //end each
    			} else if($(this).val() == "3") { //3개월 버튼 클릭시
    				date = new Date(yy, mm-1, dd-90); //오늘날짜 기준 3개월전 날짜

    				var month = date.getMonth() + 1;
    				var howLong = date.getFullYear() + "-" + monthStr(month) + "-" + date.getDate(); //3개월전 날짜 문자열
    				$("#cal #when").val(howLong); //날짜 왼쪽 input에 3개월전 날짜 띄우기
    				$("#cal #current").val(today); //날짜 오른쪽 input 오늘날짜 띄우기
    				
    				/** 모든 주문 날짜 반복으로 검색 */
    				$(".orderInfo .orderDate").each(function(){
    					var current = getTime($(this).html()); //각 날짜시간 TimeStamp
    					
    					if(current >= date.getTime()) { //3개월전TimeStamp보다 큰 주문날짜TimeStamp 찾아서 
    						$(this).parents(".order").removeClass("hidden");
    		    			$(this).parents(".order").find(".orderList").removeClass("hidden"); //일치하는 주문 띄워주기
    					}
    				}); //end each
    			} else if($(this).val() == "6"){ //6개월 버튼 클릭시
    				date = new Date(yy, mm-1, dd-180); // 오늘날짜 기준 6개월 

    				var month = date.getMonth() + 1;
    				var howLong = date.getFullYear() + "-" + monthStr(month) + "-" + date.getDate(); //6개월전 날짜 문자열
    				$("#cal #when").val(howLong); //날짜 왼쪽 input에 6개월전 날짜 띄우기
    				$("#cal #current").val(today); //날짜 오른쪽 input 오늘날짜 띄우기
    				
    				/** 모든 주문 날짜 반복으로 검색 */
    				$(".orderInfo .orderDate").each(function(){
    					var current = getTime($(this).html()); //각 날짜시간 TimeStamp
    					
    					if(current >= date.getTime()) { //1개월전TimeStamp보다 큰 주문날짜TimeStamp 찾아서 
    						$(this).parents(".order").removeClass("hidden");
    		    			$(this).parents(".order").find(".orderList").removeClass("hidden"); //일치하는 주문 띄워주기
    					}
    				}); //end each
    			} //end if	
    		}); //end click
    		
    		/**
    		* 월이 한글자일때 앞에 0붙여주는 메서드 
    		*/
    		function monthStr(m) {
    			if(String(m).length == 1) {
    				m = "0" + m;
    			}
    			return m;
    		} //end monthStr(m)
    		
    		/** 날짜 조회버튼 클릭했을 경우 */
    		$("#calButton #searchDate").click(function() {
    			$("#content .order").addClass("hidden");
    			$("#content .orderList").addClass("hidden"); //모든 주문 hidden처리
    			
    			/** 모든 주문 날짜 반복으로 검색 */
    		    $(".orderInfo .orderDate").each(function(){
					var min = getTime($("#cal #when").val()); //날짜 input의 왼쪽 상자 시간TimeStamp
					var current = getTime($(this).html()); //현재 날짜 시간 TimeStamp
					var max = getTime($("#cal #current").val()); //날짜 input의 오른쪽 상자 시간 TimeStamp
					
					//각 주문날짜가 기간에 포함되는지
					if(min <= current && current <= max) { 
						$(this).parents(".order").removeClass("hidden");
		    			$(this).parents(".order").find(".orderList").removeClass("hidden"); //포함되면 띄워주기
					}
				}); //end each
    		}); //end click

    	} //end btn()
    	
		/**
		* 날짜 문자열 TimeStamp구해주는 메서드
		*/
    	function getTime(time){
			time = new Date(time.substring(0,4), time.substring(5,7), time.substring(8));
			return time.getTime();
		} 
    	
    </script>
</head>
<body>

	<div id="container">

		<!-- 헤더영역 -->
		<%@ include file = "assets/inc/header.jsp" %>
		
		<div id="section" class="clearfix">
			<a href="mypage.jsp" class="pull-left"> 
				<span id="back"><img src="assets/img/icon/back.png" /></span>
			</a>
			<div class="title pull-left">주문조회</div>	
		</div>
		<div id="content">
            <div id="top">
                <div class="padding clearfix">
                    <div class="name pull-left">상태</div>
                    <select class="choice padding pull-left">
                        <option value="allOrderStatus">전체 주문처리상태</option>
                        <option value="orderShipping">배송중인 상품</option>
                        <option value="orderExchanged">교환</option>
                    </select>
                </div>
                <div class="padding clearfix">
                    <div class="name pull-left">기간</div>
                    <div class="choice pull-left">
                        <button value="today" class="padding btn btn-warning">오늘</button>
                        <button value="1" class="padding btn btn-warning">1개월</button>
                        <button value="3" class="padding btn btn-warning">3개월</button>
                        <button value="6" class="padding btn btn-warning">6개월</button>
                    </div>
                </div>
                <div class="padding clearfix">
                    <div id="cal" class="pull-left">
                        <input id="when" type="date" min="2014-01-01" max=""/> ~
                        <input id="current" type="date" min="2014-01-01" max=""/>
                    </div>
                    <div id="calButton" class="pull-left">
                        <button id="searchDate" value="searchDate" class="padding btn btn-warning">조회</button>
                    </div>
                </div>
            </div>
            <div id="bottom"></div>
      
            <script type="text/x-handlebars-template" id="list-item-tmpl">
				{{#orderPiece}}
				<div class="order">
                <div class="orderInfo padding">
                	<span class="orderDate">{{orderDate}}</span> 주문번호 - <span class="orderNumber">{{orderNumber}}</span>
				</div>
				<ul>
					{{#orderList}}
                    <li class="orderList clearfix">
                        <div class="orderPic pull-left" onclick="location.href='main_productDetails.jsp'; return false;">
                            <img src="{{img}}" alt="cloth" />
                        </div>
                        <div class="orderDesc pull-left">
                            <div class="{{status}} padding">{{orderStatus}}</div>
                            <div class="orderName padding">{{orderName}}</div>
                            <div class="orderMoney padding">{{orderPrice}}</div>
                        </div>
                        <div class="orderBtn pull-left">
                            <button value="help" class="help padding btn btn-warning" onclick="location.href='mypage_orderProblem.jsp'; return false;">문의하기</button>
                            <button value="comment" class="comment padding btn btn-danger" onclick="location.href='mypage_orderReview.jsp'; return false;">후기작성</button>
                        </div>
                    </li>
					{{/orderList}}
				</ul>
                </div>
				{{/orderPiece}}
			</script>
        </div>
        
        <%@ include file ="assets/inc/footer.jsp" %>
		
	</div>
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/menu.js"></script>
    <script src="assets/js/scroll.js"></script>

</body>
</html>