<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        示范课添加
        <small>添加</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/demolesson"><i class="fa fa-tag"></i> 示范课</a></li>
        <li class="active">添加</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">创建示范课</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="add">
            <div class="box-body">

                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">课程名</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="demolesson.name" placeholder="课程名">
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">难度</label>
                    <div class="col-sm-4">
                        <select id="type" class="form-control" name="demolesson.level">
                            <option value="1">一级难度</option>
                            <option value="2">二级难度</option>
                            <option value="3">三级难度</option>
                            <option value="4">四级难度</option>
                            <option value="5">五级难度</option>
                            <option value="6">六级难度</option>
                            <option value="7">七级难度</option>
                            <option value="8">八级难度</option>
                            <option value="9">九级难度</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <label for="type" class="col-sm-2 control-label">类型</label>
                    <div class="col-sm-4">
                        <select id="type" class="form-control" name="demolesson.type">
                            <option value="1">示范课</option>
                            <option value="2">曲目</option>
                            <option value="3">类型3</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="author" class="col-sm-2 control-label">课程作者</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="author" name="demolesson.author" placeholder="课程作者">
                    </div>
                </div>


                <div class="form-group">
                    <label for="konw_point" class="col-sm-2 control-label">知识要点</label>
                    <div class="col-sm-4">

                        <textarea class="form-control" rows="3" name="demolesson.know_point"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label for="like_number" class="col-sm-2 control-label">点赞数</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="like_number" name="demolesson.like_number"
                               placeholder="点赞数">
                    </div>
                </div>

                <div class="form-group">
                    <label for="pic-upload" class="col-sm-2 control-label">封面图片</label>
                    <div class="col-sm-4">
                        <input id="pic-upload" name="pic-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="pic_path" name="demolesson.pic_path" type="hidden"/>

                        <br>

                    </div>
                </div>

                <div class="form-group">
                    <label for="video" class="col-sm-2 control-label">视频文件</label>
                    <div class="col-sm-4">
                        <input id="video-upload" name="video-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="path" name="demolesson.path" type="hidden"/>

                        <br>

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


        initFileInputPic("pic-upload", "/demolesson/uploadPic");
        initFileInput("video-upload", "/demolesson/upload");

        $("#pic-upload").on('fileuploaded', function (event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#pic_path").val(data);
            }

        });


        $("#video-upload").on('fileuploaded', function (event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#path").val(data);
            }

        });

        //初始化fileinput控件（第一次初始化）
        function initFileInput(ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl, //上传的地址
                allowedFileExtensions: ['mp4'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }

        //初始化fileinput控件（第一次初始化）
        function initFileInputPic(ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl, //上传的地址
                allowedFileExtensions: ['jpg', 'png'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }


    </script>

</section>
</@layout>