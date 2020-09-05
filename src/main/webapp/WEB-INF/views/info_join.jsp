<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 설정 부분 -->

<head>
<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우정게 알려준다. - ANSI(euc-kr), UTF-8 -->
<meta charset="utf-8" />
<!-- 스마트 장치에서의 해상도 균일화 처리 -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,    minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap"
	rel="stylesheet" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css"/>
	


<!-- ajax helper -->
<link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />	
<!-- 외부 CSS 받아오기 -->
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
<link rel="stylesheet" type="text/css" href="assets/css/gallery.css" />
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assets/css/info_join.css" />
<link rel="stylesheet" type="text/css" href="assets/css/menu.css"/>
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css"/>


<style type="text/css">
	#wrap{
		display:none;
		border:1px solid;
		width:360px;
		height:300px;
		margin:5px 0;
		position:relative;
	}
	.btn-warning{
		height: 34px;
	}

</style>

<!-- 브라우저에 표시될 문서 제목 -->
<title>withFiveBird</title>
</head>
<body>
<div id="container">
	<%@ include file = "assets/inc/header.jsp" %>
	<div id="section" class="clearfix">
    	<a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
        	<span id="back"><img src="assets/img/icon/back.png" /></span>
	    </a>
       	<div class="title pull-left">회원가입</div>
    </div>
	<div id="content">
		<!-- 베너영역 -->

		<div class="agree">
			<br />
			<p class="agree_title">5조 프로젝트 용 이므로 약관 동의에 대한 효력이 없습니다.</p><br />
			<p class="agree_title">1 조(목적)</p>
			<br />
			<p>
				본 약관은 국가공간정보포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및
				절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br />
				<br />
			</p>
			<p class="agree_title">2 조(목적)</p>
			<br />
			<p>
				본 약관은 국가공간정보포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및
				절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br />
				<br />
			</p>
			<p class="agree_title">3 조(목적)</p>
			<br />
			<p>
				본 약관은 국가공간정보포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및
				절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br />
				<br />
			</p>
			<p class="agree_title">4 조(목적)</p>
			<br />
			<p>
				본 약관은 국가공간정보포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및
				절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br />
				<br />
			</p>
		</div>
	

		<div class="form-information clearfix">
			<div class="pull-left fontbold">기본 정보</div>
			<div class="pull-right identify fontbold">필수*</div>

		</div>
		<form role="form" id="join_form" method="post" action='${pageContext.request.contextPath}/info_joinOk.do'>
			<fieldset>
				<div class="form-group clearfix">
					<div>
						<label for="user_id" class="user-form pull-left">아이디<span
							class="identify">*</span></label>
					</div>

					<div class="input-group pull-left">
						<input type="text" name="user_id" id="user_id"
							class="form-control" placeholder="아이디를 입력하세요." /> <span
							class="input-group-btn">
							<button type="button" class="btn btn-warning"
								id="id_unique_check" >중복검사</button>
						</span>
					</div>

				</div>

				<div class="form-group clearfix">
					<div>
						<label for="user_pw" class="user-form pull-left">비밀번호<span
							class="identify">*</span></label>
					</div>

					<div class="input-group pull-left">
						<input type="password" name="user_pw" id="user_pw"
							class="form-control" placeholder="비밀번호를 입력하세요." />
					</div>
				</div>

				<div class="form-group clearfix">
					<div>
						<label for="user_pw_re" class="user-form pull-left">비밀번호확인<span
							class="identify">*</span></label>
					</div>

					<div class="input-group pull-left">
						<input type="password" name="user_pw_re" id="user_pw_re"
							class="form-control" placeholder="비밀번호와 같아야합니다." />
					</div>
				</div>

				<div class="form-group clearfix">
					<div>
						<label for="user_name" class="user-form pull-left">이름<span
							class="identify">*</span></label>
					</div>

					<div class="input-group pull-left">
						<input type="text" name="user_name" id="user_name"
							class="form-control" placeholder="한글, 최대 10글자" />
					</div>
				</div>

				<div class="form-group clearfix">
					<div>
						<label for="user_tel" class="user-form pull-left">연락처<span
							class="identify">*</span></label>
					</div>

					<div class="input-group pull-left">
						<input type="text" name="user_tel" id="user_tel" class="form-control"
							placeholder="'-'없이 숫자만 입력하세요." />
					</div>
				</div>

				<div class="form-group clearfix">
					<div>
						<label for="user_email" class="user-form pull-left">이메일<span
							class="identify">*</span></label>
					</div>

					<div class="input-group pull-left">
						<input type="text" name="user_email" id="user_email" class="form-control"
							placeholder="이메일을 입력하세요." />
						
					</div>
				</div>

				<div class="form-group clearfix">
					<div>
						<label for="user_postcode" class="user-form pull-left">주소<span
							class="identify">*</span></label>
					</div>

					<div class="input-group">
						<div class="clearfix">
							<input type="text" name="user_postcode" id="user_postcode"
								class="form-control pull-left" readonly /> <span
								class="input-group-btn">
								<button type="button" id="postnum"
									class="btn btn-warning pull-left "
									 data-addr1="#user_addr1"
									data-addr2="#user_addr2" onclick="post()">우편번호</button>
							</span>
						</div>
					</div>
					<div class="input-group">
						<input type="text" name="user_addr1" class="form-control address"
							id="user_addr1" readonly />
					</div>
					<div class="input-group">
						<input type="text" name="user_addr2" class="form-control address"
							id="user_addr2" />
					</div>
					<div id="wrap" >
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
				</div>
		
				<div class="form-group">
					<button type="submit" class="btn btn-danger" id="join_ok" >가입하기</button>
				</div>

			</fieldset>
		</form>
		
	</div>
	<%@ include file="assets/inc/footer.jsp" %>
</div>	
	
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	
	
	<script src="assets/plugins/ajax-form/jquery.form.min.js"></script>
	<script src="assets/js/postcode.js"></script>
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/scroll.js"></script>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="assets/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/plugins/validate/additional-methods.min.js"></script>
	<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
	
	<script type="text/javascript">
	/** 플러그인 기본 설정 옵션 추가 */

	
	$(function() {
		var check=false;
		/** 플러그인의 기본 설정 옵션 추가 */
		jQuery.validator.setDefaults({
			onkeyup : false, // 키보드 입력시 검사 안함
			onclick : false, // <input>태그 클릭시 검사 안함
			onfocusout : false, // 포커스가 빠져나올 때 검사 안함
			showErrors : function(errorMap, errorList) { // 에러 발생시 호출되는 함수 재정의

				// 에러가 있을때만..
				if (this.numberOfInvalids()) {
					swal({
						title : "에러",
						text : errorList[0].message,
						type : "error"
					}).then(function(result) {
						// 창이 닫히는 애니메이션의 시간이 있으므로, 0.1초의 딜레이 적용 후 포커스 이동
						setTimeout(function() {
							$(errorList[0].element).val('');
							$(errorList[0].element).focus();
						}, 100);
					});
				}
				
			}
		});

		/** 유효성 검사 추가 함수 */
		$.validator.addMethod("kor", function(value, element) {
			return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value);
		});

		$.validator.addMethod("phone", function(value, element) {
			return this.optional(element) || /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value) || /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
		});

		/** form 태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
		$("#join_form").validate({

			/** 입력검사 규칙 */
			rules : {
					
				// [아이디] 필수 + 알파벳 숫자 조합만 허용
				user_id : {
					required : true,
					alphanumeric : true,
					minlength : 5,
					maxlength : 20,
				},
				// [비밀번호] 필수 + 글자수 길이 제한
				user_pw : {
					required : true,
					minlength : 8,
					maxlength : 20
				},
				// [비밀번호 확인] 필수 + 특정 항목과 일치 (id로 연결)
				user_pw_re : {
					required : true,
					equalTo : "#user_pw"
				},
				// [이름] 필수
				user_name : {
					required : true,
					kor : true,
					minlength: 2,
					maxlength: 10
				},
				// [연락처] 필수
				tel : {
					required : true,
					phone : true
				},
					// [이메일] 필수 + 이메일 형식 일치 필요
				email : {
					required : true,
					email : true
				},
				postcode : {
					required: true
				},
					 
			    addr2:{
			      	required: true
			    }

			},

			/** 규칙이 맞지 않을 경우의 메시지 */
			messages : {
				

				user_id : {
					required : "아이디를 입력하세요.",
					alphanumeric : "아이디는 영어, 숫자만 입력 가능합니다.",
					minlength : "아이디는 5글자 이상 입력하셔야 합니다.",
					maxlength : "아이디는 최대 20자까지 가능합니다."
				},
				user_pw : {
					required : "비밀번호를 입력하세요.",
					minlength : "비밀번호는 8글자 이상 입력하셔야 합니다.",
					maxlength : "비밀번호는 최대 20자까지 가능합니다."
				},
				user_pw_re : {
					required : "비밀번호 확인을 입력하세요.",
					equalTo : "비밀번호 확인이 잘못되엇습니다."
				},
				// [이름] 필수
				user_name : {
					required : "이름을 입력하세요.",
					kor : "이름은 한글만 입력 가능합니다.",
					minlength: "이름은 2글자 이상 입력하셔야 합니다.",
					maxlength: "이름은 최대 10글자까지 가능합니다."
				},

				// [연락처] 필수
				tel : {
					required : "연락처를 입력하세요.",
					phone : "연락처 형식이 잘못되었습니다."
				},// [이메일] 필수 + 이메일 형식 일치 필요
				email : {
					required : "이메일을 입력하세요.",
					email : "이메일 형식이 잘못되었습니다."
				},
				postcode : {
					required: "주소를 입력하세요."
				},
				addr2:{
			       	required: "상세주소를 입력해주세요."
			    }
			}
		}); // end validate()
			
		$('#join_form').ajaxForm({
			// submit 전에 호출된다.
		    beforeSubmit: function(arr, form, options) {
		    	// validation 플러그인을 수동으로 호출하여 결과를 리턴한다.
		        // 검사규칙에 위배되어 false가 리턴될 경우 submit을 중단한다.
		        return $(form).valid();
		    },
		    success: function(json) {
// 		    	if(!check){ // 중복검사 안하고 누르면 alert나오는데 db저장됨 (문제)
// 		        	swal('에러', '중복검사를 해주세요.', 'error');
// 		        }
//		        else{
			 		var dataArr = new Array();
		        	
		        	var dataObj = new Object();
		        			
		        	dataObj.id=$("#user_id").val();
		        	dataObj.pw=$("#user_pw").val();
		        	dataObj.name=$("#user_name").val();
		        	dataObj.tel=$("#tel").val();
		        	dataObj.email=$("#email").val();
		        	dataObj.postcode=$("#postcode").val();
		        	dataObj.addr1=$("#addr1").val();
		        	dataObj.addr2=$("#addr2").val();
		        	dataArr.push(dataObj);		        			
		        		
		        	var jsonData = JSON.stringify(dataArr);
									
	
		        	console.log(jsonData);
		        	swal({
						title : '알림',
						text : '회원가입이 완료되었습니다. 로그인 해 주세요.',
						type : 'success'
					}).then(function(){
						location.href='${pageContext.request.contextPath}/info_joinC.do';
					}); // end swal
		        }
		            
// 		     }
		}); // end ajaxForm
			
	
		/** 버튼 클릭시 이벤트(중복검사 수정해야 함) */
		 
		$("#id_unique_check").click(function(){
			// 입력값을 취득하고, 내용의 존재여부를 검사한다.
			var user_id_val = $("#user_id").val();
			
			if(!user_id_val){ // 입력되지 않았다면?
				swal('알림', '아이디를 입력하세요.', 'warning');
				$("#user_id").focus(); // <-- 커서를 강제로 넣기
				return false; // <-- 실행중단
			}
			// 위의 if문을 무사히 통과했으면 내용이 존재한다는 의미
			// 입력된 내용을 Ajax를 사용해서 웹 프로그램에게 전달한다.
			$.post("assets/api/id_unique_check.do",{user_id:user_id_val}, function(req){
				// 사용 가능한 아이디인 경우 --> req = {result : "Ok"};
				// 사용 불가능한 아이디인 경우 --> req = {result: "FAIL"};
				if(req.result=='Ok'){
					swal('확인', '사용가능한 아이디 입니다.', 'success');
					check=true;
				} else{
					swal('에러', '사용불가능한 아이디 입니다.', 'error');
					$("#user_id").val("");
					$("#user_id").focus();
				}
			}); // end $.post
		
		}); // end click */
	});

	</script>
</body>
</html>