/**
 * 
 */

/* 이미지 없음(사진 바꾸지않기) */
$(function() {
	$('.min_photo img').mouseover(function() {
		if($(this).attr("src") != "img/noimg.png" ) {
			var source = $(this).attr("src");
			$('.product_img_box img').attr("src", source);
		}
	});
});

function isCheckedPrice(startPrice, bidUnit, topPrice) {
	
	if( topPrice == null ) {
		topPrice = startPrice;
	}
	
	if( $.trim($('#bid_Price').val()) == '' ) {
		alert('입찰 금액을 입력하세요.');
		$('#bid_Price').focus();
		return false;
	} else {
		if( $.trim($('#bid_Price').val()) <= startPrice ) {
			alert('입찰 금액은 시작가보다 커야합니다.');
			return false;
		} else if( (($('#bid_Price').val() - topPrice) % bidUnit) != 0 ) {
			
			alert('입찰단위는 '+bidUnit+'원 입니다. 확인해주세요.');
			return false;
		} else if ( (($('#bid_Price').val() - topPrice) % bidUnit) == 0 ) {
			if( $('#bid_Price').val() - topPrice <= 0 ) {
				alert('입찰 금액은 현재가보다 커야합니다.');
			} else {
			
				var setData = $('#bidInfo').serialize();
				$.ajax({
					type : 'post',
					url : '/setBid',
					data : setData,
					success : function(data) {
						if(data == "1") {
							alert('입찰에 성공하였습니다.');
							location.reload();
						} else {
							alert('입찰에 실패하였습니다.');
						}
					},
					error : function() {
						alert('시스템에러');
					}
				});
			}
		}
	}
}

/* 입찰 팝업 유효성 검사 */
//$(function() {
//	$('#bid_btn').click(function() {
//		
//	});
//});


/* 입찰 팝업 */
$(function() {
	$('#bid_modal').click(function() {
		$('.bid_box').show();
	});
	
	$('#close').click(function() {
		$('.bid_box').hide();
	});
	
	$('#cancel').click(function() {
		$('.bid_box').hide();
	});
});

var modal = document.getElementById('bid_box');

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}






