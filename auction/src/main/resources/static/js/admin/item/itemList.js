/**
 *  작성자 : 권경렬
 *  작성일 : 2020 - 06 - 04
 */

function checkDelete(item_seq) {	
	var str = "상품과 관련된 모든 내용이 삭제됩니다.\n선택하신 상품을 삭제하시겠습니까 ?";
	
	if( confirm(str) ) {
		location.href='/items/setItemDelete?item_seq='+item_seq;
	}
}
$(function() {
	$("#selectDelete_btn").click(function() {
		var msg = "선택하신 상품을 삭제하시겠습니까 ? 삭제후 복구되지 않습니다.";
	
		if ( !confirm(msg) ) {
			return ;
		} else {
			var chkArr = new Array;
			$(".chk:checked").each(function() {
				chkArr.push($(this).attr('data-iseq'));
				
				$.ajax({
					type : 'post',
					url : '/items/setItemDeleteAll',
					data : {
						chkArr : chkArr
					},
					success : function(data) {
						window.location.reload();
					},
					error : function() {
						alert("선택하신 상품이 없습니다.");
					}
				});
			});
	
		}
	});
});