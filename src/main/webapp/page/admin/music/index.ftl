<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="music">
<section class="content-header">
    <h1>
        通用音乐管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/music"><i class="fa fa-tag"></i> 通用音乐管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="get" action="${baseUrl!}/admin/music">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="" placeholder="音乐名"/>
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
                    <th>音乐名</th>
                    <th>所属栏目</th>
                    <th>在栏目中的顺序</th>
                    <th>midi路径</th>
                    <th>五线谱路径</th>
                    <th>ogg路径</th>
                    <th>txt1路径</th>
                    <th>txt2路径</th>

                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#list page.getList() as music>
                        <tr>
                            <td>${music.id!}</td>
                            <td>${music.name!}</td>
                            <td>${music.partname!}</td>
                            <td>${music.source_index!}</td>
                            <td>${music.midi_path!}</td>
                            <td>${music.stave_path!}</td>
                            <td>${music.ogg_path!}</td>
                            <td>${music.txt_a!}</td>
                            <td>${music.txt_b!}</td>
                            <td>
                                <@shiro.hasPermission name="music:edit">
                                    <a href="${baseUrl!}/admin/music/edit/${music.id!}"><span
                                            class="glyphicon glyphicon-edit"></span></a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="music:delete">
                                    <a href="javascript:delete_music('${music.id!}')"><span
                                            class="glyphicon glyphicon-trash"></span></a>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="music:info">
                                    <a href="${baseUrl!}/admin/music/info/${music.id!}"><span
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
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/music/index" urlParas="&course_part_id=${course_part_id! }" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <@shiro.hasPermission name="music:add">
            <div class="box-footer">
                <a href="${baseUrl!}/admin/music/add" class="btn btn-raised  btn-default pull-right">添加</a>
            </div>
        </@shiro.hasPermission>
    </div>
    <script>


        function delete_music(musicid) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/music/delete",
                    async: true,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        music_id: musicid
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
