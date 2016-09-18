<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        欢迎语详情页
        <small>详情</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/greetings"><i class="fa fa-tag"></i> 欢迎语</a></li>
        <li class="active">详情</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">欢迎语详情</h3>
        </div>


        <div class="box-body">
            <div style="margin-left: 300px;">
                <div class="box box-default" style="width: 500px;">
                    <label>欢迎语内容:</label>
                    <span>${greetings.content!}</span>
                </div>



                <div class="box box-default" style="width: 500px;">
                    <label>欢迎语客户端:</label>
                    <span>
                     <#if greetings.client_type??>
                        <#if  greetings.client_type = "1">
                            学生
                        <#elseif   greetings.client_type = "2">
                            教师
                        <#else >
                            空<font color="red">错误信息</font>
                        </#if>
                     </#if>
                    </span>
                </div>


                <div class="box box-default" style="width: 500px;">
                    <label>欢迎语时间段:</label>
                    <span>
                         <#if greetings.client_type??>
                        <#if  greetings.type = "1">
                            通用
                        <#elseif  greetings.type = "2">
                            早上
                        <#elseif  greetings.type = "3">
                            下午
                        <#elseif  greetings.type = "4">
                            晚上
                        <#elseif  greetings.type = "5">
                            午夜
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