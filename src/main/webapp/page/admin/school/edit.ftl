<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="school">
<section class="content-header">
    <h1>
        更新学校信息
        <small>添加</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/school"><i class="fa fa-tag"></i> 学校管理</a></li>
        <li class="active">更新</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">添加学校</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="/admin/school/edit" onsubmit="return submit1()" >
            <div class="box-body">
				<input type="hidden" name="school.id" value="${(school.id)! }"  />
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">学校名称</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="school.name" value="${(school.name)! }" placeholder="学校名称">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">有效期（天）</label>
                    <div class="col-sm-4">
                    	<input type="text" class="form-control" id="validity_day" name="school.validity_day" value="${day! }" placeholder="学校名称">
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
    		if($("#name").val()==null||$("#name").val()==""){
    			alert("名称不能为空")
    			return false;
    		}
    		if($("#validity_day").val()==null||$("#validity_day").val()==""){
    			alert("有效期不能为空")
    			return false;
    		}
    		if(isNaN($("#validity_day").val())||$("#validity_day").val()<0){
    			alert("有效期必须是数字,并大于0");
    			return false;
    		}
    		return true;
    	}

    </script>

</section>
</@layout>