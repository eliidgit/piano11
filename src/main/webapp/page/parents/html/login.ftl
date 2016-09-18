<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<title>登录</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/login.css" />
	</head>
		<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
		<script type="text/javascript" src="/static/parents/js/common.js" ></script>
		<script type="text/javascript" src="/static/parents/js/loginandreg.js" ></script>
	<body>
		<div class="logincenter">
			<div class="logcenter">
				<form method="post" action="find.html" onsubmit="return handin()">
					<div class="loginphone">
						<span>手机号     :  </span><input class="logphone" type="number" value="" />
					</div>
					<div class="loginpwd">
						<span>密<b class="lma">码</b>      :    </span>
						<input class="logpwd" id="txtCustomsCode1" type="password" value="" />
						<div class="deyes">
							<div class="del" id="del1">
								<img src="/static/parents/img/change_pwd/change_pwd_03.png"/>
							</div>
							<div class="eyes">
								<img src="/static/parents/img/change_pwd/change_pwd_05.png"/>
							</div>
							<div class="eyes0">
								<img src="/static/parents/img/change_pwd/eye-closed.jpg" />
							</div>
						</div>
					</div>
					<p class="logintip"></p>
					<div class="sumstep">
						<p class="step">登录后请尽快修改密码</p> 
						<p class="step">我的-修改密码-完成修改</p>
					</div>
					<input class="loginsub" type="button" value="登录" ontouchstart="this.style.background='#78849a';this.style.color='#ffffff';this.borderRadius='0.6rem';" ontouchend="this.style.borderColor='#78849a';this.style.background='';this.style.color='#52617d';" />				
				</form>
				<div class="find">
					<a class="findmsg" href="/parents/findPass">找回密码</a>
				</div>
			</div>
		</div>
		<script>
		$(function(){
			$(".loginsub").click(function(){
				if(handin()){
					$.ajax( {  
					     url:'/api/index/phonelogin',// 跳转到 action  
					     data:{  
					    	 	phone : $(".logphone").val(),  
					    	 	password : $(".logpwd").val(),  
					    	 	user_type : '1'
					     },
					     async:false,  //同步
					     type:'post', 
					     dataType:'json',  
					     success:function(data) {  
					         if(data.code=="200"){
					        	 window.location.href="/parents";
					         }else{
					        	 $(".logintip").html("用户名密码错误");
					         }
					      },  
					      error : function() {  
					           alert("异常！");  
					      }  
					 });
				}
			});
			//回车事件
			document.onkeydown = function(e){ 
				var ev = document.all ? window.event : e;
				if(ev.keyCode==13) {
					if(handin()){
						$.ajax( {  
							 url:'/api/index/phonelogin',// 跳转到 action  
							 data:{  
									phone : $(".logphone").val(),  
									password : $(".logpwd").val(),  
									user_type : '1'
							 },
							 async:false,  //同步
							 type:'post', 
							 dataType:'json',  
							 success:function(data) {  
								 if(data.code=="200"){
									 window.location.href="/parents";
								 }else{
									 $(".logintip").html("用户名密码错误");
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
	</script>
	</body>
</html>
