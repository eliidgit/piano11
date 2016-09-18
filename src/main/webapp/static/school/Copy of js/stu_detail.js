$(function(){
	var flag=true; 
	$(".teacher_edit").click(function(){
		if(flag){
			$(".tea_base_msg1").css("display","none");
			$(".tea_base_msg2").css("display","block");
			$(".stu_base_tit3").css("display","none");
			$(".stu_base_tit1").css("width","700px");
			$(".teacher_top img").attr("src","/static/school/img/teacher_det_03.png");
			$(".teacher_name").css("display","none");
			$(".teacher_top").css("marginBottom","80px");
			$(".teacher_top img").css({"top":"31px","left":"50%"});
			$(".teacher_base_msg").css({"background":"#f5f5f5","width":"602px","paddingBottom":"78px"});
			$(".teacher_save").css("display","block");
			$(this).val("取消");
			flag=false;
		}else{
			$(".tea_base_msg1").css("display","block");
			$(".tea_base_msg2").css("display","none");
			$(".stu_base_tit3").css("display","block");
			$(".stu_base_tit1").css("width","620px");
			$(".teacher_name").css("display","block");
			$(".teacher_top img").attr("src","/static/school/img/teacher_detail_03.png");
			$(".teacher_top").css("marginBottom","40px");
			$(".teacher_top img").css({"top":"28px","left":"47%"});
			$(".teacher_base_msg").css({"background":"#fff","width":"402px","paddingBottom":"0"})
			$(this).val("编辑");
			$(".teacher_save").css("display","none");
			flag=true;
		}		
	});
	var teacher_base2_edit=getClassNames("teacher_base2_edit");
	var flag1=true;
		for(var i=0;i<teacher_base2_edit.length;i++){
			teacher_base2_edit[i].index=i;
			teacher_base2_edit[i].onclick=function(){
				if(flag1){
					$(".teacher_bmsg2").eq(this.index).css({"width":"575px","margin-top":"40px","padding-left":"116px"});
					$(".teacher_bmsgs").eq(this.index).css("width","700px");
					$(".teacher_bmsg1").eq(this.index).css("display","none");
					$(".teacher_bmsg2").eq(this.index).css("display","block");
					this.value="取消";	
					flag1=false;
				}else{
					$(".teacher_bmsg2").eq(this.index).css({"width":"584px","margin-top":"40px","padding-left":"126px"});
					$(".teacher_bmsgs").eq(this.index).css("width","610px");
					$(".teacher_bmsg1").eq(this.index).css("display","block");
					$(".teacher_bmsg2").eq(this.index).css("display","none");
					this.value="编辑";	
					flag1=true;
				}
			}
		};
	var teacher_save=getClassNames("teacher_save");
	for(var i=0;i<teacher_save.length;i++){
		teacher_save[i].index=i;
	    teacher_save[i].onclick=function(){
	        $(".tea_base_msg1").css("display","block");
			$(".tea_base_msg2").css("display","none");
			$(".stu_base_tit3").css("display","block");
			$(".stu_base_tit1").css("width","620px");
			$(".teacher_name").css("display","block");
			$(".teacher_top img").attr("src","/static/school/img/teacher_detail_03.png");
			$(".teacher_top").css("marginBottom","40px");
			$(".teacher_top img").css({"top":"28px","left":"47%"});
			$(".teacher_base_msg").css({"background":"#fff","width":"402px"})
			$(".teacher_save").css("display","none");
			$(".teacher_edit").val("编辑");
			flag=true;
	    }
	}
	var flag2=true;
	$(".tea_base_sex4").click(function(){
		if(flag2){
			$(".tea_job").css("display","block");
			flag2=false;
		}else{
			$(".tea_job").css("display","none");
			flag2=true;
		}		
	});
	$(".tea_job li").click(function(){
		var str=$(".tea_base_job").val();
		$(".tea_base_job").val($(this).html());
		$(this).html(str);
		$(".tea_job").css("display","none");
		flag2=true;
	});
	var flag3=true;
	$(".tea_link").click(function(){
		if(flag3){
			$(".tea_stu_link").css("display","block");
			flag3=false;
		}else{
			$(".tea_stu_link").css("display","none");
			flag3=true;
		}		
	});
	$(".tea_stu_link ul li").click(function(){
		var str=$(".tea_link input").val();
		$(".tea_link input").val($(this).html());
		$(this).html(str);
		$(".tea_stu_link").css("display","none");
		flag3=true;
	});	
	var teacher_base2_contsave=getClassNames("teacher_base2_contsave");
	for(var i=0;i<teacher_base2_contsave.length;i++){
		teacher_base2_contsave[i].index=i;
		teacher_base2_contsave[i].onclick=function(){
			$(".teacher_bmsg2").eq(this.index).css({"width":"584px","margin-top":"40px","padding-left":"126px"});
			$(".teacher_bmsgs").eq(this.index).css("width","610px");
			$(".teacher_bmsg1").eq(this.index).css("display","block");
			$(".teacher_bmsg2").eq(this.index).css("display","none");
			$(".teacher_base2_edit").val("编辑")
			flag1=true;
		}
	}
})
