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
	
	<!-- Sweet Alert 플러그인 CSS 참조 -->
	<link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />

	<!-- 외부 CSS 받아오기 -->
	<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_picCommon.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_reviewCommon.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
    
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- [if lt IE 9] -->
	<script src="assets/bootstrap/js/html5shiv.js"></script>
	<script src="assets/bootstrap/js/respond.min.js"></script>

	<!-- 웹폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet">

    <title>내가 쓴 후기수정</title>
    
    <style type="text/css">
    
    /* 주문 배송상태 디자인 */
    .order .orderDesc #complete {
        color: #3FBC75;
        font-weight: bold;
    }
    
    /* 사진첨부 영역 */
    #content #upload {
    	margin: 20px 0;
    	padding: 20px 0;
    	border-top: 2px solid #ccc;
    	border-bottom: 2px solid #ccc;
    }
    
    #content #upload span {
    	line-height: 20px;
    	margin-right: 10px;
    }
    
    #content #upload input {
    	font-size: 13px;
    }
    
    /*** 문의상품 버튼영역 디자인 시작 ***/
    #problem button {
    	padding: 10px 0;
    	margin: 10px 0;
    }
    
    #problem #submit {
        width: 30%;
        margin-right: 2%;
    }
    
    #problem #cancel {
    	width: 30%;
    	margin-right: 2%;
    }

    #problem #delete {
        width: 30%;
    }
    /*** 문의상품 버튼영역 디자인 끝 ***/
    
    #content .bold {
    	font-weight: bold;
    }
    
    #content .frm p {
    	padding-top: 5px;
    	line-height: 20px;
    	font-size: 12px;
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
			<div class="title pull-left">후기수정</div>	
		</div>
		<div id="content">
            <div id="problem">
                <div id="problemTitle">
                    상품후기
                </div>
                <div class="order clearfix">
                    <div class="orderNumber padding">[2020-06-19] 주문번호 - P237623646186</div>
                    <div class="orderPic pull-left">
                        <img src="assets/img/clothings/4.jpg" alt="cloth" />
                    </div>
                    <div class="orderName padding pull-left">
                        상품이름
                    </div>
                    <div class="orderDesc pull-left">
                        <div id="complete" class="padding">[배송완료]</div>
                        <div class="orderMoney padding">50,000 원</div>
                    </div>
                </div>
                <div id="reviewWrite">후기쓰기</div>
                <form class="frm" enctype="multipart/form-data" method="post">
                	<textarea id="textbox" rows="10" class="problemChoice" placeholder="상세한 후기를 써주세요."></textarea>
                	<div id="upload" class="clearfix">
                		<span class="bold pull-left">사진첨부</span>
                		<input type="file" id="file" class="pull-left"/>
                	</div>
                	<span class="bold">리뷰 작성 전 확인해주세요!</span>
                	<p>
                	1. 포토 리뷰 작성: <span class="bold text-danger">500원</span>/텍스트 리뷰 작성: <span class="bold text-danger">100원</span> <br/>
                	2. 등록된 리뷰는 <span class="bold">한달 후에 삭제</span> 가능합니다. <br/>
                	3. 동일 상품에 대해 포인트 지급은 <span class="bold">1회</span>로 한정 됩니다. <br/>
                	</p>
                	<button value="submit" id="submit" class="btn btn-warning">수정</button>
                	<button value="cancel" id="cancel" class="btn btn-light" onclick="location.href='mypage_myWriteReview.jsp'; return false;">취소</button>
                	<button value="delete" id="delete" class="btn btn-danger">삭제</button>
                	
                </form>
            </div>
        </div>
        
        <%@ include file ="assets/inc/footer.jsp" %>
		
	</div>
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/menu.js"></script>
    <script src="assets/js/scroll.js"></script>
    
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$("#content #submit").click(function(e) { //수정버튼 클릭했을경우
    			e.preventDefault();
    			var hasText = $("#content #textbox").val();
    			if(!hasText) {  //내용 없을시 예외처리
    				swal("후기 없음", "후기를 입력해주세요.", "error").then(function(result) {
    					$("#content #textbox").focus(); //포커스처리
    				});
    				return;
    			}else if(hasText.length < 10) { //내용 10자 미만일시 예외처리
    				swal("", "후기는 10자 이상 입력해주세요.", "warning").then(function(result) {
    					$("#content #textbox").focus(); //포커스처리
    				});
    				return;
    			}else {
    				var hasFile = $("#content #file").val();
    				if(!hasFile) { //파일첨부 안됐을때 예외처리
    					swal("사진을 첨부해주세요.", "", "error").then(function(result) {
    						$("#content #file").focus(); //포커스처리
    					});
    					return;
    				}else if(hasFile.indexOf(".jpg") == -1 && hasFile.indexOf(".png") == -1) {
    					//jpg나 png파일 아닐시 예외처리
    					swal("", "사진은 jpg나 png파일로 첨부해주세요.", "warning").then(function(result) {
    						$("#content #file").focus(); //포커스처리
    					});
    					return;
    				} //end else if
    			} //end if
    			
    			swal("후기가 수정되었습니다.", "" ,"success").then(function(result){
    				history.back(); //수정 후 전페이지로
    			});
    		}); //end click
    		
    		$("#content #delete").click(function(e){ //삭제버튼 눌렀을 경우
    			e.preventDefault();
    			swal({
    				title: "삭제 확인",
    				text: "정말 후기를 삭제하시겠습니까?",
    				type: "warning",
    				confirmButtonText: "삭제", //삭제확인버튼 표시 문구
    				showCancelButton: true, //취소버튼 표시 여부
    				cancelButtonText: "취소" //취소버튼 표시 문구
    			}).then(function(result) { //버튼이 눌러졋을 경우의 콜백 연결
    				if(result.value) { //삭제확인 버튼이 눌러졌을 경우
    					swal("삭제", "성공적으로 삭제되었습니다.", "success").then(function(result){
    						window.location = 'mypage_myWriteList.jsp'; //목록창으로 돌아가기
    					});
    				} else {
    					swal("취소", "삭제가 취소되었습니다.", "warning"); //삭제 취소버튼 눌렀을경우
    				} //end if
    			}); //end swal
    		}); //end click
    	});
    </script>
</body>
</html>