<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        栏目资源详情
        <small>详情</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/coursepart"><i class="fa fa-tag"></i> 栏目资源</a></li>
        <li class="active">详情</li>
    </ol>
</section>
<section class="content">
    <h3>视频:</h3>
    <#if (videoList?size>0) >
        <#list videoList as video>

            <#--midi-->
                <h5>在栏目中的顺序:${video.source_index!}</h5>
                <video src="${video.path!}" controls="controls"></video>

        </#list>
    <#else >
        <h3>暂无资源</h3>
    </#if>
    <h3>音乐:</h3>
    <#if (musicList?size>0) >
        <#list musicList as music>

            <#--midi-->
                <h5>在栏目中的顺序:${music.source_index!}</h5>

                <#--五线谱-->
                    <h6>OGG:</h6>
                    <img src="${music.stave_path!}" width="300" height="300"/>




                <#--OGG-->
                    <h6>OGG:</h6>
                    <video src="${music.ogg_path!}" controls="controls"></video>




                <#--midi-->
                    <h6>MIDI:</h6>
                    <a href="${music.midi_path!}">
                        点击此处来播放 Midi文件
                    </a>


                    <#--<video src="${music.midi_path!}" controls="controls"></video>-->



        </#list>
    <#else >
        <h3>暂无资源</h3>
    </#if>

    <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
</section>
</@layout>