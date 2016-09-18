<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        示范课编辑
        <small>编辑</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/demolesson"><i class="fa fa-tag"></i> 示范课</a></li>
        <li class="active">编辑</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">编辑示范课</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="edit">
            <div class="box-body">
                <input type="hidden" name="demolesson.id" value="${demolesson.id!}">
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">课程名</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="demolesson.name" value="${demolesson.name!}" placeholder="课程名">
                    </div>
                </div>


                <div class="form-group">
                    <label for="type" class="col-sm-2 control-label">类型</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="type" name="demolesson.type" value="${demolesson.type!}" placeholder="课程类型">
                    </div>
                </div>

                <div class="form-group">
                    <label for="author" class="col-sm-2 control-label">课程作者</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="author" name="demolesson.author" value="${demolesson.author!}" placeholder="课程作者">
                    </div>
                </div>


                <div class="form-group">
                    <label for="video" class="col-sm-2 control-label">视频文件</label>
                    <div class="col-sm-4">
                        <input id="video-upload" name="video-upload" class="file" type="file" multiple data-min-file-count="1">
                        <input id="path" name="demolesson.path" class="file" value="${demolesson.path!}" type="hidden" />

                        <br>

                    </div>
                </div>



            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <button type="submit" class="btn btn-raised btn-info pull-left">保存</button>
                <input type="button"  class="btn btn-primary" name="return" onclick="javascript:history.back(-1);" value="返回">
            </div>
        </form>
    </div>
    <script>




        initFileInput("video-upload","/demolesson/upload");

        $("#video-upload").on('fileuploaded', function(event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            }else {
                $("#path").val(data);
            }

        });

        //初始化fileinput控件（第一次初始化）
        function initFileInput(ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl, //上传的地址
                allowedFileExtensions : ['mp4'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }






    </script>

</section>
</@layout>