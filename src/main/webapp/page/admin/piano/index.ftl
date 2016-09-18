<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="piano">
<section class="content-header">
    <h1>
        钢琴管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/piano"><i class="fa fa-tag"></i> 钢琴管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="post" action="${baseUrl!}/admin/song">
                <div class="form-group">
                                     分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类:
                    <select name="tag" class="form-control" id="school"  onchange="search(this)">
                    	<option <#if schoolId??><#if schoolId==-1>selected="selected</#if></#if>  value="-1">[--全部--]</option>
                    	<#list schools! as list>
                    		<option <#if schoolId??><#if schoolId==list.id>selected="selected</#if></#if> value="${list.id! }">${list.name! }</option>
                    	</#list>
                    </select>
                </div>
            </form>
        </div>


        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table class="table table-hover table-bordered">
                    <thead>
                    <th>id</th>
                    <th>钢琴编号</th>
                    <th>状态</th>
                    <th>使用时间</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#list page.getList() as list>
                        <tr>
                            <td>${list.id!}</td>
                            <td>${list.piano_id!}</td>
                            <td><#if list.status??><#if list.status=="1">正常<#else>报修中</#if></#if></td>
                            <td>${list.create_time!?string("yyyy-MM-dd")}</td>
                            <td>
                                   <#-- <a href="${baseUrl!}/admin/piano/edit?songId=${list.id!}"><span
                                            class="glyphicon glyphicon-edit"></span></a>-->
                                    <a href="javascript:del('${list.id!}')"><span
                                            class="glyphicon glyphicon-trash"></span></a>
                                    <#--<a href="${baseUrl!}/admin/piano/detail?id=${list.id!}"><span
                                            class="glyphicon glyphicon-eye-open"></span></a>-->

                            </td>
                        </tr>
                        </#list>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-5">
                        <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">
                            总课程数：${page.getTotalRow()}</div>
                    </div>
                    <div class="col-sm-7">
                        <div class="dataTables_paginate paging_simple_numbers">
                            <#include "/page/admin/common/_paginate.ftl"/>
                          	<#if schoolId?? || schoolId!=-1>
                            	<@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/piano/index" urlParas="&schoolId=${schoolId! }" />
                            <#else>
                            	<@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/piano/index" urlParas="" />
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
	function search(obj){
		location.href="/admin/piano?schoolId="+$(obj).val();
	}
        function del(id) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/piano/del",
                    async: false,
                    cache: false,
                    type: 'post',
                    dataType: "json",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        if (data.code == '200') {
                        	alert("成功");
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
