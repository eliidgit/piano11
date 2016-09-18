<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<title>找回密码</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/find.css" />
	</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<script type="text/javascript" src="/static/parents/js/loginandreg.js" ></script>
	<body>
		<!--头部结束-->
		<div class="findword">
			<div class="findcenter">
				<form method="post" action="reset.html">
					<div class="findword1">
						<span class="phn1">手机号:</span><input class="phn2" type="number" />
					</div>
					<div class="findword2">
						<span class="code1">验证码:</span><input class="code2" type="text" /><span class="code3">获取验证码</span>
					</div>
					<p class="pwdtip"></p>
					<input class="next" type="button" value="下一步"  ontouchstart="this.style.background='#78849a';this.style.color='#ffffff';this.borderRadius='0.6rem';" ontouchend="this.style.borderColor='#78849a';this.style.background='';this.style.color='#52617d';"  />
				</form>				
			</div>
		</div>
	</body>
	<script>
		$(function (){
			$(".next").click(function (){
				var uname= /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
				if($(".phn2").val()==""){	
					$(".pwdtip").html("请输入手机号");
					return false;
				}else if(uname.test($(".phn2").val())==false){
					$(".pwdtip").html("请输入正确的手机号格式");
					return false;
				}else{
					$.ajax( {  
				     url:'/parents/isVelicodeRight',// 跳转到 action  
				     data:{  
			              phone : $(".phn2").val(),  
			              valicode : $(".code2").val()
				     },
				     async:false,  //同步
				     type:'post', 
				     dataType:'json',  
				     success:function(data) {  
				         if(data.code =="200" ){  
							 location.href="/parents/resetPassHtml";
				         }else{  
				             $(".pwdtip").html(data.description);
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
						var uname= /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
						if($(".phn2").val()==""){	
							$(".pwdtip").html("请输入手机号");
							return false;
						}else if(uname.test($(".phn2").val())==false){
							$(".pwdtip").html("请输入正确的手机号格式");
							return false;
						}else{
							$.ajax( {  
							 url:'/parents/isVelicodeRight',// 跳转到 action  
							 data:{  
								  phone : $(".phn2").val(),  
								  valicode : $(".code2").val()
							 },
							 async:false,  //同步
							 type:'post', 
							 dataType:'json',  
							 success:function(data) {  
								 if(data.code =="200" ){  
									 location.href="/parents/resetPassHtml";
								 }else{  
									 $(".pwdtip").html(data.description);
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
</html>
