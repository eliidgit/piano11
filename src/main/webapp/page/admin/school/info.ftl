<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="school">
<section class="content-header">
    <h1>
        音乐详情页
        <small>详情</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/school"><i class="fa fa-tag"></i> 学校管理</a></li>
        <li class="active">详情</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">详情</h3>
        </div>


            <div class="box-body">
                <div style="margin-left: 300px;">
                    <div class="box box-default" style="width: 500px;">
                        <label>学校名称:</label>
                        <span>${school.name!}</span>
                    </div>
                    <div class="box box-default" style="width: 500px;">
                        <label>入驻时间:</label>
                        <span>${school.create_time!?string('yyyy-MM-dd')}</span>
                    </div>
                    <div class="box box-default" style="width: 500px;">
                        <label>有效期至:</label>
                        <span>${end_time!!?string('yyyy-MM-dd')}</span>
                    </div>
                    <div class="box box-default" style="width: 500px;">
                        <label>有效天数:</label>
                        <span>${day!}</span>
                    </div>

                </div>
            </div>
            <!-- /.box-body -->
        <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
    </div>

</section>
</@layout>