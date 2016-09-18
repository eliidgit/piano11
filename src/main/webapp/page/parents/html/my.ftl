<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>我的信息</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/my.css" />
	</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/zepto_1.1.3.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<body>
		<div class="my_msg">
			<div class="my_msg_center">
				<div class="my_msg_parent">
					<img src="/static/parents/img/my/my_msg02.png"/>
					<span class="my_msg_parentname">${(stu.parent_type)! }姓名          :</span>
					<span>${(stu.parent_name)! }</span>
				</div>
				<div class="clear"></div>
				<div class="my_msg_phone">
					<a class="my_msg_phone1" href="/parents/changePhoneHtml">
						<img src="/static/parents/img/my/my_msg03.png"/>
						<span class="my_msg_parentname">手机号         :</span>
						<div class="my_msg_paphone">${(session.user.phone)! }</div>
						<img class="my_msg_prev" src="/static/parents/img/my/my_msg08.png"/>
					</a>
				</div>
				<div class="my_msg_add">
					<a class="my_msg_address" href="/parents/changeAddrHtml">
						<img class="my_msg_addpic" src="/static/parents/img/my/my_msg05.png"/>
						<span>家庭地址           :</span>
						<div class="my_msg_addetail">${(stu.address)! }</div>
						<img class="my_msg_prev" src="/static/parents/img/my/my_msg08.png"/>
					</a>
				</div>
				<p class="my_msg_link">以上信息为与您及时沟通的依据  ,如有变动请更新</p>
			</div>
			<div class="clear"></div>
			<div class="my_msg_chagepwd">
				<a class="my_msg_chagepwd1" href="/parents/changePassHtml">
					<img src="/static/parents/img/my/my_msg07.png"/>
					<span class="my_msg_cpwd">修改密码</span>
					<img class="my_msg_cpwdprev" src="/static/parents/img/my/my_msg08.png"/>
				</a>				
			</div>
			<div class="clear"></div>
			<p class="my_msg_tip">家长端和学生端使用用一手机号和密码</p>
			<div class='exit' onclick="location.href='/parents/loginI?type=1'"  ontouchstart="this.style.background='#78849a';this.style.color='#ffffff';this.borderRadius='0.6rem';" ontouchend="this.style.borderColor='#78849a';this.style.background='';this.style.color='#52617d';" >退出登录</div>
		</div>
	</body>
</html>
