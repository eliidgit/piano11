<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="tone">


<section class="content-header">
    <h1>
        音色管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/tone"><i class="fa fa-tag"></i> 音色管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">

        <div class="box-header">
            <form class="form-inline" method="post" action="${baseUrl!}/admin/tone">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="${name!}" placeholder="音色中文名"/>
                    <input type="text" class="form-control" name="english_name" value="${english_name!}" placeholder="音色英文名"/>
                </div>
                <div class="form-group">


                    <select id="parent_id" class="form-control" name="parent_id" ">
                               <option value="" selected="selected" >-请选择音色属性名-</option>

                               <option <#if parent_id??><#if parent_id = 0> selected="selected" </#if></#if> value="0">[根音色]</option>
                        <#if parentTones??>
                            <#list parentTones as tone>

                                <option <#if parent_id??><#if parent_id = tone.id> selected="selected" </#if></#if> value="${tone.id!}">${tone.name!}</option>
                            </#list>
                        </#if>
                    </select>


                </div>
                <div class="form-group">
                    <select class="form-control"  name="client_type">
                        <option value="">-请选择户端-</option>
                        <option <#if client_type??><#if client_type = "1"> selected="selected" </#if></#if> value="1">---学生端---</option>
                        <option <#if client_type??><#if client_type = "2"> selected="selected" </#if></#if> value="2">---教师端---</option>

                    </select>
                </div>
                <button type="submit" class="btn btn-raised btn-default ">搜索</button>
            </form>
        </div>



        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table class="table table-hover table-bordered">
                    <thead>

                    <th>音色序号</th>
                    <th>音色名</th>
                    <th>音色英文名</th>
                    <th>音色属性名</th>
                    <th>音色客户端</th>
                    <th>音色ID号</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#if page??>
                            <#list page.getList() as tone>
                            <tr>
                                <td>${tone.id!}</td>
                                <td>${tone.name!}</td>
                                <td>${tone.english_name!}</td>
                                <td>${tone.parent_id!}</td>
                                <td>
                                    <#if tone.client_type??>
                                        <#if  tone.client_type = "1">
                                            学生
                                        <#elseif   tone.client_type = "2">
                                            教师
                                        <#elseif   tone.client_type = "">
                                            ***
                                        <#else >
                                            空<font color="red">错误信息</font>
                                        </#if>
                                    </#if>
                                </td>
                                <td>${tone.tone_id!}</td>
                                <td>

                                        <a href="${baseUrl!}/admin/tone/edit/${tone.id!}"><span
                                                class="glyphicon glyphicon-edit"></span></a>


                                        <a href="javascript:delete_tone(${tone.id!},${tone.client_type!0})"><span
                                                class="glyphicon glyphicon-trash"></span></a>


                                        <a href="${baseUrl!}/admin/tone/info/${tone.id!}"><span
                                                class="glyphicon glyphicon-eye-open"></span></a>


                                </td>
                            </tr>
                            </#list>
                        </#if>

                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-5">
                        <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">
                            总音色数：
                            <#if page??>
                            ${page.getTotalRow()}
                            </#if>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <div class="dataTables_paginate paging_simple_numbers">
                            <#include "/page/admin/common/_paginate.ftl"/>
                            <#if page??>
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/tone/index" urlParas="&name=${name!}&english_name=${english_name!}&client_type=${client_type!}&parent_id=${parent_id!}"/>

                        </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <div class="box-footer">
                <a href="${baseUrl!}/admin/tone/add" class="btn btn-raised  btn-default pull-right">添加</a>
            </div>


    </div>
    <script>
/*
        $(function(){

            $.ajax({
                url: "${baseUrl!}/admin/tone/gettone",
                async: true,
                cache: true,
                type: 'post',
                dataType: "json",
                success: function (data) {
                    if (data.code == '200') {
                        var text="";

                      //  var default_='<option '+(obj.id==''?'selected="selected"':'')+' value=''>'+"请选择"+'</option>';

                        for(var i=0;i<data.detail.length;i++){
                            var obj = data.detail[i];
                            text+='<option '+(obj.id=='${parent_id!}'?'selected="selected"':'')+' value='+obj.id+'>'+obj.name+'</option>';

                        }
                       // default_+=text;
                        $("#parent_id").append(text);
                    }
                }
            });
        });*/

       /* function ajaxParts(obj) {
            var parent_id = obj.value;

                $.ajax({

                    url: "${baseUrl!}/admin/tone/gettone",
                    async: false,
                    cache: true,
                    type: 'post',
                    dataType: "json",
                    data: {"parent_id": parent_id},    //参数值
                    success: function (data) {
                        //请求成功时处理
                        if (data.code == '200') {
                            //location.reload();
                            //在这里处理

                            for(var i=0;i<data.detail.length;i++){

                                var option ='<option '+(obj.id='parent_id'?'selected="selected"':'')+' value='+obj.id+'>'+obj.name+'</option>';

                                $("#parent_id").append(option);
                            }
                        } else {
                            alert(data.description);
                        }

                    }
                });
            }*/





        function delete_tone(id,client_type) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/tone/delete",
                    async: false,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        id: id,
                        client_type:client_type
                    },
                    success: function (data) {
                        if (data.code == '200') {
                            alert("删除成功");
                            window.location.reload();
                        } else {
                            alert("删除失败，原因是" + data.description);

                        }
                    }
                });
            }
        }


    </script>
</section>
</@layout>
