/* 햄버거 버튼 */
function openModal(modalname) {
	document.get
	$("#modal").fadeIn(300);
	$("." + modalname).fadeIn(300);
}

$("#modal, .close").on('click', function() {
	$("#modal").fadeOut(200);
	$(".modal-con").fadeOut(200);
});