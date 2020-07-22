/**
 *  작성자 : 권경렬
 *  작성일 : 2020 - 06 - 02
 **/

/* 권한 수정 */
function authUpdate(user_Auth, useq) {
	$.ajax({
		type : 'post',
		url : '/users/setAuthUpdate',
		data : {
			user_Auth : user_Auth,
			useq : useq
		},
		success : function(data) {
			if( data == "1" ) {
				alert("권한이 변경되었습니다.");
				window.location.reload();
			}
		},
		error : function() {
			alert("시스템 에러");
		}
	});
}


/* 선택 삭제 */
$(function() {
	var str = "삭제하신 정보는 복구할 수 없습니다. 삭제하시겠습니까 ?";
	
	$('#selectDelete_btn').click(function() {
		if( confirm(str) ) {
			var chkArr = new Array;
			$('.chk:checked').each(function() {
				chkArr.push( $(this).attr('data-useq') );
			});
			$.ajax({
				type : 'post',
				url : '/users/usersDeleteAll',
				data : {
					chkArr : chkArr
				},
				success : function(data) {
					if(data == "1") {
						alert('선택하신 회원정보가 삭제되었습니다.');
						window.location.reload();
					} else {
						alert("삭제에 실패하였습니다. 관리자에게 문의하세요.");
					}
				},
				error : function() {
					alert("회원정보를 한 개 이상 선택해 주세요.");
				}
			});
		} else {
			return false;
		}
	});
});