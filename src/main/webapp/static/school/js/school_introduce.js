$(function(){
	$(".topcenter li").eq(6).addClass("act");//添加
	//学校介绍页中展开按钮的点击事件
	var school_history_top2=getClassNames("school_history_top2","div");
	var flag=[];
	for(var i=0;i<school_history_top2.length;i++){
		school_history_top2[i].index=i;
		flag.push("flag"+i);
		flag[i]=true;
		school_history_top2[i].onclick=function(){
			 /*给某元素的使用animate将高改成auto失效的解决办法*/
			var curHeight=$(".school_history_p").eq(this.index).height();//获得该元素当前的高
			var autoHeight=$(".school_history_p").eq(this.index).css("height","auto").height();//获得该元素自适应以后的高
			if(flag[this.index]){
				$(".school_history_top2").eq(this.index).find("span").html("收起");
				$(".school_history_top2").eq(this.index).find("img").attr("src","/static/school/img/up_07.gif");
				$(".school_history_p").eq(this.index).height(curHeight).stop().animate({"height":autoHeight},500);
				flag[this.index]=false;
			}else if(flag[this.index]==false){
				$(".school_history_top2").eq(this.index).find("span").html("展开");
				$(".school_history_top2").eq(this.index).find("img").attr("src","/static/school/img/down2_03.gif");
				$(".school_history_p").eq(this.index).stop().animate({"height":"0"},500);
				flag[this.index]=true;
			}
		}
	}
	//学校介绍页中简介旁边编辑按钮的点击事件
	var change=true;
	$(".school_title_edit").click(function(){
		if(change){
			$(this).val("取消");
			$(".school_history_top2").css("display","none");
			$(".school_history_edit").css("display","block");
			$(".school_history_p").css({"height":"auto"});
			$(".school_img img").attr("src","/static/school/img/school_introce/edit.png");
			$(".school_img p").css("display","block");
			$(".school_exp").addClass("school_exp_change");
			$('.school_exp_save').css("display","block");
			$(".school_exp").attr("contenteditable","true");
			$(".school_exp_cont").removeClass("school_exp_change_sum");
			change=false;
		}else{
			$(this).val("编辑");
			$(".school_history_top2").css("display","block");
			$(".school_history_edit").css("display","none");
			$(".school_history_p").css({"height":"0"});
			$(".school_img img").attr("src","/static/school/img/school_introce/image.png");
			$(".school_img p").css("display","none");
			$(".school_exp").removeClass("school_exp_change");
			$(".school_exp").attr("contenteditable","false");
			$(".school_exp_cont").addClass("school_exp_change_sum");
			$('.school_exp_save').css("display","none");
			change=true;
		}
	});
	//学校介绍页中各个部分的编辑按钮的点击事件
	var school_history_edit=getClassNames("school_history_edit","input");
	var school_save=getClassNames("school_save","input");
	var arr=[];
	for(var j=0;j<school_history_edit.length;j++){
		arr.push("arr"+j);
		arr[j]=true;
		school_history_edit[j].index=j;
		school_save[j].index=j;
		school_history_edit[j].onclick=function(){
			if(arr[this.index]){
				$(".school_history").eq(this.index).addClass("school_active");
				$(".school_history_cent").css({"padding-bottom":"20px","overflow":"hidden","margin-top":"20px"});
				$(this).val("取消");				
				arr[this.index]=false;
			}else{
				$(".school_history").eq(this.index).removeClass("school_active");
				$(".school_history_cent").css({"padding-bottom":"0","overflow":"initial","margin-top":"0"});
				$(this).val("编辑");				
				arr[this.index]=true;
			}
		}
		school_save[j].onclick=function(){
			$(".school_history").eq(this.index).removeClass("school_active");
			$(".school_history_edit").eq(this.index).val("编辑");
			arr[this.index]=true;
		}
	}
	//保存按钮的点击事件
	$(".school_exp_save").click(function(){
		$(".school_exp").removeClass("school_exp_change");
		$(".school_exp_cont").addClass("school_exp_change_sum");
		$('.school_exp_save').css("display","none");
		$(".school_exp").attr("contenteditable","false");
	});
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
            //console.log('num change');
        }
	});
	//日期插件调用结束
});
