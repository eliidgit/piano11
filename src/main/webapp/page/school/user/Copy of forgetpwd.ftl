<#include "/page/school/common/_layout.ftl"/>
<@html title="找回密码 - ${siteTitle!}" description="找回密码" sidebar_about="show">
<div class="panel panel-default">
    <div class="panel-heading">
        <ol class="breadcrumb">
            <li><a href="${baseUrl!}/">首页</a></li>
            <li class="active">找回密码</li>
        </ol>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" style="margin-top: 20px;">
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-8">
                    <div class="input-group">
                        <input type="email" class="form-control" id="forgetpwd_phone" placeholder="手机号码(必填)"/>
                        <span class="input-group-btn">
                            <button class="btn btn-raised btn-default" type="button" id="send_sms_btn" onclick="sendSMS()">发送验证码</button>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="valicode" class="col-sm-2 control-label">验证码</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="valicode" placeholder="验证码(必填)">
                </div>
            </div>
            <div class="form-group">
                <label for="newpwd" class="col-sm-2 control-label">新密码</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" id="newpwd" placeholder="新密码(必填)">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <span id="forgetpwdMsg"></span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <a onclick="forgetpwd()" id="forgetpwd_btn" class="btn btn-raised btn-default">确定</a>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function sendSMS() {
        $("#send_sms_btn").attr("disabled", true);
        $.ajax({
            url: "${baseUrl!}/sendSMSValiCode",
            async: false,
            cache: false,
            type: 'post',
            dataType: "json",
            data: {
                type: 'forgetpwd',
                phone: $("#forgetpwd_phone").val()
            },
            success: function (data) {
                if (data.code == '200') {
                    $("#send_sms_btn").html("发送成功");
                    $("#forgetpwd_phone").attr("disabled", true);
                } else {
                    $("#forgetpwdMsg").css("color", "red").html(data.description);
                    $("#send_sms_btn").attr("disabled", false);
                }
            }
        });
    }
    function forgetpwd() {
        $("#forgetpwd_btn").attr("disabled", true);
        $.ajax({
            url: "${baseUrl!}/api/index/phoneforgetpwd",
            async: false,
            cache: false,
            type: 'post',
            dataType: "json",
            data: {
                phone: $("#forgetpwd_phone").val(),
                valicode: $("#valicode").val(),
                newpwd: $("#newpwd").val()
            },
            success: function (data) {
                if (data.code == '200') {
                    alert("密码修改成功，请重新登录")
                    location.href="${baseUrl!}/school";
                } else {
                    $("#forgetpwdMsg").css("color", "red").html(data.description);
                    $("#forgetpwd_btn").attr("disabled", false);
                }
            }
        });
    }
</script>
</@html>