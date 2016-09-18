<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="video">
<section class="content-header">
    <h1>
        通用视频管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/video"><i class="fa fa-tag"></i> 通用视频管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="get" action="${baseUrl!}/admin/video">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="" placeholder="视频名"/>
                    <input type="text" class="form-control" name="author_name" value="" placeholder="作者"/>
                </div>
                <button type="submit" class="btn btn-raised btn-default ">搜索</button>
            </form>
        </div>


        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table class="table table-hover table-bordered">
                    <thead>

                    <th>id</th>
                    <th>视频名</th>
                    <th>所属栏目</th>
                    <th>该资源在栏目中的位置</th>
                    <th>视频路径</th>
                    <th>视频封面</th>
                    <th>作者姓名</th>
                    <th>作者照片</th>
                    <th>上传时间</th>

                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#list page.getList() as video>
                        <tr>
                            <td>${video.id!}</td>
                            <td>${video.name!}</td>
                            <td>${video.partname!}</td>
                            <td>${video.source_index!}</td>
                            <td>${video.path!}</td>
                            <td>${video.pic_path!}</td>
                            <td>${video.author_name!}</td>
                            <td>${video.author_avatar!}</td>
                            <td>${video.upload_time!}</td>

                            <td>
                                <@shiro.hasPermission name="video:edit">
                                    <a href="${baseUrl!}/admin/video/edit/${video.id!}"><span
                                            class="glyphicon glyphicon-edit"></span></a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="video:delete">
                                    <a href="javascript:delete_video('${video.id!}')"><span
                                            class="glyphicon glyphicon-trash"></span></a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="video:info">
                                    <a href="${baseUrl!}/admin/video/info/${video.id!}"><span
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
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/video/index" urlParas="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <@shiro.hasPermission name="video:add">
            <div class="box-footer">
                <a href="${baseUrl!}/admin/video/add" class="btn btn-raised  btn-default pull-right">添加</a>
            </div>
        </@shiro.hasPermission>
    </div>
    <script>


        function delete_video(videoid) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/video/delete",
                    async: true,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        video_id: videoid
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
