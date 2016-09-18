<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="course">
<section class="content-header">
    <h1>
        课程修改
        <small>修改</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/course"><i class="fa fa-tag"></i> 课程</a></li>
        <li class="active">修改</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">创建课程</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="edit">
            <div class="box-body">

                <input type="hidden" name="course.id" value="${course.id!}"/>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">课程名</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="course.name" value="${course.name}"
                               placeholder="课程名">
                    </div>
                </div>

                <div class="form-group">
                    <label for="level" class="col-sm-2 control-label">难度</label>
                    <div class="col-sm-4">
                        <select id="level" class="form-control" name="course.level">
                            <option  <#if course.level = 1> selected="selected" </#if> value="1">小学</option>
                            <option <#if course.level = 2> selected="selected" </#if> value="2">幼儿园</option>
                            <option <#if course.level = 3> selected="selected" </#if> value="3">社会培训</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <label for="part_number" class="col-sm-2 control-label">课程项目数</label>
                    <div class="col-sm-4">
                        <input type="text" id="part_number" class="form-control" name="course.part_number" value="${course.part_number}"
                               placeholder="课程项目数">
                    </div>
                </div>


                <div class="form-group">
                    <label for="comments" class="col-sm-2 control-label">课程评价</label>
                    <div class="col-sm-4">
                        <textarea class="form-control" id="comments" rows="3" name="course.comments" >
                            ${course.comments!}
                        </textarea>
                    </div>
                </div>

            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <button type="submit" class="btn btn-primary">提交</button>
                <button type="reset" class="btn btn-default">重置</button>
                <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
            </div>
        </form>
    </div>
    <script>
    </script>

</section>
</@layout>