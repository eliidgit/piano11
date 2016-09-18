<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="tone">
<section class="content-header">
    <h1>
        音色修改
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
        <form role="form" class="form-horizontal" method="post" action="edit">
            <div class="box-body">

                <input type="hidden" name="tone.id" value="${tone.id!}"/>

                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">音色内容</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="tone_id" name="tone.tone_id" value="${(tone.tone_id)!}"
                               placeholder="音色ID">
                        <input type="text" class="form-control" id="name" name="tone.name" value="${(tone.name)!}"
                               placeholder="音色中文名">
                        <input type="text" class="form-control" id="english_name" name="tone.english_name" value="${(tone.english_name)!}"
                               placeholder="音色英文名">

                    </div>
                </div>
                <div class="form-group">
                    <label for="level" class="col-sm-2 control-label">音色属性</label>
                    <div class="col-sm-4">
                        <select id="parentId" name="tone.parent_id"  class="form-control" >
                            <option value="" >-请选择音色属性名-</option>
                            <option value="0">根音色</option>
                            <#if parentTones??>
                                <#list parentTones as list>
                                    <option <#if (tone.parent_id)??><#if tone.parent_id = list.id> selected="selected" </#if></#if> value="${list.id!}">${list.name!}</option>
                                </#list>
                            </#if>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="level" class="col-sm-2 control-label">欢迎客户端</label>
                    <div class="col-sm-4">
                        <select id="level" class="form-control" name="tone.client_type">

                            <option   <#if tone.client_type??><#if tone.client_type = ""> selected="selected" </#if></#if> value="">默认</option>
                            <option   <#if tone.client_type??><#if tone.client_type = "1"> selected="selected" </#if></#if> value="1">学生</option>
                            <option  <#if tone.client_type??><#if tone.client_type = "2"> selected="selected" </#if></#if> value="2">教师</option>

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

