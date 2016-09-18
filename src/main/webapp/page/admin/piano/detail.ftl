<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="school">
<section class="content-header">
    <h1>
        添加设备维修状况
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/piano/mal"><i class="fa fa-tag"></i>钢琴故障</a></li>
        <li class="active">添加</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        
        <!-- form start -->
        <form id="form1" role="form" class="form-horizontal" method="post" action="/admin/piano/detail" onsubmit="return submit1()" >
             	<#if detail?? && detail?size gt 0>
             	<div class="box-header with-border">
		            <h3 class="box-title">历史维修状况</h3>
		        </div>
             	<#list detail! as list>
             	<div class="form-group">
                    <label for="name" class="col-sm-2 control-label">${list.create_time! }</label>
                    <div class="col-sm-4">
                        <input type="text" style="border:none;" readonly="readonly" class="form-control" id="message" value="${list.content! }" >
                    </div>
                </div>
                </#list>
                <br />
                <br />
                </#if>
                <br />
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">钢琴编号ID</label>
                    <div class="col-sm-4">
                        <input type="text" readonly="readonly" class="form-control" id="message" value="${piano_id!}" >
                        <input type="hidden" name="pianoMalfunctionDetail.mal_id" value="${id!}"/>
                        <input type="hidden" name="pid" value="${pid!}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">维修状况</label>
                    <div class="col-sm-4">
                         <input type="text" name="pianoMalfunctionDetail.content" class="form-control" id="content" value="" placeholder="维修状况概要">
                    </div>
                </div>
                <br>
            </div>

            <div class="box-footer">
            <input type="hidden" name="type" id="type1" value=""/>
                <button type="button" id="z" class="btn btn-primary">正在维修</button>
                <button type="button" id="w" class="btn btn-default">维修完成</button>
                <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
            </div>
        </form>
    </div>
    <script>
    	$("#z").click(function(){
    		$("#type1").val("1");
    		$("#form1").submit();
    	});
    	$("#w").click(function(){
    		$("#type1").val("2");
    		$("#form1").submit();
    	});
    	function submit1(){
    		if($("#content").val()==null||$("#content").val()==""){
    			alert("维修状况不能为空不能为空")
    			return false;
    		}
    		return true;
    	}

    </script>

</section>
</@layout>