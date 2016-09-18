<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="user">
<section class="content-header">
    <h1>
        用户
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/user"><i class="fa fa-tag"></i> 用户</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="post" action="${baseUrl!}/admin/user">
                <div class="form-group">
                    <input type="text" class="form-control" name="nickname" value="${nickname!}" placeholder="昵称"/>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" name="email" value="${email!}" placeholder="邮箱">
                </div>
                <div class="form-group">
                    <select class="form-control" name="type" value="${type!}">
                        <option value="">---请选择用户类型---</option>
                        <option <#if type = "4"> selected='selected'</#if> value="4">学校</option>
                        <option <#if type = "2"> selected='selected'</#if> value="2">教师</option>
                        <option <#if type = "1"> selected='selected'</#if> value="1">学生</option>

                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control" id="schoolId" name="schoolId" >
                        <option value=0>---请选择学校---</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-raised btn-default ">搜索</button>
            </form>
        </div>
        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table class="table table-hover table-bordered">
                    <thead>
                    <th>头像</th>
                    <th>手机号</th>
                    <th>用户类型</th>
                    <th>昵称</th>
                    <th>邮箱</th>
                    <th>QQ绑定</th>
                    <th>微博绑定</th>
                    <th>积分</th>
                    <th>注册时间</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#list page.getList() as user>
                        <tr>
                            <td><a href="${baseUrl!}/user/${user.id}"><img src="${user.avatar!}" width="30"></a></td>
                            <td>${user.phone!}</td>
                        <td>
                            <#if user.type?? && user.type != "">
                                <#if user.type = '1'>
                                    学生
                                <#elseif user.type = '2'>
                                    教师
                                <#elseif user.type = '3'>
                                    家长
                                <#elseif user.type = '4'>
                                    学校
                                </#if>

                            </#if>
                        </td>


                            <td><a href="${baseUrl!}/admin/user/detail/${user.id}">${user.nickname!}</a></td>
                            <td><a href="mailto:${user.email!}">${user.email!}</a></td>
                            <td>
                                <#if user.qq_nickname?? && user.qq_nickname != "">
                                    <img src="${user.qq_avatar!}" width="30"/>${user.qq_nickname!}
                                </#if>
                            </td>
                        <td>
                            <#if user.sina_nickname?? && user.sina_nickname != "">
                                <img src="${user.sina_avatar!}" width="30"/>${user.sina_nickname!}</td>
                            </#if>
                            <td>${user.score!}</td>
                            <td>${user.in_time!}</td>
                            <td>
                                <@shiro.hasPermission name="user:disabled">
                                    <a href="#" class="btn btn-danger btn-sm">禁用</a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="user:delete">
                                    <a href="#" class="btn btn-danger btn-sm" id="del_user" onclick="delete_user('${user.id!}')">删除</a>
                                </@shiro.hasPermission>
                            </td>
                        </tr>
                        </#list>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-5">
                        <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">
                            总用户数：${page.getTotalRow()}</div>
                    </div>
                    <div class="col-sm-7">
                        <div class="dataTables_paginate paging_simple_numbers">
                            <#include "/page/admin/common/_paginate.ftl"/>
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/user/index" urlParas="&schoolId=${schoolId! }&type=${type!}" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <@shiro.hasPermission name="user:add">
            <div class="box-footer">
                <a href="${baseUrl!}/admin/user/addSchoolUser" class="btn btn-raised  btn-default pull-right">添加学校用户</a>
            </div>
        </@shiro.hasPermission>
    </div>
    <script>
    $(function(){
	    $.ajax({
	        url: "${baseUrl!}/admin/school/getSchool",
	        async: false,
	        cache: false,
	        type: 'post',
	        dataType: "json",
	        success: function (data) {
	            if (data.code == '200') {
	            	var text="";
	            	for(var i=0;i<data.detail.length;i++){
	            		var obj = data.detail[i];
	            		text+='<option '+(obj.id=='${schoolId!}'?'selected="selected"':'')+' value='+obj.id+'>'+obj.name+'</option>';
	            	}
	            	$("#schoolId").append(text);
	            }
	        }
	    });
    });
    
        function delete_user(userid) {
            $.ajax({
                url: "${baseUrl!}/admin/user/delete",
                async: true,
                cache: false,
                type: 'post',
                dataType: "json",
                data: {
                    user_id : userid
                },
                success: function (data) {
                    if (data.code == '200') {
                        alert("删除成功");
                        window.location.reload();
                    } else {
                        alert("删除失败，原因是"+data.description);
                    }
                }
            });
        }

    </script>
</section>
</@layout>
