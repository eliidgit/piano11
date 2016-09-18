<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        视频添加
        <small>添加</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/video"><i class="fa fa-tag"></i> 视频</a></li>
        <li class="active">添加</li>
    </ol>

    <!-- Bootstrap styles -->
<#--<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">-->
    <!-- Generic page styles -->
    <link rel="stylesheet" href="/static/jQuery-File-Upload-9.12.5/css/style.css">
    <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" href="/static/jQuery-File-Upload-9.12.5/css/jquery.fileupload.css">


</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">创建视频</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="add">
            <div class="box-body">


                <input type="hidden" id="course_part_id" name="video.course_part_id"/>
                <div class="form-group">
                    <label for="part" class="col-sm-2 control-label">所属栏目</label>
                    <div class="col-sm-4">
                        <input id="part_name" type="hidden" class="form-control"></input>
                        <button id="part" class="btn btn-primary" type="button">选择栏目</button>
                        <div class="modal" id="mymodal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span
                                                aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title">选择视频所关联的栏目</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>
                                        <#--模态弹出窗主体内容-->
                                        <div id="treeview-searchable" class="form-group"></div>

                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <#--<button type="button" class="btn btn-primary" data-dismiss="modal">保存</button>-->
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                    </div>
                </div>


                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">本资源在所在栏目中的位置</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="video.source_index"
                               placeholder="示例:10,20...">
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">视频名</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="video.name" placeholder="视频名">
                    </div>
                </div>

                <div class="form-group">
                    <label for="author" class="col-sm-2 control-label">视频作者</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="author" name="video.author_name" placeholder="作者姓名">
                    </div>
                </div>


                <div class="form-group">
                    <label for="avatar-upload" class="col-sm-2 control-label">作者照片</label>
                    <div class="col-sm-4">
                        <input id="avatar-upload" name="avatar-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="avatar_path" name="video.author_avatar" type="hidden"/>

                        <br>

                    </div>
                </div>


                <div class="form-group">
                    <label for="pic-upload" class="col-sm-2 control-label">封面图片</label>
                    <div class="col-sm-4">
                        <input id="pic-upload" name="pic-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="pic_path" name="video.pic_path" type="hidden"/>

                        <br>

                    </div>
                </div>


                <div class="form-group">
                    <label for="video-upload" class="col-sm-2 control-label">视频文件</label>
                    <div class="col-sm-4">
                    <#--<input id="video-upload" name="video-upload" class="file" type="file">-->
                        <input id="path" name="video.path" type="hidden"/>

                        <br>
                    <#---->
                        <div class="container">

                            <!-- The fileinput-button span is used to style the file input field as button -->
                            <span class="btn btn-success fileinput-button">
                                <i class="glyphicon glyphicon-plus"></i>
                                <span>选择文件</span>
                                <!-- The file input field used as target for the file upload widget -->
                                <input id="fileupload" type="file" name="video-upload" multiple>
                            </span>
                            <br>
                            <br>
                            <!-- The global progress bar -->
                            <div id="progress" class="progress">
                                <div class="progress-bar progress-bar-success"></div>
                            </div>
                            <!-- The container for the uploaded files -->
                            <div id="video-files" class="video-files"></div>

                        </div>


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

    <script src="/static/bootstrap-treeview-master/bootstrap-treeview.js"></script>

    <script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-transition.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>


    <!-- Jquery file upload -->
<#--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>-->
    <!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
    <script src="/static/jQuery-File-Upload-9.12.5/js/vendor/jquery.ui.widget.js"></script>
    <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
    <script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
    <!-- The Canvas to Blob plugin is included for image resizing functionality -->
    <script src="//blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
    <!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <!-- The basic File Upload plugin -->
    <script src="/static/jQuery-File-Upload-9.12.5/js/jquery.fileupload.js"></script>
    <!-- The File Upload processing plugin -->
    <script src="/static/jQuery-File-Upload-9.12.5/js/jquery.fileupload-process.js"></script>

    <!-- The File Upload video preview plugin -->
    <script src="/static/jQuery-File-Upload-9.12.5/js/jquery.fileupload-video.js"></script>
    <!-- The File Upload validation plugin -->
    <script src="/static/jQuery-File-Upload-9.12.5/js/jquery.fileupload-validate.js"></script>
    <script>

        $('#myModal').on('hide.bs.modal', function () {
            alert('嘿，我听说您喜欢模态框...');
        });

        //栏目tree-view
        $("#part").click(function () {
            //ajax请求数据，填充treeview
            $.ajax({
                url: "${baseUrl!}/admin/video/treeViewData",
                async: true,
                cache: false,
                type: 'post',
                dataType: "json",
                data: {},
                success: function (data) {
                    if (data.code == '200') {
                        $('#treeview-searchable').treeview({
                            data: data.detail,
                            levels: 1,
                            enableLinks: false,
                            showTags: true,
                            onNodeSelected: function (event, data) {
                                part_id = data.href;
                                if (part_id == -1)
                                    alert("此栏目不可关联资源，请重新选择")
                                else {
                                    $("#course_part_id").val(data.href);
                                    //显示在界面上
                                    $("#part_name").val(data.text);
                                    $("#part_name").attr("type", "text").attr("readonly", "readonly");

                                }
                            }
                        });
                        $("#mymodal").modal("toggle");
                    } else {
                        alert("树形菜单获取失败，原因是" + data.description);

                    }
                }
            });


        });


        //视频封面
        initFileInputPic("pic-upload", "/video/uploadPic", "pic-upload");
        //作者头像
        initFileInputPic("avatar-upload", "/video/uploadPic", "avatar-upload");

        //initFileInput("video-upload", "/video/upload");

        $("#avatar-upload").on('fileuploaded', function (event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#avatar_path").val(data);
            }

        });


        $("#pic-upload").on('fileuploaded', function (event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#pic_path").val(data);
            }

        });


        //        $("#video-upload").on('fileuploaded', function (event, data, previewId, index) {
        //
        //
        //            var data = data.response.detail;
        //            if (data == undefined) {
        //                toastr.error('文件格式类型不正确');
        //                return;
        //            } else {
        //                $("#path").val(data);
        //            }
        //
        //        });

        //初始化fileinput控件（第一次初始化） 视频
        function initFileInput(ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl, //上传的地址
                allowedFileExtensions: ['mp4'],//接收的文件后缀
                showUpload: true, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                maxFileSize: 10240000,
                allowedFileTypes: ["video"],
                uploadAsync: true

            });
        }

        //初始化fileinput控件（第一次初始化） 图片
        function initFileInputPic(ctrlName, uploadUrl, picName) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl + "?pic_name=" + picName, //上传的地址
                allowedFileExtensions: ['jpg', 'png'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }
        var uploadButton = $("<button id='video-upload-button'/>")
                .addClass('btn btn-primary')
                .prop('disabled', true)
                .text('Processing...')
                .on('click', function () {
                    var $this = $(this);
                    data = $this.data();
                    data.submit();
                    this.remove();
                    return false;
                });

        $('#fileupload').fileupload({
            url: '/video/upload',
            autoUpload: false,
            previewMaxWidth: 100,
            previewMaxHeight: 100,
            previewCrop: true,
            acceptFileTypes: /(\.|\/)(mp4)$/i,
            dataType: 'json',
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .progress-bar').css(
                        'width',
                        progress + '%'
                );
            }
        }).on('fileuploadadd', function (e, data) {
            data.context = $('<div/>').appendTo('#video-files');
            $.each(data.files, function (index, file) {
                var node = $('<p/>')
                        .append($('<span/>').text(file.name));
                if (!index) {
                    node
                            .append('<br>')
                            .append(uploadButton.clone(true).data(data));
                }
                node.appendTo(data.context);
            });
        }).on('fileuploadprocessalways', function (e, data) {
            var index = data.index,
                    file = data.files[index],
                    node = $(data.context.children()[index]);
            if (file.preview) {
                node
                        .prepend('<br>')
                        .prepend(file.preview);
            }
            if (file.error) {
                node
                        .append('<br>')
                        .append($('<span class="text-danger"/>').text(file.error));
            }
            if (index + 1 === data.files.length) {
                data.context.find('#video-upload-button')
                        .text('上传')
                        .prop('disabled', !!data.files.error);
            }
        }).on('fileuploaddone', function (e, data) {
            $("#path").val(data.result.detail);
            alert("上传成功");
        }).on('fileuploadfail', function (e, data) {
            alert("上传失败");
        }).prop('disabled', !$.support.fileInput)
                .parent().addClass($.support.fileInput ? undefined : 'disabled');


    </script>

</section>
</@layout>