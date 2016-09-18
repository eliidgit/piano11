<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>确认新密码</title>
	</head>
	<link rel="stylesheet" href="/static/school/css/common.css" />
	<link rel="stylesheet" href="/static/school/css/confirm.css" />
	<script type="text/javascript" src="/static/school/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/school/js/confirm.js" ></script>
	<script type="text/javascript" src="/static/school/js/common.js" ></script>
	<body>
		<div class="lr_tc"></div>
		<div class="loading"><img src="/static/school/img/pic19.png"/></div>
		<!--修改成功以后出现的提示-->
		<div class="sumchange">
			<div class="changetip"></div>
			<p class="ctip">修改成功</p>				
		</div>
		<div class="conf">
		    <div class="change">
		    	<div class="angle_logo">
		    		<img src="/static/school/img/angle_logo.png"/>
		    	</div>
				<!--确认密码中心部分-->
				<div class="confcenter">
					<div class="confs">
						<p class="findconf">找回密码</p>
						<div class="sumconf">
						<!--<form method="post" action="login.html" onsubmit="return confirm()">-->
								<div class="sumconf1">
									<span class="newpwd1">新密码</span><input class="newpwd2" type="password" value="" />
								</div>
								<div class="clear"></div>
								<div class="sumconf2">
									<span class="pwd1">确认密码</span><input class="pwd2" type="password" value="" />
								</div>
								<div class="clear"></div>
								<div class="sumconf3">
									<input class="confno" type="reset" value="取消"/><input class="confyes" type="buttun" value="确定" />
								</div>								
							<!--</form>-->
						</div>					
					</div>
				</div>		    	
					<div class="circle">
			    		<img src="/static/school/img/circle.png"/>
			    	</div>
		    </div>
			<!--登录页面底部-->
			<div class="bot">
				<p>jfinal_test</p>
			</div>
		</div>
	</body>
</html>
