var flag10=true;
$(function(){
	$(".topcenter li").eq(2).addClass("act");//添加
	//性别点击事件
	$(".stu_sex_select1").click(function(){
		$(this).css("background","url(../img/spirit_img.png) no-repeat -197px -54px");
		$(".stu_sex_select2").css("background","url(../img/spirit_img.png) no-repeat -218px -54px");
	});
	$(".stu_sex_select2").click(function(){
		$(this).css("background","url(../img/spirit_img.png) no-repeat -197px -54px");
		$(".stu_sex_select1").css("background","url(../img/spirit_img.png) no-repeat -218px -54px");
	});
	//学生信息编辑点击事件
	//var flag=true; 
	$(".teacher_edit").click(function(){
		//if(flag){
			$(".tea_base_msg1").css("display","none");
			$(".tea_base_msg2").css("display","block");
			$(".stu_base_tit3").css("display","none");
			$(".teacher_save").css("display","block");
			$(".stu_btn").css("display","block");
			$(this).css("display","none");
			$(".stu_right").css("width","980px");
			$(".stu_det_edit").html("学生详情编辑");
			//flag=false;
		//}	
	});
	$(".teacher_cancle").click(function(){
		//if(flag==false){
			$(".tea_base_msg1").css("display","block");
			$(".tea_base_msg2").css("display","none");
//			$(".stu_base_tit3").css("display","block");
//			$(".teacher_save").css("display","none");
			$(".stu_btn").css("display","none");
			$(".teacher_edit").css("display","block")
			$(".stu_right").css("width","860px");
			$(".stu_det_edit").html("学生详情");
//			$(".teacher_cancle").css("display","none");
			//flag=true;			
		//}
	});
	//家长编辑点击事件开始采用js事件委托原理来给新创建的元素添加点击事件
	//var flag1=true;
	var teacher_base2_edit=getClassNames("teacher_base2_edit","input");
	var teacher_base2_cancle=getClassNames("teacher_base2_cancle","input");
	$(".teacher_base2_msg").click(function(event){//父元素来添加点击事件
		for(var i=0;i<teacher_base2_edit.length;i++){
			//teacher_base2_edit[i].index=i;//给每个编辑按钮添加索引
			if(event.target==teacher_base2_edit[i]){//判断事件源是否是编辑按钮如果是的话就执行如下操作
				//if(flag1){
					$(".teacher_bmsg1").eq(i).css("display","none");
					$(".teacher_bmsg2").eq(i).css("display","block");	
					$(".teacher_base2_edit").eq(i).css("display","none");	
					//flag1=false;
				//}else{
					//flag1=true;
				//}
			}
			if(event.target==teacher_base2_cancle[i]){
				$(".teacher_bmsg1").eq(i).css("display","block");
				$(".teacher_bmsg2").eq(i).css("display","none");
				$(".teacher_base2_edit").eq(i).css("display","block");
			}
		}
	});
	//家长编辑点击事件结束
	//保存按钮的点击事件开始修改将for循环去掉
	//点击保存后修改对应的数据也修改
	/*var teacher_save=getClassNames("teacher_save","input");
	    teacher_save[0].onclick=function(){
	        $(".tea_base_msg1").css("display","block");
			$(".tea_base_msg2").css("display","none");
			$(".stu_base_tit3").css("display","block");
			$(".stu_base_tit1").css("width","620px");
			$(".teacher_name").css("display","block");
			$(".teacher_top img").attr("src","../img/teacher_detail_03.png");
			$(".teacher_top").css("marginBottom","40px");
			$(".teacher_top img").css({"top":"28px","left":"47%"});
			$(".teacher_base_msg").css({"background":"#fff","width":"402px"})
			$(".teacher_edit").val("编辑");
//			$(".teacher_save").css("display","none");
			$(".stu_btn").css("display","none");
			$(".teacher_edit").css("display","block")
			$(".stu_right").css("width","860px");
			//添加部分
			if($(".boy").css("background").indexOf("102")>0){
				$(".sex").html("男");
			}else{
				$(".sex").html("女");
			}
			$(".teacher_name").html($(".tea_name").val());
			$(".teacher_age").html($(".tea_age").val());
//			flag=true;
	   }*/
	//保存按钮的点击事件结束
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
	//编辑页面中保存按钮的点击事件开始将tea_link选择亲属关系的点击事件删除添加到下面
	var teacher_base2_contsave=getClassNames("teacher_base2_contsave","input");
//	var tea_link1=getClassNames("tea_link1","input");
//	var tea_stu_link=getClassNames("tea_stu_link","div");
	var flag3=[];
	for(var j=0;j<teacher_base2_contsave.length;j++){
		flag3[j]=true;
	}
	/*$(".teacher_base2_fruits").click(function(event){
		for(var i=0;i<teacher_base2_contsave.length;i++){
			if(event.target==teacher_base2_contsave[i]){//判断事件源是否是保存按钮如果是的话就执行如下操作
				$(".teacher_bmsg1").eq(i).css("display","block");
				$(".teacher_bmsg2").eq(i).css("display","none");
				$(".teacher_base2_edit").eq(i).css("display","block");
				//点击保存修改数据对应的数据改变点击保存以后相应的数据就改变。
				$(".stu_second").eq(i).find("span").eq(0).html($(".teacher_base2_content").eq(i).find("input").val());
				$(".stu_first").eq(i).find("span").eq(1).html(tea_link1[i].value);
				$(".stu_first").eq(i).find("span").eq(1).html($(".teacher_base2_time").eq(i).find("input").val());
				flag1=true;
			}
			else if(event.target==tea_link1[i]){//如果事件源是选择亲属关系的点击事件	
				console.log(flag3[i]);
				if(flag3[i]){
					$(".tea_stu_link").eq(i).css("display","block");
					flag3[i]=false;					
				}else{
					$(".tea_stu_link").eq(i).css("display","none");
					flag3[i]=true;
				}
			}
			else if(event.target.parentNode.parentNode==tea_stu_link[i]){//div下面的li的点击事件
				var str=$(".tea_link input").val();
				$(".tea_link input").eq(i).val(event.target.innerHTML);
				event.target.innerHTML=str;
				event.target.parentNode.parentNode.style.display="none";
				flag3[i]=true;
			}
		}
	});*/
	//编辑页面中保存按钮的点击事件结束
	changesta($(".link_parent li"),$(".parent1 input"),$(".link_parent"),$(".parent1"));
	hideele($(".all_cancel"),$(".allstu_screen"),$(".all_parent"));
	showele($(".teacher_base2_right"),$(".allstu_screen"),$(".all_parent"));
	//添加按钮的点击事件
	$(".all_save").click(function(){
		var all_save=$("<div class='teacher_bmsgs'><input class='teacher_base2_edit' type='button' value='编辑' /><div class='teacher_bmsg1'><div class='stu_circle'></div><div class='stu_relation'><div class='stu_first'><span>"+$(".parent1 input").val()+"</span><span>"+$(".all_name").val()+"</span></div><div class='stu_second'><span>"+$('.all_name').eq(1).val()+"</span></div></div></div><div class='teacher_bmsg2'><div class='teacher_base2_tit'><span class='tea_relation'>亲属关系</span><div class='tea_link'><input  class='tea_link1' type='text' value='"+$(".parent1 input").val()+"' /><span></span></div><div class='tea_stu_link'><ul><li>妈妈</li><li>奶奶</li><li>爷爷</li></ul></div><div class='clear'></div></div><div class='teacher_base2_time'><span>姓名</span><input class='stu_add' type='text' value='"+$('.all_name').eq(0).val()+"' />	</div><div class='clear'></div><div class='teacher_base2_content'><span>联系电话</span><input class='stu_add' type='text' value='"+$(".all_name").eq(1).val()+"' /></div><div class='clear'></div><div class='stubtn'><input class='teacher_base2_cancle' type='button' value='取消'/><input class='teacher_base2_contsave' type='button' value='保存' /></div></div></div>")
	    $(".teacher_base2_msg").append(all_save);
	    $(".all_parent").css("display","none");
	    $(".allstu_screen").css("display","none");
	});
	//学生详情页
	//selectclass($(".select_bj input"),$(".all_stu_hover"));
	//shownew($(".select_class1 li"),$(".select_class1"),".select_bj",$(".select_class2 ul"),$(".select_bj input"));
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
	//学生详情状态的点击事件
	/*$(document).click(function(e){
		e = e || window.event;
		if(e.target.className!="stu_state"&&e.target.className!="stu_sate_input"&&e.target.className!="stu_sate_span"){
			$(".stu_state_ul").css("display","none");
			flag10=true;
		}
		if(e.target.className!="tea_link1"&&e.target.className!="tea_link"&&e.target.className!="tea_link_span"){
			$(".tea_stu_link").css("display","none");
			for(var k=0;k<$(".tea_link1").length;k++){
				flag3[k]=true;
			}
		}
	})*/
});
