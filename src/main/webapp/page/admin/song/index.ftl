<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="song">
<section class="content-header">
    <h1>
        曲库管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/song"><i class="fa fa-tag"></i> 曲库管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="post" action="${baseUrl!}/admin/song">
                <div class="form-group">
                                     分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类:
                    <select name="tag" class="form-control">
                    	<option value="0">[--请选择--]</option>
                    <#list tags! as list>
                    	<option value="${list.id! }">${list.name!}</option>
                    </#list>
                    </select>
                </div>
                <button type="submit" class="btn btn-raised btn-default ">搜索</button>
            </form>
            <form class="form-inline" method="post" action="${baseUrl!}/admin/song">
                <div class="form-group">
                     <input type="text" class="form-control" name="name" value="" placeholder="音乐名"/>
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
                    <th>作者</th>
                    <th>难度</th>
                    <th>封面图片路径</th>
                    <th>midi路径</th>
                    <th>五线谱路径</th>
                    <th>ogg路径</th>
                    <th>txt_a路径</th>
                    <th>txt_b路径</th>
                    <th>点击量</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#list page.getList() as list>
                        <tr>
                            <td>${list.id!}</td>
                            <td>${list.name!}</td>
                            <td>${list.author!}</td>
                            <td>${list.level!}</td>
                            <td>${list.cover_path!}</td>
                            <td>${list.stave_path!}</td>
                            <td>${list.midi_path!}</td>
                            <td>${list.ogg_path!}</td>
                            <td>${list.txt_a!}</td>
                            <td>${list.txt_b!}</td>
                            <td>${list.click_num!}</td>
                            <td>
                                    <a href="${baseUrl!}/admin/song/editSong?songId=${list.id!}"><span
                                            class="glyphicon glyphicon-edit"></span></a>
                                    <a href="javascript:delete_song('${list.id!}')"><span
                                            class="glyphicon glyphicon-trash"></span></a>
                                    <a href="${baseUrl!}/admin/song/detail?id=${list.id!}"><span
                                            class="glyphicon glyphicon-eye-open"></span></a>

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
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/song/index" urlParas="&name=${name! }&tag=${tag! }" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <@shiro.hasPermission name="music:add">
            <div class="box-footer">
                <a href="${baseUrl!}/admin/song/add" class="btn btn-raised  btn-default pull-right">添加</a>
            </div>
        </@shiro.hasPermission>
    </div>
    <script>


        function delete_song(songId) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/song/delSong",
                    async: false,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        songId: songId
                    },
                    success: function (data) {
                        if (data.code == '200') {
                        	alert("成功");
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
