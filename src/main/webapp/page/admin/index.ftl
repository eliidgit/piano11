<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="index">
<section class="content-header">
    <h1>
        首页
        <small>概览</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active">概览</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-6">
            <@shiro.hasPermission name="index:topic">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">学生总数</h3>
                        <small>共${studentCount!0 }条</small>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered">
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="index:mission">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">家长总数</h3>
                        <small>共${studentCount!0 }条</small>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>

                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </@shiro.hasPermission>
        </div>
        <div class="col-md-6">
            <@shiro.hasPermission name="index:user">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">学校总数</h3>
                        <small>共${schoolCount!0 }条</small>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>

                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="index:reply">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">教师总数</h3>
                        <small>共${teacherCount!0 }条</small>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered">
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </@shiro.hasPermission>
        </div>
    </div>
</section>
</@layout>
