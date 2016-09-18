$(function(){
	$(".course_top li").click(function(){
		$(".courseware_center_sum"+$(this).index()).css("display","block").siblings().css("display","none");
		if($(this).index()==1){
			$(".course_select").css("display","block");
		}else{
			$(".course_select").css("display","none");
		}
		$(this).addClass("course_topact").siblings().removeClass("course_topact");
	});
});
