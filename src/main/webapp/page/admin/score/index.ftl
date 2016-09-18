<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="score">
<section class="content-header">
    <h1>
        成绩管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/score"><i class="fa fa-tag"></i> 成绩管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="get" action="${baseUrl!}/admin/score">
                <div class="form-group">
                    <input type="text" class="form-control" name="student.name" value="" placeholder="学生名"/>
                </div>
                <button type="submit" class="btn btn-raised btn-default ">搜索</button>
            </form>
        </div>


        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table class="table table-hover table-bordered">
                    <thead>

                    <th>id</th>
                    <th>学生姓名</th>
                    <th>所属课时</th>
                    <th>分数</th>
                    <#--<th>该资源在栏目中的位置</th>-->
                    <th>节奏</th>
                    <th>实值</th>
                    <th>音高</th>
                    <th>评语</th>
                    <th>学生所选答案</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#list page.getList() as score>
                        <tr>
                            <td>${score.id!}</td>
                            <td>${score.stuname!}</td>
                            <td>${score.partname!}</td>
                            <td>${score.score!}</td>
                            <td>${score.s_jiezou!}</td>
                            <td>${score.s_shizhi!}</td>
                            <td>${score.s_yingao!}</td>
                            <td>${score.comments!}</td>
                            <td>${score.student_answer!}</td>

                            <td>
                                <@shiro.hasPermission name="score:edit">
                                    <a href="${baseUrl!}/admin/score/edit/${score.id!}"><span
                                            class="glyphicon glyphicon-edit"></span></a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="score:delete">
                                    <a href="javascript:delete_score('${score.id!}')"><span
                                            class="glyphicon glyphicon-trash"></span></a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="score:info">
                                    <a href="${baseUrl!}/admin/score/info/${score.id!}"><span
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
                            总成绩数：${page.getTotalRow()}</div>
                    </div>
                    <div class="col-sm-7">
                        <div class="dataTables_paginate paging_simple_numbers">
                            <#include "/page/admin/common/_paginate.ftl"/>
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/score/index" urlParas="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <@shiro.hasPermission name="score:add">
            <div class="box-footer">
                <a href="${baseUrl!}/admin/score/add" class="btn btn-raised  btn-default pull-right">添加</a>
            </div>
        </@shiro.hasPermission>
    </div>
    <script>

        function delete_score(scoreid) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/score/delete",
                    async: true,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        score_id: scoreid
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
