$(function(){
	$(".topcenter li").eq(3).addClass("act");//添加
	/*$(".boy").click(function(){
		$(this).css("background","#666");
		$(".girl").css("background","#fff");
	});
	$(".girl").click(function(){
		$(this).css("background","#666");
		$(".boy").css("background","#fff");
	});*/
	$(".tea_yes").click(function(){
		 $(".teach_hx:last").css("display","none");
	    $(".tea_add_fruit").css("display","none");
		$(".tea_add_fut").css("display","none");
		var options = {
	               url: '/school/teacher/addTeacherResult',
	               type: 'post',
	               dataType: 'json',
	               data: $("#add_teacher").serialize(),
	               success: function (data) {
	                   if (data.code == '200') {
	                	   var timestart=change_year(data.detail.time_start);
	                	   var newfruit='<div class="teacher_bmsgs">'+
	               		'<form>'+
	               				'<input class="teacher_base2_edit" type="button" onclick="edit_teacher_msg(this)" value="编辑" />'+
	               				'<input type="hidden" name="teacherResult.id" value="'+data.detail.id+'"/>'+
	               				'<div class="teacher_bmsg1">'+
	               					'<div class="teacher_bmsg_left">'+
	               					'</div>'+
	               					'<div class="teacher_bmsg_right">'+
	               						'<p class="teacher_title">'+data.detail.title+'</p>'+
	               						'<div class="allp">'+
	               							'<p class="teacher_date">'+timestart+'</p>'+
	               							'<p class="teacher_cont">'+data.detail.content+'</p>'+	
	               						'</div>'+
	               					'</div>		'+									
	               				'</div>	'+
	               				'<div class="teacher_bmsg2 hide">'+
	               					'<div class="teacher_base2_tit">'+
	               						'<p>标题</p>'+
	               						'<input class="pass" type="text" name="teacherResult.title" value="'+data.detail.title+'" />'+										
	               					'</div>'+
	               					'<div class="teacher_base2_time">'+
	               						'<p>时间</p>'+
	               						'<div class="teacher_bmsg2_time1">'+
	               							'<input class="teacher_startime jcDate"  name="teacherResult.time_start" type="text" value="'+data.detail.time_start+'" />'+
	               							'<span></span>'+
	               						'</div>'+
	               						'<div class="teacher_bmsg2_hx">至</div>'+
	               						'<div class="teacher_bmsg2_time1">'+
	               							'<input class="teacher_endtime jcDate" name="teacherResult.time_end" type="text" value="'+data.detail.time_end+'" />'+
	               							'<span></span>'+
	               						'</div>'+
	               					'</div>'+
	               					'<div class="teacher_base2_content">'+
	               						'<p>工作内容</p>'+
	               						'<textarea name="teacherResult.content">'+data.detail.content+'</textarea>'+
	               					'</div>'+
	               					'<div class="tea_btn">'+
	               						'<input class="teacher_base2_contcancle" onclick="cancle_teacher_msg(this)" type="button" value="取消" />'+
	               						'<input class="teacher_base2_contsave" onclick="save_teacher_msg(this)" type="button" value="保存" />'+												
	               					'</div>'+
	               				'</div>'+
	               				'</form>'+
	               			'</div>';
	               	    $(".teacher_base2_msg").append(newfruit);
	               	    $(".teach_hx").css("display","block");
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
	                   } else {
	                       alert(data.description);
	                   }


	               }
	           };
	           $.ajax(options);
	           return false; 
	});
	$(".teacher_edit").on("click",function(){
			$(".tea_base_msg1").css("display","none");
			$(".tea_base_msg2").css("display","block");
			$(".teacher_btn").css("display","block");
			$(".tea_top").css("display","block");//添加上传图片功能编辑时input框消失
			$(this).css("display","none");
			$(".teacher_base_hx2").eq(0).css("width","960px");
			
	});
	$(".teacher_cancle").click(function(){
		$(".tea_base_msg1").css("display","block");
		$(".tea_base_msg2").css("display","none");
		$(".teacher_btn").css("display","none");
		$(".tea_top").css("display","block");//添加上传图片功能编辑时input框出现
		$(".teacher_edit").css("display","block");
		$(".teacher_base_hx2").eq(0).css("width","856px");
	});
//将teacher_base2_edit的事件委托给他的父元素，这是修改的js
   /* var teacher_base2_edit=getClassNames("teacher_base2_edit","input");
    var teacher_base2_contsave=getClassNames("teacher_base2_contsave","input");
    var teacher_base2_contcancle=getClassNames("teacher_base2_contcancle","input");
	$(".teacher_base2_msg").click(function(event){//父元素来添加点击事件
		for(var i=0;i<teacher_base2_edit.length;i++){
				if(event.target==teacher_base2_edit[i]){//判断事件源是否是编辑按钮如果是的话就执行如下操作
						$(".teacher_bmsg1").eq(i).css("display","none");
						$(".teacher_bmsg2").eq(i).css("display","block");
						$(".teacher_base2_edit").eq(i).css("display","none");
				}else if(event.target==teacher_base2_contsave[i]){
						$(".teacher_bmsg1").eq(i).css("display","block");
						$(".teacher_title").eq(i).html($(".pass").eq(i).val());
						$(".teacher_date").eq(i).html($(".teacher_startime").eq(i).val());
						$(".teacher_cont").eq(i).html($(".teacher_base2_content textarea").eq(i).val());
						$(".teacher_bmsg2").eq(i).css("display","none");
				}else if(event.target==teacher_base2_contcancle[i]){
					$(".teacher_bmsg1").eq(i).css("display","block");
					$(".teacher_bmsg2").eq(i).css("display","none");
					$(".teacher_base2_edit").eq(i).css("display","block");
				}
			}
		});*/
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
//事件委托结束
	var flag1=true;
	$(".tea_base_det").click(function(){
		if(flag1){
			$(".select_teacher").css("display","block");
			flag1=false;
		}else if(flag1==false){
			$(".select_teacher").css("display","none");	
			flag1=true;
		}
	});
	$(".select_teacher li").click(function(){
		$(".tea_base_det input").val($(this).html());
		$(".select_teacher").css("display","none");	
		$('[name="teacher.job"]').val($(this).attr("data-value"));
		flag1=true;
	});
	var flag3=true;
	$(".tea_base_sex4").click(function(){
		if(flag3){
		    $(".tea_job").css("display","block");
		    flag3=false;
		}else{
			$(".tea_job").css("display","none");
			flag3=true;
		}
	});
	$(".tea_job li").click(function(){
//		var str=$(".tea_base_job").val();
//		var id=$("[name='teacher.state'").val();
		
		$(".tea_base_job").val($(this).html());
		$("[name='teacher.state'").val($(this).attr("data-value"));
//		$(this).html(str);
//		$(this).attr("data-value",id);
		$(".tea_job").css("display","none");
		flag3=true;
	});
	$(".teacher_base2_right").click(function(){
		$(".tea_add_fruit").css("display","block");
		$(".tea_add_fut").css("display","block");
	});
	$(".tea_can").click(function(){
		$(".tea_add_fruit").css("display","none");
		$(".tea_add_fut").css("display","none");
	});
	selectclass($(".select_bj_border"),$(".all_stu_hover"));
//	shownew($(".select_nj li"),$(".select_class1"),".select_bj",$(".select_class2 ul"),$(".select_bj input"));
//	addclass1($(".select_insert"),$(".select_bj input"),$(".tea_bjs"),"tea_bj","tea_del");	
//	//教师编辑中年级的删除事件开始
//	var tea_del=getClassNames("tea_del","span");
//	$(".tea_bjs").click(function(){
//		for(var i=0;i<tea_del.length;i++){
//			tea_del[i].index=i;
//			if(event.target==tea_del[i]){
//				$(".tea_bj").eq(event.target.index).remove();
//			}
//		}
//	});
	//教师编辑中年级的删除事件结束
	
	//保存按钮的点击事件结束
});
//截取字符串将时间转换格式
function change_year(ele){
	var str=ele.toString();
	var sum=str.split("-")[0]+"年"+str.split("-")[1]+"月";
	return sum;
}
/*//从file域获取本地图片的url
function getFileUrl(sourceId) { 
	var url; 
	if (navigator.userAgent.indexOf("MSIE")>=1) { // IE 
		url = document.getElementById(sourceId).value; 
	} else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox 
		url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0)); 
	} else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome 
		url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0)); 
	} 
	return url; 
}
function preImg(sourceId, targetId){ 
	var url = getFileUrl(sourceId); 
	var imgPre = document.getElementById(targetId); 
	imgPre.src = url; 
} 
*/