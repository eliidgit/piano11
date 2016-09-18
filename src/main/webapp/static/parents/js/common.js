window.onresize=function(){
	document.documentElement.style.fontSize = document.documentElement.clientWidth / 7.5 + 'px';
}
document.documentElement.style.fontSize = document.documentElement.clientWidth / 7.5 + 'px';	
$(function(){
	$(".logpwd").focus(function(){
		$(".del").css("display","block");
	});
	//找回密码页面
	hidden_tip($(".phn2"), $(".pwdtip"));//输入框获取焦点是提示消失
	hidden_tip($(".code2"), $(".pwdtip"));
	//登录页面
	hidden_tip($(".logphone"), $(".logintip"));//输入框获取焦点是提示消失
	hidden_tip($(".logpwd"), $(".logintip"));
	show_pwd($(".eyes"),$(".eyes0"),$("#txtCustomsCode1"));
	hidden_pwd($(".eyes0"),$(".eyes"),$("#txtCustomsCode1"));
});
/*登录页表单提交*/
function handin(){
	var uname= /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
	if($(".logphone").val()==""){	
		$(".logintip").html("请输入手机号");
		$(".logphone").val("");
		return false;
	}else if(uname.test($(".logphone").val())==false){
		$(".logintip").html("请输入正确的手机号格式");
		$(".logphone").val("");
		return false;
	}else if($(".logpwd").val()==""){	
		$(".logpwd").val("");
		$(".logintip").html("请输入密码");
		return false;
	}else{
	    return true;
	}
}
function resetpwd(){
	if($(".renewpwd").val()==""){
		$(".renewpwd").val("");
		$(".errortip").html("请输入新密码");
		return false;
	}else if($(".reyes").val()==""){
	    $(".reyes").val("");
	    $(".errortip").html("请输入新密码");
		return false;
	}else if($(".reyes").val()!=$(".renewpwd").val()){
		$(".renewpwd").val("");
		$(".reyes").val("");
	    $(".errortip").html("密码输入不一致");
		return false;
	}else{
		return true;
	}
}
function show_pwd(ele1,ele2,ele3){
	ele1.click(function(){
		ele2.css("display","block");
		$(this).css("display","none");
		ele3.attr("type","text");
	});	
}
function hidden_pwd(ele1,ele2,ele3){
	ele1.click(function(){
		ele2.css("display","block");
		$(this).css("display","none");
		ele3.attr("type","password");
	});	
}
function hidden_tip(focus_ele,hidden_tip){
	focus_ele.keydown(function(){
		hidden_tip.html("");
	});
}








