$(function(){
	$(".topcenter li").eq(0).addClass("act");
	$(".sumbtn_cancel").click(function(){
		$(".first_screen").css("display","none");
		$(".first_alert").css("display","none");
	});
});
function checkpwd(){
	if($(".newpwd input").val()==""){
		alert("请输入新密码");
		return false;
	}else if($(".oldpwd input").val()==""){
		alert("请输入确认密码");
		return false;
	}else if($(".newpwd input").val()!=$(".oldpwd input").val()){
		alert("新密码和确认密码必须一致");
		return false;
	}else{
		$(".first_screen").css("display","none");
		$(".first_alert").css("display","none");
		return true;
	}
}
