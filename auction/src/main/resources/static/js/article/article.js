/**
 * 작성자 : 권경렬
 * 작성일 : 2020-05-13
 */

/* selectedDelete */
$(function() {
	$('#selectDelete-btn').click(function() {
		var msg = "삭제하신 정보는 복구 불가능합니다.\n선택하신 회원정보를 삭제하시겠습니까 ?";
		var str = confirm(msg);
		
		if( str ) {
			var chkArr = new Array;
			var boardCode = $('.chk').attr('data-code');
			$('.chk:checked').each(function() {
				chkArr.push( $(this).attr("data-aseq") );
			});
			
			$.ajax({
				type: 'post',
				url: '/article/setArticleDeleteAll',
				data: {
					boardCode : boardCode,
					chkArr : chkArr
				},
				success: function(data) {
					if( data == 'success' ) {
						alert('선택하신 게시물 정보가 삭제되었습니다.');
						window.location.reload();
					} else {
						alert("게시물 정보가 삭제되지 않았습니다.\n확인하세요.");
					}
				},
				error: function() {
					alert("선택하신 게시물이 없습니다");
				}
			});
			
		} else {
			
			return false;
		}
	});
});


/* 댓글 출력 */




/* comment delete & update */





/* article delete */
function selectedDelete(boardCode, aseq) {
	var msg = "삭제하신 정보는 복구 불가능합니다.\n선택하신 게시물을 삭제하시겠습니까 ?";
	var str = confirm(msg);

	if( str ) {
		location.href='/article/setArticleDelete?boardCode='+boardCode+'&aseq='+aseq;
	}
}

///* comment btn */
//$('#commentSetBtn').click(function() {
//	if (!$.trim( $('#comment').val())) {
//		alert('댓글 내용을 입력하세요.');
//		$('#comment').focus();
//		return false;
//	}
//	var aseq = "${sessionScope.userName}";
//	alert(aseq);
//});
