
$(function(){
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
            console.log('num change');
        }
	});
	$(".topcenter li").eq(3).addClass("act");
	//结束
	$("#add").click(function(){
		$(".add_all_screen").css("display","block");
		$(".add_teacher").css("display","block");
	});
	$("#cancle").click(function(){
		$(".add_all_screen").css("display","none");
		$(".add_teacher").css("display","none");
	});
	changesrc($(".tea_batch_check"),"teacher");
	$("#batch_tea").click(function(){
		$(".tea_batch_check").css("display","block");
		$("#add").css("display","none");
		$("#batch_tea").css("display","none");
		$(".all_tea2_edit").css("display","block");
		$(".all_tea2_cancel").css("display","block");
		$(".tea_allcheck").css("display","block");
	});
	$(".all_tea2_cancel").click(function(){
		/*if($(".tea_check1").prop("checked")){
			var tea_check1=getClassNames("tea_check1","a")[0];
			var all_batch_check=getClassNames("tea_batch_check","img");
			for(var i=0;i<all_batch_check.length;i++){			
				all_batch_check[i].src="/static/school/img/teacher/u45.png";
			}*/
//			tea_check1.checked=false;
		$(".tea_batch_check").css("display","none");
		$("#add").css("display","block");
		$("#batch_tea").css("display","block");
		$(".all_tea2_edit").css("display","none");
		$(".all_tea2_cancel").css("display","none");
		$(".tea_allcheck").css("display","none");
		$(".taecher_pic li").removeClass("li_act");
		$(".taecher_pic .tea_batch_check").attr("src","/static/school/img/teacher/u45.png");
		$(".tea_check1").css("background","url('/static/school/img/spirit_img.png') -218px -54px no-repeat;")
		$(".taecher_pic li").each(function(){
				$(this).attr("data-value","");
		});
		flag8=true;			
	});
	/*新增班级页面*/
	selectclass($(".add_select_class2 input"),$(".change_hover"));
	//shownew($(".select_class1 li"),$(".select_class1"),".select_bj",$(".select_class2 ul"),$(".add_select_class2 input"));
//	addclass($(".add_confirm"),$(".add_select_class2 input"),$(".add_tea_class1 ul"));
	/*选择*/
	//changesta($(".tea_change_statue4"),$(".tea_change_statue_bj li"),$(".tea_change_statue_bj"),$(".tea_change_statue4"));
	changesta($(".select_teacher li"),$(".add_tea_now input"),$(".select_teacher"),$(".add_tea_now input"));
	//changesta1($(".add_tea_sort li"),$(".add_tea_level"),$(".add_tea_sort"),$(".add_tea_level"));
	selectclass($(".tea_change_class4"),$(".all_stu_hover"));
	//shownew($(".tea_change_nj li"),$(".tea_change_nj"),".tea_change_bj",$(".tea_change_bj ul"),$(".tea_change_class4"));
	//addclass1($(".tea_confirm"),$(".tea_change_class4"),$(".tea_change_csum"),"tea_change_c1","new_bj_del");
	//编辑的点击事件
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
	var flag6=true;
	$(".add_tea_level").click(function(){
		if(flag6){
			$(".add_tea_sort").css("display","block");
			flag6=false;
		}else{
			$(".add_tea_sort").css("display","none");
			flag6=true;
		};		
	})
	$(".add_tea_sort li").click(function(){
		$(".add_tea_level").val($(this).html());
		$("#teacher_job").val($(this).attr("data-value"));
	});
	//点击其他地方是div消失
	$(document).click(function(e){
		e = e || window.event;
		if(e.target.className!="all_btn_edit"&&e.target.className!="all_tea2_edit"){
			$(".tea_change").css("display","none");
			flag7=true;
		}
		if(e.target.className!="tea_change_statue3"&&e.target.className!="tea_change_statue4"&&e.target.className!="pull_down"){
			$(".tea_change_statue_bj").css("display","none");
			flag9=true;
		}	
		if(e.target.className!="add_tea_newname add_tea_level"){
			$(".add_tea_sort").css("display","none");
			flag6=true;
		}	
	});
	//结束
	$(".tea_pk").click(function(){
		$(".tea_all_change").css("display","block");
		$(".tea_change_class").css("display","block");
		flag7=true;
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
	var flag9=true;
	$(".tea_change_statue_bj li").click(function(){
		var str=$(".tea_change_statue4").val();
		var id=$(".tea_change_statue4").attr("data-value");
		$(".tea_change_statue4").val($(this).html());
		$(".tea_change_statue4").attr("data-value",$(this).attr("data-value"));
		$(this).html(str);
		$(this).attr("data-value",id);
		$(".tea_change_statue_bj").css("display","none");
		flag9=true;
	});
	$(".tea_change_statue3").click(function(){
		if(flag9){
			$(".tea_change_statue_bj").css("display","block");
			flag9=false;
		}else{
			$(".tea_change_statue_bj").css("display","none");
			flag9=true;
		}	
	});
	//教师添加排课班级中的删除事件
	var new_bj_del=getClassNames("new_bj_del","span");
	$(".tea_change_csum").click(function(event){
		for(var j=0;j<new_bj_del.length;j++){
			new_bj_del[j].index=j;
			if(event.target==new_bj_del[j]){
				$(".tea_change_c1").eq(event.target.index).remove();
			}
		}
	});
	//教师管理中新增教师年级的删除事件
	var bj_del=getClassNames("bj_del","span");
	$(".add_tea_class1").click(function(event){
		for(var k=0;k<bj_del.length;k++){
			bj_del[k].index=k;
			if(event.target==bj_del[k]){
				$(".add_tea_class1 li").eq(event.target.index).remove();
			}
		}
	});
	//事件结束
	//$(".taecher_pic li").bind("click",skip);
});
