<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        示范课详情页
        <small>详情</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/demolesson"><i class="fa fa-tag"></i> 示范课</a></li>
        <li class="active">详情</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">示范课详情</h3>
        </div>


            <div class="box-body">
                <div style="margin-left: 300px;">
                    <div class="box box-default" style="width: 500px;">
                        <label>课程名:</label>
                        <span>${demolesson.name!}</span>
                    </div>

                    <div class="box box-default" style="width: 500px;">
                        <label>类型:</label>
                        <span>${demolesson.type!}</span>
                    </div>


                    <div class="box box-default" style="width: 500px;">
                        <label>课程作者:</label>
                        <span>${demolesson.author!}</span>
                    </div>


                    <div class="box box-default" style="width: 500px;">
                        <label>知识要点:</label>
                        <span>${demolesson.know_point!}</span>
                    </div>

                    <div class="box box-default" style="width: 500px;">
                        <label>点赞数:</label>
                        <span>${demolesson.like_number!}</span>
                    </div>


                    <div class="box box-default" style="width: 500px;">
                        <label>封面图片:</label>
                        <span>${demolesson.pic_path!}</span>
                    </div>

                    <div class="box box-default" style="width: 500px;">
                        <label>视频文件:</label>
                        <span>${demolesson.path!}</span>
                    </div>


                </div>
            </div>
            <!-- /.box-body -->
        <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
    </div>

</section>
</@layout>