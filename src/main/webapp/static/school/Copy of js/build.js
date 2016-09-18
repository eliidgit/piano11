$(function(){

	/*添加教师的跳过事件*/
	$(".jump_teacher").click(function(){
		$(".allbuild1").css("display","none");
		$(".allbuild2").css("display","none");
		$(".allbuild3").css("display","block");
		$(".allbuild4").css("display","none");
		$(".allselct").css("display","none");
	})




	/*建立班级页面中自定义按钮的点击事件*/
   var flaga=true;
   $(".addbtn1").click(function(evt){
   	var ev=evt||event;
   	ev.stopPropagation();
   	if(flaga){
	   	$(".addgrade").css("display","block");
	   	flaga=false;
   	}else{
   		$(".addgrade").css("display","none");
   		flaga=true;
   	}
   });
   /*建立班级页面年级的点击事件*/
   var flag5=true;
   $(".bnj").click(function(evt){
   	var ev=evt||event;
   	ev.stopPropagation();
   	if(flag5){
   		 $(".njdown").css("display","block");
   		 flag5=false;
   	}else{
   		$(".njdown").css("display","none");
   		flag5=true;
   	}   	 
   });
   $(document).on("click",".njdown li",function(){
   		$(".selecnj").val($(this).html());
	   $("#grade_id").val($(this).attr("value"));
   	    $(".njdown").css("display","none");
   		flag5=true;
   });
  /* $("body").click(function(){
   	  $(".njdown").css("display","none");
   	  flag5=true;
   });
*/
	/*全部班级点击事件*/
	var asum=getClassNames("a1");
	for(var i=0;i<asum.length;i++){
		asum[i].index=i;
		asum[i].onclick=function(){
			if(this.index==0){
				$(".allselct1").css("display","block");
				$(".allselct2").css("display","none");
				asum[0].style.color="#333";
				asum[1].style.color="#666";
				asum[2].style.color="#666";
				$(".sub1").css("display","block");
				$(".sub2").css("display","none");
				$(".sub3").css("display","none");
			}else if(this.index==1){
				$(".allselct1").css("display","none");
				$(".allselct2").css("display","block");
				asum[0].style.color="#666";
				asum[1].style.color="#333";
				asum[2].style.color="#666";
				$(".sub1").css("display","none");
				$(".sub2").css("display","block");
				$(".sub3").css("display","none");
			}else if(this.index==2){
				$(".allselct1").css("display","none");
				$(".allselct2").css("display","none");
				asum[0].style.color="#666";
				asum[1].style.color="#666";
				asum[2].style.color="#333";
				$(".sub1").css("display","none");
				$(".sub2").css("display","none");
				$(".sub3").css("display","block");
			}
			for(var j=0;j<asum.length;j++){
				$(".newtea"+(j+1)).css("display","none");
			}
			$(".newtea"+(this.index+1)).css("display","block");
		}
	}

  /*判断录入学生页面显示*/
	$(".sub").eq(1).click(function(){
		var tcheck1=getClassNames("tcheck1");
		var sum=0;
		for(var i=0;i<tcheck1.length;i++){
			if(tcheck1[i].src.indexOf("success2_07.png")>=0){
				sum++;
			}
		}
		if(sum>0){
			$(".lr_tc").css("display","block");
			$(".lr_success").css("display","block");						
		}else if(sum==0){
			alert("请选择要录入的学生");
		}
	});
	/*新增学生*/
	selectclass($(".newtit_down1"),$(".newtit_down2"));
	shownew($(".newtit_down2 li"),$(".newtit_down2"),".newtit_down2_ul",$(".newtit_down2_ul ul"),$(".newtit_down1 input"));
	/*结束*/
    $(".jump_step").click(function(){
   		$(".allbuild1").css("display","none");
	   	$(".allbuild2").css("display","none");
	   	$(".allbuild3").css("display","none");
	   	$(".allbuild4").css("display","block");
   });
  
   /*全选*/
    var flag8=true;
	$(".allcheck").click(function(){
		var tcheck=getClassNames("tcheck");
		if(flag8){
			for(var i=0;i<tcheck.length;i++){
				tcheck[i].src="/static/school/img/success2_07.png";
			}
			flag8=false;
		}else{
			for(var i=0;i<tcheck.length;i++){			
				tcheck[i].src="/static/school/img/u45.png";
			}
			flag8=true;
		}
	});
	/*全选添加*/
	 var flag9=true;
	$(".allcheck1").click(function(){
		var tcheck1=getClassNames("tcheck1");
		if(flag9){
			for(var i=0;i<tcheck1.length;i++){
				tcheck1[i].src="/static/school/img/success2_07.png";
			}
			flag9=false;
		}else{
			for(var i=0;i<tcheck1.length;i++){			
				tcheck1[i].src="/static/school/img/u45.png";
			}
			flag9=true;
		}
	});
	/*全选结束*/
	/*全选添加*/
	 var flag10=true;
	$(".allcheck2").click(function(){
		var tcheck2=getClassNames("tcheck2");
		if(flag10){
			for(var i=0;i<tcheck2.length;i++){
				tcheck2[i].src="/static/school/img/success2_07.png";
			}
			flag10=false;
		}else{
			for(var i=0;i<tcheck2.length;i++){			
				tcheck2[i].src="/static/school/img/u45.png";
			}
			flag10=true;
		}
	});
	/*全选结束*/
	changesrc($(".tcheck"));
	changesrc($(".tcheck1"));
	changesrc($(".tcheck2"));
	selectclass($(".allbj1"),$(".build_class_ul"));
	shownew($(".build_class_ul li"),$(".build_class_ul"),".build_ul_new",$(".build_ul_new ul"),$(".allbj1"));
	/*班级选择*/
	selectclass($(".select_down input"),$(".bj_tit2"));
	shownew($(".bj_tit2 li"),$(".bj_tit2"),".bj_ul",$(".bj_tit3 ul"),$(".select_down input"));
	/*获取id*/
	/*录入学生的删除事件*/
	/*var lr_del=getClassNames("lr_del");
	var lr_success1_li=getClassNames("lr_success1_li");
	var lr_del_input=getClassNames("lr_del_input");
	for(var i=0;i<lr_del.length;i++){
		lr_del[i].index=i;
		$(".lr_success ul").on("click",lr_del[i],function(evt){
			var ev=evt||event;
			var target=ev.target||ev.srcElement;
			target.parentNode.parentNode.remove();
			console.log(target.previousSibling.value);
			$(".tcheck_id1").each(function(i){
				if($(this).val()==target.previousSibling.value){
					//$(this).parent().remove();
				}
			})
		});
	}*/
	/*继续添加学生*/
	/*继续添加学生*/
	//hideele($(".lr_go"),$(".lr_tc"),$(".lr_success"));
	$(".lr_go").click(function(){
		$(".lr_tc").css("display","none");
		$(".lr_success").css("display","none");
		$(".lr_success1 ul li").remove();
	});



	/*判断录入学生页面显示*/
	//insert_people($(".sub1"),"tcheck1");
	//insert_people($(".sub2"),"tcheck2");
	/*结束*/


	/*录入学生成功后调回学生列表*/
	$(".sub3").click(function(){
		$(".newtea1").css("display","block");
		$(".allselct1").css("display","block");
		$(".newtea3").css("display","none");
		$(".sub1").css("display","block");
		$(".sub2").css("display","none");
		$(".sub3").css("display","none");
	});

	/**/
	/*选中学生 录入按钮 事件函数*/
	$(".sub1").click(function(){
		var newarr=[];
		var tcheck1=getClassNames("tcheck1");
		var tcheck_id1=getClassNames("tcheck_id1");
		var sum=0;
		for(var i=0;i<tcheck1.length;i++){
			tcheck1[i].index=i;
			//alert("1");

			if(tcheck1[i].src.indexOf("success2_07.png")>=0){

				newarr.push(tcheck_id1[i].value);
				//console.log($(".allbuild3 .newtea1 .ntp").eq(i).find("p").eq(1).html());
				var newtcheck1=$("<li class='lr_success1_li'><a href='#'><input class='lr_del_input' type='hidden' value='"+tcheck_id1[i].value+"' /><img class='lr_del' src='/static/school/img/lr_del_03.png'><div class='lr_tx'><img src='/static/school/img/teacher_msg_03.png'/></div><div class='lr_msg'><p class='lr_msg1'>"+$(".allbuild3 .newtea1 .ntp").eq(i).find("p").eq(0).html()+"</p><p class='lr_msg2'>"+$(".allbuild3 .newtea1 .ntp").eq(i).find("p").eq(1).html()+"</p><p class='lr_msg3'>学籍:<span>"+$(".allbuild3 .newtea1 .ntp").eq(i).find("span").eq(0).html()+"</span></p></div></a></li>")

				$(".lr_success1 ul").append(newtcheck1);

				/*录入学生的删除事件*/
				var lr_del=getClassNames("lr_del");
				var lr_success1_li=getClassNames("lr_success1_li");
				var lr_del_input=getClassNames("lr_del_input");
				for(var j=0;j<lr_del.length;j++){
					lr_del[j].index=j;
					$(".lr_success ul").on("click",lr_del[j],function(evt){
						var ev=evt||event;
						var target=ev.target||ev.srcElement;
						target.parentNode.parentNode.remove();
						console.log(target.previousSibling.value);
						$(".allbuild3 .newtea1 .tcheck_id1").each(function(i){
							if($(this).val()==target.previousSibling.value){
								$(".tcheck1").eq(i).attr("src","../img/u45.png");
							}
						});

					});
				}

			}
			sum++;
		}
		if(sum>0){
			$(".lr_tc").css("display","block");
			$(".lr_success").css("display","block");
		}else if(sum==0){
			alert("请选择要录入的学生");
		}
		console.log(newarr);












	});
	$(".sub2").click(function(){
		var tcheck2=getClassNames("tcheck2");
		var tcheck_id2=getClassNames("tcheck_id2");
		var sum=0;
		for(var i=0;i<tcheck2.length;i++){
			tcheck2[i].index=i;
			if(tcheck2[i].src.indexOf("success2_07.png")>=0){
				console.log(tcheck_id2[i].value);
				console.log($(".newtea2 .ntp").eq(i).find("p").eq(1).html());
				var newtcheck1=$("<li class='lr_success1_li'><a href='#'><input class='lr_del_input' type='hidden' value='2' /><img class='lr_del' src='/static/school/img/lr_del_03.png'><div class='lr_tx'><img src='/static/school/img/teacher_msg_03.png'/></div><div class='lr_msg'><p class='lr_msg1'>"+$(".newtea2 .ntp").eq(i).find("p").eq(0).html()+"</p><p class='lr_msg2'>"+$(".newtea2 .ntp").eq(i).find("p").eq(1).html()+"</p><p class='lr_msg3'>学籍:<span>"+$(".newtea2 .ntp").eq(i).find("span").eq(0).html()+"</span></p></div></a></li>")
				$(".lr_success1 ul").append(newtcheck1);
			}
			sum++;
		}
		if(sum>0){
			$(".lr_tc").css("display","block");
			$(".lr_success").css("display","block");
		}else if(sum==0){
			alert("请选择要录入的学生");
		}
	});

	/**/

});
function insert1(){
	if($(".selecnj").val()==""){
		alert("请选择年级");
		return false;
	}else if($(".insbj").val()==""){
		alert("请填写班级");
		return false;
	}else{
		return true;
	}
}
function showAddTeacherDiv(){
	$(".allbuild1").css("display","none");
	$(".allbuild2").css("display","block");
	$(".allbuild3").css("display","none");
	$(".allbuild4").css("display","none");
}
function showAddStudentDiv(){
	$(".allbuild1").css("display","none");
	$(".allbuild2").css("display","none");
	$(".allbuild3").css("display","block");
	$(".allbuild4").css("display","none");
	$(".allselct").css("display","none");
	$(".allselct1").css("display","block");
}
function showAddSuccessDiv(){
   $(".allbuild1").css("display","none");
   $(".allbuild2").css("display","none");
   $(".allbuild3").css("display","none");
   $(".allbuild4").css("display","block");
   $(".lr_tc").css("display","none");
   $(".lr_success").css("display","none");
}

