<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우정게 알려준다. - ANSI(euc-kr), UTF-8 -->
    <meta charset="utf-8" />
    <!-- 스마트 장치에서의 해상도 균일화 처리 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,    minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
    <!-- IE의 호환성 보기 모드 금지 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />
    <script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

    <!-- 외부 CSS 받아오기 -->
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mypage_heart.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />

    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet"/>

    <title>mypage_like</title>
<style type="text/css">
       .container {
               margin: 0;
             padding: 0;
             width: 100%;
          }
   </style>
</head>
<body>
<!-- reset 안먹힘  -->
   <div class="container">
      <!-- 헤더 영역-->
      <%@ include file = "assets/inc/header.jsp" %>
      <div id="section" class="clearfix">
            <a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
               <span id="back"><img src="assets/img/icon/back.png" /></span>
            </a>
            <div class="title pull-left">찜목록</div>   
        </div>
      <!-- 내용영역 -->
    <div id="content">
       <div id="like_list">
       <form id="list" name="like_info" method="post"> 
           <div class="btn_all clearfix">
               <input type="button" class="select btn btn-warning pull-right" name="chk" value="전체선택" id="all_select" />
               <input type="button" class="delete btn btn-warning pull-right" name="chk" value="선택삭제" id="select_delete" />
         </div>
          <ul id="like_li">
         
         </ul>  
      </form>           
      <div id="select">
         <div class="btn_all_basket">
            <button type="submit" class="all_basket btn btn-warning" name="all_order" id="all_basket">상품 장바구니 담기</button>
         </div>
      </div>
      </div>    
  </div>
<!-- 하단 영역 -->
      <%@ include file = "assets/inc/footer.jsp" %>
      </div>
       <script src="assets/js/menu.js"></script>
       <script src="assets/js/scroll.js"></script>
    <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script src="assets/js/pagination.js"></script>
   <script src="assets/api/like.js"></script>
    <script src="assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
   
   <script type="text/x-handlebars-template" id="like_a">
      {{#item}}
         <li class="list">
            <div class="like">
               <div class="details clearfix">
                  <div class="img_a pull-left">
                     <a href="main_productDetails.jsp" class="pull-left">
                     <img class="pull-left" alt="cloth" src="{{img}}"></a>
                  </div>
                  <div class="name_a pull-left">
					 <div class="title_a pull-left">
                     	<h3 class="title_name pull-left">
                     		<a href="main_productDetails.jsp" class="pull-left">{{name}}</a>
                     	</h3>
					 </div>
					 <div class="color pull-left">
					 	<input type="text" class="color_name pull-left" value="[ {{color}} ]" disabled="disabled" />
					 </div>
                  </div>
                  <div class="chk">
                     <input type="checkbox" name="chk" id="check" class="select_a pull-right" value="상품이름"/>
                  </div>
                  <div class="pic clearfix">
                     <p class="price_a pull-right">{{won}}</p>
                     <p class="price pull-right">{{price}}</p>
                  </div>
               </div>
               
            </div>
         </li>
      {{/item}}
    </script>   
    <script type="text/javascript">
    // js
    $(function() {
      paging(totalData, dataPerPage, pageCount, 1);
      var template = Handlebars.compile($("#like_a").html());
      var html = template(data);
      $("#like_li").append(html);   
    });
    
   // checkbox 전체 선택 & 해지
   $(function() {
   		$("#all_select").click(function() {
      		if($("input:checkbox[name='chk']").is(":checked") == false) {
         	   	$("input:checkbox[name='chk']").prop("checked", true);
      		} else {
         	   	$("input:checkbox[name='chk']").prop("checked", false);
      		}    
   		});
   });
        
   // 선택 삭제
   $(function() {
     	$("#select_delete").click(function() {
		if ($("input:checkbox[name='chk']").is(":checked") == true) {
					swal({
						title : '확인',
						text : "정말 선택하신 항목을 삭제하시겠습니까?",
						type : 'warning',
						confirmButtonText : 'Yes',
					}).then(function(result) {
						if (result.value) {
							$("input[name=chk]:checked").each(function() {

								$(this).parents('.list').remove();
								swal('삭제', '성공적으로 삭제되었습니다.', 'success');
								if ($(".list") == null) {
									var tmpHtml = "";
									tmpHtml = tmpHtml
											+ "<div class='add'>찜목록이 비었습니다.</div>"
									$("#like_li").append(
											tmpHtml);
								}
							});
						} else if (result.dismiss === 'cancel') {
							swal('취소', '삭제가 취소되었습니다.', 'error');
							return false;
						}
					});
				} else {
					swal({
						title : '상품을 선택하세요.',
						text : "선택된 상품이 존재 하지 않습니다.",
						type : 'warning',
						confirmButtonText : '확인',
						showCancelButton : false,
						cancelButtonText : null,
					});
				}
			});
     	
     	$("#all_basket").click(function() {
     		if ($("input:checkbox[name='chk']").is(":checked") == true) {
     			swal({
					title : '확인',
					text : "선택하신 상품을 장바구니에 담겠습니까?",
					type : 'warning',
					confirmButtonText : 'Yes',
				}).then(function(result) {
					if (result.value) {
						$("input[name=chk]:checked").each(function() {
							swal('확인', '장바구니에 담겼습니다.', 'success').then(function(result) {
    				        	window.location = 'main_basket.jsp';
							});	
						});
					} else if (result.dismiss === 'cancel') {
						swal('취소', '장바구니담기가 취소되었습니다.', 'error');
						return false;
					}
				});
			} else {
				swal({
					title : '상품을 선택하세요.',
					text : "선택된 상품이 존재 하지 않습니다.",
					type : 'warning',
					confirmButtonText : '확인',
					showCancelButton : false,
					cancelButtonText : null,
				});
			}
		});
     });
   
   

   
     
     
    </script>

</body>

</html>