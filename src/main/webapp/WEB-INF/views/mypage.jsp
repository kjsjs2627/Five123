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
    <link rel="stylesheet" type="text/css" href="assets/css/mypage.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- [if lt IE 9] -->
	<script src="assets/bootstrap/js/html5shiv.js"></script>
	<script src="assets/bootstrap/js/respond.min.js"></script>

	<!-- 웹폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet">

    <title>마이페이지</title>
    
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="assets/js/member.js"></script>
    <script type="text/javascript">
    
    	/**
    	* 원하는 회원의 이름을 입력하면 마이페이지 회원정보 바뀌는 메서드
    	*/
   		$(function() {
			memberInfo("윤수빈");
		});
    	
   		/**
   		* member.js에서 회원정보가져와서 마이페이지 바꿔주는 메서드
   		*/
    	function memberInfo(name) {
    		
   			// 회원 배열의 길이만큼 반복해서 검색
    		for(var i=0; i<member.length; i++){
				if(member[i].name == name){ //json의 회원 이름과 원하는 이름이 같다면
					//json의 정보로 내용 변경
					
					// 회원정보
					$("#name").html(name); 
					$("#level").html(member[i].level); //등급
					
					// 적립금, 쿠폰					
					$("#money").html(member[i].money); 
					$("#coupon").html(member[i].coupon); 
					
					// 주문처리 근황
					$("#notpaid").html(member[i].notpaid);
					$("#prepareShipping").html(member[i].prepareShipping);
					$("#shipping").html(member[i].shipping);
					$("#shipped").html(member[i].shipped);
					
					// 취소, 교환, 반품
					$("#cancelItem").html(member[i].cancelItem);
					$("#exchangeItem").html(member[i].exchangeItem);
					$("#returnItem").html(member[i].returnItem);
				}
				// SELECT로 이름값 찾아와서 맞는 레벨값 넣어주기
    		} //end loop
		
    		
			if($("#level").html() == "[실버]"){ //등급이 실버라면
				$("#level").removeClass();
				$("#level").addClass("silver"); //색 변경
				$("#content #info img").attr("src", "assets/img/my/silver.png"); //이미지 변경
			}else if($("#level").html() == "[골드]"){ //등급이 골드라면
				$("#level").removeClass();
				$("#level").addClass("gold"); //색 변경
				$("#content #info img").attr("src", "assets/img/my/gold.png"); //이미지 변경
			}else if($("#level").html() == "[뚬땜이]"){ //등급이 뚬땜이라면
				$("#level").removeClass();
				$("#level").addClass("dia"); //색 변경
				$("#content #info img").attr("src", "assets/img/my/dia.png"); //이미지 변경
			}else if($("#level").html() == "[퍼플로즈]"){ //등급이 퍼플로즈라면
				$("#level").removeClass();
				$("#level").addClass("purplerose"); //색 변경
				$("#content #info img").attr("src", "assets/img/my/purplerose.png"); //이미지 변경
			} //end if
    	} //end memberInfo(name)
    </script>
</head>
<body>

	<div id="container">

		<!-- 헤더영역 -->
		<%@ include file = "assets/inc/header.jsp" %>
		<div id="section" class="clearfix">
			<a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
				<span id="back"><img src="assets/img/icon/back.png" /></span>
			</a>
			<div class="title pull-left">마이페이지</div>	
		</div>
		
		<div id="content">
            <div id="info" class="clearfix">
                <img class="pull-left" src="" alt="내 등급" />
                <div id="mylevel" class="pull-left">
                    <span id="name"></span>님의 구매등급은 <br />
                    <span id="level"></span>입니다.
                </div>
            </div>
            <div id="point" class="clearfix">
                <div class="pull-right">
                    &nbsp;쿠폰:
                    <span id="coupon">0개</span>
                </div>
                <div class="pull-right">
                    적립금:
                    <span id="money">2000원</span>
                </div>
            </div>
            <div id="orderStatus">
                <div id="statusTitle">
                    <span>나의 주문처리 현황</span>
                    (최근 <span>3개월</span> 기준)
                </div>
                <div id="infoBox" class="clearfix">
                    <div class="status pull-left">
                        <div class="statusBox">
                            입금전
                            <div id="notpaid" class="number"></div>
                        </div>
                    </div>
                    <div class="status pull-left">
                        <div class="statusBox">
                            배송준비중
                            <div id="prepareShipping" class="number"></div>
                        </div>
                    </div>
                    <div class="status pull-left">
                        <div class="statusBox">
                            배송중
                            <div id="shipping" class="number"></div>
                        </div>
                    </div>
                    <div class="status pull-left">
                        <div class="statusBox last">
                            배송완료
                            <div id="shipped" class="number"></div>
                        </div>
                    </div>
                </div>
                <div id="finished" class="clearfix">
                    <div class="return pull-left">
                        <div class="returnBox">
                            취소:
                            <span id="cancelItem" class="number pull-right"></span>
                        </div>
                    </div>
                    <div class="return pull-left">
                        <div class="returnBox">
                            교환:
                            <span id="exchangeItem" class="number pull-right"></span>
                        </div>
                    </div>
                    <div class="return pull-left">
                        <div class="returnBox last">
                            반품:
                            <span id="returnItem" class="number pull-right"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div id="divide"></div>
            <div id="myButton" class="clearfix">
                <ul>
                    <li class="pull-left">
                        <a href="${pageContext.request.contextPath }/mypage_orderCheck.do">
                            <span class="buttons">
                                <img class="btnInfo" src="assets/img/my/calendar.png" alt="주문조회">
                                <span>주문조회</span>
                            </span>
                        </a>
                    </li>
                    <li class="pull-left">
                        <a href="${pageContext.request.contextPath}/mypage_myInfoUpdate.do">
                            <span class="buttons">
                                <img class="btnInfo" src="assets/img/my/update.png" alt="주문조회">
                                <span>회원정보수정</span>
                            </span>
                        </a>
                    </li>
                    <li class="pull-left">
                        <a href="${pageContext.request.contextPath }/mypage_heart.do">
                            <span class="buttons">
                                <img class="btnInfo" src="assets/img/my/heart.png" alt="주문조회">
                                <span>찜목록</span>
                            </span>
                        </a>
                    </li>
                    <li class="pull-left">
                        <a href="${pageContext.request.contextPath }/mypage_myPoint.do">
                            <span class="buttons">
                                <img class="btnInfo" src="assets/img/my/point.png" alt="주문조회">
                                <span>적립금</span>
                            </span>
                        </a>
                    </li>
                    <li class="pull-left">
                        <a href="${pageContext.request.contextPath }/mypage_myWriteList.do">
                            <span class="buttons">
                                <img class="btnInfo" src="assets/img/my/write.png" alt="주문조회">
                                <span>내가 쓴 글</span>
                            </span>
                        </a>
                    </li>
                    <li class="pull-left">
                        <a href="${pageContext.request.contextPath }/mypage_myCoupon.do">
                            <span class="buttons">
                                <img class="btnInfo" src="assets/img/my/coupon.png" alt="쿠폰">
                                <span>쿠폰</span>
                            </span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        
        <%@ include file ="assets/inc/footer.jsp" %>
		
	</div>
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/menu.js"></script>
    <script src="assets/js/scroll.js"></script>
</body>
</html>