/**
 * 작성자 : 권경렬
 *  작성일 : 2020 - 06 - 02
 **/

function userDelete(useq) {
	var str = "삭제하신 정보는 복구할 수 없습니다. 삭제하시겠습니까 ?";

	if( confirm(str) ) {
		location.href='/users/userDelete?useq='+useq;
	}
}