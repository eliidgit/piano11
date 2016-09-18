window.onload=function(){
	/*故障钢琴列表和钢琴资产配置的点击事件*/
	tabnav($(".proplist ul li"),".propdecen","act");
	/*自维修和厂家维修*/
	var service=getClassNames("service");
	newtabnav(service,".service",".maintain","wxact");
	/*教室选择点击事件*/
	var classes=getClassNames("classes");
	newtabnav(classes,".classes",".sumstate","active2");
	/*联系售后点击事件*/
	$(".proplink").click(function(){
		$(".screen").css("display","block");
		$(".propcontact").css("display","block");		
	});
	/*联系售后弹窗取消按钮的点击事件*/
	$(".qx").click(function(){
		$(".screen").css("display","none");
		$(".propcontact").css("display","none");	
	});
	/*展开按钮点击事件   不足高度不该写成定值*/
	var spread=getClassNames("spread");
	var flag3=true;
	for(var i=0;i<spread.length;i++){
		spread[i].index=i;
		spread[i].onclick=function(){			
			if(flag3){
				$(".sumpropde").eq(this.index).animate({height:"200px"});
				flag3=false;
				$(".sp1").eq(this.index).html("收起");
				$(".down2 img").eq(this.index).attr("src","../images/up_07.gif");
			}else{
				$(".sumpropde").eq(this.index).animate({height:"0"});
				flag3=true;
				$(".sp1").eq(this.index).html("展开");
				$(".down2 img").eq(this.index).attr("src","../images/down2_03.gif");
			}
		}
	}
	/*自维修页面未维修按钮点击事件*/
	var flag4=true;
	var unfold=getClassNames("unfold");
	for(var i=0;i<unfold.length;i++){
		unfold[i].index=i;
		unfold[i].onclick=function(){
			if(flag4){
				$(".flodul").eq(this.index).css("display","block");
				flag4=false;
			}else{
				$(".flodul").eq(this.index).css("display","none");
				flag4=true;
			}
		}
	}
	/*新增钢琴页面向下的点击事件*/
	var flag5=true;
	$(".down3").click(function(){
		if(flag5){
			$(".cendown").css("display","block");
			flag5=false;			
		}else{
			$(".cendown").css("display","none");
			flag5=true;	
		}
	});
	/*分配教室的点击事件*/
	$(".cendown li").click(function(){
		$(".date3").val($(this).html());
		$(".cendown").css("display","none");
		flag5=true;	
	});
	/*新建教室的取消按钮*/
	hideele($(".newbtnc"),$(".newc1"),$(".newclass"));
	/*新建教室按钮的点击事件*/
	showele($(".createclass"),$(".newc1"),$(".newclass"));
	/*新建钢琴取消按钮点击事件*/
	hideele($(".canres"),$(".allpinao"),$(".newpinao"));
	showele($(".propadd"),$(".allpinao"),$(".newpinao"));
}
/*联系售后的表单提交*/
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
/*新建教室的表单提交*/
function createclass(){
	if($(".jxl").val()==""){
		alert("请输入教学楼名称");
		return false;
	}else if($(".jsname").val()==""){
		alert("请输入教室名称");
		return false;
	}else{
		return true;
	}
}
/*新建钢琴的表单提交*/
function createpinao(){
	if($(".date1").val()==""){
		alert("请选择入校时间");
		return false;
	}else if($(".date2").val()==""){
		alert("请输入用户ID");
		return false;
	}else if($(".date3").val()==""){
		alert("请选择分配教室");
		return false;
	}else{
		return true;
	}
}














