<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="homework">
<section class="content-header">
    <h1>
        作业管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/homework"><i class="fa fa-tag"></i> 作业管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="get" action="${baseUrl!}/admin/homework">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="" placeholder="作业名"/>
                </div>
                <button type="submit" class="btn btn-raised btn-default ">搜索</button>
            </form>
        </div>


        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table class="table table-hover table-bordered">
                    <thead>

                    <th>id</th>
                    <th>作业名</th>
                    <th>所属课程</th>
                    <th>所属栏目</th>
                    <th>该资源在栏目中的位置</th>
                    <th>内容</th>
                    <th>图片</th>
                    <th>背景音乐</th>
                    <th>答案类型</th>
                    <th>Do</th>
                    <th>Re</th>
                    <th>Mi</th>
                    <th>Fa</th>
                    <th>答案</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#list page.getList() as homework>
                        <tr>
                            <td>${homework.id!}</td>
                            <td>${homework.name!}</td>
                            <td>${homework.cname!}</td>
                            <td>${homework.pname!}</td>
                            <td>${homework.source_index!}</td>
                            <td>${homework.content!}</td>
                            <td>${homework.pics_path!}</td>
                            <td>${homework.ogg_path!}</td>
                            <td>
                            <#if homework.answer_type = '1'>
                                文字
                            <#else >
                                图片
                            </#if>
                            </td>
                            <td>${homework.answer_a!}</td>
                            <td>${homework.answer_b!}</td>
                            <td>${homework.answer_c!}</td>
                            <td>${homework.answer_d!}</td>
                            <td>${homework.answer!}</td>

                            <td>
                                <@shiro.hasPermission name="homework:edit">
                                    <a href="${baseUrl!}/admin/homework/edit/${homework.id!}"><span
                                            class="glyphicon glyphicon-edit"></span></a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="homework:delete">
                                    <a href="javascript:delete_homework('${homework.id!}')"><span
                                            class="glyphicon glyphicon-trash"></span></a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="homework:info">
                                    <a href="${baseUrl!}/admin/homework/info/${homework.id!}"><span
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
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/homework/index" urlParas="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <@shiro.hasPermission name="homework:add">
            <div class="box-footer">
                <a href="${baseUrl!}/admin/homework/add" class="btn btn-raised  btn-default pull-right">添加</a>
            </div>
        </@shiro.hasPermission>
    </div>
    <script>


        function delete_homework(homeworkid) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/homework/delete",
                    async: true,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        homework_id: homeworkid
                    },
                    success: function (data) {
                        if (data.code == '200') {
                            alert(data.detail);
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
