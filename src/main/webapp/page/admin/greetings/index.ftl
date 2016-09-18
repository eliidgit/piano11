<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="greetings">


<section class="content-header">
    <h1>
        欢迎语管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/greetings"><i class="fa fa-tag"></i> 欢迎语管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">

        <div class="box-header">
            <form class="form-inline" method="post" action="${baseUrl!}/admin/greetings">
                <div class="form-group">
                    <input type="text" class="form-control" name="content" value="${content!}" placeholder="欢迎语名"/>

                </div>
                <div class="form-group">
                    <select class="form-control"  name="client_type">
                        <option value="" selected="selected">---请选择户端---</option>
                        <option <#if client_type??><#if client_type = "1"> selected="selected" </#if></#if> value="1">---学生端---</option>
                        <option <#if client_type??><#if client_type = "2"> selected="selected" </#if></#if> value="2">---教师端---</option>

                    </select>
                </div>

                <div class="form-group">
                    <select class="form-control"  name="type" >
                       <option value="" selected="selected">---请选择时间段---</option>

                        <option  <#if client_type??><#if type = "1"> selected="selected" </#if></#if> value="1">---通用---</option>
                        <option <#if client_type??><#if  type = "2"> selected="selected" </#if></#if> value="2">---上午---</option>
                        <option  <#if client_type??><#if type = "3"> selected="selected" </#if></#if> value="3">---下午---</option>
                        <option <#if client_type??><#if  type = "4"> selected="selected" </#if></#if> value="4">---晚上---</option>
                        <option  <#if client_type??><#if type = "5"> selected="selected" </#if></#if> value="5">---凌晨---</option>

                    </select>
                </div>
                <button type="submit" class="btn btn-raised btn-default ">搜索</button>
            </form>
        </div>



        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table class="table table-hover table-bordered">
                    <thead>

                    <th>id</th>
                    <th>欢迎语名</th>
                    <th>欢迎语客户端</th>
                    <th>欢迎语时间段</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#if page??>
                            <#list page.getList() as greetings>
                            <tr>
                                <td>${greetings.id!}</td>
                                <td>${greetings.content!}</td>
                                <td>
                                    <#if greetings.client_type = "1">
                                        学生端
                                    <#elseif greetings.client_type = "2">
                                         教师端
                                    <#else >
                                        空<font color="red">错误信息</font>
                                    </#if>
                                </td>
                                <td>
                                    <#if greetings.type = "1">
                                        通用
                                    <#elseif greetings.type = "2">
                                        上午
                                    <#elseif greetings.type = "3">
                                        下午
                                    <#elseif greetings.type = "4">
                                        晚上
                                    <#elseif greetings.type = "5">
                                        凌晨
                                    <#else >
                                        空<font color="red">错误信息</font>
                                    </#if>

                                </td>
                                <td>

                                        <a href="${baseUrl!}/admin/greetings/edit/${greetings.id!}"><span
                                                class="glyphicon glyphicon-edit"></span></a>


                                        <a href="javascript:delete_greetings(${greetings.id!},${greetings.client_type!})"><span
                                                class="glyphicon glyphicon-trash"></span></a>

                                        <a href="${baseUrl!}/admin/greetings/info/${greetings.id!}"><span
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
                            总欢迎语数：
                            <#if page??>
                            ${page.getTotalRow()}
                            </#if>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <div class="dataTables_paginate paging_simple_numbers">
                            <#include "/page/admin/common/_paginate.ftl"/>
                            <#if page??>
                            <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/greetings/index" urlParas="&client_type=${client_type!}&type=${type!} "/>
                        </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <div class="box-footer">
                <a href="${baseUrl!}/admin/greetings/add" class="btn btn-raised  btn-default pull-right">添加</a>
            </div>


    </div>
    <script>
        function delete_greetings(greetings_id,greetings_type) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/greetings/delete",
                    async: true,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        greetings_id: greetings_id,
                        greetings_type:greetings_type
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
