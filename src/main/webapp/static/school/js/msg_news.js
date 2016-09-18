$(function(){
	$(".msg_center_kj li").mouseover(function(){
		$(this).css("border-bottom","1px solid #fff");
		$(this).prev().css("border-bottom","1px solid #fff");
	});
	$(".msg_center_kj li").mouseout(function(){
		$(this).css("border-bottom","1px solid #ebe8e7");
		$(this).prev().css("border-bottom","1px solid #ebe8e7");
	});
})
