<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>修改手机号</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/change_phone.css" />
	</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<script type="text/javascript" src="/static/parents/js/change_phone.js" ></script>
	<body>
		<!--弹窗开始-->
		<div class="window_screen"></div>
		<div class="new_window">
			<div class="new_already">
				<img src="/static/parents/img/change_pwd/change_pwd_22.png"/><span>绑定成功</span>
			</div>
			<p class="new_window_tip">新手机号绑定成功&nbsp;!&nbsp;记得提醒孩子使用新手机号登录</p>
		</div>
		<!--弹窗结束-->
		<div class="change_phone_center">
			<div class="change_cen1">
				<div class="change_cen1_cent">
					<div class="old_phone">
						<span>原号码&nbsp;:&nbsp;</span><input class="old_number" type="number" readonly="readonly"  value="${(session.user.phone)! }" />
					</div>
					<div class="old_pwd">
						<span>密&nbsp;&nbsp;&nbsp;码&nbsp;:&nbsp;</span><input class="pwd1" type="password" value="" />
						<div class="pwd_btn">
							<div class="pwd_btn1">
								<img src="/static/parents/img/change_pwd/change_pwd_03.png"/>
							</div>
							<div class="pwd_btn2">
								<img src="/static/parents/img/change_pwd/change_pwd_05.png"/>
							</div>
							<div class="pwd_btn3">
								<img src="/static/parents/img/change_pwd/eye-closed.jpg"/>
							</div>							
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="change_cen2">
				<div class="change_cen2_center">
					<div class="new_phone">
						<span>新号码&nbsp;:&nbsp;</span><input class="new_phone_number" type="number"  />
					</div>
					<div class="new_yzm">
						<span>验证码&nbsp;:&nbsp;</span><input class="yzm" type="text" value="" /><div class="new_yzm2">获取验证码</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<p class="change_phone_tip"></p>
			<div class="change_cen_tip">
				<p>家长端和学生端使用同一手机号和密码</p>
				<p>修改后,两端均需要使用新密码重新登录</p>
			</div>
		    <div class="confirm_bd" ontouchstart="this.style.background='#78849a';this.style.color='#ffffff';this.borderRadius='0.6rem';" ontouchend="this.style.borderColor='#78849a';this.style.background='';this.style.color='#52617d';" >确认绑定</div>
		</div>
	</body>
</html>
