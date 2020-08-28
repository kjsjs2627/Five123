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

<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	
<!-- ajax helper -->
<link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />	

<!-- 외부 CSS 받아오기 -->
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css"/>
<link rel="stylesheet" type="text/css" href="assets/css/info_idSearch.css"/>


<style type="text/css">

</style>

<!-- 브라우저에 표시될 문서 제목 -->
<title>아이디 찾기</title>
</head>
<body>
<div id="container"> 
	<%@ include file="assets/inc/header.jsp" %>
	<div id="section" class="clearfix">
        <a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
            <span id="back"><img src="assets/img/icon/back.png" /></span>
	    </a>
        <div class="title pull-left">아이디 찾기</div>
    </div>
	<div id="content">
		<form role="form" id="info_idSearch" method="post" action="${pageContext.request.contextPath}/api/search.do">
			<fieldset>
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
</div>	
	

	
	
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/menu.js"></script>
	<script src="assets/js/scroll.js"></script>
	<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>	
	

	<script type="text/javascript">
	$(function(){
		$("#search_ok").click(function(e){
			e.preventDefault();
			var name = $("#name_search").val();
			var email =$("#email_search").val();
			if(!name){
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
			$.post("assets/api/search.do",{name_search: name, email_search : email}, function(req){
				if(req.result=='Ok'){
				
					swal({
						type: 'success',
						text : '가입하신 아이디는 '+req.value+ ' 입니다.'
					});
					$("#name_search").val("");
					$("#email_search").val("");
	                //location.href = 'info_idOk.jsp';
				}else{
					
					swal('에러', '등록된 아이디가 없습니다.', 'error');
					$("#name_search").val("");
					$("#email_search").val("");
				} 
			});
		});
		

	});
	</script>
</body>
</html>