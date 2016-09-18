$(function(){
	$(".batch_href2").click(function(){
		$(".batch_href1").css("display","none");
		$(".batch_href2").css("display","none");
		$(".all_stu2_cancel").css("display","block");
		$(".all_stu2_check").css("display","block");
		$(".all_stu2_edit").css("display","block");
		$(".stu_batch_check").css("display","block");
	});
	$(".batch_href1").click(function(){
		$(".add_all_screen").css("display","block");
		$(".add_teacher").css("display","block");
	});
	$("#cancle").click(function(){
		$(".add_all_screen").css("display","none");
		$(".add_teacher").css("display","none");
	});
	/*全部选择班级*/
	selectclass($(".all_brn_stu"),$(".all_stu3"));
	shownew($(".all_stu3 li"),$(".all_stu3"),".all_stu_bj",$(".all_stu4 ul"),$(".all_brn_stu"));
	/*全部选择班级结束*/
	/*新增学生*/
	selectclass($(".add_select_class5 input"),$(".select_class1"));
	shownew($(".select_class1 li"),$(".select_class1"),".select_bj",$(".select_class2 ul"),$(".add_select_class5 input"));
	/*新增学生班级选择结束*/
	selectclass($(".change_class4"),$(".change_nj"));
	shownew($(".change_nj li"),$(".change_nj"),".change_bj",$(".change_bj ul"),$(".change_class4"));
	changesta($(".select_teacher li"),$(".add_tea_now input"),$(".select_teacher"),$(".add_tea_now"))
	/*结束*/
	$(".all_stu2_cancel").click(function(){
		if($(".stu_check").prop("checked")==true){
			var stu_check=getClassNames("stu_check")[0];
			var all_check=getClassNames("stu_batch_check");
			for(var i=0;i<all_check.length;i++){
				all_check[i].src="/static/school/img/u45.png";
			}
			stu_check.checked=false;
			flag8=true;
		}
		$(".batch_href1").css("display","block");
		$(".batch_href2").css("display","block");
		$(".all_stu2_cancel").css("display","none");
		$(".all_stu2_check").css("display","none");
		$(".all_stu2_edit").css("display","none");
		$(".stu_batch_check").css("display","none");
	});
	var flag5=true;
	$(".all_stu2_edit1").click(function(){
		if(flag5){
			$(".stu_change").css("display","block");
			flag5=false;
		}else{
			$(".stu_change").css("display","none");
			flag5=true;
		}
	});
	$(".change_alter").click(function(){
		$(".stu_all_change").css("display","block");
		$(".change_class").css("display","block");
		$(".stu_change").css("display","none");
		flag5=true;
	});
	$(".change_state").click(function(){
		$(".stu_all_change").css("display","block");
		$(".change_statue").css("display","block");
		$(".stu_change").css("display","none");
		flag5=true;
	});
	hideele($(".change_btn_cancle"),$(".stu_all_change"),$(".change_class"));
	hideele($(".change_statue_cancle"),$(".stu_all_change"),$(".change_statue"));
	var flag8=true;
	$(".stu_check").click(function(){
		var all_check=getClassNames("stu_batch_check");
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
	$(".all_stu2_cancel").click(function(){
		if($(".stu_check").prop("checked")==true){
			var stu_check=getClassNames("stu_check")[0];
			var all_check=getClassNames("stu_batch_check");
			for(var i=0;i<all_check.length;i++){
				all_check[i].src="/static/school/img/u45.png";
			}
			stu_check.checked=false;
			flag8=true;
		}
	});
	$(".stu_batch_msg ul li").click(function(){
		if($(".stu_batch_check").eq($(this).index()).attr("src")=="/static/school/img/success2_07.png"){
			$(".stu_batch_check").eq($(this).index()).attr("src","/static/school/img/u45.png");
		}else{
			$(".stu_batch_check").eq($(this).index()).attr("src","/static/school/img/success2_07.png");
		}
	});
	/**/
	changesrc($(".stu_batch_check"))
	//changesta($(".change_statue_bj li"),$(".change_statue4"),$(".change_statue_bj"),$(".change_statue3"));
	var flagstu=true;
	$(".change_statue_bj li").click(function(){
		$(".change_statue4").val($(this).html());


		var sss = $(this).attr("livalue");
		$("#stu_change_state").val(sss);


		$(".change_statue_bj").css("display","none");
		flagstu=true;
	});
	$(".change_statue3").click(function(){
		if(flagstu){
			$(".change_statue_bj").css("display","block");
			flagstu=false;
		}else{
			$(".change_statue_bj").css("display","none");
			flagstu=true;
		}
	});
});
