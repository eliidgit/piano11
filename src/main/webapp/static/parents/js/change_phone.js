$(function(){
	$(".pwd_btn1").click(function(){
		$(".pwd1").val("");
		$(this).css("display","none");
	});
	$(".pwd1").focus(function(){
		$(".pwd_btn1").css("display","block");
	});
	hidden_tip($(".pwd1"),$(".change_phone_tip"));
	hidden_tip($(".new_phone_number"),$(".change_phone_tip"));
	hidden_tip($(".yzm"),$(".change_phone_tip"));
	show_pwd($(".pwd_btn2"),$(".pwd_btn3"),$(".pwd1"));
	hidden_pwd($(".pwd_btn3"),$(".pwd_btn2"),$(".pwd1"));
	$(".new_yzm2").click(function(){
		$(".change_phone_tip").html("");
		var uname= /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if($(".new_phone_number").val()==""){	
			$(".new_phone_number").focus();
			$(".change_phone_tip").html("请输入手机号");
			return;
		}else if(uname.test($(".new_phone_number").val())==false){
			$(".new_phone_number").focus();
			$(".change_phone_tip").html("请输入正确的手机号格式");
			return;
		}
		$.ajax({  
		     url:'/sendSMSValiCode',// 跳转到 action  
		     data:{  
	              phone : $(".new_phone_number").val(),  
	              type : 'reg'
		     },
		     async:false,  //同步
		     type:'post', 
		     dataType:'json',  
		     success:function(data) {  
		         if(data.code =="200" ){  
		        	var sum=60;
		     		var timer=setInterval(function(){
		     			if(sum<0){
		     				$(".new_yzm2").html("重新获取");
		     				clearInterval(timer);
		     			}else{
		     				$(".new_yzm2").html("已发送"+sum+"s");
		     				sum--;			
		     			}
		     		},1000);

		         }else{  
		             $(".change_phone_tip").html(data.description);
		         }  
		      },  
		      error : function() {  
		           alert("异常！");  
		      }  
		 });
		
	});
	$(".confirm_bd").click(function(){
		if($(".old_number").val()==""){
			$(".change_phone_tip").html("请输入原号码");
		}else if($(".pwd1").val()==""){
			$(".change_phone_tip").html("请输入密码");
		}else if($(".new_phone_number").val()==""){
			$(".change_phone_tip").html("请输入新的手机号码");
		}else if($(".yzm").val()==""){
			$(".change_phone_tip").html("请输入验证码");
		}else{
			$.ajax({  
			     url:'/parents/bindPhone',  
			     data:{   
		              pass : $(".pwd1").val(),
		              newPhone:$(".new_phone_number").val(),
		              code:$(".yzm").val()
			     },
			     async:false,  //同步
			     type:'post', 
			     dataType:'json',  
			     success:function(data) {  
			    	 if(data.code=="200"){
				    	 $(".window_screen").css("display","block");
						$(".new_window").css("display","block");
				    	 setTimeout(function(){
								$(".window_screen").css("display","none");
								$(".new_window").css("display","none");
								location.href="/parents/loginI";
							},3000);
			    	 }else{
			    		 $(".change_phone_tip").html(data.description);
			    	 }
			      },  
			      error : function() {  
			           alert("异常！");  
			      }  
			 });
		}
	});
	//回车事件提交
document.onkeydown = function(e){ 
    var ev = document.all ? window.event : e;
    if(ev.keyCode==13) {
			if($(".old_number").val()==""){
				$(".change_phone_tip").html("请输入原号码");
			}else if($(".pwd1").val()==""){
				$(".change_phone_tip").html("请输入密码");
			}else if($(".new_phone_number").val()==""){
				$(".change_phone_tip").html("请输入新的手机号码");
			}else if($(".yzm").val()==""){
				$(".change_phone_tip").html("请输入验证码");
			}else{
				$.ajax({  
					 url:'/parents/bindPhone',  
					 data:{   
						  pass : $(".pwd1").val(),
						  newPhone:$(".new_phone_number").val(),
						  code:$(".yzm").val()
					 },
					 async:false,  //同步
					 type:'post', 
					 dataType:'json',  
					 success:function(data) {  
						 if(data.code=="200"){
							 $(".window_screen").css("display","block");
							$(".new_window").css("display","block");
							 setTimeout(function(){
									$(".window_screen").css("display","none");
									$(".new_window").css("display","none");
									location.href="/parents/loginI";
								},3000);
						 }else{
							 $(".change_phone_tip").html(data.description);
						 }
					  },  
					  error : function() {  
						   alert("异常！");  
					  }  
				 });
			}
		}
	}
})
