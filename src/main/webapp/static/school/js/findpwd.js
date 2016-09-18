$(function(){
	$(".phnum").focus(function(){
		$(".phone p").html("");
	});
	$(".codenum").focus(function(){
		$(".code p").html("");
	})
	$(".pwdcode").click(function(){
		var phonenum=/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if($(".phnum").val()==""){
			alert("请输入手机号码");
			return;
		}else if(phonenum.test($(".phnum").val())==false){
			 $(".phnum").val("");
			 alert("请输入正确的手机号格式");
			return ;
		}
		$.ajax( {  
		     url:'/sendSMSValiCode',// 跳转到 action  
		     data:{  
	              phone : $(".phnum").val(),  
	              type : 'forgetpwd'
		     },
		     async:false,  //同步
		     type:'post', 
		     dataType:'json',  
		     success:function(data) {  
		         if(data.code =="200" ){  
		        	 var sum=60;
		     		var timer=setInterval(function(){
		     			if(sum<0){
		     				$(".pwdcode1").html("重新获取");
		     				$(".pwdcode2").html("");
		     				clearInterval(timer);
		     			}else{
		     				$(".pwdcode1").html("重新发送");
		     				$(".pwdcode2").html(sum+"s");
		     				sum--;			
		     			}
		     		},1000);
		         }else{  
		             $(".pwdtip").html(data.description);
		         }  
		      },  
		      error : function() {  
		           alert("异常！");  
		      }  
		 });
		
	});
});
function refer(){
	var phonenum=/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
	if($(".phnum").val()==""){
		$(".phone p").html("请输入手机号码");
		return false;
	}else if(phonenum.test($(".phnum").val())==false){
		 $(".phnum").val("");
		 $(".phone p").html("请输入正确的手机号格式");
		return false;
	}else if($(".codenum").val()==""){
		$(".code p").val("请输入验证码");
	    $(".codenum").val("");
		return false;
	}else{
		return true;
	}
}
