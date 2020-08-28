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
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_dateCommon.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_picCommon.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- [if lt IE 9] -->
	<script src="assets/bootstrap/js/html5shiv.js"></script>
	<script src="assets/bootstrap/js/respond.min.js"></script>

	<!-- 웹폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet">

    <title>내가 쓴 글</title>
    
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var date = new Date();
    		var yy = date.getFullYear();
    		var mm = date.getMonth()+1;	
    		var dd = date.getDate();
    		var today = yy + "-" + monthStr(mm) + "-" + dd; //오늘 날짜 문자열
    		
    		$("#cal #current").val(today);  // 페이지 시작하자마자 날짜 오른쪽 input에 오늘날짜 띄우기
    		 
    		$("#cal input").attr("max", today); // 오늘날짜 다음으로 선택 못하게

    		/** 오늘, 1개월 3개월 6개월 버튼 눌렀을때 */
    		$(".choice button").click(function() {
    			$("#content a").addClass("hidden"); // 모든 글 안보이게
    			
    			if($(this).val() == "today") { //오늘 버튼 클릭시
    				$("#cal #when").val(today); //날짜 왼쪽 input 오늘날짜 띄우기
    				$("#cal #current").val(today); //날짜 오른쪽 input 오늘날짜 띄우기
    				/** 모든 글 날짜 반복으로 검색 */
    				$(".order .orderDate").each(function(){
    					var thisOne = $(this).html().substring(1, 11); //[]포함되었기 때문에 substring
    					if(thisOne == today){ //오늘날짜랑 일치하는 날짜 찾아서
    						$(this).parents("a").removeClass("hidden"); //일치하는 링크 띄워주기
    					}
    				}); //end each

    			} else if($(this).val() == "1") { // 1개월 버튼 클릭시
    				
    				date = new Date(yy, mm-1, dd-30); //오늘날짜 기준 1개월전 날짜
    				
    				var month = date.getMonth() + 1;
    				var howLong = date.getFullYear() + "-" + monthStr(month) + "-" + date.getDate(); //1개월전 날짜 문자열
    				$("#cal #when").val(howLong); //날짜 왼쪽 input에 1개월전 날짜 띄우기
    				$("#cal #current").val(today); //날짜 오른쪽 input 오늘날짜 띄우기
    				
    				/** 모든 글 날짜 반복으로 검색 */
    				$(".order .orderDate").each(function(){
    					var current = getTime($(this).html().substring(1, 11)); //각 날짜시간 TimeStamp
    					
    					if(current >= getTime(howLong)) { //1개월전TimeStamp보다 큰 날짜TimeStamp 찾아서 
    						$(this).parents("a").removeClass("hidden"); //일치하는 링크 띄워주기
    					}
    				}); //end each
    			} else if($(this).val() == "3") { //3개월 버튼 클릭시
    				date = new Date(yy, mm-1, dd-90); //오늘날짜 기준 3개월전 날짜

    				var month = date.getMonth() + 1;
    				var howLong = date.getFullYear() + "-" + monthStr(month) + "-" + date.getDate(); //3개월전 날짜 문자열
    				$("#cal #when").val(howLong); //날짜 왼쪽 input에 3개월전 날짜 띄우기
    				$("#cal #current").val(today); //날짜 오른쪽 input 오늘날짜 띄우기
    				
    				/** 모든 글 날짜 반복으로 검색 */
    				$(".order .orderDate").each(function(){
    					var current = getTime($(this).html().substring(1, 11)); //각 날짜시간 TimeStamp
    					
    					if(current >= getTime(howLong)) { //3개월전TimeStamp보다 큰 날짜TimeStamp 찾아서 
    						$(this).parents("a").removeClass("hidden"); //일치하는 링크 띄워주기
    					}
    				}); //end each
    			} else if($(this).val() == "6"){ //6개월 버튼 클릭시
    				date = new Date(yy, mm-1, dd-180); // 오늘날짜 기준 6개월 

    				var month = date.getMonth() + 1;
    				var howLong = date.getFullYear() + "-" + monthStr(month) + "-" + date.getDate(); //6개월전 날짜 문자열
    				$("#cal #when").val(howLong); //날짜 왼쪽 input에 6개월전 날짜 띄우기
    				$("#cal #current").val(today); //날짜 오른쪽 input 오늘날짜 띄우기
    				
    				/** 모든 글 날짜 반복으로 검색 */
    				$(".order .orderDate").each(function(){
    					var current = getTime($(this).html().substring(1, 11)); //각 날짜시간 TimeStamp
    					
    					if(current >= getTime(howLong)) { //1개월전TimeStamp보다 큰 날짜TimeStamp 찾아서 
    						$(this).parents("a").removeClass("hidden"); //일치하는 링크 띄워주기
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
    		} //end monthStr
    		
    		/** 날짜 조회버튼 클릭했을 경우 */
    		$("#calButton #searchDate").click(function() {
    			$("#content a").addClass("hidden"); // 모든 글 안보이게
    			
    			/** 모든 글 날짜 반복으로 검색 */
    		    $(".order .orderDate").each(function(){
					var min = getTime($("#cal #when").val()); //날짜 input의 왼쪽 상자 시간TimeStamp
					var current = getTime($(this).html().substring(1, 11)); //현재 날짜 시간 TimeStamp
					var max = getTime($("#cal #current").val()); //날짜 input의 오른쪽 상자 시간 TimeStamp
					
					//각 글 날짜날짜가 기간에 포함되는지
					if(min <= current && current <= max) { 
						$(this).parents("a").removeClass("hidden"); //일치하는 링크 띄워주기
					}
				}); //end each
    		}); //end click
    		
    		/**
    		* 날짜 문자열 TimeStamp구해주는 메서드
    		*/
        	function getTime(time){
    			time = new Date(time.substring(0,4), time.substring(5,7), time.substring(8));
    			return time.getTime();
    		}
		});
		
		
	</script>
    <style type="text/css">
    
    	#content .listSection {
    		padding: 10px 20px;
    	}
    	
    	#content a {
    		padding: 20px 20px;
    	}
    	
    	#content .listSection {
    		background-color: #940A37;
    		font-weight: bold;
    		color: #fff;
    	}
    	
    	#content a {
    		display: block;
    		width: 100%;
			border-bottom: 1px solid #ccc;
    	}
    	
    	#content a:last-child {
    		border-bottom: none;
    	}
    	
    	#content span {
    		display: block;
    	}
    	
    	#content .order .orderName {
    		width: 70%;
    	}
    	
    </style>
</head>
<body>

	<div id="container">

		<!-- 헤더영역 -->
		<%@ include file = "assets/inc/header.jsp" %>
		
		<div id="section" class="clearfix">
			<a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
				<span id="back"><img src="assets/img/icon/back.png" /></span>
			</a>
			<div class="title pull-left">내가 쓴 글</div>	
		</div>
		<div id="content">
            <div id="top">
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
                        <input id="when" type="date" /> ~
                        <input id="current" type="date" />
                    </div>
                    <div id="calButton" class="pull-left">
                        <button id="searchDate" value="searchDate" class="padding btn btn-warning">조회</button>
                    </div>
                </div>
            </div>
            <div class="listSection">내가 쓴 문의 글</div>
            	<a href="${pageContext.request.contextPath }/mypage_myWriteProblem.do">
            			<span class="order padding clearfix">
                    		<span class="orderNumber padding">
                    			<span class="orderDate pull-left">[2020-08-17]</span> &nbsp; 주문번호 - P237623646186
                    		</span>
                    		<span class="orderPic pull-left">
                        		<img src="assets/img/clothings/4.jpg" alt="cloth" />
                    		</span>
                    		<span class="orderName padding pull-left">
                        		[교환문의] 색깔이 안 맞아요.
                    		</span>
                		</span>
                </a>
                <a href="${pageContext.request.contextPath }/mypage_myWriteProblem.do">
            			<span class="order padding clearfix">
                    		<span class="orderNumber padding">
                    			<span class="orderDate pull-left">[2020-05-14]</span> &nbsp; 주문번호 - P237623646186
                    		</span>
                    		<span class="orderPic pull-left">
                        		<img src="assets/img/clothings/4.jpg" alt="cloth" />
                    		</span>
                    		<span class="orderName padding pull-left">
                        		[교환문의] 색깔이 안 맞아요.
                    		</span>
                		</span>
                </a>
            <div class="listSection">내가 쓴 후기 글</div>
            	<a href="${pageContext.request.contextPath }/mypage_myWriteReview.do">
            			<span class="order padding clearfix">
							<span class="orderNumber padding">
                    			<span class="orderDate pull-left">[2020-08-17]</span> &nbsp; 주문번호 - P237623646186
                    		</span>                    		
                    		<span class="orderPic pull-left">
                        		<img src="assets/img/clothings/4.jpg" alt="cloth" />
                    		</span>
                    		<span class="orderName padding pull-left">
                        		제 사이즈랑 딱 맞고 색깔도 너무 이쁜거 같아서 맨날 입어요.
                    		</span>
                		</span>
                </a>
                <a href="${pageContext.request.contextPath }/mypage_myWriteReview.do">
            			<span class="order padding clearfix">
							<span class="orderNumber padding">
                    			<span class="orderDate pull-left">[2020-06-07]</span> &nbsp; 주문번호 - P237623646186
                    		</span>                    		
                    		<span class="orderPic pull-left">
                        		<img src="assets/img/clothings/4.jpg" alt="cloth" />
                    		</span>
                    		<span class="orderName padding pull-left">
                        		허리가 너무 커요.
                    		</span>
                		</span>
                </a>
                <a href="${pageContext.request.contextPath }/mypage_myWriteReview.do">
            			<span class="order padding clearfix">
                    		<span class="orderNumber padding">
                    			<span class="orderDate pull-left">[2020-02-25]</span> &nbsp; 주문번호 - P237623646186
                    		</span>
                    		<span class="orderPic pull-left">
                        		<img src="assets/img/clothings/4.jpg" alt="cloth" />
                    		</span>
                    		<span class="orderName padding pull-left">
                        		친구들이 다 어디서 샀냐고 물어봐요.
                    		</span>
                		</span>
                </a>
        </div>
        
        <%@ include file ="assets/inc/footer.jsp" %>
		
	</div>
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/menu.js"></script>
    <script src="assets/js/scroll.js"></script>
</body>
</html>