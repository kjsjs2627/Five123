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
<!--    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
   <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.css" />
   <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.min.css" />
	 -->
<!-- ajax helper -->
<link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />	

<!-- 외부 CSS 받아오기 -->
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />


<style type="text/css">
body #content {
	padding: 130px 25px 0 25px;
}
#info_pwSearch{
	margin-top : 50px;
}
.form-group{
	margin-bottom: 25px;
}


.search-form{
	width: 30%;
	line-height: 35px;
	
}
.input-group{
	width: 70%;
}
#search_ok{
	width: 100%;
	font-weight: bold;
	font-size: 20px;
	margin: 20px 0;
}


</style>

<!-- 브라우저에 표시될 문서 제목 -->
<title>아이디 찾기</title>
</head>
<body>
	<%@ include file="assets/inc/header.jsp" %>
	<div id="section" class="clearfix">
        <a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
            <span id="back"><img src="assets/img/icon/back.png" /></span>
	    </a>
     	<div class="title pull-left">비밀번호 찾기</div>
    </div>
	<div id="content">
		<form role="form" id="info_pwSearch" method="post" action="" >
			<fieldset>
				<div class="form-group clearfix">
					<div>
						<label for="id_search" class="search-form pull-left">아이디</label>
					</div>

					<div class="input-group pull-left">
						<input type="text" name="id_search" id="id_search"
							class="form-control" />

					</div>

				</div>
				<div class="form-group clearfix">
					<div>
						<label for="name_search" class="search-form pull-left">이름</label>
					</div>

					<div class="input-group pull-left">
						<input type="text" name="name_search" id="name_search"
							class="form-control" />

					</div>

				</div>
				<div class="form-group clearfix">
					<div>
						<label for="email_search" class="search-form pull-left">이메일</label>
					</div>

					<div class="input-group pull-left">
						<input type="text" name="email_search" id="email_search"
							class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-warning" id="search_ok">확인</button>
				</div>
			</fieldset>
		</form>

	</div>
	<%@ include file="assets/inc/footer.jsp" %>
	

	
	
	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/scroll.js"></script>
	
	<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>	
	

	<script type="text/javascript">

	$(function(){
		$("#search_ok").click(function(e){
			e.preventDefault();
			var id = $("#id_search").val();
			var name = $("#name_search").val();
			var email =$("#email_search").val();
			if(!id){
				swal({
					title: '에러',
					type : 'error',
					text : '아이디를 입력해주세요.'
				});
				return false;
			}else if(!name){
				swal({
					title: '에러',
					type : 'error',
					text : '이름을 입력해주세요.'
				});
				return false;
			}else if(!email){
				swal({
					title: '에러',
					type : 'error',
					text : '이메일을 입력해주세요.'
				});
				return false;
			}
			$.post("assets/api/search.do",{id_search: id, name_search: name, email_search : email}, function(req){
				if(req.result=='Ok'){
					var a="";
					var change = req.value.length-req.value.length/3;
					for(var i=change; i<req.value.length; i++){
						a += "*";
					}
					
					var pw = req.value.replace(req.value.substring(change),a);
					swal({
						type : 'success',
						text : '비밀번호는 '+ pw+ ' 입니다.'
						
					});
					$("#name_search").val("");
					$("#email_search").val("");
					$("#id_search").val("");
	                //window.location = 'info_pwOk.html';
				}else{
					
					swal('에러', '등록된 회원정보가 아닙니다.', 'error');
					$("#name_search").val("");
					$("#email_search").val("");
					$("#id_search").val("");
				} 
			});
		});
		

	});
	
	</script>
</body>
</html>