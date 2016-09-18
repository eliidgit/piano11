<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        视频详情
        <small>详情</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/video"><i class="fa fa-tag"></i> 视频</a></li>
        <li class="active">详情</li>
    </ol>
</section>
<section class="content">
    <div style="width: 560px; height: 320px; margin: 100px  auto 0;">
        <video src="${video_path!}" controls="controls"></video>
    </div>
    <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
</section>
</@layout>