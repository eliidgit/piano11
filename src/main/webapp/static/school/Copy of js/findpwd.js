$(function(){
	$(".pwdcode").click(function(){
		var sum=60;
		var timer=setInterval(function(){
			if(sum<0){
				$(".pwdcode1").html("重新获取");
				$(".pwdcode2").html("");
				clearInterval(timer);
			}else{
				$(".pwdcode1").html("重新发送");
				$(".pwdcode2").html("("+sum+"s)");
				sum--;			
			}
		},1000);
	});
});
function refer(){
	var phonenum=/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
	if($(".phnum").val()==""){
		alert("请输入手机号码");
		return false;
	}else if(phonenum.test($(".phnum").val())==false){
		 $(".phnum").val("");
		 alert("请输入正确的手机号格式");
		return false;
	}else if($(".codenum").val()==""){
	    alert("请输入验证码");
	    $(".codenum").val("");
		return false;
	}else{
		return true;
	}
}
