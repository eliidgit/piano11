<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="notify">
<section class="content-header">
    <h1>
        通知管理
        <small>列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/notify"><i class="fa fa-tag"></i> 通知管理</a></li>
        <li class="active">列表</li>
    </ol>
</section>
<section class="content">
    <div class="box">
        <div class="box-header">
            <form class="form-inline" method="post" action="${baseUrl!}/admin/song">
                <div class="form-group">
                                     分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类:
                    <select name="tag" class="form-control" id="school"  onchange="searchNotify(this)">
                    	<option <#if schoolId??><#if schoolId==-1>selected="selected</#if></#if>  value="-1">[--全部--]</option>
                    	<option <#if schoolId??><#if schoolId==0>selected="selected</#if></#if> value="0">系统通知</option>
                    </select>
                </div>
            </form>
        </div>


        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table class="table table-hover table-bordered">
                    <thead>
                    <th>id</th>
                    <th>通知消息内容</th>
                    <th>通知类型</th>
                    <th>发表者</th>
                    <th>是否已读</th>
                    <th>创建是时间</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <#list page.getList() as list>
                        <tr>
                            <td>${list.id!}</td>
                            <td>${list.message!}</td>
                            <td><#if list.type??><#if list.type="1">系统通知<#elseif list.type="2">示范课<#elseif list.type="2">课件<#else>提交钢琴保修</#if></#if></td>
                            <td>${list.author!}</td>
                            <td><#if list.is_read??><#if list.is_read == "1">未读<#else>已读</#if></#if></td>
                            <td>${list.create_time!?string('yyyy-MM-dd')}</td>
                            <td>
                                    <a href="${baseUrl!}/admin/song/editSong?songId=${list.id!}"><span
                                            class="glyphicon glyphicon-edit"></span></a>
                                    <a href="javascript:del('${list.id!}')"><span
                                            class="glyphicon glyphicon-trash"></span></a>
                                    <#--<a href="${baseUrl!}/admin/song/detail?id=${list.id!}"><span
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
                            	<@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/notify/index" urlParas="&schoolId=${schoolId! }" />
                            <#else>
                            	<@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/admin/notify/index" urlParas="" />
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="box-footer">
                <a href="${baseUrl!}/admin/notify/add" class="btn btn-raised  btn-default pull-right">添加</a>
            </div>
    </div>
    <script>
    $(function(){
	    $.ajax({
	        url: "${baseUrl!}/admin/school/getSchool",
	        async: false,
	        cache: false,
	        type: 'post',
	        dataType: "json",
	        success: function (data) {
	            if (data.code == '200') {
	            	var text="";
	            	for(var i=0;i<data.detail.length;i++){
	            		var obj = data.detail[i];
	            		text+='<option '+(obj.id=='${schoolId!}'?'selected="selected"':'')+' value='+obj.id+'>'+obj.name+'</option>';
	            	}
	            	$("#school").append(text);
	            }
	        }
	    });
    });
	function searchNotify(obj){
		location.href="/admin/notify?schoolId="+$(obj).val();
	}

        function del(id) {

            if (confirm("确定删除吗?")) {
                $.ajax({
                    url: "${baseUrl!}/admin/notify/del",
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
