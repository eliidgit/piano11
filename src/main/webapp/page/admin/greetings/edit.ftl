<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="greetings">
<section class="content-header">
    <h1>
        欢迎语修改
        <small>修改</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/greetings"><i class="fa fa-tag"></i> 欢迎语</a></li>
        <li class="active">修改</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">修改欢迎语</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="edit">
            <div class="box-body">

                <input type="hidden" name="greetings.id" value="${greetings.id!}"/>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">欢迎语内容</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="greetings.content" value="${(greetings.content)!}"
                               placeholder="欢迎语内容">
                    </div>
                </div>

                <div class="form-group">
                    <label for="level" class="col-sm-2 control-label">欢迎客户端</label>
                    <div class="col-sm-4">
                        <select id="level" class="form-control" name="greetings.client_type">

                            <option  <#if greetings.client_type = "1"> selected="selected" </#if> value="1">学生</option>
                            <option <#if greetings.client_type = "2"> selected="selected" </#if> value="2">教师</option>

                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <label for="level" class="col-sm-2 control-label">欢迎时间段</label>
                    <div class="col-sm-4">
                        <select id="level" class="form-control" name="greetings.type">
                            <option  <#if greetings.type = "1"> selected="selected" </#if> value="1">通用</option>
                            <option <#if greetings.type = "2"> selected="selected" </#if> value="2">上午</option>
                            <option  <#if greetings.type = "3"> selected="selected" </#if> value="3">下午</option>
                            <option <#if greetings.type = "4"> selected="selected" </#if> value="4">晚上</option>
                            <option  <#if greetings.type = "5"> selected="selected" </#if> value="5">凌晨</option>

                        </select>
                    </div>
                </div>



            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <button type="submit" class="btn btn-primary">提交</button>
                <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
            </div>
        </form>
    </div>
    <script>
    </script>

</section>
</@layout>