function confirm(){
	if($(".newpwd2").val()==""){
		alert("新密码不能为空");
		return false;
	}else if($(".pwd2").val()==""){
		alert("确认密码不能为空");
		return false;
	}else if($(".newpwd2").val()!=$(".pwd2").val()){
		alert("新密码和确认密码必须相同");
		return false;
	}else{
		return true;
	}
}
$(function(){
	$(".confyes").click(function(){
		if(confirm()==true){
			$.ajax({  
			     url:'/school/user/changePass',// 跳转到 action  
			     data:{  
		              pass : $(".newpwd2").val(),  
		              pass2 : $(".pwd2").val()
			     },
			     async:false,  //同步
			     type:'post', 
			     dataType:'json',  
			     success:function(data) {  
			         if(data.code =="200" ){  
			        	 $(".sumchange").css("display","block");
			 			setTimeout(function(){
			 				location.href="/school/login";
			 			},3000);
			         }else{  
			            alert(data.description);
			         }  
			      },  
			      error : function() {  
			           alert("异常！");  
			      }  
			 });
			
		}
	});
})
