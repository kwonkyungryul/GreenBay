/**
 * 작성자 : 권경렬
 * 작성일 : 2020-05-11
 */

$(function() {
	$('#boardColor').change(function() {
		$('.clrBox').css({
			backgroundColor: $(this).val()
		});
	});
});

/* 한글 게시판 코드 X */
$(function() {
	$('#boardCode').keyup(function() {
		$(this).val( $(this).val().replace(/[0-9]|[^\!-z]/gi,"") );
	});
});

/* boardcheck */
$(function() {
	$('#board_btn').click(function() {
		var boardCode = $('#boardCode');
		var boardName = $('#boardName');
		
		if( !boardCode.val() ) {
			alert('게시판 코드를 입력하세요');
			boardCode.focus();
			return false;
		}
		
		if( !boardName.val() ) {
			alert('게시판 이름을 입력하세요');
			boardName.focus();
			return false;
		}
	});
});

//function boardDelete(boardCode) {
//	var msg = "삭제하신 정보는 복구 불가능합니다.\n선택하신 회원정보를 삭제하시겠습니까 ?";
//	var str = confirm(msg);
//
//	if( str ) {
//		location.href='/board/deleteBoard?boardCode=' + boardCode;
//	}
//}

/* boardCode 중복확인 */
$(function() {
	$('#boardCode').blur(function() {
		$.ajax({
			method: 'post',
			url: '/board/getBoardCodeCheck',
			data: {
				boardCode: $('#boardCode').val()
			},
			success: function(data) {
				if( data == "YES") {
					$('#confirm').html('사용하실 수 있는 게시판 코드입니다.');
				} else {
					$('#confirm').html('사용 중인 게시판 코드입니다.');
					$('#boardCode').val('');
					$('#boardCode').focus();
				}
			},
			error: function() {
				alert('시스템 오류입니다.');
				window.location.reload();
			}
		});
	});
});
