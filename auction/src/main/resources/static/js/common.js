
/* 현재 시각 */
function showClock() {
    var currentDate = new Date();
    var divClock = document.getElementById("clock");
    var apm = currentDate.getHours();
    var min = currentDate.getMinutes();
    var sec = currentDate.getSeconds();
    var hour = currentDate.getHours();

    if( hour < 10 ) {
        hour = '0' + hour;
    }

    if( min < 10 ) {
        min = '0' + min;
    }

    if( sec < 10 ) {
        sec = '0' + sec;
    }

    if( apm < 12 ) {
        apm = "AM ";
    } else {
        apm = "PM ";
    }
    
    var msg = "현재시간 : ";
    msg += currentDate.getFullYear() + ". ";
    msg += currentDate.getMonth() + 1 + ". ";
    msg += currentDate.getDate() + ". ";
    msg += apm + hour + ":";
    msg += min + ":";
    msg += sec;
    
    divClock.innerText = msg;
    
    setTimeout(showClock, 1000);
}

/* 전체 선택 */
$(function() {
	$('#chkAll').click(function() {
		if( $('#chkAll').is(':checked') ) {
			$('.chk').prop('checked', true);
		} else {
			$('.chk').prop('checked', false);
		}
	});
});