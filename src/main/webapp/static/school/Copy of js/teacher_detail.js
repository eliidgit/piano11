$(function(){
	$(".boy").click(function(){
		$(this).css("background","#666");
		$(".girl").css("background","#fff");
	});
	$(".girl").click(function(){
		$(this).css("background","#666");
		$(".boy").css("background","#fff");
	});
	var flag=true;
	$(".teacher_edit").click(function(){
		if(flag){
			$(this).val("取消");
			$(".teacher_base_msg").css({"width":"602px","background":"#f5f5f5","margin-left":"0","padding-left":"98px","margin-top":"20px","margin-bottom":"72px"});
			$(".tea_base_msg1").css("display","none");
			$(".tea_base_msg2").css("display","block");
			$(".teacher_save").css("display","block");
			$(".teacher_top img").attr("src","/static/school/img/teacher_det_03.png");
			$(".teacher_name").html("");
			$(".teacher_name").css("margin-top","95px");
			flag=false;			
		}else{
			$(this).val("编辑");
			$(".teacher_base_msg").css({"width":"500px","background":"#fff","margin-left":"98px","padding-left":"0","margin-top":"0","margin-bottom":"0"});
			$(".tea_base_msg1").css("display","block");
			$(".tea_base_msg2").css("display","none");
			$(".teacher_save").css("display","none");
			$(".teacher_top img").attr("src","../img/teacher_detail_03.png");
			$(".teacher_name").html("谢依晨");	
			$(".teacher_name").css("margin-top","7px");
			flag=true;
		}
	});
	var teacher_base2_edit=getClassNames("teacher_base2_edit");
	var flag=true;
	for(var i=0;i<teacher_base2_edit.length;i++){
		teacher_base2_edit[i].index=i;
		teacher_base2_edit[i].onclick=function(){
			if(flag){
				$(".teacher_bmsgs").eq(this.index).css("width","700px");
				$(".teacher_bmsg1").eq(this.index).css("display","none");
				$(".teacher_bmsg2").eq(this.index).css("display","block");
				$(this).css("top","-38px");
				$(this).val("取消");
				flag=false;
			}else{
				$(".teacher_bmsgs").eq(this.index).css("width","610px");
				$(".teacher_bmsg1").eq(this.index).css("display","block");
				$(".teacher_bmsg2").eq(this.index).css("display","none");
				$(this).val("编辑");
				$(this).css("top","0");
				flag=true;
			}
		}
	}
	var flag1=true;
	$(".tea_base_det").click(function(){
		if(flag1){
			$(".select_teacher").css("display","block");
			flag1=false;
		}else if(flag1==false){
			$(".select_teacher").css("display","none");	
			flag1=true;
		}
	});
	$(".select_teacher li").click(function(){
		$("#tea_base_sex2_input1").val($(this).text());
		$("#tea_base_sex2_input2").val($(this).attr("data-value"));
		$(".select_teacher").css("display","none");	
		flag1=true;
	});
	var flag2=true;
	$(".select_bj").click(function(){
		if(flag2){
			$(".select_class1").css("display","block");
			flag2=false;
		}else{
			$(".select_class1").css("display","none");
			flag2=true;
		}		
	});
	$(".select_nj li").mouseover(function(){
		$(".select_bj"+$(this).index()).css("display","block").siblings().css("display","none");
		console.log("1");
	});
	var flag3=true;
	$(".tea_base_sex1").click(function(){
		if(flag3){
		    $(".tea_job").css("display","block");
		    flag3=false;
		}else{
			$(".tea_job").css("display","none");
			flag3=true;
		}
	});
	$(".tea_job li").click(function(){
		$(".tea_base_job").val($(this).html());
		$(".tea_job").css("display","none");
		flag3=true;
	});
});
