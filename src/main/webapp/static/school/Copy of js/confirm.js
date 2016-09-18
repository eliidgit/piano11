function confirm(){
	if($(".newpwd2").val()==""){
		alert("新密码不能为空");
		return false;
	}else if($(".pwd2").val()==""){
		alert("确认密码不能为空");
		return false;
	}else if($(".newpwd2").val()!=$(".pwd2").val()){
		alert("新密码和确认密码必须相同");
		$(".pwd2").val("");
		$(".newpwd2").val("");
		return false;
	}else{
		$(".sumchange").css("display","block");
		setTimeout(function(){
			$(".sumchange").css("display","none");
		},3000);
		return true;
	}
}
$(function(){
	$(".confyes").click(function(){
		if(confirm()==true){
			$(".sumchange").css("display","block");
			setTimeout(function(){
				location.href="login.html";
			},3000);
		}
	});
})
