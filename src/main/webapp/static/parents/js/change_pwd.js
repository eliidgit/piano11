$(function(){
	$(".oldpwd_del").click(function(){
		$(".oldpwd2").val("");
		$(this).css("display","none");
	})
	$(".newpwd_del").click(function(){
		$(".newpwd2").val("");
		$(this).css("display","none");
	})
	$(".newpwd_del_confirm4").click(function(){
		$(".newpwd2_confirm2").val("");
		$(this).css("display","none");
	})
	$(".oldpwd2").focus(function(){
		$(".oldpwd_del").css("display","block");
	});
	$(".newpwd2").focus(function(){
		$(".newpwd_del").css("display","block");
	});
	$(".newpwd2_confirm2").focus(function(){
		$(".newpwd_del_confirm4").css("display","block");
	});
	hidden_tip($(".oldpwd2"),$(".change_tip"));
	hidden_tip($(".newpwd2"),$(".change_tip"));
	hidden_tip($(".newpwd2_confirm2"),$(".change_tip"));
	
	show_pwd($(".oldpwd_jm"),$(".oldpwd_jm1"),$(".oldpwd2"));
	hidden_pwd($(".oldpwd_jm1"),$(".oldpwd_jm"),$(".oldpwd2"));
	
	show_pwd($(".newpwd_jm"),$(".newpwd_jm1"),$(".newpwd2"));
	hidden_pwd($(".newpwd_jm1"),$(".newpwd_jm"),$(".newpwd2"));
	
	show_pwd($(".newpwd_jm_confirm4"),$(".newpwd_jm_close"),$(".newpwd2_confirm2"));
	hidden_pwd($(".newpwd_jm_close"),$(".newpwd_jm_confirm4"),$(".newpwd2_confirm2"));
	$(".confirm_yes").click(function(){
		$(".change_tip").html("");
		if($(".oldpwd2").val()==""){
			$(".change_tip").html("请输入原密码！");
		}else if($(".newpwd2").val()==""){
			$(".change_tip").html("请输入新密码！");
		}else if($(".newpwd2_confirm2").val()==""){
			$(".change_tip").html("密码确认不能为空！");
		}else if($(".newpwd2").val()!=$(".newpwd2_confirm2").val()){
			$(".change_tip").html("新密码和确认密码必须一致！");
		}else{
			$.ajax({  
			     url:'/parents/changePass',// 跳转到 action  
			     data:{  
		              pass : $(".oldpwd2").val(),  
		              newPass : $(".newpwd2").val()
			     },
			     async:false,  //同步
			     type:'post', 
			     dataType:'json',  
			     success:function(data) {  
			         if(data.code =="200" ){  
			        	$(".pwd_screen").css("display","block");
			 			$(".pwd_window").css("display","block");
			 			setTimeout(function(){
			 				$(".pwd_screen").css("display","none");
			 				$(".pwd_window").css("display","none");
			 				location.href="/parents/loginI";
			 			},3000);
			         }else{  
			             $(".change_tip").html(data.description);
			         }  
			      },  
			      error : function() {  
			           alert("异常！");  
			      }  
			 });
			
		}
	});
	document.onkeydown = function(e){ 
    var ev = document.all ? window.event : e;
    if(ev.keyCode==13) {
			$(".change_tip").html("");
		if($(".oldpwd2").val()==""){
			$(".change_tip").html("请输入原密码！");
		}else if($(".newpwd2").val()==""){
			$(".change_tip").html("请输入新密码！");
		}else if($(".newpwd2_confirm2").val()==""){
			$(".change_tip").html("密码确认不能为空！");
		}else if($(".newpwd2").val()!=$(".newpwd2_confirm2").val()){
			$(".change_tip").html("新密码和确认密码必须一致！");
		}else{
			$.ajax({  
			     url:'/parents/changePass',// 跳转到 action  
			     data:{  
		              pass : $(".oldpwd2").val(),  
		              newPass : $(".newpwd2").val()
			     },
			     async:false,  //同步
			     type:'post', 
			     dataType:'json',  
			     success:function(data) {  
			         if(data.code =="200" ){  
			        	$(".pwd_screen").css("display","block");
			 			$(".pwd_window").css("display","block");
			 			setTimeout(function(){
			 				$(".pwd_screen").css("display","none");
			 				$(".pwd_window").css("display","none");
			 				location.href="/parents/loginI";
			 			},3000);
			         }else{  
			             $(".change_tip").html(data.description);
			         }  
			      },  
			      error : function() {  
			           alert("异常！");  
			      }  
			 });
			
		}
		}
	}
	
	
	
});





