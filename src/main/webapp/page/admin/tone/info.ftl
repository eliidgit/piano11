<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        音色详情页
        <small>详情</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/tone"><i class="fa fa-tag"></i> 音色</a></li>
        <li class="active">详情</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">音色详情</h3>
        </div>


        <div class="box-body">
            <div style="margin-left: 300px;">

                <input type="hidden" name="tone.id" id="id"/>
                <div class="box box-default" style="width: 500px;">
                    <label>音色名:</label>
                    <span>${tone.name!}</span>
                </div>
                <div class="box box-default" style="width: 500px;">
                    <label>音色英文名:</label>
                    <span>${tone.english_name!}</span>
                </div>

                <div class="box box-default" style="width: 500px;">
                     <label>音色属性:</label>
                    <span>${parentName!}
                    </span>
                </div>

                <div class="box box-default" style="width: 500px;">
                    <label>音色ID:</label>
                    <span>${tone.tone_id!}</span>
                </div>

                <div class="box box-default" style="width: 500px;">
                    <label>音色客户端:</label>
                    <span>
                     <#if tone.client_type??>
                        <#if  tone.client_type = "1">
                            学生
                        <#elseif   tone.client_type = "2">
                            教师
                        <#else >
                            空<font color="red">错误信息</font>
                        </#if>
                     </#if>
                    </span>
                </div>




            </div>
        </div>
        <!-- /.box-body -->
        <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
    </div>


</section>
</@layout>