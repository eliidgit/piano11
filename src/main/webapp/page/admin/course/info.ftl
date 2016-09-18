<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        课程详情页
        <small>详情</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/course"><i class="fa fa-tag"></i> 课程</a></li>
        <li class="active">详情</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">课程详情</h3>
        </div>


        <div class="box-body">
            <div style="margin-left: 300px;">
                <div class="box box-default" style="width: 500px;">
                    <label>课程名:</label>
                    <span>${course.name!}</span>
                </div>

                <div class="box box-default" style="width: 500px;">
                    <label>小节数:</label>
                    <span>${course.part_number!}</span>
                </div>


                <div class="box box-default" style="width: 500px;">
                    <label>课程阶段:</label>
                    <span>
                        <#if course.level = 1>
                            小学
                        <#elseif course.level = 2>
                            幼儿园
                        <#elseif course.level = 3>
                            社会培训
                        <#else >
                            空<font color="red">错误信息</font>
                        </#if>
                    </span>
                </div>


                <div class="box box-default" style="width: 500px;">
                    <label>课程评语:</label>
                    <span>${course.comments!}</span>
                </div>
            </div>
        </div>
        <!-- /.box-body -->
        <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
    </div>

</section>
</@layout>