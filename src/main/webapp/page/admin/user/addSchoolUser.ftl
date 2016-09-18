<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        学校用户添加
        <small>添加</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/user"><i class="fa fa-tag"></i> 用户</a></li>
        <li class="active">添加</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">创建学校用户</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="addSchoolUser">
            <div class="box-body">

                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">昵称</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="school.name" placeholder="昵称">
                    </div>
                </div>


                <div class="form-group">
                    <label for="phone" class="col-sm-2 control-label">手机号</label>
                    <div class="col-sm-4">
                        <input type="text" id="phone" class="form-control" name="course.part_number" placeholder="手机号">
                    </div>
                </div>
                <div class="form-group">
                    <label for="phone" class="col-sm-2 control-label">学校</label>
                    <div class="col-sm-4">
                        <select id="school" class="form-control">
                        	<option value="0">[请选择]</option>
                        	<#list schools! as list>
                        	<option value="${list.id! }">${list.name! }</option>
                        	</#list>
                        </select>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <button type="button" id="submit_form" class="btn btn-primary">提交</button>
                <button type="reset" class="btn btn-default">重置</button>
            </div>
        </form>
    </div>
    <script>
        $("#submit_form").click(function () {
        	if($("#phone").val()==""){
        		alert("手机号码不能为空");
        		return;
        	}
			if($("#name").val()==""){
				alert("昵称不能为空");
        		return;
        	}if($("#school").val()=="0"){
        		alert("请选择对应的学校");
        		return;
        	}
            $.ajax({
                url: "${baseUrl!}/admin/user/addSchoolUser",
                async: true,
                cache: false,
                type: 'post',
                dataType: "json",
                data: {
                    phone: $("#phone").val(),
                    name: $("#name").val(),
                    schoolId:$("#school").val()
                },
                success: function (data) {
                    if (data.code == '200') {
                        alert("添加学校用户成功,密码已经发送至手机");
                        location.href="${baseUrl!}/admin/user";
                    } else {
                       alert(data.description);
                    }
                }
            });
        });





    </script>

</section>
</@layout>