$(function(){
	$(document).click(function(){
		$(".sum_class_sel").css("display","none");
	});
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
	$(".topcenter li").eq(5).addClass("act");//添加
	/*钢琴详情申请报修的点击事件*/
	showele($(".apply"),$(".pinao_screen"),$(".pinao_repair"));
	hideele($(".pinao_btns_cancle"),$(".pinao_screen"),$(".pinao_repair"));
	/*钢琴详情申请报修的弹窗中设备类型的点击事件*/
	changesta($(".pinao_list_cont ul li"),$(".pinao_date .piano_type"),$(".pinao_list_cont"),$(".pinao_date"));
	/*钢琴详情申请保修选择自维修和厂家维修的点击事件*/
	$(".pinao_list_btn1").click(function(){
		$(this).css("color","#000");
		$(".pinao_list_btn2").css("color","#666");
	});
	$(".pinao_list_btn2").click(function(){
		$(this).css("color","#000");
		$(".pinao_list_btn1").css("color","#666");
	});
	//钢琴详情编辑和取消按钮的点击事件
	$(".cancel").click(function(){
		$(".sum_edit1").css("display","none");
		$(".sum_edit2").css("display","block");
		$(".save").css("display","block");
		$(".apply").css("display","none");
		$(".btn_cancle").css("display","block");
		$(this).css("display","none");
		$(".pinao_left_hx1").css("width","986px");
		$(".pinao_det").html("钢琴详情编辑")
	});
	$(".sum_btn .btn_cancle").click(function(){
		$(".sum_edit1").css("display","block");
		$(".sum_edit2").css("display","none");
		$(".save").css("display","none");
		$(".cancel").css("display","block");
		$(".apply").css("display","block");
		$(".btn_cancle").css("display","none");
		$(".pinao_left_hx1").css("width","860px");
		$(".pinao_det").html("钢琴详情")
	});
	//钢琴详情保存按钮的点击事件
	$(".save").click(function(){
		$(".pinao_det").html("钢琴详情");
		var options = {
                url: '/school/piano/edit',
                type: 'post',
                dataType: 'json',
                data: $("#update_piano").serialize(),
                success: function (data) {
                    if (data.code == '200') {
                    	$(".sum_edit1").css("display","block");
                		$(".sum_edit2").css("display","none");
                		$(".save").css("display","none");
                		$(".sum1").css("background","#fff");
                		$(".cancel").css("display","block");
                		$(".apply").css("display","block");
                		$(".btn_cancle").css("display","none");
                		$(".pinao_left_hx1").css("width","860px");
                		$("#piano_piano_id1").text($("#piano_piano_id2").val());
                		$("#piano_building_name1").text($("#piano_building_name2").val());
                		$("#piano_create_time1").text($("#piano_create_time2").val());
                		$("#y1").text(data.detail+"年");
                		$("#y2").val(data.detail+"年");
                    } else {
                        alert(data.description);
                    }
                }
            };
            $.ajax(options);
            return false; 
		
	});
});
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