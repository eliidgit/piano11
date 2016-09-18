<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="school">
<section class="content-header">
    <h1>
        添加系统通知
        <small>添加</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/notify"><i class="fa fa-tag"></i> 系统管理</a></li>
        <li class="active">添加</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">添加通知</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="/admin/notify/add" onsubmit="return submit1()" >
            <div class="box-body">

                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">消息通知</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="message" name="notification.message" placeholder="学消息通知内容">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">学校</label>
                    <div class="col-sm-4">
                         <select name="notification.school_id" class="form-control" id="school"  >
                         	<option value="0">全部</option>
                         	<#list schools! as list>
                         		<option value="${list.id! }">${list.name!}</option>
                         	</#list>
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
    
    	function submit1(){
    		if($("[name='notification.message']").val()==null||$("[name='notification.message']").val()==""){
    			alert("名称不能为空")
    			return false;
    		}
    		return true;
    	}

    </script>

</section>
</@layout>