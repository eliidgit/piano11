<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>登录-天使音乐</title>
	</head>
	<link rel="stylesheet" href="/static/school/css/common.css"/>
	<link rel="stylesheet" href="/static/school/css/login.css"/>
	<script type="text/javascript" src="/static/school/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/school/js/common.js" ></script>
	<body>
		<div class="lr_tc"></div>
		<div class="loading"><img src="/static/school/img/pic19.png"/></div>
		<div class="loginsum">
		<div class="login_center">
			<div class="angle_logo">
				<img style="width:150px;" src="/static/school/img/logo_2.png"/>
			</div>
			<div class="logincenter">
				<div class="lcenter">
					<p class="userlogin">用户登录</p>
					<form method="post" onsubmit="return handin()" action="login">
						<div class="phone_email">
							<span>邮箱/手机号</span>
							<input name="phone" class="username" value="${phone! }" type="text" />	
							<p></p>							
						</div>
						<div class="phone_pwd">
							<span>密码</span>
							<input class="psd" name="password" type="password" />
							<p></p>
						</div>
						<div class="autologin">
							<div class="alogin">
								<span class="auto"></span><span class="autol">下次自动登录</span>
							</div>
							<a class="forget" href="/school/forgetpwd.html">忘记密码?</a>
						</div>
						<div class="clear"></div>
						<input type="submit" class="yes" value="登录" />		
						<span style="color:red;">${error!}</span>				
					</form>
				</div>
			</div>
			<!--登录页面底部-->
		</div>
		</div>
			<div class="bot">
                <p>jfinal_test</p>
			</div>
	</body>
</html>
