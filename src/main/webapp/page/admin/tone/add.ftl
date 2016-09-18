<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="tone">
<section class="content-header">
    <h1>
        音色xx
        <small>修改</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/tone"><i class="fa fa-tag"></i> 音色</a></li>
        <li class="active">修改</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">创建音色</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="add" onsubmit="return checkParams();">
            <div class="box-body">

                <input type="hidden" name="tone.id" id="id"/>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">音色内容</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="tone_id" name="tone.tone_id"
                               placeholder="音色ID">
                        <input type="text" class="form-control" id="name" name="tone.name"
                               placeholder="音色中文名">
                        <input type="text" class="form-control" id="english_name" name="tone.english_name"
                               placeholder="音色英文名">

                    </div>
                </div>
                <div class="form-group">
                    <label for="level" class="col-sm-2 control-label">音色属性</label>
                    <div class="col-sm-4">

                        <select id="parentId" class="form-control" name="tone.parent_id" onchange="ajaxParts(this)">
                            <option value="0">默认[根音色]</option>
                            <#if parentTones??>
                                <#list parentTones as tone>
                                    <option value="${tone.id!}">${tone.name!}</option>
                                </#list>
                            </#if>
                        </select>

                    </div>
                </div>
                <div class="form-group">
                    <label for="level" class="col-sm-2 control-label">欢迎客户端</label>
                    <div class="col-sm-4">
                        <select id="client_type" class="form-control" name="tone.client_type">
                            <option value="">默认</option>
                            <option value="1">学生</option>
                            <option value="2">教师</option>

                        </select>
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

<script>


    function checkParams() {
        //校验字段
        if (!checkNull("name", "中文名")) {
            return false;
        }

        if (!checkNull("english_name", "英文名")) {
            return false;
        }
        if(document.getElementById("parentId").value="0")){
        if (checkNull("tone_id", "顶级ID不能手动设置，请留空")) {

            return false;

        }
    }
    else{
        alert("--顶级ID不能手动设置，请留空--");
    }

    return true;
    }

</script>