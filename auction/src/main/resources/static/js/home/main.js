/**
 * 
 */

/* 남은 시간 구하기 */
$(function() {
	$(".deadline_chk").each(function(){
		$(this).deadLine();
	});
//	$('.deadHour').html(endHour);
});

$.fn.deadLine=function(){
	
//	var currentDate = new Date();
//	
//	var eDate = $(this).data("end-date");
//	var eDateArr = eDate.split(" ");
//	
//	var eTimeTemp = eDateArr[0];
//	var eHourTemp = eDateArr[1];
//
//	var eTimeArr = eTimeTemp.split("-");
//	
//	var eHourArr = eHourTemp.split(":");
//
//	
//	$('.deadline span').html(eTimeArr[1] + "월 " + eTimeArr[2] + "일 "+eHourArr[0]+"시 마감");
	
	
	
	/* 현재시간 */
	var currentDate = new Date();

	/* 마감시간 */
	var eDate = $(this).data("end-date");
	var eDateArr = eDate.split(" ");

	var eTimeTemp = eDateArr[0];
	var eHourTemp = eDateArr[1];

	var eTimeArr = eTimeTemp.split("-");
	var eHourArr = eHourTemp.split(":");

	var endTime = new Date(eTimeArr[0], eTimeArr[1] - 1, eTimeArr[2], eHourArr[0]);

	var deadDate = Math.floor((endTime.getTime() - currentDate.getTime()) / (1000*60*60*24));

	var deadHour = Math.ceil((endTime.getTime() - currentDate.getTime()) / (1000*60*60));
//		Math.ceil((endTime.getTime() - currentDate.getTime()) / (1000*60*60));

	var deadTime = Math.floor(deadHour % 24);

//	alert(endTime.getTime() / (1000*60*60*24));
//	alert(currentDate.getTime() / (1000*60*60*24));
	
	if(deadDate < 0){
		$(this).find('.deadDate').val("0");
	} else {
		$(this).find('.deadDate').html(deadDate + "일");
	}
	
	if(deadTime < 0){
		$(this).find('.deadTime').html("마감되었습니다");
	} else {
		$(this).find('.deadTime').html(deadTime + "시간 남음");
	}
}


