<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        年级课程添加
        <small>添加</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/grade"><i class="fa fa-tag"></i> 年级课程</a></li>
        <li class="active">添加</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">创建年级课程</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="/admin/grade/edit">
            <div class="box-body">


                <div class="form-group">
                    <label for="grade" class="col-sm-2 control-label">年级</label>
                    <div class="col-sm-4">
                            <#if grade??>
                                <input type="hidden" name="grade.id" value="${grade.id!}" />
                                <input type="text" class="form-control" readonly="readonly" name="grade.id" value="${grade.name!}" />
                            </#if>
                    </div>
                </div>


                <div class="form-group">
                    <label for="course" class="col-sm-2 control-label">课程</label>
                    <div class="col-sm-4">
                        <select id="course" class="form-control" name="grade.course_id">
                            <option value="-1">请选择</option>
                            <#if courseList??>
                                <#list courseList as course>
                                    <option value="${course.id!}">${course.name!}</option>
                                </#list>
                            </#if>
                        </select>
                    </div>
                </div>

            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <button id="form-submit" type="submit" class="btn btn-primary">提交</button>
                <button type="reset" class="btn btn-default">重置</button>
            </div>
        </form>
    </div>


    <script>

        $("form").submit(function () {
            //判断两个选择项
            if ($("#grade").val() == -1) {
                alert("请选择年级");
                return false;
            }
            if ($("#course").val() == -1) {
                alert("请选择课程");
                return false;
            }
            return true;
        });


    </script>

</section>
</@layout>