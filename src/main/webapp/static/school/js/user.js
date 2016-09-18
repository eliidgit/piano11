$(function(){
	/*个人中心页面编辑的点击事件*/
	$(".pwdedit2").click(function(){
		$(".pwdslide").css("display","block");
		$(".nick2 input").css("border","1px solid #e1e1e1");
		$(".zh_num").css("border","1px solid #e1e1e1");
		$(".userpass").css("border","1px solid #e1e1e1");
		$(this).css("display","none");
		$(".use_hx1").css("width","990px");
		$(".nick2 input").removeAttr("readonly");
		$(".userpass").val("");
		$(".userpass").removeAttr("readonly");
		$(".userpass").attr("type","password");
	});
	$(".usercancle").click(function(){
		$(".pwdslide").css("display","none");
		$(".nick2 input").css("border","0");
		$(".zh_num").css("border","0");
		$(".userpass").css("border","0");
		$(".pwdedit2").css("display","block");
		$(".use_hx1").css("width","857px");
		$(".nick2 input").attr("readonly","readonly");
		$(".zh_num").attr("readonly","readonly");
		$(".userpass").attr("readonly","readonly");
		$(".userpass").val("*** *** ***");
		$(".userpass").attr("type","text");
	});
	$(".usersave").click(function(){
		var options = {
                url: '/school/user/editPassword',
                type: 'post',
                dataType: 'json',
                data: $("#edit_user").serialize(),
                success: function (data) {
                    if (data.code == '200') {
                    	$(".pwdslide").css("display","none");
                		$(".nick2 input").css("border","0");
                		$(".zh_num").css("border","0");
                		$(".userpass").css("border","0");
                		$(".pwdedit2").css("display","block");
                		$(".use_hx1").css("width","857px");
                		$(".nick2 input").attr("readonly","readonly");
                		$(".zh_num").attr("readonly","readonly");
                		$(".userpass").attr("readonly","readonly");
                		$(".userpass").val("*** *** ***");
                		$(".userpass").attr("type","text");
                		$("#new_password,#new_password2").val("");
                    } else {
                        alert(data.description);
                    }
                }
            };
            $.ajax(options);
            return false; 
	});
})
