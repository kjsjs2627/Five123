<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
<link rel="stylesheet" type="text/css" href="assets/css/menu.css"/>
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css"/>
<link rel="stylesheet" type="text/css" href="assets/css/info_update.css"/>


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
       	<div class="title pull-left">회원정보수정</div>
    </div>
	<div id="content">
		<!-- 베너영역 -->

		<div class="agree">
			<br />
			<p class="agree_title">개인정보 보호에 각별히 주의하세요.</p><br />

			<p>
				기억하세요! 개인정보는 여러분의 소중한 정보입니다.<br />
				개인정보를 각별히 보관하시고, 3개월 혹은 6개월에 한번씩 변경하세요.<br />
			</p>
			
		</div>
	
		<div class="form-information clearfix">
			<div class="pull-left fontbold">기본 정보</div>
			<div class="pull-right identify fontbold">필수*</div>

		</div>
		<form role="form" id="join_form" method="post" novalidate="novalidate">
			<fieldset>
				<div class="form-group clearfix">
					<div>
						<label for="user_id" class="user-form pull-left">아이디<span
							class="identify">*</span></label>
					</div>

					<div class="input-group pull-left">
						<input type="text" name="user_id" id="user_id"
							class="form-control" value ="subin" readonly /> 
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
							class="form-control" value="윤수빈" readonly/>
					</div>
				</div>

				<div class="form-group clearfix">
					<div>
						<label for="tel" class="user-form pull-left">연락처<span
							class="identify">*</span></label>
					</div>

					<div class="input-group pull-left">
						<input type="text" name="tel" id="tel" class="form-control"
							placeholder="'-'없이 숫자만 입력하세요." />
					</div>
				</div>

				<div class="form-group clearfix">
					<div>
						<label for="email" class="user-form pull-left">이메일<span
							class="identify">*</span></label>
					</div>

					<div class="input-group pull-left">
						<input type="text" name="email" id="email" class="form-control"
							placeholder="이메일을 입력하세요." />
						
					</div>
				</div>

				<div class="form-group clearfix">
					<div>
						<label for="postcode" class="user-form pull-left">주소<span
							class="identify">*</span></label>
					</div>

					<div class="input-group">
						<div class="clearfix">
							<input type="text" name="postcode" id="postcode"
								class="form-control pull-left" readonly /> <span
								class="input-group-btn">
								<button type="button" id="postnum"
									class="btn btn-warning pull-left "
									 data-addr1="#addr1"
									data-addr2="#addr2" onclick="post()">우편번호</button>
							</span>
						</div>
						<div id="wrap" >
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
					</div>
					<div class="input-group">
						<input type="text" name="addr1" class="form-control address"
							id="addr1" readonly />
					</div>
					<div class="input-group">
						<input type="text" name="addr2" class="form-control address"
							id="addr2" />
					</div>
				</div>
		
				<div class="form-group clearfix">
					<button type="submit" class="btn btn-danger pull-left" id="update_ok">회원정보수정</button>
					<button type="button" class="btn pull-left" id="update_no" onclick="location.href='${pageContext.request.contextPath}/mypage.do'">취소</button>
					<button type="button" class="btn pull-right" id="delete" onclick="location.href='${pageContext.request.contextPath}/mypage_myInfoOut.do'">회원탈퇴</button>
					
				</div>

			</fieldset>
		</form>
	</div>
	<%@ include file="assets/inc/footer.jsp" %>
</div>	
	
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	
	
	<script src="assets/plugins/ajax-form/jquery.form.min.js"></script>
	<script src="assets/js/postcode.js"></script>
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/scroll.js"></script>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
	<script src="assets/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/plugins/validate/additional-methods.min.js"></script>
	<script type="text/javascript">
	/** 플러그인 기본 설정 옵션 추가 */

	
	$(function() {
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
				user_pw : {
					required : "비밀번호를 입력하세요.",
					minlength : "비밀번호는 8글자 이상 입력하셔야 합니다.",
					maxlength : "비밀번호는 최대 20자까지 가능합니다."
				},
				user_pw_re : {
					required : "비밀번호 확인을 입력하세요.",
					equalTo : "비밀번호 확인이 잘못되엇습니다."
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
		        swal('알림', '회원정보가 수정되었습니다.', 'success').then(function(result) {
			                location.href = '${pageContext.request.contextPath}/mypage.do';
			    });
		    }
		}); // end ajaxForm	
	});
	</script>
</body>
</html>