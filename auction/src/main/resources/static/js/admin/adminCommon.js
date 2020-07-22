/**
 *  작성자 : 권경렬
 *  작성일 : 2020 - 06 - 02
 */

/* select words */
$(function() {
    $('#search_btn').click(function () {
        var words = $.trim( $('#words').val() );

        if( !words ) {
            alert('검색어를 입력하세요.');
            $('#words').focus();
            return false;
        }
    });
});


