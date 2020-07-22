/**
 * 
 */
/* 댓글 입력 */
$(function() {
	$('#commentSetBtn').click(function() {
		if (!$.trim( $('#comment').val())) {
			alert('댓글 내용을 입력하세요.');
			$('#comment').focus();
			return false;
		} else {
			var setData = $("#commentSet").serialize(); // key, value 형식
			$.ajax({
				type : 'post',
				url : '/comment/commentSet',
				data : setData,
				success : function(data) {
					if( data == 1 ) {
						$('#comment').val('');
						commentList();
					} else {
						alert('시스템 오류입니다.');
					}
				},
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		}
	});
});

/* 댓글 출력 */
function commentList() {
	
	var aseq = $('#aseq').val();
	var boardCode = $('#boardCode').val();
	
	$.ajax({
		type: 'post',
		url: '/comment/getCommentList',
		data: {
			'aseq' : aseq,
			'boardCode' : boardCode
		},
		success: function(data) {
			var str = '';
			var num = 0;
			var cnt = data.length;
			
			$.each(data, function(key, value) {
				str += '<div class="commentArea margin_t10">';
					str += '<div class="commentInfo">';
						str += '댓글 번호 : '+cnt+' / <span class="p_r5">작성자 : '+value.who+'</span>';
						str += '<a href="#" onClick="commentUpdate('+value.cseq+', \''+value.comment+'\')" class="p_r5"><strong>[수정]</strong></a>';
						str += '<a href="#" onClick="commentDelete('+value.cseq+')"><strong>[삭제]</strong></a>';
						str += '<div class="margin_t10 commentContent'+value.cseq+'">';
							str += '<p class="bold">내용 : '+value.comment+'</p>';
						str += '</div>';
					str += '</div>';
					str += '<hr class="margin_t10 margin_b10" />';
				str += '</div>';
				cnt = cnt - 1;
			});
			
			$('.commentList').html(str);
		}
	});
}

/* comment update */
function commentUpdate(cseq, comment) {
	var str = '';

	str += '<div class="input_group">';
		str += '<input type="text" class="input_full p_lr_10" name="comment_'+cseq+'" value="'+comment+'" />';
		str += '<button type="button" class="btn_50 bo_green bold margin_t10" onClick="getCommentUpdate('+cseq+')">수정</button>';
	str += '</div>';

	$('.commentContent' + cseq).html(str); // 내 댓글에 해당되는 내용 위치에 가서 수정으로 변경
}

function getCommentUpdate(cseq) {
	var comment = $('[name=comment_'+cseq+']').val();
	var boardCode = $('#boardCode').val();
	$.ajax({
		type: 'post',
		url: '/comment/setCommentUpdate',
		data: {
			'cseq'		: cseq,
			'comment'	: comment,
			'boardCode' : boardCode
		},
		success: function(data) {
			if( data == 1 ) {
				alert('댓글이 수정되었습니다.');
				commentList();
			}
		},
		error: function() {
			alert('에러');
		}
	});
}

/* comment delete */
function commentDelete(cseq) {
	var boardCode = $('#boardCode').val();
	if ( confirm("댓글 삭제 후 복구가 불가능합니다.\n선택하신 댓글을 삭제하시겠습니까 ? ") ){
		$.ajax({
			type: 'post',
			url: '/comment/setCommentDelete',
			data: {
				'cseq' : cseq,
				'boardCode' : boardCode
			},
			success: function(data){
				if( data == 1 ) {
					commentList();
				}
			}
		});
	} else {
		return false;
	}
}

/* comment 출력 */
$(document).ready(function() {
	commentList();
});