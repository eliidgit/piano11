<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="song">
<section class="content-header">
    <h1>
        音乐详情页
        <small>详情</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/song"><i class="fa fa-tag"></i> 曲库管理</a></li>
        <li class="active">详情</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">音乐详情</h3>
        </div>


            <div class="box-body">
                <div style="margin-left: 300px;">
                    <div class="box box-default" style="width: 500px;">
                        <label>音乐名称:</label>
                        <span>${song.name!}</span>
                    </div>
					<div class="box box-default" style="width: 500px;">
                        <label>标签分类:</label>
                        
                        <#list tagNames! as tagName>
                        	<span style="border: 1px solid #999;padding:0px 3px;margin:0 3px;">${tagName!}</span>
                        </#list>
                        
                    </div>
                    <div class="box box-default" style="width: 500px;">
                        <label>作者:</label>
                        <span>${song.author!}</span>
                    </div>


                    <div class="box box-default" style="width: 500px;">
                        <label>难度等级:</label>
                        <span>${song.level!}</span>
                    </div>


                    <div class="box box-default" style="width: 500px;">
                        <label>封面图片路径:</label>
                        <span>${song.cover_path!}</span>
                    </div>

                    <div class="box box-default" style="width: 500px;">
                        <label>五线谱路径:</label>
                        <span>${song.stave_path!}</span>
                    </div>


                    <div class="box box-default" style="width: 500px;">
                        <label>midi路径:</label>
                        <span>${song.midi_path!}</span>
                    </div>

                    <div class="box box-default" style="width: 500px;">
                        <label>音乐文件路径:</label>
                        <span>${song.ogg_path!}</span>
                    </div>
                    <div class="box box-default" style="width: 500px;">
                        <label>txt_a路径:</label>
                        <span>${song.txt_a!}</span>
                    </div>
                    <div class="box box-default" style="width: 500px;">
                        <label>txt_b路径:</label>
                        <span>${song.txt_b!}</span>
                    </div>
					<div class="box box-default" style="width: 500px;">
                        <label>点击量:</label>
                        <span>${song.click_num!}</span>
                    </div>
					<div class="box box-default" style="width: 500px;">
                        <label>创建时间:</label>
                        <span>${song.create_time!}</span>
                    </div>

                </div>
            </div>
            <!-- /.box-body -->
        <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
    </div>

</section>
</@layout>