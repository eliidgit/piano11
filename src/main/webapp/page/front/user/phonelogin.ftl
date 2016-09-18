<#include "/page/front/common/_layout.ftl"/>
<@html title="用户登录 - ${siteTitle!}" description="用户登录" page_tab="login" sidebar_about="show">
<div class="panel panel-default">
    <div class="panel-heading">
        <ol class="breadcrumb">
            <li><a href="${baseUrl!}/">首页</a></li>
            <li class="active">登录</li>
        </ol>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" style="margin-top: 20px;">
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-8">
                    <input type="phone" class="form-control" id="phone" placeholder="手机号(必填)">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" id="password" placeholder="密码(必填)">
                </div>
            </div>

            <div class="form-group">
                <label for="user_type" class="col-sm-2 control-label">用户类型</label>
                <div class="col-sm-8">
                    <select name="user_type" id="user_type">
                        <option value="1">学生</option>
                        <option value="2">教师</option>
                        <option value="3">家长</option>
                    </select>
                </div>
            </div>



            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <span id="loginMsg"></span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <a onclick="login()" id="login_btn" class="btn btn-raised btn-default">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="${baseUrl!}/smsreg.html">
                    <a  href="${baseUrl!}/phoneforgetpwd.html" id="login_btn" class="btn btn-raised btn-default">忘记密码</a>
                </div>
            </div>
        </form>
        <p class="text-center">第三方登录:</p>
        <div class="divide mar-5"></div>
        <span class="pull-left" style="margin: 8px; 0 0;">
            <a href="${baseUrl!}/oauth/qqlogin">
                <img src="${baseUrl!}/static/img/QQ_Logo_wiki.png" width="24" alt="QQ 登录">
            </a>&nbsp;&nbsp;
            <a href="${baseUrl!}/oauth/weibologin">
                <img src="http://www.sinaimg.cn/blog/developer/wiki/LOGO_24x24.png" alt="微博登录">
            </a>
        </span>
    </div>
</div>
<script>
    function login() {
        $("#login_btn").attr("disabled", true);
        $.ajax({
            url: "${baseUrl!}/api/index/phonelogin",
            async: false,
            cache: false,
            type: 'post',
            dataType: "json",
            data: {
                phone: $("#phone").val(),
                password: $("#password").val(),
                user_type: $("#user_type").val()
            },
            success: function (data) {
                if (data.code == '200') {
                    location.href = "${baseUrl!}/";
                } else {
                    $("#loginMsg").css("color", "red").html(data.description);
                    $("#login_btn").attr("disabled", false);
                }
            }
        });
    }
</script>
</@html>