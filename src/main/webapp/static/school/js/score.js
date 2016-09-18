var flag4=true;
var flag8=true;
var extend0;
var extend3;
var extend2;
$(function(){
	extend0=$(".student_msg li").size();//添加
	extend3=$(".alert_all_teacher li").size();
	extend2=$(".add_center0 li").size();
	$(".topcenter li").eq(4).addClass("act");//添加
	/*tabnav($(".scorenav li"),".scoretable","scoreliact");
	tabnav($(".scoreul li"),".score","scoact");*/
	showele($(".add_teacher1"),$(".alert_window"),$(".alert_screen"));
	//hideele($(".alert_cancel"),$(".alert_window"),$(".alert_screen"));
	showele($(".add_teacher2"),$(".score_checked"),$(".edit_people"));
	//时间点击事件开始
	$(".music_time1 .music_time_sum").click(function(event){
		stopEvent(event);
		if($(".music_time1 .time_select").css("display")=="none"){
			$(".music_time1 .time_select").css("display","block");	
			var scrolltop=(parseInt($(this).find("input").val())-3)*$(".music_time1 .time_select li").height()
			$(".music_time1 .time_select").scrollTop(scrolltop);
		}		
	});
	$(".music_time2 .music_time_sum").click(function(event){
		stopEvent(event);
		if($(".music_time2 .time_select").css("display")=="none"){
			$(".music_time2 .time_select").css("display","block");	
			var scrolltop=(parseInt($(this).find("input").val())-3)*$(".music_time2 .time_select li").height()
			$(".music_time2 .time_select").scrollTop(scrolltop);
		}
	});
	$(".music_time1 .time_select li").click(function(){
		$(".music_time_sum input").eq(0).val($(this).html());
		$(".music_time1 .time_select").css("display","none");		
	})
	$(".music_time2 .time_select li").click(function(){
		$(".music_time_sum input").eq(1).val($(this).html());
		$(".music_time2 .time_select").css("display","none");		
	})
	//时间点击事件结束
	//绑定教师弹窗
	$(".alert_cancel").click(function(){
		$(".alert_all_teacher li").each(function(){
			$(this).attr("data-value","");
		});
		$(".alert_window").css("display","none");
		$(".alert_screen").css("display","none");
		$(".alert_all li").removeClass("alert_li_act");
		$(".alert_check1").attr("src","/static/school/img/class/u45.png");
	});
	$(".add_teacher2").click(function(){
		$(".score_checked").css("display","block");
		$(".edit_people").css("display","block");
		$(".add_teacher").css("display","none");
	});
	$(".score_edit1").click(function(){
		$(".score_teachpic li").each(function(){
			$(this).attr("data-value","");
		});
		$(".score_checked").css("display","none");
		$(".edit_people").css("display","none");
		$(".add_teacher").css("display","block");
		$(".score_teachpic li").removeClass("li_act");
		$(".score_checked").attr("src","/static/school/img/class/u45.png");
		$(".score_check").css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
		flag8=true;
	});
//	selectclass($(".score_edit2"),$(".score_select"));
	showele($(".score_pk"),$(".class_start"),$(".alert_screen"));
	showele($(".score_change_login"),$(".change_class_statue"),$(".alert_screen"));
	//showele($(".score_remove_teach"),$(".remove_tea"),$(".alert_screen"));
//	教师模块的编辑事件
	var flag1=true;
	var flag2=true;
	$(".score_edit2").click(function(){
		if(flag1){
			$(".score_select").css("display","block");
			flag1=false;
		}else{
			$(".score_select").css("display","none");
			flag1=true;
		}
	});
	$(document).click(function(e){
		var e=e||event;
		if(e.target.className!="score_edit_check"&&e.target.className!="score_edit2"){
			$(".score_select").css("display","none");
			flag1=true;
		}
		if(e.target.className!="stu_bj"&&e.target.className!="stu_bj1"){
			$(".stu_score_select").css("display","none");
			flag2=true;
		}
		if(e.target.className!="change_statue1"&&e.target.className!="change_input"&&e.target.className!="change_simg"){
			$(".change_statue2").css("display","none");
			flag=true;
		}
		if(e.target.className!="stu_change1"&&e.target.className!="stu_change1_input"&&e.target.className!="add_stu_down"){
			$(".stu_change2").css("display","none");
			flag3=true;
		}
		$(".time_select").css("display","none");
	});
//	学生模块的编辑事件
	$(".stu_bj").click(function(){
		if(flag2==true){
			$(".stu_score_select").css("display","block");
			flag2=false;
		}else{
			$(".stu_score_select").css("display","none");
			flag2=true;
		}
	});
	hideele($(".class_btns1"),$(".class_start"),$(".alert_screen"));
	hideele($(".change_class_cancle"),$(".change_class_statue"),$(".alert_screen"));
	hideele($(".remove_cancle"),$(".remove_tea"),$(".alert_screen"));
	/*全选
   
	$(".score_check").click(function(){
				if(flag8){
					$(".score_teachpic li").each(function(){
						$(this).attr("data-value",$(this).attr("default-value"));
					});
					$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -240px -54px");
					$(".score_teachpic li").addClass("li_act");
					$(".score_checked").attr("src","/static/school/img/class/success2_07.png");
					flag8=false;
				}else{
					$(".score_teachpic li").each(function(){
						$(this).attr("data-value","");
					});
					$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
					$(".score_teachpic li").removeClass("li_act");
					$(".score_checked").attr("src","/static/school/img/class/u45.png");
					flag8=true;
				}
	});*/
	//添加教师中的更改状态的点击事件
	var flag=true;
	$(".change_statue1").click(function(){
		if(flag){
			$(".change_statue2").css("display","block");
			flag=false;
		}else{
			$(".change_statue2").css("display","none");
			flag=true;
		}		
	});
	$(".change_statue2 li").click(function(){
		var str=$(".change_input").val();
		var id=$(".change_input").attr("data-value");
		$(".change_input").val($(this).html());
		$(".change_input").attr("data-value",$(this).attr("data-value"));
		$(this).html(str);
		$(this).attr("data-value",id);
		
	});
	//添加教师中更改状态的点击事件结束
	//学生模块更改状态的点击事件开始
	var flag3=true;	
	$(".stu_change1").click(function(){
		if(flag3){
			$(".stu_change2").css("display","block");
			flag3=false;			
		}else{
			$(".stu_change2").css("display","none");
			flag3=true;	
		}
	});
	$(".stu_change2 li").click(function(){
		var str=$(".stu_change1_input").val();
		var id=$(".stu_change1_input").attr("data-value");
		$(".stu_change1_input").val($(this).text());
		$(".stu_change1_input").attr("data-value",$(this).attr("data-value"));
		$(this).html(str);
		$(this).attr("data-value",id);
	});
	//学生模块更改状态的点击事件结束
	//选择班级
	selectclass($(".class_sum_select"),$(".all_stu_hover"));
	//shownew($(".class_sum3 li"),$(".class_sum3"),".alert_bj",$(".class_sum4 ul"),$(".class_sum_select"));
	//changesta($(".change_statue2 li"),$(".change_input"),$(".change_statue2"),$(".change_statue1"));
	$(".stu_add_student2").click(function(){
		$(".stu_edit_people").css("display","block");
		$(".student_check").css("display","block");
		$(".stu_add_student").css("display","none");
	});
	$(".stu_score_cbj1").click(function(){
		$(".student_msg li").each(function(){
			$(this).attr("data-value","");
		});
		$(".stu_edit_people").css("display","none");
		$(".student_check").css("display","none");
		$(".stu_add_student").css("display","block");
		$(".student_msg li").removeClass("li_act");
		$(".student_check").attr("src","/static/school/img/class/u45.png");
		$(".stu_score_check").css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
		flag4=true;
	});
//	selectclass($(".stu_bj"),$(".stu_score_select"));
	showele($(".stu_change_b1"),$(".change_stu"),$(".alert_screen"));	
	showele($(".stu_change_b2"),$(".stu_change_statu"),$(".alert_screen"));	
	hideele($(".change_stu2_cancle"),$(".change_stu"),$(".alert_screen"));
	hideele($(".stu_sta_cancle"),$(".stu_change_statu"),$(".alert_screen"));	
	selectclass($(".change_select"),$(".change_hover"));
	//shownew($(".change_stunj li"),$(".change_stunj"),".change_stubj",$(".change_stubj ul"),$(".change_select"));
	//教师批量管理
	//allcheck("stu_score_check","student_check","stu_score_cbj1");
	//showele($(".kb_add"),$(".add_music"),$(".alert_screen"));
	//hideele($(".music_btn1"),$(".add_music"),$(".alert_screen"));
	showele($(".stu_add_student1"),$(".add_student"),$(".alert_screen"));
//  hideele($(".add_student_cancle"),$(".add_student"),$(".alert_screen"));
//	allcheck("add_all_check11","add_cen2","add_student_cancle");/*修改class名*/
//	allcheck("add_all_check2","add_cen2_tcheck","add_student_cancle");/*添加未选班级代码全选代码*/
//	changesrc($(".add_cen2"));
//	changesrc($(".alert_check1"));
//	changesrc($(".add_cen2_tcheck"));
//	allcheck("alert_right1","alert_check1","alert_cancel");
	//添加音乐课
	//添加代码
	//changesrc($(".student_check"));
	//changesrc($(".score_checked"));
	//绑定学生的取消事件
	$(".add_student_cancle").click(function(){
		$(".add_center0 li").each(function(){
			$(this).attr("data-value","");
		});
		$(".add_student").css("display","none");
		$(".alert_screen").css("display","none");
		$(".add_center0 li").removeClass("add_student_act");
		$(".add_center0 .add_cen2").attr("src","/static/school/img/class/u45.png");
	});
	//音乐课表添加音乐课代码
	var add_kb=getClassNames("add_kb","li");
	var add_kb1=getClassNames("add_kb1","li");
	var index=0;
	var pnodename="";
	for(var i=0;i<add_kb.length;i++){
		add_kb[i].index=i;
		add_kb[i].onclick=function(){
			index=this.index+1;				
			$(".alert_screen").css("display","block");
			$(".add_music").css("display","block");
			pnodename=this.parentNode.className;
			var id = $(this).attr("data-value");
			$("#lesson_id").val("");
			$("#lesson_apm").val("1");
			$("#lesson_week").val($(this).attr("data-week"));
			$(".add_music").find("[name='schedule.title']").val("");
			$(".add_music").find("[name='schedule.time_start']").val("");
			$(".add_music").find("[name='schedule.time_end']").val("");
			$(".add_music").find("[name='schedule.intro']").val("");
			if(id!=null && id!=""){
				$("#lesson_id").val(id);
				$(".add_music").find("[name='schedule.title']").val($(this).find("p").eq(0).text());
				$(".add_music").find("[name='schedule.time_start']").val($(this).find("p").eq(1).find("span").eq(0).text());
				$(".add_music").find("[name='schedule.time_end']").val($(this).find("p").eq(1).find("span").eq(1).text())
				$(".add_music").find("[name='schedule.intro']").val($(this).find("p").eq(2).text());
			}
		}
	}
	for(var i=0;i<add_kb1.length;i++){
		add_kb1[i].index=i;
		add_kb1[i].onclick=function(){
			index=this.index+1;				
			$(".alert_screen").css("display","block");
			$(".add_music").css("display","block");
			pnodename=this.parentNode.className;
			var id = $(this).attr("data-value");
			$("#lesson_id").val("");
			$("#lesson_apm").val("2");
			$("#lesson_week").val($(this).attr("data-week"));
			$(".add_music").find("[name='schedule.title']").val("");
			$(".add_music").find("[name='lesson.time_start']").val("");
			$(".add_music").find("[name='schedule.time_end']").val("");
			$(".add_music").find("[name='schedule.intro']").val("");
			if(id!=null && id!=""){
				$("#lesson_id").val(id);
				$("#lesson_apm").val("2");
				$(".add_music").find("[name='schedule.title']").val($(this).find("p").eq(0).text());
				$(".add_music").find("[name='schedule.time_start']").val($(this).find("p").eq(1).find("span").eq(0).text());
				$(".add_music").find("[name='schedule.time_end']").val($(this).find("p").eq(1).find("span").eq(1).text())
				$(".add_music").find("[name='schedule.intro']").val($(this).find("p").eq(2).text());
			}
		}
	}
	$(".music_btn_yes").click(function(){
		if($("#lesson_apm").val()==null || $("#lesson_apm").val()=="" ||$(".add_music").find("[name='schedule.title']").val()==null ||$(".add_music").find("[name='schedule.title']").val()==""
			|| $(".add_music").find("[name='schedule.time_start']").val()==null || $(".add_music").find("[name='schedule.time_start']").val()=="" || $(".add_music").find("[name='schedule.time_end']").val()==null || $(".add_music").find("[name='schedule.time_end']").val()==""){
			alert('名称和时间不能为空');
			return;
		}
		var options = {
                url: '/school/class/saveClassLesson',
                type: 'post',
                dataType: 'json',
                data: $("#class_lesson").serialize(),
                success: function (data) {
                    if (data.code == '200') {
                    	$("."+pnodename+" li").eq(index).empty();
                		var newp=$("<p>"+$(".music_class").val()+"</p><p>"+$(".music_time1 input").val()+"~"+$(".music_time2 input").val()+"</p><p>"+$(".music_bz textarea").val()+"</p>");
                		$("."+pnodename+" li").eq(index).append(newp);
                		$("."+pnodename+" li").eq(index).removeClass("kb").addClass("time_already");
                		$(".alert_screen").css("display","none");
                		$(".add_music").css("display","none");
                		//添加
                		$(".music_bz textarea").val("");
                    } else {
                        alert(data.description);
                    }
                }
            };
            $.ajax(options);
            return false;
		
	});
	//全部班级的点击事件
  	selectclass($(".add_bjclick input"),$(".add_bj_select1"));
	shownew($(".add_bj_select1 li"),$(".add_bj_select1"),".change_stubj",$(".add_bj_select2 ul"),$(".add_bjclick input"));	
	//新增学生中班级的点击事件
	selectclass($(".add_center_class input"),$(".add_center2_class1"));
	shownew($(".add_center2_class1 li"),$(".add_center2_class1"),".add_center2_bj",$(".add_center2_class2 ul"),$(".add_center_class input"));
	//教师中排课班级中确认添加的点击事件
	//addclass1($(".class_sum2"),$(".class_sum_select"),$(".class_start1"),$(".class_del"),"class_start2");
	
	//添加课表页面的鼠标滑过事件
	//hover("time_date1");
	//hover("time_date2");
	//教师，成绩和课表等tab切换
	$(".scoreul li").click(function(){
		$(this).addClass("scoact").siblings().removeClass("scoact");
		$(".score"+$(this).index()).removeClass("hide").siblings().addClass("hide");
		if($(this).index()==0){
			$(".add_tea_sum").css("display","block");
			$(".stu_add_sum").css("display","none");
			$(".scoresearch").css("display","none");
			$(".class_tit").html("教师");
		}else if($(this).index()==1){
			$(".add_tea_sum").css("display","none");
			$(".stu_add_sum").css("display","block");
			$(".scoresearch").css("display","none");
			$(".class_tit").html("学生");
		}else if($(this).index()==2){
			$(".add_tea_sum").css("display","none");
			$(".stu_add_sum").css("display","none");
			$(".scoresearch").css("display","block");
			$(".class_tit").html("成绩");
		}else if($(this).index()==3){
			$(".add_tea_sum").css("display","none");
			$(".stu_add_sum").css("display","none");
			$(".scoresearch").css("display","none");
			$(".class_tit").html("课表");
		}
	});
	//鼠标滑过去掉边框事件
	ul_hover($(".scoretable1 ul"));
	//学生模块中全选按钮
	
	$(".stu_score_check").click(function(){
		if(flag4){
			$(".student_msg li").each(function(){
				$(this).attr("data-value",$(this).attr("default-value"));
			});
			$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -240px -54px");
			$(".student_check").attr("src","/static/school/img/class/success2_07.png");
			$(".student_msg li").addClass("li_act");
			num1=extend0;//添加
			flag4=false;
		}else{
			$(".student_msg li").each(function(){
				$(this).attr("data-value","");
			});
			$(this).css("background","url('/static/school/img/spirit_img.png') -218px -54px no-repeat");
			$(".student_check").attr("src","/static/school/img/class/u45.png");
			$(".student_msg li").removeClass("li_act");
			num1=0;//添加
			flag4=true;
		}
	});
	//绑定教师全选的点击事件
	var flag5=true;
	$(".alert_right").click(function(){
		if(flag5){
			$(".alert_all_teacher li").each(function(){
				$(this).attr("data-value",$(this).attr("default-value"));
			});
			$(".alert_all li").addClass("alert_li_act");
			$(this).find(".alert_right1").css("background","url('/static/school/img/spirit_img.png') -240px -54px no-repeat");
			$(".alert_check1").attr("src","/static/school/img/class/success2_07.png");
			num2=extend3;
			flag5=false;
		}else{
			$(".alert_all_teacher li").each(function(){
				$(this).attr("data-value","");
			});
			$(".alert_all li").removeClass("alert_li_act");
			$(this).find(".alert_right1").css("background","url('/static/school/img/spirit_img.png') -218px -54px no-repeat");
			$(".alert_check1").attr("src","/static/school/img/class/u45.png");
			num2=0;
			flag5=true;
		}
	});
	var flag6=true;
	$(".add_all_check").click(function(){
		if(flag6){
			$(".add_center0 li").each(function(){
				$(this).attr("data-value",$(this).attr("default-value"));
			});
			$('.add_cen2').attr("src","/static/school/img/class/success2_07.png");
			$(".add_center0 li").addClass("add_student_act");
			$(this).find(".add_all_check11").css("background","url(/static/school/img/spirit_img.png) no-repeat -240px -54px");
			flag6=false;
			num3=extend2;
		}else{
			$(".add_center0 li").each(function(){
				$(this).attr("data-value","");
			});
			$('.add_cen2').attr("src","/static/school/img/class/u45.png");
			$(".add_center0 li").removeClass("add_student_act");
			$(this).find(".add_all_check11").css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
			flag6=true;
			num3=0;
		}
	});
});
/*function hover(ele){
	$("."+ele+" li").mouseover(function(){
		if($(this).hasClass("time_already")){
		}else if($(this).hasClass("sw")){
		}else{
			$(this).css("background","#f9f9f9");					
		}
	});
	$("."+ele+" li").mouseout(function(){
		if($(this).hasClass("time_already")){
		}else if($(this).hasClass("sw")){
		}else{
			$(this).css("background","#f2f2f2");				
		}	
	});
}*/

var num1=0;
function stu_jump(obj){
	if($(obj).find(".student_check").css("display")=="none"){
	}else{
		if($(obj).find(".student_check").attr("src").indexOf("success2_07")<0){
			$(obj).attr("data-value",$(obj).attr("default-value"));
			$(obj).addClass("li_act");
			$(obj).find(".student_check").attr("src","/static/school/img/class/success2_07.png");	
			num1++;				
		}else{
			$(obj).attr("data-value","");
			$(obj).removeClass("li_act");
			$(obj).find(".student_check").attr("src","/static/school/img/class/u45.png");
			num1--;			
		}
		if(num1==extend0){
			$(".stu_score_check").css({"background":"url('/static/school/img/spirit_img.png') -240px -54px no-repeat"});	
			flag4=false;			
		}else{
			$(".stu_score_check").css({"background":"url('/static/school/img/spirit_img.png') -218px -54px no-repeat"});						
			flag4=true;
		}
	}
}
var num2=0;
function goto_addteacher(obj){
	if($(obj).find(".alert_check1").css("display")=="none"){
	}else{
		if($(obj).find(".alert_check1").attr("src").indexOf("success2_07")<0){
			$(obj).attr("data-value",$(obj).attr("default-value"));
			$(obj).addClass("alert_li_act");
			$(obj).find(".alert_check1").attr("src","/static/school/img/class/success2_07.png");
			num2++;
		}else{
			$(obj).attr("data-value","");
			$(obj).removeClass("alert_li_act");
			$(obj).find(".alert_check1").attr("src","/static/school/img/class/u45.png");
			num2--;			
		}
		if(num2==extend3){
			$(".alert_right1").css({"background":"url('/static/school/img/spirit_img.png') -240px -54px no-repeat"});	
			flag5=false;			
		}else{
			$(".alert_right1").css({"background":"url('/static/school/img/spirit_img.png') -218px -54px no-repeat"});						
			flag5=true;
		}
	}
}
var num3=0;
function goto_addstudent(obj){
	if($(obj).find(".add_cen2").css("display")=="none"){
	}else{
		if($(obj).find(".add_cen2").attr("src").indexOf("success2_07")<0){
			$(obj).attr("data-value",$(obj).attr("default-value"));
			$(obj).addClass("add_student_act");
			$(obj).find(".add_cen2").attr("src","/static/school/img/class/success2_07.png");
			num3++;
		}else{
			$(obj).attr("data-value","");
			$(obj).removeClass("add_student_act");
			$(obj).find(".add_cen2").attr("src","/static/school/img/class/u45.png");
			num3--;			
		}
		if(num3==extend2){
			$(".add_all_check11").css({"background":"url('/static/school/img/spirit_img.png') -240px -54px no-repeat"});	
			flag6=false;			
		}else{
			$(".add_all_check11").css({"background":"url('/static/school/img/spirit_img.png') -218px -54px no-repeat"});						
			flag6=true;
		}
	}
}
function stopEvent(event){ //阻止冒泡事件
     //取消事件冒泡
     var e=arguments.callee.caller.arguments[0]||event; //若省略此句，下面的e改为event，IE运行可以，但是其他浏览器就不兼容
     if (e && e.stopPropagation) {
     // this code is for Mozilla and Opera
     e.stopPropagation();
     } else if (window.event) {
     // this code is for IE
      window.event.cancelBubble = true;
    }
}
