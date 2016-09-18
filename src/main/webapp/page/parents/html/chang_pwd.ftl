<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>修改密码</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/change_pwd.css" />
	</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<script type="text/javascript" src="/static/parents/js/change_pwd.js"></script>
	<body>
		<!--弹窗开始-->
		<div class="pwd_screen"></div>
		<div class="pwd_window">
			<div class="pwd_already">
				<img src="/static/parents/img/change_pwd/change_pwd_22.png"/><span>修改成功</span>
			</div>
			<p class="pwd_window_tip">新密码修改成功&nbsp;!&nbsp;记得提醒孩子使用新密码登录</p>
		</div>
		<!--弹窗结束-->
		<div class="change_pwd">
			<div class="oldepwd">
				<span class="oldpwd1">原密码&nbsp;:</span>
				<input class="oldpwd2" type="password" value="" />
				<div class="oldpwd3">
					<div class="oldpwd_del">
						<img src="/static/parents/img/change_pwd/change_pwd_03.png"/>
					</div>
					<div class="oldpwd_jm">
						<img src="/static/parents/img/change_pwd/change_pwd_05.png"/>
					</div>
					<div class="oldpwd_jm1">
						<img src="/static/parents/img/change_pwd/eye-closed.jpg"/>
					</div>				
				</div>
			</div>
			<div class="newpwd">
				<div class="newpwd1">
					<span class="newpwd1_ma">新密码&nbsp;:</span>
					<input class="newpwd2" type="password" value="" />
					<div class="newpwd3">
						<div class='newpwd_del'>
							<img src="/static/parents/img/change_pwd/change_pwd_03.png"/>
						</div>
						<div class='newpwd_jm'>
							<img src="/static/parents/img/change_pwd/change_pwd_05.png"/>
						</div>
						<div class='newpwd_jm1'>
							<img src="/static/parents/img/change_pwd/eye-closed.jpg"/>
						</div>	
					</div>
				</div>
				<div class="newpwd2_confirm">
					<span class="newpwd_confirm1">密码确认&nbsp;:</span>
					<input class="newpwd2_confirm2" type="password" value="" />
					<div class="newpwd3_confirm3">
						<div class="newpwd_del_confirm4">
							<img src="/static/parents/img/change_pwd/change_pwd_03.png"/>
						</div>
						<div class="newpwd_jm_confirm4">
							<img src="/static/parents/img/change_pwd/change_pwd_05.png"/>
						</div>
						<div class="newpwd_jm_close">
							<img src="/static/parents/img/change_pwd/eye-closed.jpg"/>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<p class="change_tip"></p>
			<div class="change_pwd_tip">
				<p>家长端和学生端使用同一手机号和密码</p>
				<p>修改后，两端都需要使用新密码重新登录</p>
			</div>
			<div class="confirm_yes" ontouchstart="this.style.background='#78849a';this.style.color='#ffffff';this.borderRadius='0.6rem';" ontouchend="this.style.borderColor='#78849a';this.style.background='';this.style.color='#52617d';" >确认修改</div>
		</div>
	</body>
</html>
