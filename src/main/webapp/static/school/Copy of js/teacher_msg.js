$(function(){
	$("#add").click(function(){
		$(".add_all_screen").css("display","block");
		$(".add_teacher").css("display","block");
	});
	$("#cancle").click(function(){
		$(".add_all_screen").css("display","none");
		$(".add_teacher").css("display","none");
	});
	/*var tea_batch_check=getClassNames("tea_batch_check");
	for(var i=0;i<tea_batch_check.length;i++){
		tea_batch_check[i].index=i;
		tea_batch_check[i].onclick=function(){
			if($(".tea_batch_check").eq(this.index).attr("src")=="/static/school/img/success2_07.png"){
				$(".tea_batch_check").eq(this.index).attr("src","/static/school/img/u45.png");
			}else{
				$(".tea_batch_check").eq(this.index).attr("src","/static/school/img/success2_07.png");
			}
		}
	}*/
	$("#batch_tea").click(function(){
		flag1111=false;
		$(".tea_batch_check").css("display","block");
		$("#add").css("display","none");
		$("#batch_tea").css("display","none");
		$(".all_tea2_edit").css("display","block");
		$(".all_tea2_cancel").css("display","block");
		$(".tea_allcheck").css("display","block");
	});
	$(".all_tea2_cancel").click(function(){
		flag1111=true;
		if($(".tea_check1").prop("checked")){
			var tea_check1=getClassNames("tea_check1")[0];
			var all_batch_check=getClassNames("tea_batch_check");
			for(var i=0;i<all_batch_check.length;i++){			
				all_batch_check[i].src="/static/school/img/u45.png";
			}
			tea_check1.checked=false;
			flag8=true;			
		}
		$(".tea_batch_check").css("display","none");
		$("#add").css("display","block");
		$("#batch_tea").css("display","block");
		$(".all_tea2_edit").css("display","none");
		$(".all_tea2_cancel").css("display","none");
		$(".tea_allcheck").css("display","none");
	});
	/*新增班级页面*/
	selectclass($(".add_select_class2 input"),$(".select_class1"));
	shownew($(".select_class1 li"),$(".select_class1"),".select_bj",$(".select_class2 ul"),$(".add_select_class2 input"));
	addclass($(".add_confirm"),$(".add_select_class2 input"),$(".add_tea_class1 ul"));
	/*选择*/
	changesta($(".tea_change_statue4"),$(".tea_change_statue_bj li"),$(".tea_change_statue_bj"),$(".tea_change_statue4"));
	changesta($(".select_teacher li"),$(".add_tea_now input"),$(".select_teacher"),$(".add_tea_now input"));
	changesta($(".add_tea_sort li"),$(".add_tea_level"),$(".add_tea_sort"),$(".add_tea_level"));
	selectclass($(".tea_check"),$(".tea_change_nj"));
	shownew($(".tea_change_nj li"),$(".tea_change_nj"),".tea_change_bj",$(".tea_change_bj ul"),$(".tea_change_class4"));
	addclass1($(".tea_confirm"),$(".tea_change_class4"),$(".tea_change_csum"));
});
