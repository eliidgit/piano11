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

    </div>
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

        $(function () {
            var url = '/video/upload';
            $('#fileupload').fileupload({
                url: url,
                acceptFileTypes: /(\.|\/)(mp4)$/i,
                dataType: 'json',
                progressall: function (e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    $('#progress .progress-bar').css(
                            'width',
                            progress + '%'
                    );
                }
            }).on('fileuploaddone', function (e, data) {
                alert(data.result.detail);
            }).prop('disabled', !$.support.fileInput)
                        .parent().addClass($.support.fileInput ? undefined : 'disabled');
            });
    </script>

</section>
</@layout>