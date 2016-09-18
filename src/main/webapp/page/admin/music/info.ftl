<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        音乐详情
        <small>详情</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/music"><i class="fa fa-tag"></i> 音乐</a></li>
        <li class="active">详情</li>
    </ol>
</section>
<section class="content">

    <div class="box-body">
        <div style="margin-left: 300px;">

    <div class="box box-default" style="width: 500px;">
        <label>所属栏目:</label>
        <span>${part_name!}</span>
    </div>
    <div class="box box-default" style="width: 500px;">
        <label>本资源在所在栏目中的位置:</label>
        <span>${music.source_index!}</span>
    </div>
    <div class="box box-default" style="width: 500px;">
        <label>音乐名称:</label>
        <span>${music.name!}</span>
    </div>
    <div class="box box-default" style="width: 500px;">
        <label>音乐属性:</label>
        <span>${parent_name!}</span>
        <span>${tone_name!}</span>
    </div>



    <div class="box box-default" style="width: 500px; height: 320px; ">
        <#--五线谱-->
           <label>五线谱:</label> <span><img src="${music.stave_path!}" width="300" height="300" /></span>
    </div>
    <div class="box box-default" style="width: 500px;  ">
    <#--OGG-->
        <label>OGG:</label> <span> <video src="${music.ogg_path!}" controls="controls"></video></span>
    </div>

    <div class="box box-default" style="width: 500px;   ">
        <label>midi路径:</label>
        <span>${music.midi_path!}</span>
    </div>
    <div class="box box-default" style="width: 500px;    ">
        <label>txt_a路径:</label>
        <span>${music.txt_a!}</span>
    </div>

    <div class="box box-default" style="width: 500px;    ">
        <label>txt_b路径:</label>
        <span>${music.txt_b!}</span>
    </div>

            </div>
        </div>
    <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
</section>
</@layout>