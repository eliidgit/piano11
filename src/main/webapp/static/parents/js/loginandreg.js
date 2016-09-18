$(function(){
	$("#del1").click(function(){
		$("#txtCustomsCode1").val("");
		$("#del1").css("display","none");
	});
	$("#del2").click(function(){
		$("#txtCustomsCode2").val("");
		$("#del2").css("display","none");
	});
	$("#del3").click(function(){
		$("#txtCustomsCode3").val("");
		$("#del3").css("display","none");
	});
	/*获取验证码倒计时*/
	$(".code3").click(function(){
		$(".pwdtip").html("");
		var uname= /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if($(".phn2").val()==""){	
			$(".pwdtip").html("请输入手机号");
			$(".phn2").focus();
			return false;
		}else if(uname.test($(".phn2").val())==false){
			$(".pwdtip").html("请输入正确的手机号格式");
			$(".phn2").focus();
			return false;
		}
		$.ajax( {  
		     url:'/sendSMSValiCode',// 跳转到 action  
		     data:{  
	              phone : $(".phn2").val(),  
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
		     				$(".code3").html("重新获取");
		     				$(".code3").css("background","#868686");
		     				$(".code3").css("color","#1e1e1e");
		     				clearInterval(timer);
		     			}else{
		     				$(".code3").html("已发送"+sum+"s");
		     				$(".code3").css("background","#c9c9c9");
		     				$(".code3").css("color","#888");
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



















