$(function(){
	$(".change_btn").click(function(){
		$(".change_add_tip").html("");
		if($(".change_add2").val()==""){
			$(".change_add_tip").html("请输入家庭地址");
		}else{
			$.ajax({  
			     url:'/parents/changeAddr',// 跳转到 action  
			     data:{  
		              addr : $(".change_add2").val()
			     },
			     async:false,  //同步
			     type:'post', 
			     dataType:'json',  
			     success:function(data) {  
			         if(data.code =="200" ){  
			        	 $(".add_screen").css("display","block");
			 			$(".add_window").css("display","flex");			
			 			setTimeout(function(){
			 				$(".add_screen").css("display","none");
			 				$(".add_window").css("display","none");
			 				location.href="/parents/center";
			 			},3000);

			         }else{  
			             $(".change_add_tip").html(data.description);
			         }  
			      },  
			      error : function() {  
			           alert("异常！");  
			      }  
			 });
			
		}
	});
})
