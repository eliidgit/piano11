<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="demolesson">
<section class="content-header">
    <h1>
        示范课
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/demolesson"><i class="fa fa-tag"></i> 示范课</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="get" action="${baseUrl!}/admin/demolesson">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="" placeholder="课程名"/>
                    <input type="text" class="form-control" name="author" value="" placeholder="作者"/>
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
                    <th>视频路径</th>
                    <th>大小</th>
                    <th>课程类型</th>
                    <th>课程作者</th>
                    <th>图片路径</th>
                    <th>知识要点</th>
                    <th>点赞数</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#list page.getList() as lesson>
                        <tr>
                            <td>${lesson.id!}</td>
                            <td>${lesson.name!}</td>
                            <td>${lesson.path!}</td>
                            <td>${lesson.size!}</td>

                            <#if lesson.type='1'>
                                <td>示范课</td>
                            <#elseif lesson.type='2'>
                                <td>曲目</td>
                            <#else >
                                <td>类型3</td>
                            </#if>

                            <td>${lesson.author!}</td>
                            <td>${lesson.pic_path!}</td>
                            <#if lesson??>
                                <#if lesson.know_point??>
                                    <td>${lesson.know_point?substring(0,10)}
                                    </td>
                                <#else>
                                    <td></td>
                                </#if>
                            <#else>
                                <td></td>
                            </#if>
                            <td>${lesson.like_number!}</td>
                            <td>
                                <@shiro.hasPermission name="demolesson:edit">
                                    <a href="${baseUrl!}/admin/demolesson/edit?id=${lesson.id!}"><span
                                            class="glyphicon glyphicon-edit"></span></a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="demolesson:delete">
                                    <a href="javascript:delete_lesson('${lesson.id!}')"><span
                                            class="glyphicon glyphicon-trash"></span></a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="demolesson:get">
                                    <a href="${baseUrl!}/admin/demolesson/info?id=${lesson.id!}"><span
                                            class="glyphicon glyphicon-eye-open"></span></a>
                                </@shiro.hasPermission>

                            </td>
                        </tr>
                        </#list>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-5">
                        <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">
                            总课程数：${page.getTotalRow()}</div>
                    </div>
                    <div class="col-sm-7">
                        <div class="dataTables_paginate paging_simple_numbers">
                            <#include "/page/admin/common/_paginate.ftl"/>
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/demolesson/index" urlParas="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <@shiro.hasPermission name="demolesson:add">
            <div class="box-footer">
                <a href="${baseUrl!}/admin/demolesson/add" class="btn btn-raised  btn-default pull-right">添加</a>
            </div>
        </@shiro.hasPermission>
    </div>
    <script>


        function delete_lesson(lessonid) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/demolesson/delete",
                    async: true,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        lesson_id: lessonid
                    },
                    success: function (data) {
                        if (data.code == '200') {
                            alert("删除成功");
                            window.location.reload();
                        } else {
                            alert("删除失败，原因是" + data.detail);

                        }
                    }
                });
            }
        }
    </script>
</section>
</@layout>
