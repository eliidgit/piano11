<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>忘记密码</title>
	</head>
	<link rel="stylesheet" href="/static/school/css/common.css" />
	<link rel="stylesheet" href="/static/school/css/findpwd.css" />
	<script type="text/javascript" src="/static/school/js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="/static/school/js/findpwd.js" ></script>
	<script type="text/javascript" src="/static/school/js/common.js" ></script>
	<body>
		<div class="lr_tc"></div>
		<div class="loading"><img src="/static/school/img/pic19.png"/></div>
		<div class="find">
			<!--注册页面中心-->
			<div class="angle_logo">
				<img style="width:150px;" src="/static/school/img/logo_2.png"/>
			</div>
			<div class="findcenter">
				<div class="findpwd">
					<div class="sumfind">
						<p class="pwdtit">找回密码</p>
						<div class="sum_form">
							<form method="post"  onsubmit="return refer()">
								<div class="phone">
									<span class="phmsg">输入手机号</span>
									<input class="phnum" type="text" />
									<p></p>
								</div>
								<div class="clear"></div>
								<div class="code">
									<span class="codemsg">验证码</span>
									<div class="code_sum">
										<input class="codenum" type="text" />
										<div class="pwdcode">
											<span class="pwdcode1">点击发送验证码</span><span class="pwdcode2"></span>
										</div>										
									</div>
									<p></p>	
								</div>
								<div class="clear"></div>
								<div class="tj">
									<input class="rescond" type="reset" value="取消" />
									<input class="confirm" type="button" value="确定" />
								</div>		
								<div class="clear"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="circle">
				<img src="/static/school/img/circle.png"/>
			</div>
			<!--登录页面底部-->
		</div>
		<div class="bot">
            <p>jfinal_test</p>
		</div>
	</body>
<script type="text/javascript">
$(function (){
	$(".confirm").click(function (){
		if(!refer()){
			return;
		}
		$.ajax( {  
	     url:'/school/user/isVelicodeRight',// 跳转到 action  
	     data:{  
              phone : $(".phnum").val(),  
              valicode : $(".codenum").val()
	     },
	     async:false,  //同步
	     type:'post', 
	     dataType:'json',  
	     success:function(data) {  
	         if(data.code =="200" ){  
				 location.href="/school/user/resetPass";
	         }else{  
	             alert(data.description);
	         }  
	      },  
	      error : function() {  
	           alert("异常！");  
	      }  
	 });
	});
});
</script>
</html>
