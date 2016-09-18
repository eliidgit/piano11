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
	$(".topcenter li").eq(5).addClass("act");
	//故障钢琴列表和钢琴资产配置的点击事件
	//tabnav($(".proplist ul li"),".propdecen","act");
	$(".proplist ul li").click(function(){
		$(".propdecen"+$(this).index()).css("display","block").siblings().css("display","none");
		$(this).addClass("act").siblings().removeClass("act");
		$(".fault").html($(this).find("a").html());
		$("#search_type").val($(this).index());
	})
	//鼠标滑过去边框
	ul_hover($(".state ul"));
	//自维修和厂家维修
//	var service=getClassNames("service","li");
//	newtabnav(service,".service",".maintain","wxact");
	//教室选择点击事件
	$(".propsort ul").on("click","li",function(){
		$(this).addClass("class_act").siblings().removeClass("class_act");
		$("#classroom_id").val("classroomId="+$(this).attr("data-id"));
		var classroom_id = $(this).attr("data-id");
		$('.state').empty();
		$.ajax( {  
		     url:'/school/piano/getPagePianoByClassroom',// 跳转到 action     
		     data:{  
		    	 classroomId : classroom_id,    
		             },
		     async:false,  //同步
		     type:'post',      
		     dataType:'json',  
		     success:function(data) { 
		    	 currentPage=1;
		    	 totalPage=1;
		         if(data.code =="200" ){  
		        	 $('.state').empty();
		        	 totalPage=data.detail.totalPage;
		        	 for(var i = 0;i<data.detail.list.length;i++){
		        		 var temp = data.detail.list[i];
		        		 showPiano(temp);
		        	 }
		         }else{  
		            alert(data.description);  
		        }  
		     },  
		      error : function() {  
		           alert("异常！");  
		     }  
		});

		
	});
	//申诉点击事件
	$(".proplink").click(function(){
		$(".allpinao").css("display","block");
		$(".propcontact").css("display","block");		
	});
	//申诉弹窗取消按钮的点击事件
	$(".qx").click(function(){
		$(".allpinao").css("display","none");
		$(".propcontact").css("display","none");	
	});
	//故障报修的取消按钮
	hideele($(".repairs_cancle"),$(".repairs"),$(".allpinao"));
	//报修按钮的点击事件
	//showele($(".propde0"),$(".repairs"),$(".allpinao"));
	//新增钢琴页面向下的点击事件
	$(".cendate").click(function(event){
		stopEvent(event);
		if($(".cendown").css("display")=="none"){
			$(".cendown").css("display","block");
		}else{
			$(".cendown").css("display","none");
		}
	});
	//分配教室的点击事件
	$(".cendown li").click(function(){
		$(".date3").val($(this).html());
		$("#piano_classroom_id").val($(this).attr("data-id"));
		$(".cendown").css("display","none");
	});
	//新建教室的取消按钮
	hideele($(".newbtnc"),$(".newc1"),$(".newclass"));
	//新建教室按钮的点击事件
	showele($(".createclass"),$(".newc1"),$(".newclass"));
	//新建钢琴取消按钮点击事件
	hideele($(".canres1"),$(".allpinao"),$(".newpinao"));
	showele($(".propadd"),$(".allpinao"),$(".newpinao"));
	//添加
	//自维修和厂家维修的点击事件
	$(".repairs_mode0").click(function(){
		$(this).find(".repairs_check").addClass("repair_act");
		$(".repairs_mode1").find(".repairs_check").removeClass("repair_act");
		$("#pianoMalfunction_dispose_mode").val(1);
	});
	$(".repairs_mode1").click(function(){
		$(this).find(".repairs_check").addClass("repair_act");
		$(".repairs_mode0").find(".repairs_check").removeClass("repair_act");
		$("#pianoMalfunction_dispose_mode").val(2);
	});
	//钢琴故障类型的点击事件
	$(".equipment li").click(function(){
		$(".repair_input input").val($(this).html());
		$("#pianoMalfunction_type").val($(this).attr("data-id"));
	});
	$(".repair_input").click(function(){
		if($(".equipment").css("display")=="none"){
			$(".equipment").css("display","block");
		}else{
			$(".equipment").css("display","none");
		}
	});
	$(document).click(function(e){
		var e=e||event;
		if(e.target.className!="repair_input"&&e.target.className!="repair_input0"&&e.target.className!="repair_input1"){
			$(".equipment").css("display","none");
		}
		//$(".main_ul").css("height","30px");
		//$(".cendown").css("display","none");
	});
});
//申诉的表单提交
function question(){
	var phonenum=/^(13[0-9]{9})|(15[89][0-9]{8})$/;
	if($(".pc1 textarea").val()==""){
		alert("请输入问题描述");
		return false;
	}else if($(".pophone").val()==""){
		alert("请输入您的联系方式");
		return false;
	}else if(phonenum.test($(".pophone").val())==false){
		$(".pophone").val("")
		alert("请输入正确的手机号格式");
		return false;
	}else{
		return true;
	}
}
//新建教室的表单提交
function createclass(){
	if($(".jxl").val()==null||$(".jxl").val()==""){
		alert("请输入教学楼名称");
		return false;
	}else if($(".jsname").val()==null||$(".jsname").val()==""){
		alert("请输入教室名称");
		return false;
	}else{
		var options = {
                url: '/school/piano/addClassroom',
                type: 'post',
                dataType: 'json',
                data: $("#add_classroom").serialize(),
                success: function (data) {
                    if (data.code == '200') {
                    	var create_class=$('<li data-id="'+data.detail.id+'">'+data.detail.building+'-'+data.detail.name+'</li>');
                		$(".cendown ul").append(create_class);
                		$(".date3").val(data.detail.building+'-'+data.detail.name);
                		$("#piano_classroom_id").val(data.detail.id);
                		$(".propsort ul").append('<li class="class_act" data-id="'+data.detail.id+'">'+data.detail.name+'</li>')
                		$(".newc1").css("display","none");
                		$(".newclass").css("display","none");
                    } else {
                        alert(data.description);
                    }
                }
            };
            $.ajax(options);
		return true;
	}
}
//新建钢琴的表单提交
function createpinao(){
	if($(".date1").val()==null&&$(".date1").val()==""){
		alert("请选择入校时间");
		return false;
	}else if($(".date2").val()==null&&$(".date2").val()==""){
		alert("请输入用户ID");
		return false;
	}else if($("#piano_classroom_id").val()==null||$("#piano_classroom_id").val()==""){
		alert("请选择分配教室");
		return false;
	}else{
		return true;
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













