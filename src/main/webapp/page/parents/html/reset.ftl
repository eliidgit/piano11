<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<title>重置密码</title>
		<link rel="stylesheet" href="/static/parents/css/common.css"/>
		<link rel="stylesheet" href="/static/parents/css/reset.css" />
	</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<script type="text/javascript" src="/static/parents/js/loginandreg.js" ></script>
	<body>
		<!--头部开始-->
		<a class="top" href="javascript:history.back(-1)">
			<div class="back"><img src="/static/parents/img/index/parents_index_01_03.png"></div>
			<p>重置密码</p>			
		</a>
		<!--头部结束-->
		<!--重置密码页面-->
		<div class="reset">
			<div class="resetcenter">
				<form  method="post">
					<div class="rcenter1">
						<span>新密码:</span>
						<input class="renewpwd" id="txtCustomsCode2" name="phone" type="password" value="" />
						<!-- <input class="renewpwd1" type="hidden" value="" /> -->
						<div class="renew">
							<img class="del" id="del2" src="/static/parents/img/change_pwd/change_pwd_03.png"/>
							<img class="eyes" id="eyes2" src="/static/parents/img/change_pwd/change_pwd_05.png"/>
						</div>
					</div>
					<div class="rcenter2">
						<span>密码确认:</span>
						<input class="reyes" id="txtCustomsCode3" type="password" value="" />
						<!-- <input class="renewpwd2" type="hidden" value=""/> -->
						<div class="renew">
							<img class="del" id="del3" src="/static/parents/img/change_pwd/change_pwd_03.png"/>
							<img class="eyes" id="eyes3" src="/static/parents/img/change_pwd/change_pwd_05.png"/>
						</div>
					</div>
					<p class="errortip"></p>
					<input class="resetyes" type="button" value="确定" />					
				</form>
			</div>
		</div>
	</body>
	<script>
		$(function (){
			$(".resetyes").click(function(){
				if(resetpwd()){
					$.ajax( {  
					     url:'/parents/resetPass',// 跳转到 action  
					     data:{  
					    	 	pass : $(".renewpwd").val()
					     },
					     async:false,  //同步
					     type:'post', 
					     dataType:'json',  
					     success:function(data) {  
					         if(data.code=="200"){
					        	 window.location.href="/parents/login";
					         }else{
					        	 $(".errortip").html(data.description);
					         }
					      },  
					      error : function() {  
					           alert("异常！");  
					      }  
					 });
				}
			});
		});
	</script>
</html>
