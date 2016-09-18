var flag5=true;
$(function(){
	$(".topcenter li").eq(2).addClass("act");
	$(".batch_href2").click(function(){
		$(".batch_href1").css("display","none");
		$(".batch_href2").css("display","none");
		$(".all_stu_import").css("display","none");
		$(".all_stu2_cancel").css("display","block");
		$(".all_stu2_check").css("display","block");
		$(".all_stu2_edit").css("display","block");
		$(".stu_batch_check").css("display","block");
	});
	$(".batch_href1").click(function(){
		$(".stu_all_change").css("display","block");
		$(".add_new_student").css("display","block");
//		/*$(".all_stu_import").css("display","block");*/
	});
	$("#cancle").click(function(){
		$(".add_all_screen").css("display","none");
		$(".add_teacher").css("display","none");
	});
	/*全部选择班级*/
	selectclass($(".all_brn_stu"),$(".all_stu_hover"));
//	shownew($(".all_stu3 li"),$(".all_stu3"),".all_stu_bj",$(".all_stu4 ul"),$(".all_brn_stu"));
	/*全部选择班级结束*/
	/*新增学生*/
	selectclass($(".add_select_class5 input"),$(".select_class1"));
	shownew($(".select_class1 li"),$(".select_class1"),".select_bj",$(".select_class2 ul"),$(".add_select_class5 input"));
	/*新增学生班级选择结束*/
	selectclass($(".change_class4"),$(".change_hover"));
	//shownew($(".change_nj li"),$(".change_nj"),".change_bj",$(".change_bj ul"),$(".change_class4"));
	changesta($(".select_teacher li"),$(".add_tea_now input"),$(".select_teacher"),$(".add_tea_now"))
	/*结束*/
	$(".all_stu2_cancel").click(function(){
			$(".batch_href1").css("display","block");
			$(".batch_href2").css("display","block");
			$(".all_stu2_cancel").css("display","none");
			$(".all_stu2_check").css("display","none");
			$(".all_stu2_edit").css("display","none");
			$(".stu_batch_check").css("display","none");
			$(".stu_change").css("display","none");
			$(".every_stu1 li").removeClass("li_act");
			$(".stu_batch_check").attr("src","/static/school/img/student/u45.png");
			$(".stu_check").css("background","url('/static/school/img/spirit_img.png') -218px -54px no-repeat;")
			$(".every_stu1 li").each(function(){
				$(this).attr("data-value","");
			});
			flag5=true;
			flag8=true;
	});
	//编辑的点击事件
	$(".all_stu2_edit1").click(function(){
		if(flag5){
			$(".stu_change").css("display","block");
			flag5=false;			
		}else{
			$(".stu_change").css("display","none");
			flag5=true;
		}
	});
	//编辑的点击事件结束
	$(".change_alter").click(function(){
		$(".stu_all_change").css("display","block");
		$(".change_class").css("display","block");
	});
	$(".change_state").click(function(){
		$(".stu_all_change").css("display","block");
		$(".change_statue").css("display","block");
	});
	var flag1=true;
	$(".add_statue").click(function(){
		if(flag1){
			$(".add_statue_ul").css("display","block");
			flag1=false;
		}else{
			$(".add_statue_ul").css("display","none");
			flag1=true;
		}
	});
	$(".add_statue_ul li").click(function(){
		$(".add_statue input").val($(this).html());
	});
	$(document).click(function(e){
		e = e || window.event;
		if(e.target.className!="all_stu2_edit1"&&e.target.className!="stu_change"){
			$(".stu_change").css("display","none");
			flag5=true;
		}
		if(e.target.className!="change_statue3"&&e.target.className!="change_statue4"&&e.target.className!="change_statue3_down"){
			$(".change_statue_bj").css("display","none");
			flag9=true;
		}
		//新增学生中亲属选择的点击事件
		if(e.target.className!="add_relation_name0"&&e.target.className!="add_relate_down"&&e.target.className!="add_span"){
			$(".add_relation_ul").css("display","none");
			flag4=true;
		}
		//新增学生中状态的点击事件
		if(e.target.className!="add_statue"&&e.target.className!="add_statue_input"&&e.target.className!="add_statue_down"){
			$(".add_statue_ul").css("display","none");
			flag1=true;
		}
	});
	//编辑点击事件结束
	//更改状态事件开始
	var flag9=true;
	$(".change_statue_bj li").click(function(){
		var str=$(".change_statue4").val();
		var id=$(".change_statue4").attr("data-value");
		$(".change_statue4").val($(this).html());
		$(".change_statue4").attr("data-value",$(this).attr("data-value"));
		$(this).html(str);
		$(this).attr("data-value",id);
		flag9=true;
	});
	$(".change_statue3").click(function(){
		if(flag9){
			$(".change_statue_bj").css("display","block");
			flag9=false;
		}else{
			$(".change_statue_bj").css("display","none");
			flag9=true;
		}
	});
	//更改状态事件结束
	hideele($(".change_btn_cancle"),$(".stu_all_change"),$(".change_class"));
	hideele($(".change_statue_cancle"),$(".stu_all_change"),$(".change_statue"));	
	/*var flag8=true;
	$(".stu_check").click(function(){
		var all_check=getClassNames("stu_batch_check","img");
		if(flag8){
			$(".every_stu1 li").addClass("li_act");
			$(".stu_batch_check").attr("src","/static/school/img/student/success2_07.png");
			$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -240px -54px");
			$(".every_stu1 li").each(function(){
				$(this).attr("data-value",$(this).attr("data-default-val"));
			});
			flag8=false;
		}else{
			$(".every_stu1 li").removeClass("li_act");
			$(".stu_batch_check").attr("src","/static/school/img/student/u45.png");
			$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
			$(".every_stu1 li").each(function(){
				$(this).attr("data-value","");
			});
			flag8=true;
		}
	});*/
	changesrc($(".stu_batch_check"),"student");
	//changesta($(".change_statue_bj li"),$(".change_statue4"),$(".change_statue_bj"),$(".change_statue3"));
	//新增学生弹窗中家属的点击事件
	var flag4=true;
	$(".add_relate_down").click(function(){
		if(flag4){
			$(".add_relation_ul").css("display","block");
			flag4=false;
		}else{
			$(".add_relation_ul").css("display","none");
			flag4=true;
		}
	});
	$(".add_relation_ul li").click(function(){
		var str=$(".add_relation_name0").val();
		$(".add_relation_name0").val($(this).html());
		$(this).html(str);
	});
	
	//新增学生取消按钮的点击事件
	hideele($(".add_stu_cancle"),$(".stu_all_change"),$(".add_new_student"));
	//调用日历插件
	//日期插件调用
    $(".jcDate").jcDate({
        Class : "", //为input注入自定义的class类（默认为空）
        Default: "today", //设置默认日期（默认为当天）
        Event : "click", //设置触发控件的事件，默认为click
        Speed : 100,    //设置控件弹窗的速度，默认100（单位ms）
        Left : 0,       //设置控件left，默认0
        Top : 22,       //设置控件top，默认22
        Format : "-",   //设置控件日期样式,默认"-",效果例如：XXXX-XX-XX
        DoubleNum: true, //设置控件日期月日格式，默认true,例如：true：2015-05-01 false：2015-5-1
        Timeout : 100,   //设置鼠标离开日期弹窗，消失时间，默认100（单位ms）
        OnChange: function(){ //设置input中日期改变，触发事件，默认为function(){}
            
        }
	});
	selectclass($(".add_stu_class"),$(".stu_msg_class"));
	shownew($(".stu_msg_class li"),$(".stu_msg_class"),".stu_msg_ul",$(".stu_msg_ul ul"),$(".add_stu_class input"));
});

