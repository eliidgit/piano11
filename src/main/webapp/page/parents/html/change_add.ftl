<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>修改地址</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/change_add.css" />
	</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<script type="text/javascript" src="/static/parents/js/change_add.js"></script>
	<body>
		<!--弹窗-->
		<div class="add_screen"></div>
		<div class="add_window">
			<div class="add_already">
				<img src="/static/parents/img/change_pwd/change_pwd_22.png"/><span>保存成功</span>
			</div>
		</div>
		<!--弹窗结束-->
		<div class="change_add">
			<div class="change_addcenter">
				<span class="change_add1">家庭地址       :   </span>
				<textarea class="change_add2">${address!}</textarea>
			</div>
		</div>
		<div class="clear"></div>
		<p class="change_add_tip"></p>
		<div class="change_save">
			<div class="change_btn" ontouchstart="this.style.background='#78849a';this.style.color='#ffffff';this.borderRadius='0.6rem';" ontouchend="this.style.borderColor='#78849a';this.style.background='';this.style.color='#52617d';" >保存</div>
		</div>
	</body>
</html>
