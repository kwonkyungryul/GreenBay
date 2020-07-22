/**
 *  작성자 : 권경렬
 * 	작성일 : 2020 - 06 - 03
 **/

/* 한글 유효성 검사 */
$(function() {
	$('#mainCode').blur(function() {
		var mainCode = $.trim($('#mainCode').val());
		var hangul = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		if( hangul.test(mainCode) ) {
			alert('코드에 한글은 사용할 수 없습니다.');
			$('#mainCode').val('');
			$('#mainCode').focus();
			return false;
		}
	});
	
	$('#subCode').blur(function() {
		var subCode = $.trim($('#subCode').val());
		var hangul = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		if( hangul.test(subCode) ) {
			alert('코드에 한글은 사용할 수 없습니다.');
			$('#subCode').val('');
			$('#subCode').focus();
			return false;
		}
	});
});

/* 대분류 등록 */
$(function() {
	$('#main_btn').click(function() {
		var mainCode = $.trim($('#mainCode').val());
		var mainName = $.trim($('#mainName').val());
		
		if( !mainCode ) {
			alert('대분류 코드를 입력하세요.');
			$('#mainCode').focus();
			return false;
		}
		
		if( !mainName ) {
			alert('대분류 이름을 입력하세요.');
			$('#mainName').focus();
			return false;
		}
		
		$.ajax({
			type : 'post',
			url : '/cate/setMainCate',
			data : {
				mainCode : mainCode,
				mainName : mainName
			},
			success : function(data) {
				if( data == '1' ) {
					alert('대분류가 정상적으로 저장되었습니다.');
					location.reload();
				} else if( data == '2' ) {
					alert('중복되는 대분류 코드입니다.');
					$('#mainCode').val('');
					$('#mainCode').focus();
				} else if( data == '3' ) {
					alert('대분류는 8개 이상 생성할 수 없습니다.');
				}
			},
			error : function() {
				alert("시스템 에러입니다.");
			}
		});
	});
});

/* 소분류 등록 */
$(function() {
	$('#sub_btn').click(function() {
		var subCode = $.trim($('#subCode').val());
		var subName = $.trim($('#subName').val());
		var mainName = $.trim($('.selected_mainCate').val());
		
		if( mainName == "1" ) {
			alert('대분류를 선택하세요.');
			$('.selected_mainCate').focus();
			return false;
		}
		
		if( !subCode ) {
			alert('소분류 코드를 입력하세요.');
			$('#subCode').focus();
			return false;
		}
		
		if( !subName ) {
			alert('소분류 이름을 입력하세요.');
			$('#subName').focus();
			return false;
		}
		
		$.ajax({
			type : 'post',
			url : '/cate/setSubCate',
			data : {
				mainName : mainName,
				subCode : subCode,
				subName : subName
			},
			success : function(data) {
				if( data == '1' ) {
					alert('소분류가 정상적으로 저장되었습니다.');
					location.reload();
				} else {
					alert('중복되는 소분류 코드입니다.');
				}
			},
			error : function() {
				alert("시스템 에러입니다.");
			}
		});
	});
});

/* 대분류 출력 */
function mainCateList() {
	$.ajax({
		type : 'post',
		url : '/cate/getMainCateList',
		data : {},
		success : function(data) {
			var str = '';
			$.each(data, function(key, value) {
				str += '<span class="w_100 h_50 br_3 bg_sky p_a_5 clr_w font_12 margin_r10">' + value.mainName + '('+value.mainCode+')';
					str += '<a href="#" onClick="setDeleteMain(\''+value.mainName+'\')" class="close">&nbsp;';
						str += '<i class="fal fa-do-not-enter clr_w"></i>';
					str += '</a>';
				str += '</span>';
			});
			$('.mainCateArea').html(str);
		}
	});
}

/* 소분류 출력 */
function subCateList() {
	$.ajax({
		type : 'post',
		url : '/cate/getSubCateList',
		data : {},
		success : function(data) {
			var str = '';
			$.each(data, function(key, value) {
				str += '<span class="w_100 h_50 br_3 bg_sky p_a_5 clr_w font_12 margin_r10">' + value.subName + '('+value.mainName+')';
					str += '<a href="#" onClick="setDeleteSub(\''+value.mainName+'\', \''+value.subName+'\')" class="close">&nbsp;';
						str += '<i class="fal fa-do-not-enter clr_w"></i>';
					str += '</a>';
				str += '</span>';
			});
			$('.subCateArea').html(str);
		}
	});
}


/* 대분류 삭제 */
function setDeleteMain(mainName) {
	var str = "삭제하신 정보는 복구할 수 없습니다. 삭제하시겠습니까 ?";
	
	if( confirm(str) ) {
		$.ajax({
			type: 'post',
			url : '/cate/setDeleteMainCate',
			data : {
				mainName : mainName
			},
			success : function(data) {
				window.location.reload();
			},
			error : function() {
				alert("에러");
			}
		});
	} else {
		return false;
	}
}


/* 소분류 삭제 */
function setDeleteSub(mainName, subName) {
	var str = "삭제하신 정보는 복구할 수 없습니다. 삭제하시겠습니까 ?";
	
	if( confirm(str) ) {
		$.ajax({
			type: 'post',
			url : '/cate/setDeleteSubCate',
			data : {
				mainName : mainName,
				subName : subName
			},
			success : function(data) {
				window.location.reload();
			},
			error : function() {
				alert("에러");
			}
		});
	} else {
		return false;
	}
}



/* 소분류박스(대분류셀렉트박스) */
function mainCateSelected() {
	$.ajax({
		type : 'post',
		url : '/cate/getMainCateList',
		data : {},
		success : function(data) {
			$.each(data, function(key,value) {
				$('.selected_mainCate').append('<option value="'+value.mainName+'">'+value.mainName+'</option>');
			});
		}
	});
}




$(document).ready(function() {
	mainCateList();
	subCateList();
	
	mainCateSelected();
});