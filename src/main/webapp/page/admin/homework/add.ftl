<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        作业添加
        <small>添加</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/homework"><i class="fa fa-tag"></i> 作业</a></li>
        <li class="active">添加</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">创建作业</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="add" onsubmit="return checkAdd()">
            <div class="box-body">


                <input type="hidden" id="course_part_id" name="homework.course_part_id"/>
                <div class="form-group">
                    <label for="part" class="col-sm-2 control-label">所属栏目</label>
                    <div class="col-sm-4">
                        <input id="part_name" type="hidden"></input>
                        <button id="part" class="btn btn-primary" type="button">选择栏目</button>
                        <div class="modal" id="mymodal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span
                                                aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title">选择作业所关联的栏目</h4>
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
                        <input type="text" class="form-control" id="name" name="homework.source_index"
                               placeholder="示例:10,20...">
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">作业名</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="homework.name" placeholder="作业名">
                    </div>
                </div>

                <div class="form-group">
                    <label for="comments" class="col-sm-2 control-label">作业内容</label>
                    <div class="col-sm-4">
                        <textarea class="form-control" id="content" rows="3" name="homework.content"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label for="pics-upload" class="col-sm-2 control-label">题目图片</label>
                    <div class="col-sm-4">
                        <input id="pics-upload" name="pics-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="pics_path" name="homework.pics_path" type="hidden"/>

                        <br>

                    </div>
                </div>


                <div class="form-group">
                    <label for="ogg-upload" class="col-sm-2 control-label">背景音乐</label>
                    <div class="col-sm-4">
                        <input id="ogg-upload" name="ogg-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="ogg_path" name="homework.ogg_path" type="hidden"/>

                        <br>

                    </div>
                </div>


                <div class="form-group">
                    <label for="answer" class="col-sm-2 control-label">问题答案</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="answer" name="homework.answer" placeholder="问题答案">
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">答案类型</label>
                    <div class="col-sm-4">
                        <label class="checkbox-inline">
                            <input type="radio" class="radioItem" name="homework.answer_type" checked="checked"
                                   id="inlineCheckbox1" value="1"> 文字
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" class="radioItem" name="homework.answer_type" id="inlineCheckbox2"
                                   value="2"> 图片
                        </label>
                    </div>
                </div>


                <div class="question_plain">
                    <div class="form-group">
                        <label for="answer_a" class="col-sm-2 control-label">答案A</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="answer_a" name="homework.answer_a"
                                   placeholder="答案A">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="answer_b" class="col-sm-2 control-label">答案B</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="answer_b" name="homework.answer_b"
                                   placeholder="答案B">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="answer_c" class="col-sm-2 control-label">答案C</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="answer_c" name="homework.answer_c"
                                   placeholder="答案C">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="answer_d" class="col-sm-2 control-label">答案D</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="answer_d" name="homework.answer_d"
                                   placeholder="答案D">
                        </div>
                    </div>

                </div>


                <div class="question_pic">

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
    <script>
        //验证表单
        function checkAdd() {
            var flag = true;
            flag = checkNull("answer","答案不能为空");
            return flag;
        }


        $(".radioItem").change(function () {
            var $selectedvalue = $("input[name='homework.answer_type']:checked").val();
            //alert($selectedvalue);
            if ($selectedvalue == 1) {
                var htmlStrings = jointPlainHtml('a') + jointPlainHtml('b') + jointPlainHtml('c') + jointPlainHtml('d');
                $('.question_pic').html("");
                $('.question_plain').html(htmlStrings);

            } else {
                var htmlStrings = jointPicHtml('a') + jointPicHtml('b') + jointPicHtml('c') + jointPicHtml('d');
                $('.question_pic').html(htmlStrings);
                $('.question_plain').html("");
                initFileInputPic("answer-a-upload", "/homework/uploadPics", "answer_a_upload");
                initFileInputPic("answer-b-upload", "/homework/uploadPics", "answer_b_upload");
                initFileInputPic("answer-c-upload", "/homework/uploadPics", "answer_c_upload");
                initFileInputPic("answer-d-upload", "/homework/uploadPics", "answer_d_upload");
                $("#answer-a-upload").on('fileuploaded', function (event, data, previewId, index) {


                    var data = data.response.detail;
                    if (data == undefined) {
                        toastr.error('文件格式类型不正确');
                        return;
                    } else {
                        $("#answer_a_path").val(data);
                    }

                });
                $("#answer-b-upload").on('fileuploaded', function (event, data, previewId, index) {


                    var data = data.response.detail;
                    if (data == undefined) {
                        toastr.error('文件格式类型不正确');
                        return;
                    } else {
                        $("#answer_b_path").val(data);
                    }

                });
                $("#answer-c-upload").on('fileuploaded', function (event, data, previewId, index) {


                    var data = data.response.detail;
                    if (data == undefined) {
                        toastr.error('文件格式类型不正确');
                        return;
                    } else {
                        $("#answer_c_path").val(data);
                    }

                });
                $("#answer-d-upload").on('fileuploaded', function (event, data, previewId, index) {


                    var data = data.response.detail;
                    if (data == undefined) {
                        toastr.error('文件格式类型不正确');
                        return;
                    } else {
                        $("#answer_d_path").val(data);
                    }

                });
            }
            //
        });

        //拼接图片html
        function jointPicHtml(item) {
            var htmlString = "                <div class=\"form-group\">"
                    + "<label for=\"answer-" + item + "-upload\" class=\"col-sm-2 control-label\">答案" + item + "</label>"
                    + "<div class=\"col-sm-4\">"
                    + "<input id=\"answer-" + item + "-upload\" name=\"answer_" + item + "_upload\" class=\"file\" type=\"file\" multiple"
                    + "data-min-file-count=\"1\">"
                    + "<input id=\"answer_" + item + "_path\" name=\"homework.answer_" + item + "\" type=\"hidden\"/>"
                    + "<br>"

                    + "</div>"
                    + "</div>";
            return htmlString;

        }
        //拼接文字html
        function jointPlainHtml(item) {
            var htmlString = "<div class=\"form-group\">"
                    + "<label for=\"answer_" + item + "\" class=\"col-sm-2 control-label\">答案" + item + "</label>"
                    + "<div class=\"col-sm-4\">"
                    + " <input type=\"text\" class=\"form-control\" id=\"answer_" + item + "\" name=\"homework.answer_" + item + "\""
                    + "placeholder=\"答案" + item + "\">"
                    + "</div>"
                    + "</div>"
            return htmlString;

        }


        //栏目tree-view
        $("#part").click(function () {
            //ajax请求数据，填充treeview
            $.ajax({
                url: "${baseUrl!}/admin/homework/treeViewData",
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


        //题目图片
        initFileInputPic("pics-upload", "/homework/uploadPics", "pics-upload");
        initFileInputOgg("ogg-upload", "/homework/uploadOgg", "ogg-upload");

        // initFileInputPic("answer_b-uppload", "/homework/uploadPics", "answer_b-uppload");
        //initFileInputPic("answer_c-uppload", "/homework/uploadPics", "answer_c-uppload");
        //initFileInputPic("answer_d-uppload", "/homework/uploadPics", "answer_d-uppload");

        $("#pics-upload").on('fileuploaded', function (event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                if ($("#pics_path").val().length == 0)
                    $("#pics_path").val(data);
                else
                    $("#pics_path").val($("#pics_path").val() + '|' + data);
            }
        });



        $("#ogg-upload").on('fileuploaded', function (event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#ogg_path").val(data);
            }
        });


        //初始化fileinput控件（第一次初始化） 图片
        function initFileInputPic(ctrlName, uploadUrl, picName) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl + "?pics_name=" + picName, //上传的地址
                allowedFileExtensions: ['jpg', 'png'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }


        //初始化fileinput控件（第一次初始化） OGG
        function initFileInputOgg(ctrlName, uploadUrl, oggName) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl + "?ogg_name=" + oggName, //上传的地址
                allowedFileExtensions: ['ogg'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }


    </script>

</section>
</@layout>