$(function(){
	$(".tea_batch_msg ul li").click(function(){
		if($(".tea_batch_check").eq($(this).index()).attr("src")=="/static/school/img/success2_07.png"){
			$(".tea_batch_check").eq($(this).index()).attr("src","/static/school/img/u45.png");
		}else{
			$(".tea_batch_check").eq($(this).index()).attr("src","/static/school/img/success2_07.png");
		}
	});
	var flag7=true;
	$(".all_btn_edit").click(function(){
		if(flag7){
			$(".tea_change").css("display","block");
			flag7=false;
		}else{
			$(".tea_change").css("display","none");
			flag7=true;
		}		
	});
	$(".tea_pk").click(function(){
		$(".tea_all_change").css("display","block");
		$(".tea_change_class").css("display","block");
		$(".tea_change").css("display","none");
		flag7=true;
	});
	$(".tea_btn_cancle").click(function(){
		$(".tea_all_change").css("display","none");
		$(".tea_change_class").css("display","none");
	});
	$(".tea_sta").click(function(){
		$(".tea_all_change").css("display","block");
		$(".tea_change_statue").css("display","block");
		$(".tea_change").css("display","none");
		flag7=true;
	});
	$(".tea_state1").click(function(){
		$(".tea_all_change").css("display","none");
		$(".tea_change_statue").css("display","none");
	});
	var flag8=true;
	$(".tea_check1").click(function(){
		var all_check=getClassNames("tea_batch_check");
		if(flag8){
			for(var i=0;i<all_check.length;i++){
				all_check[i].src="/static/school/img/success2_07.png";
			}
			flag8=false;
		}else{
			for(var i=0;i<all_check.length;i++){			
				all_check[i].src="/static/school/img/u45.png";
			}
			flag8=true;
		}
	});

	$(".tea_change_statue_bj li").click(function(){
		$(".tea_change_statue4").val($(this).html());
		var sss = $(this).attr("livalue");
		
		$("#tea_job_change_state").val(sss);
		
		$(".tea_change_statue_bj").css("display","none");
		flag9=true;
	});
	var flag9=true;
	$(".tea_change_statue3").click(function(){
		if(flag9){
			$(".tea_change_statue_bj").css("display","block");
			flag9=false;
		}else{
			$(".tea_change_statue_bj").css("display","none");
			flag9=true;
		}	
	});
})

