<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="course">
<section class="content-header">
    <h1>
        课程管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/course"><i class="fa fa-tag"></i> 课程管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="get" action="${baseUrl!}/admin/course">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="${name!}" placeholder="课程名"/>
                </div>
                <button type="submit" class="btn btn-raised btn-default ">搜索</button>
            </form>
        </div>


        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table class="table table-hover table-bordered">
                    <thead>

                    <th>id</th>
                    <th>课程名</th>
                    <th>课程项目数</th>
                    <th>课程阶段</th>
                    <th>课程评语</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#if page??>
                            <#list page.getList() as course>
                            <tr>
                                <td>${course.id!}</td>
                                <td>${course.name!}</td>
                                <td>${course.part_number!}</td>
                                <td>
                                    <#if course.level = 1>
                                        小学
                                    <#elseif course.level = 2>
                                        幼儿园
                                    <#elseif course.level = 3>
                                        社会培训
                                    <#else >
                                        空<font color="red">错误信息</font>
                                    </#if>
                                </td>
                                <td>${course.comments!}</td>
                                <td>
                                    <@shiro.hasPermission name="course:edit">
                                        <a href="${baseUrl!}/admin/course/edit/${course.id!}"><span
                                                class="glyphicon glyphicon-edit"></span></a>
                                    </@shiro.hasPermission>
                                    <@shiro.hasPermission name="course:delete">
                                        <a href="javascript:delete_course('${course.id!}')"><span
                                                class="glyphicon glyphicon-trash"></span></a>
                                    </@shiro.hasPermission>
                                    <@shiro.hasPermission name="course:info">
                                        <a href="${baseUrl!}/admin/course/info/${course.id!}"><span
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
                            总课程数：
                            <#if page??>
                            ${page.getTotalRow()}
                            </#if>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <div class="dataTables_paginate paging_simple_numbers">
                            <#include "/page/admin/common/_paginate.ftl"/>
                            <#if page??>
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/course/index" urlParas="" />
                        </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <@shiro.hasPermission name="course:add">
            <div class="box-footer">
                <a href="${baseUrl!}/admin/course/add" class="btn btn-raised  btn-default pull-right">添加</a>
            </div>
        </@shiro.hasPermission>
    </div>
    <script>


        function delete_course(courseid) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/course/delete",
                    async: true,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        course_id: courseid
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
