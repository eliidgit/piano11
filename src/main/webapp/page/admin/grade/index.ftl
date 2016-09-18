<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="grade">
<section class="content-header">
    <h1>
        年级课程管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/grade"><i class="fa fa-tag"></i> 年级课程管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="get" action="${baseUrl!}/admin/grade">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="${name!}" placeholder="年级课程名"/>
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

                    <th>id</th>
                    <th>年级名</th>
                    <th>课程名</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#if page??>
                            <#list page.getList() as grade>
                            <tr>
                                <td>${grade.id!}</td>
                                <td>${grade.name!}</td>
                                <td>${grade.cname!}</td>
                                <td>
                                    <@shiro.hasPermission name="grade:edit">
                                        <a href="${baseUrl!}/admin/grade/edit/${grade.id!}"><span
                                                class="glyphicon glyphicon-edit"></span></a>
                                    </@shiro.hasPermission>
                                    <@shiro.hasPermission name="grade:delete">
                                        <a href="javascript:delete_grade('${grade.id!}')"><span
                                                class="glyphicon glyphicon-trash"></span></a>
                                    </@shiro.hasPermission>
                                    <@shiro.hasPermission name="grade:info">
                                        <a href="${baseUrl!}/admin/grade/info/${grade.id!}"><span
                                                class="glyphicon glyphicon-eye-open"></span></a>
                                    </@shiro.hasPermission>

                                </td>
                            </tr>
                            </#list>
                        </#if>

                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-5">
                        <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">
                            总年级课程数：
                            <#if page??>
                            ${page.getTotalRow()}
                            </#if>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <div class="dataTables_paginate paging_simple_numbers">
                            <#include "/page/admin/common/_paginate.ftl"/>
                            <#if page??>
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/grade/index" urlParas="?schoolId=${schooId! }" />
                        </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <@shiro.hasPermission name="grade:add">
            <div class="box-footer">
                <a href="${baseUrl!}/admin/grade/add" class="btn btn-raised  btn-default pull-right">添加</a>
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

        function delete_grade(gradeid) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/grade/delete",
                    async: true,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        grade_id: gradeid
                    },
                    success: function (data) {
                        if (data.code == '200') {
                            alert("删除成功");
                            window.location.reload();
                        } else {
                            alert("删除失败，原因是" + data.description);

                        }
                    }
                });
            }
        }
    </script>
</section>
</@layout>
