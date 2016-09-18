<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="link">
<section class="content-header">
    <h1>
        音乐添加
        <small>添加</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/music"><i class="fa fa-tag"></i> 音乐</a></li>
        <li class="active">添加</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">创建音乐</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="add">
            <div class="box-body">


                <input type="hidden" id="course_part_id" name="music.course_part_id"/>
                <div class="form-group">
                    <label for="part" class="col-sm-2 control-label">所属栏目</label>
                    <div class="col-sm-4">
                        <input id="part_name" type="hidden" ></input>
                        <button id="part" class="btn btn-primary" type="button">选择栏目</button>
                        <div class="modal" id="mymodal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span
                                                aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title">选择音乐所关联的栏目</h4>
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
                        <input type="text" class="form-control" id="name" name="music.source_index" placeholder="示例:10,20...">
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">音乐名</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="music.name" placeholder="音乐名">
                    </div>
                </div>
				<div class="form-group">
                    <label for="name" class="col-sm-2 control-label">音色</label>
                    <div class="col-sm-4">
                        <select onchange="changeChild(this)"  id="tone_id" >
                        	<option value="0">[请选择]</option>
                        	<#list tones! as list>
                        	<option value="${list.id! }">${list.name! }</option>
                        	</#list>
                        </select>
                        <select id="child_tone_id" name="music.tone_id">
                        	<option value="1">[请选择]</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="stave-upload" class="col-sm-2 control-label">五线谱</label>
                    <div class="col-sm-4">
                        <input id="stave-upload" name="stave-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="stave_path" name="music.stave_path" type="hidden"/>

                        <br>

                    </div>
                </div>


                <div class="form-group">
                    <label for="midi-upload" class="col-sm-2 control-label">midi文件</label>
                    <div class="col-sm-4">
                        <input id="midi-upload" name="midi-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="midi_path" name="music.midi_path" type="hidden"/>

                        <br>

                    </div>
                </div>

                <div class="form-group">
                    <label for="ogg-upload" class="col-sm-2 control-label">ogg文件</label>
                    <div class="col-sm-4">
                        <input id="ogg-upload" name="ogg-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="ogg_path" name="music.ogg_path" type="hidden"/>

                        <br>

                    </div>
                </div>


                <div class="form-group">
                    <label for="txt-a-upload" class="col-sm-2 control-label">txt文件1</label>
                    <div class="col-sm-4">
                        <input id="txt-a-upload" name="txt-a-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="txt_a_path" name="music.txt_a" type="hidden"/>
                        <br>
                    </div>
                </div>

                <div class="form-group">
                    <label for="txt-b-upload" class="col-sm-2 control-label">txt文件2</label>
                    <div class="col-sm-4">
                        <input id="txt-b-upload" name="txt-b-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="txt_b_path" name="music.txt_b" type="hidden"/>
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

    <script src="/static/bootstrap-treeview-master/bootstrap-treeview.js"></script>

    <script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-transition.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>
    <script>
    	function changeChild(obj){
    		if(obj.value!="0"){
    			
    			$.ajax( {  
    			     url:'/admin/music/getChildTonesByParentId',// 跳转到 action      
    			     data:{  
    			             parentId : obj.value,  
    			    },
    			     async:false,  //同步
    			     type:'post',      
    			     dataType:'json',  
    			     success:function(data) { 
   			    		$("#child_tone_id").html("");
    			    	 if(data.code=="200"){
    			    		var text='<option value="1">[请选择]</option>';
    			    		 for(var i =0 ;i<data.detail.length;i++){
    			    			 var tone=data.detail[i];
    			    			 text+='<option value="'+tone.tone_id+'">'+tone.name+'</option>';
    			    		 }
    			    		 $("#child_tone_id").html(text);
    			    	 }else{
    			    		 alert(data.detail);
    			    	 }
    			     },  
    			      error : function() {  
    			           alert("异常！");  
    			     }  
    			});
    		}
    	}
    	
        $('#myModal').on('hide.bs.modal', function () {
            alert('嘿，我听说您喜欢模态框...');
        });

        //栏目tree-view
        $("#part").click(function () {
            //ajax请求数据，填充treeview
            $.ajax({
                url: "${baseUrl!}/admin/music/treeViewData",
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
                            showTags:true,
                            onNodeSelected: function (event, data) {
                                part_id = data.href;
                                if (part_id == -1)
                                    alert("此栏目不可关联资源，请重新选择")
                                else{
                                    $("#course_part_id").val(data.href);
                                    //显示在界面上
                                    $("#part_name").val(data.text);
                                    $("#part_name").attr("type","text").attr("readonly","readonly");

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


        //midi音乐
        initFileInputMidi("midi-upload", "/music/uploadMidi", "midi-upload");
        //五线谱
        initFileInputStave("stave-upload", "/music/uploadStave", "stave-upload");

        //Ogg
        initFileInputOgg("ogg-upload", "/music/uploadOgg", "ogg-upload");

        //txt
        initFileInputTxta("txt-a-upload", "/music/uploadTxta", "txt-a-upload");
        initFileInputTxtb("txt-b-upload", "/music/uploadTxtb", "txt-b-upload");



        //initFileInput("music-upload", "/music/upload");

        $("#stave-upload").on('fileuploaded', function (event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#stave_path").val(data);
            }

        });


        $("#midi-upload").on('fileuploaded', function (event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#midi_path").val(data);
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


        $("#txt-a-upload").on('fileuploaded', function (event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#txt_a_path").val(data);
            }

        });


        $("#txt-b-upload").on('fileuploaded', function (event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#txt_b_path").val(data);
            }

        });

        //初始化fileinput控件（第一次初始化） 音乐
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

        //初始化fileinput控件（第一次初始化） 图片
        function initFileInputStave(ctrlName, uploadUrl, picName) {
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

        //初始化fileinput控件（第一次初始化） midi
        function initFileInputMidi(ctrlName, uploadUrl, midiName) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl + "?midi_name=" + midiName, //上传的地址
                allowedFileExtensions: ['midi','mid'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }

        //初始化fileinput控件（第一次初始化） midi
        function initFileInputOgg(ctrlName, uploadUrl, oggName) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl + "?ogg_name=" + oggName, //上传的地址
                allowedFileExtensions: ['ogg','mp3'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }


        //txt
        function initFileInputTxta(ctrlName, uploadUrl, txtName) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl + "?txt_a_name=" + txtName, //上传的地址
                allowedFileExtensions: ['txt'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }

        //txt
        function initFileInputTxtb(ctrlName, uploadUrl, txtName) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl + "?txt_b_name=" + txtName, //上传的地址
                allowedFileExtensions: ['txt'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }


    </script>

</section>
</@layout>