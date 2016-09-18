window.onload=function(){

	/*全部班级的点击事件*/
	selectclass($(".add_bjclick input"),$(".add_bj_select1"));
	shownew($(".add_bj_select1 li"),$(".add_bj_select1"),".change_stubj",$(".add_bj_select2 ul"),$(".add_bjclick input"));





	tabnav($(".scorenav li"),".scoretable","scoreliact");
	tabnav($(".scoreul li"),".score","scoact");
	
	//取消按钮点击，弹窗消失
	//hideele($(".alert_cancel"),$(".alert_window"),$(".alert_screen"));
	$(".alert_cancel").click(function(){
		$(".alert_window").css("display","none");
		$(".alert_screen").css("display","none");
	})

	showele($(".add_teacher2"),$(".score_checked"),$(".edit_people"));
	$(".add_teacher2").click(function(){
		$(".score_checked").css("display","block");
		$(".edit_people").css("display","block");
		$(".add_teacher").css("display","none");
	});
	$(".score_edit1").click(function(){
		$(".score_checked").css("display","none");
		$(".edit_people").css("display","none");
		$(".add_teacher").css("display","block");
	});
	selectclass($(".score_edit2"),$(".score_select"));
	showele($(".score_pk"),$(".class_start"),$(".alert_screen"));
	showele($(".score_change_login"),$(".change_class_statue"),$(".alert_screen"));
	showele($(".score_remove_teach"),$(".remove_tea"),$(".alert_screen"));
	hideele($(".class_btns1"),$(".class_start"),$(".alert_screen"));
	hideele($(".change_class_cancle"),$(".change_class_statue"),$(".alert_screen"));
	hideele($(".remove_cancle"),$(".remove_tea"),$(".alert_screen"));
	/*全选*/
    var flag8=true;
	$(".score_check").click(function(){
		var score_checked=getClassNames("score_checked");
		if(flag8){
			for(var i=0;i<score_checked.length;i++){
				score_checked[i].src="../img/success2_07.png";
			}
			flag8=false;
		}else{
			for(var i=0;i<score_checked.length;i++){			
				score_checked[i].src="../img/u45.png";
			}
			flag8=true;
		}
	});
	$(".score_edit1").click(function(){
		if($(".score_check").prop("checked")==true){
			var score_check=getClassNames("score_check")[0];
			var score_checked=getClassNames("score_checked");
			for(var i=0;i<score_checked.length;i++){			
				score_checked[i].src="../img/u45.png";
			}
			score_check.checked=false;
			flag8=true;			
		}
	});
	/*选择班级*/
	selectclass($(".class_sum_select"),$(".class_sum3"));
	shownew($(".class_sum3 li"),$(".class_sum3"),".alert_bj",$(".class_sum4 ul"),$(".class_sum_select"));
	changesta($(".change_statue2 li"),$(".change_input"),$(".change_statue2"),$(".change_statue1"));
	$(".stu_add_student2").click(function(){
		$(".stu_edit_people").css("display","block");
		$(".student_check").css("display","block");
		$(".stu_add_student").css("display","none");
	});
	$(".stu_score_cbj1").click(function(){
		$(".stu_edit_people").css("display","none");
		$(".student_check").css("display","none");
		$(".stu_add_student").css("display","block");
	});
	selectclass($(".stu_bj"),$(".stu_score_select"));
	showele($(".stu_change_b1"),$(".change_stu"),$(".alert_screen"));	
	showele($(".stu_change_b2"),$(".change_class_statue"),$(".alert_screen"));	
	hideele($(".change_stu2_cancle"),$(".change_stu"),$(".alert_screen"));
	hideele($(".stu_sta_cancle"),$(".change_class_statue"),$(".alert_screen"));	
	selectclass($(".change_select"),$(".change_stunj"));
	shownew($(".change_stunj li"),$(".change_stunj"),".change_stubj",$(".change_stubj ul"),$(".change_select"));
	/*教师批量管理*/
	allcheck("stu_score_check","student_check","stu_score_cbj1");
	showele($(".kb_add"),$(".add_music"),$(".alert_screen"));
	hideele($(".music_btn1"),$(".add_music"),$(".alert_screen"));
	showele($(".stu_add_student1"),$(".add_student"),$(".alert_screen"));
    hideele($(".add_student_cancle"),$(".add_student"),$(".alert_screen"));
	allcheck("add_all_check1","add_cen2","add_student_cancle");
	changesrc($(".add_cen2"));
	changesrc($(".alert_check1"));
	allcheck("alert_right1","alert_check1","alert_cancel");
	/*添加音乐课*/
}

