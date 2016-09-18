<#include "/page/school/common/_layout.ftl"/>
<@html title="设置 - ${siteTitle!}" description="" >

<link rel="stylesheet" href="/static/school/css/user.css"/>
<script type="text/javascript" src="/static/school/js/user.js"></script>


<div class="lr_tc"></div>
<div class="loading"><img src="/static/school/img/pic19.png"/></div>
<div class="screen hide"></div>
<div class="loading hide"></div>
<div class="user">
			<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li><</li>
						<li>个人中心</li>
					</ul>
				</div>
				<!--添加结束-->
			<div class="usercenter">
				<div class="ucenter">
					<p class="uctit">个人中心</p>
					<div class="user_center1">
						<div class="use_people">
							<div class="use_hx_sum">
								<div class="use_hx0"></div>
								<div class="use_cent">基本信息</div>
								<div class="use_hx1"></div>								
							</div>
							<div class="pwdedit2">
								<input type="button" value="编辑" />
							</div>
						</div>
						<div class="add_nickname_sum"><!--添加-->
						  <form id="edit_user">
							<div class="nickname">
								<span class="nick1">昵称</span>
								<div class="nick2">
									<input readonly="readonly" name="nickname" type="text" value="${(session.user.nickname)! }" />
								</div>
								<div class="clear"></div>
							</div>
							<div class="userzh">
								<span class="login_zh">登录帐号</span>
								<input readonly="readonly" class="zh_num"  type="text" value="${(session.user.phone)! }" />
								<div class="clear"></div>
							</div>
							<div class="pwdedit">
								<div class="pwdedit1">
									<span class="use_change_pwd">当前密码</span>
									<input class="userpass"  name="password" readonly="readonly" type="text" value="***   ***   ***" />
								</div>
							</div>
							<div class="pwdslide">
									<div class="pwdslide2">
										<label>新的密码</label><input id="new_password" name="new_password" type="password" value="" />									
									</div>
									<div class="pwdslide3">
										<label>确认新密码</label><input id="new_password2" name="new_password2" type="password" value="" />									
									</div>
									<div class="user_btn">
										<input type="button" class="usercancle" value="取消" />
										<input class="usersave" type="button" value="保存" />
										<div class="clear"></div>
									</div>
							</div>	
						  </form>
						</div>
					</div>
					<div class="clear"></div>
					<div class="contact">
						<div class="use_hx_sum">
								<div class="use_hx0"></div>
								<div class="use_cent">联系天使音乐</div>
								<div class="use_hx2"></div>								
							</div>
						<div class="contlink">
							<!--<img src="../img/user_03.gif"/>-->
							<span class="contlink_span"></span>
							<span>010-51292950   /   010-57283548</span>
						</div>
						<div class="useradvice">
							<div class="useradcen">
								<p class="userad">意见建议</p>
							</div>
							<div class="usermsg">
								<form id="add_suggest">
									<div class="msg">
										<label>姓名</label>
										<input id="suggest_name" name="suggest.name" type="text" value="" />
									</div>
									<div class="msg">
										<label>联系电话</label>
										<input id="suggest_phone" name="suggest.phone" type="text" value="" />
									</div>
									<div class="msg usermsg3">
										<label>邮箱</label>
										<input id="suggest_email" name="suggest.email" type="text" value="" />
									</div>
									<div class="clear"></div>
									<div class="board">
										<label>留言</label><textarea name="suggest.message" id="suggest_message"></textarea>										
									</div>
									<div class="all_btn">
										<input type="reset" value="重置" />
										<input class="all_btn_save" type="button" value="保存" />
									</div>
								</form>
							</div>							
						</div>
					</div>
					<div class="have_sumbit">
						<div class="use_hx_sum">
							<div class="use_hx0"></div>
							<div class="use_cent">已提交的建议意见</div>
							<div class="use_hx3"></div>								
						</div>
						<div class="advice">
						<#list s! as list>
							<div class="advice_list">
								<div class="advice_time">${(list.create_time)!?string('yyyy-MM-dd') }</div>
								<div class="advice_cont">${list.message! }</div>
							</div>
						</#list>
						</div>
					</div>
				</div>
			</div>
			</div>
<script type="text/javascript">
	$(".all_btn_save").click(function(){
		if($("#suggest_name").val()==""){
			alert("姓名不能为空!");
			return;
		}
		if($("#suggest_phone").val()==""){
			alert("联系电话!");
			return;
		}
		if($("#suggest_email").val()==""){
			alert("邮箱!");
			return;
		}
		if($("#suggest_message").val()==null||$("#suggest_message").val()==""){
			alert("留言不能为空!");
			return;
		}
		if($("#suggest_message").val().length>255){
			alert("留言字数过长，不能大约255个字符!");
			return;
		}
		var options = {
                url: '/school/user/addSuggest',
                type: 'post',
                dataType: 'json',
                data: $("#add_suggest").serialize(),
                success: function (data) {
                    if (data.code == '200') {
                    	$(".advice").prepend('<div class="advice_list">'+
								'<div class="advice_time">'+data.detail.create_time.substr(0,10)+'</div>'+
								'<div class="advice_cont">'+data.detail.message+'</div>'+
							'</div>');
						document.getElementById("add_suggest").reset(); 
                    } else {
                        alert(data.description);
                    }
                }
            };
            $.ajax(options);
            return false;
	});
</script>
</@html>