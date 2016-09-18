var global_sids=[];
$(".lr_tc").css("display","block");
$(".loading").css("display","block");
var leng;
var leng0;
$(function(){
	leng=$(".newtea li").size();
	leng0=$(".newtea0_ul li").size();
	$(".topcenter li").eq(4).addClass("act");//添加
	/*添加教师的跳过事件*/
   /*建立班级页面中自定义按钮的点击事件*/
   $(".addbtn1").click(function(){
	   	if($(".addbtn2").css("display")=="none"){
		   	$(".addbtn2").css("display","block"); 
	   	}else{
	   		$(".addbtn2").css("display","none");
	   	}
   });
   
   /*建立班级页面年级的点击事件*/
   $(".bnj").click(function(evt){
    var ev=evt||event;
   	ev.stopPropagation();
   	if($(".njdown").css("display")=="none"){
   		 $(".njdown").css("display","block");
   	}else{
   		$(".njdown").css("display","none");
   	}   	 
   });
   /*给创建的元素添加事件*/
   $(document).on("click",".njdown li",function(){
   		$(".selecnj").val($(this).html());
   		$("#grade_id").val($(this).attr("value"));
   		
   	    $(".njdown").css("display","none");
   });
   //全部班级点击事件
  $(".select li").click(function(){
  	$(this).addClass("select_act").siblings().removeClass("select_act");
  	$(".newtea"+$(this).index()).css("display","block").siblings().css("display","none");
  });
   $(".bsub").click(function(){
	   if($(".selecnj").val()=="" || $('[name="classInfo.name"]').val()==""){
		   alert("参数不能为空");
		   return;
	   }
	   var options = {
	            url: '/school/class/add',
	            type: 'post',
	            dataType: 'json',
	            data: $("#form1").serialize(),
	            success: function (data) {
	                if (data.code == '200') {
	                	 $("#class_id").val(data.detail);
	                	 $(".allbuild1").css("display","none");
	                	 $(".allbuild2").css("display","block");
	                	 $(".allbuild3").css("display","none");
	                	 $(".allbuild4").css("display","none");
	                	 $(".circle img").attr("src","/static/school/img/class/pic10.png");
	                } else {
	                    alert(data.description);
	                }


	            }
	        };
	        $.ajax(options);
	        return false;
    	   	
           
   });
    $(".jump_step").click(function(){
   		$(".allbuild1").css("display","none");
	   	$(".allbuild2").css("display","none");
	   	$(".allbuild3").css("display","none");
	   	$(".allbuild4").css("display","block");
	   	$(".circle img").attr("src","/static/school/img/class/pic14.png");
   });
  
   /*全选*/
    var flag8=true;
	$(".allcheck").click(function(){
		if(flag8){
			$(".newtea li").each(function(){
				$(this).attr("data-value",$(this).attr("default-value"));
			});
			$(".tcheck").attr("src","/static/school/img/class/success2_07.png");
			$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -240px -54px");
			$(".newtea li").addClass("li_act");
			sum=leng;
			flag8=false;
		}else{
			$(".newtea li").each(function(){
				$(this).attr("data-value","");
			});
			$(".tcheck").attr("src","/static/school/img/class/u45.png");
			$(this).css("background","url(/static/school/img/spirit_img.png) -218px -54px no-repeat");
			$(".newtea li").removeClass("li_act");
			sum=0;
			flag8=true;
		}
	});
	/*全选添加*/
	 var flag9=true;
	$(".allcheck1").click(function(){
		if(flag9){
			$(".newtea0 li").each(function(){
				$(this).attr("data-value",$(this).attr("default-value"));
			});
			$(".newtea0 li").addClass("li_act");
			$(this).css("background","url('/static/school/img/spirit_img.png') -240px -54px no-repeat");
			$(".tcheck1").attr("src","/static/school/img/class/success2_07.png");
			sum0=leng0;
			flag9=false;
		}else{
			$(".newtea0 li").each(function(){
				$(this).attr("data-value","");
			});
			$(".newtea0 li").removeClass("li_act");
			$(this).css("background","url('/static/school/img/spirit_img.png') -218px -54px no-repeat");
			$(".tcheck1").attr("src","/static/school/img/class/u45.png");
			sum0=0;
			flag9=true;
		}
	});
	
	/*改变*/
	/*继续添加学生*/
	$(".lr_go").click(function(){
		$(".lr_tc").css("display","none");
		$(".lr_success").css("display","none");
		//$(".lr_success1 ul li").remove();
	});
	
	/*$(".sub1").click(function(){
		var newarr=[];
		var tcheck1=getClassNames("tcheck1","img");
		var tcheck_id1=getClassNames("tcheck_id1","input");
		var sum=0;
		var arr=[];
		for(var i=0;i<tcheck1.length;i++){
			tcheck1[i].index=i;
			if(tcheck1[i].src.indexOf("success2_07.png")>=0){
				newarr.push(tcheck_id1[i].value);
				var newtcheck1=$("<li class='lr_success1_li'>" +
									"<span class='lr_del'></span>" +
									"<input class='lr_del_input' type='hidden' value='"+tcheck_id1[i].value+"' />" +
								    "<div class='lr_tx'>" +
								    	"<img src='"+$(".allbuild3 .newtea0 .ntx").eq(i).find("img").attr('src')+"'/>" +
								    "</div>" +
								    "<div class='lr_msg'>" +
								    	"<p class='lr_msg1'>"+$(".allbuild3 .newtea0 .ntp").eq(i).find("p").eq(0).html()+"</p>" +
								    	"<p class='lr_msg2'>"+$(".allbuild3 .newtea0 .ntp").eq(i).find("p").eq(1).html()+"</p>" +
								    	"<p class='lr_msg3'>" +
								    	"学籍:<span>"+$(".allbuild3 .newtea0 .ntp").eq(i).find("span").eq(0).html()+"</span>" +
								    	"</p>" +
								    "</div></li>");
				$(".lr_success1 ul").append(newtcheck1);	
				var lr_del=getClassNames("lr_del");
				for(var j=0;j<lr_del.length;j++){
					lr_del[j].index=j;
					lr_del[j].onclick=function(){
						this.parentNode.remove();
						arr.push(this.nextSibling.value);
						$(".li_act").eq(this.index).removeClass("li_act").find(".tcheck1").attr("src","/static/school/img/class/u45.png");
					}
				sum++;
			}
		}
		if(sum>0){
			$(".lr_tc").css("display","block");
			$(".lr_success").css("display","block");						
		}else if(sum==0){
			alert("请选择要录入的学生");
		}
      }
	});*/
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
function removeStu(obj,sid){
	$(obj).parent().remove();
	for(var i =0;i<global_sids.length;i++){
		if(global_sids[i]==sid){
			global_sids[i]=0;
			break;
		}
	}
	var temp = [];
	for(var i =0;i<global_sids.length;i++){
		if(global_sids[i]!=0){
			temp.push(global_sids[i]);
		}
	}
	global_sids=temp;
}
var sum0=0;
function class_jump(obj){
	if($(obj).find(".tcheck1").attr("src").indexOf("success2_07")<0){
		$(obj).attr("data-value",$(obj).attr("default-value"));
		$(obj).addClass("li_act");
		$(obj).find(".tcheck1").attr("src","/static/school/img/class/success2_07.png");	
		sum0++;
	}else{
		$(obj).attr("data-value","");
		$(obj).removeClass("li_act");
		$(obj).find(".tcheck1").attr("src","/static/school/img/class/u45.png");	
		sum0--;		
	}
	if(sum0==leng0){
		$(".allcheck1").css({"background":"url('/static/school/img/spirit_img.png') -240px -54px no-repeat"});
		flag9=false;
	}else{
		$(".allcheck1").css({"background":"url('/static/school/img/spirit_img.png') -218px -54px no-repeat"});
		flag9=true;
	}
}
var sum=0;
function class_skip(obj,id){	
	if($(obj).find(".tcheck").attr("src").indexOf("success2_07")<0){
		$(obj).attr("data-value",id);
		$(obj).addClass("li_act");
		$(obj).find(".tcheck").attr("src","/static/school/img/class/success2_07.png");
		sum++;		
	}else{
		$(obj).attr("data-value","");
		$(obj).removeClass("li_act");
		$(obj).find(".tcheck").attr("src","/static/school/img/class/u45.png");	
		sum--;		
	}
	if(sum==leng){
		$(".allcheck").css({"background":"url('/static/school/img/spirit_img.png') -240px -54px no-repeat"});
		flag8=false;
	}else{
		$(".allcheck").css({"background":"url('/static/school/img/spirit_img.png') -218px -54px no-repeat"});
		flag8=true;
	}
}