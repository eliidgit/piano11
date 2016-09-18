<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="coursepart">
<section class="content-header">
    <h1>
        课程小节(项目)修改
        <small>修改</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/coursepart"><i class="fa fa-tag"></i> 课程小节(项目)</a></li>
        <li class="active">修改</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">修改课程小节(项目)</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="edit" onsubmit="checkParams()">
            <div class="box-body">
                <input type="hidden" name="coursepart.id" value="${coursepart.id!}"/>


                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">父级栏目</label>
                    <div class="col-sm-4">
                        <span>${parent_name!}</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">课程小节(项目)名</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="coursepart.name" value="${coursepart.name!}" placeholder="课程小节(项目)名">
                    </div>
                </div>



            <#--添加一级栏目的时候才会选择课程-->
                <#if parent_id =0>
                    <div class="form-group">
                        <label for="course" class="col-sm-2 control-label">所在课程</label>
                        <div class="col-sm-4">
                            <select id="course" class="form-control" name="coursepart.course_id" onchange="ajaxParts(this)">
                                <option value="-1">请选择</option>
                                <#if courseList??>
                                    <#list courseList as course>
                                        <option <#if course.id = coursepart.course_id > selected="selected" </#if> value="${course.id!}" >${course.name!}</option>
                                    </#list>
                                </#if>
                            </select>
                        </div>
                    </div>

                    <!-- 二级联动 -->
                    <div class="form-group">
                        <label for="part" class="col-sm-2 control-label">该小节(项目)在其所在课程中的顺序</label>
                        <div class="col-sm-4">
                            <select id="part" class="form-control" name="coursepart.part_index">
                                <#if partsIndexList??>
                                    <#list partsIndexList as partIndex>
                                        <option <#if partIndex = coursepart.part_index > selected="selected" </#if> value="${partIndex!}" >第${partIndex!}节</option>
                                    </#list>
                                </#if>
                            </select>
                        </div>
                    </div>
                <#else>
                    <!-- 二级联动 -->
                    <div class="form-group">
                        <label for="part" class="col-sm-2 control-label">该栏目在父级栏目中的顺序</label>
                        <div class="col-sm-4">
                            <input id="part" type="text" class="form-control"  name="coursepart.part_index" value="${coursepart.part_index!}"
                                   placeholder="栏目顺序，示例：10,20..." />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="resource" class="col-sm-2 control-label">该栏目类型</label>
                        <div class="col-sm-4">
                            <select id="resource" class="form-control" name="coursepart.type">
                                <option <#if coursepart.type = '1'>selected="selected"</#if> value="1">课时</option>
                                <option <#if coursepart.type = '2'>selected="selected"</#if> value="2">普通子栏目</option>
                                <option <#if coursepart.type = '6'>selected="selected"</#if> value="5">作业子栏目</option>
                                <option <#if coursepart.type = '3'>selected="selected"</#if> value="3">视频资源</option>
                                <option <#if coursepart.type = '4'>selected="selected"</#if> value="4">音乐资源</option>
                                <option <#if coursepart.type = '5'>selected="selected"</#if> value="5">作业资源</option>

                            </select>
                        </div>
                    </div>


                </#if>






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

<script>
    function checkParams() {
        //校验字段
        if (!checkNull("name", "课程名")) {
            return false;
        }
        if ($("#course").val() == -1) {
            alert("请选择课程");
            return false;
        }
        if ($("#part").val() == -1) {
            alert("请选择小节（项目）在其所在课程中的顺序");
            return false;
        }
        return true;
    }

    function ajaxParts(obj) {
        //已经准备好选中数组
        var courseId = obj.value;
        if (courseId == -1) {
            alert("请正确选择课程");
        } else {
            $.ajax({
                url: "/admin/coursepart/getParts",    //请求的url地址
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {"course_id": courseId},    //参数值
                type: "post",   //请求方式

                success: function (data) {
                    //请求成功时处理
                    if (data.code == '200') {
                        //location.reload();
                        //在这里处理
                        var arr = data.detail;
                        $("#part").html("<option value='-1' >请选择</option>");
                        for (var i = 0; i < arr.length; i++) {
                            var option = "<option value='" + arr[i] + "'>第" + arr[i] + "小节</option>"
                            $("#part").append(option);
                        }
                    } else {
                        alert(data.description);
                    }

                }
            });
        }

    }

</script>
</@layout>