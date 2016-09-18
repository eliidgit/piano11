<#include "/page/front/common/_layout.ftl"/>
<@html title="接口测试 - ${siteTitle!}" description="接口测试" page_tab="login" sidebar_about="show">
<div class="panel panel-default">
    <div class="panel-heading">
        <ol class="breadcrumb">
            <li><a href="${baseUrl!}/">首页</a></li>
            <li class="active">接口测试</li>
        </ol>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" style="margin-top: 20px;">
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">测试地址</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="apiurl" placeholder="测试地址">

                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">手机</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="phone" placeholder="手机">

                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">验证码</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="valicode" placeholder="验证码">

                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <span id="loginMsg">MESSAGE</span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <a onclick="login()" id="login_btn" class="btn btn-raised btn-default">请求</a>
                </div>
            </div>

        </form>

    </div>
</div>
<script>

    function login() {
        $("#login_btn").attr("disabled", true);
        $.ajax({
            url: $("#apiurl").val(),
            async: false,
            cache: false,
            type: 'post',
            dataType: "json",
            data: {
                phone: $("#phone").val(),
                valicode: $("#valicode").val()
            },
            success: function (data) {
                if (data.code == '200') {
                    $("#loginMsg").css("color", "red").html(data.description);
                } else {
                    $("#loginMsg").css("color", "red").html(data.description);
                }
            }
        });
    }
</script>
</@html>