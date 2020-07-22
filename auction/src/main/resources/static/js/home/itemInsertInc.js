/**
 * 
 */

function mainCateList() {
	$.ajax({
		type : 'post',
		url	 : '/cate/getMainCateList',
		data : {},
		success : function(data) {
			$.each(data, function(key, value) {
				$('.mainCateSelected').append('<option value="'+value.mainName+'">'+value.mainName+'</option>');
			});
		}
	});
}



/* 소분류 셀렉트박스 */
$(function() {
	$('#mainCate').change(function() {
		var mainCate = $(this).val();
		$.ajax({
			type : 'post',
			url : '/cate/selectedSubCateList',
			data : {
				mainName : mainCate
			},
			success : function(data) {
				var str = '';
				$.each(data, function(key, value) {
					str += '<option value="'+value.subName+'">'+value.subName+'</option>';
				});
				
				$(".subCateSelected").html(str);
			},
			
		});
	});
});


/* image 출력 */
function imgFileViewer(e) {
	sel_files = [];
	$('.imgs_wrap').empty();
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	var index = 0;
	filesArr.forEach(function(f) {
		if( !f.type.match("image.*") ) {
			alert("이미지 파일만 업로드 가능합니다.");
			return;
		}
		
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e) {
			var str = '';
			str += "<a href=\"javascript:void(0);\" id=\"img_"+index+"\" onClick=\"deleteImage("+index+");\"><img src=\""+e.target.result+"\"  class=\"img_size\" /></a>";
			$('.imgs_wrap').append(str);
			index++;
		}
		
		reader.readAsDataURL(f);
		
	});
	
}

/* 이미지 삭제 */
function deleteImage(index) {
	sel_files.splice(index, 1);
	
	var img_id = "#img_"+index;
	$(img_id).remove();
}





/* 유효성 검사 */
$(function() {
	$('#btn').click(function() {
		if( $("#mainCate").val() == '' ) {
			alert("상품 대분류를 선택하세요.");
			$("#mainCate").focus();
			return false;
		}

		if( $("#subCate").val() == '' ) {
			alert("상품 소분류를 선택하세요.");
			$("#subCate").focus();
			return false;
		}
		
		if( $("#item_Name").val() == '' ) {
			alert("상품명을 입력하세요.");
			$("#item_Name").focus();
			return false;
		}
		
		if( $("#item_Detail").val() == '' ) {
			alert("상품 내용을 입력하세요.");
			$("#item_Detail").focus();
			return false;
		}
		
		if( !$("#item_img").val() ) {
			alert("상품 이미지를 선택하세요.");
			$("#item_img").focus();
			return false;
		}
		
		if( $("#item_StartPrice").val() < 1 ) {
			alert("상품 가격은 0보다 커야합니다.");
			$("#item_StartPrice").focus();
			return false;
		}
		
		if( !$("#item_BiddingUnit").val() ) {
			alert("입찰 단위를 입력하세요.");
			$("#item_BiddingUnit").focus();
			return false;
		}
		
		if( $("#sHour").val() == '' ) {
			alert("시작 시간을 선택하세요.");
			$("#sHour").focus();
			return false;
		}
		
		if( $("#eDate").val() == '' ) {
			alert("마감일을 선택하세요.");
			$("#eDate").focus();
			return false;
		}
		
		if( $("#eHour").val() == '' ) {
			alert("마감 시간을 선택하세요.");
			$("#eHour").focus();
			return false;
		}
		
		if( $("#productAmount").val() < 1 ) {
			alert("상품 수량은 0보다 커야합니다.");
			$("#productAmount").focus();
			return false;
		}
	});
});

/* delete */
function checkDelete(pseq) {	
	var str = "상품과 관련된 모든 내용이 삭제됩니다.\n선택하신 상품을 삭제하시겠습니까 ?";
	
	if( confirm(str) ) {
		location.href='/product/setProductDelete?pseq='+pseq;
	}
}





$(document).ready(function() {
	mainCateList();
	
	$("#sDate").datepicker({ dateFormat: "yy-mm-dd"}).datepicker("setDate", new Date());
	$("#startDate").datepicker({ dateFormat: "yy-mm-dd"}).datepicker("setDate", new Date());
	$('#eDate').datepicker({ dateFormat : 'yy-mm-dd' });
	
	
	var sel_files = [];
	$('#item_img').on("change", imgFileViewer);
});