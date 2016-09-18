<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="school">
<section class="content-header">
    <h1>
        年级课程管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/school"><i class="fa fa-tag"></i> 学校管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="get" action="${baseUrl!}/admin/school">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="${name!}" placeholder="学校名"/>
                </div>
                <button type="submit" class="btn btn-raised btn-default ">搜索</button>
            </form>
        </div>


        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table class="table table-hover table-bordered">
                    <thead>

                    <th>id</th>
                    <th>学校名</th>
                    <th>入驻时间</th>
                    <th>有效值至</th>
                    <th>有效天数</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#if page??>
                            <#list page.getList() as list>
                            <tr>
                                <td>${list.id!}</td>
                                <td>${list.name!}</td>
                                <td>${list.create_time!?string('yyyy-MM-dd')}</td>
                                <td>${list.end_time!?string('yyyy-MM-dd')}</td>
                                <td>${list.day!}</td>
                                <td>
                                        <a href="${baseUrl!}/admin/school/edit/${list.id!}"><span
                                                class="glyphicon glyphicon-edit"></span></a>
                                        <a href="javascript:delete_school('${list.id!}')"><span
                                                class="glyphicon glyphicon-trash"></span></a>
                                        <a href="${baseUrl!}/admin/school/info/${list.id!}"><span
                                                class="glyphicon glyphicon-eye-open"></span></a>

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
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/school/index" urlParas="" />
                        </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="box-footer">
                <a href="${baseUrl!}/admin/school/add" class="btn btn-raised  btn-default pull-right">添加</a>
            </div>
    </div>
    <script>


        function delete_school(id) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/school/del",
                    async: true,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        id: id
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
