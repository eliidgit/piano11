<#include "/page/admin/common/_layout.ftl"/>
<@layout page_tab="song">
<section class="content-header">
    <h1>
        添加音乐
        <small>添加</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${baseUrl!}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${baseUrl!}/admin/song"><i class="fa fa-tag"></i> 曲库管理</a></li>
        <li class="active">添加</li>
    </ol>
</section>
<section class="content">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">添加音乐</h3>
        </div>
        <!-- form start -->
        <form role="form" class="form-horizontal" method="post" action="/admin/song/add" onsubmit="return submit1()" >
            <div class="box-body">

                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">音乐名称</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="song.name" placeholder="音乐名称">
                    </div>
                </div>
				 <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">标签分类</label>
                    <div id="div1" class="col-sm-4" style="padding-top:6px;position: relative;">
                        <span style="display:inline-block;border:1px dashed #156FEA;padding:2px;margin:0 3px;position: relative;"><a href="javascript:;" onclick="add1(this)" flag='1' >&nbsp;+&nbsp;添加标签</a></span>
                        <div  id="tagsDiv" style="display:none;top:36px;left:128px;position: absolute;padding:10px;border:1px dashed #000;z-index: 10;background-color: #FFF;">
                        	<#list tags! as tag>
                        	<span onclick="addTag('${tag.id!}','${tag.name! }')" style="display:inline-block;border:1px solid #999;padding:2px;margin:3px 3px;position: relative;background-color: #B4D1E6"><a href="javascript:;">${tag.name! } </a></span>
                        	</#list>
                        </div>
                    </div>
                    <input id="taginput" type="hidden" name="tags" />
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label"></label>
                    <div class="col-sm-4">
                        <input type="text" class="" id="tag" placeholder="标签">
                        <input id="tieshang" type="button" class="btn-primary" value="贴上">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">难度</label>
                    <div class="col-sm-4">
                        <select id="type" class="form-control" name="song.level">
                            <option value="1">一级难度</option>
                            <option value="2">二级难度</option>
                            <option value="3">三级难度</option>
                            <option value="4">四级难度</option>
                            <option value="5">五级难度</option>
                            <option value="6">六级难度</option>
                            <option value="7">七级难度</option>
                            <option value="8">八级难度</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="author" class="col-sm-2 control-label">音乐作者</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="author" name="song.author" placeholder="音乐作者">
                    </div>
                </div>


                <div class="form-group">
                    <label for="like_number" class="col-sm-2 control-label">点击数</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="click_num" name="song.click_num"
                               value=0>
                    </div>
                </div>

                <div class="form-group">
                    <label for="pic-upload" class="col-sm-2 control-label">封面图片</label>
                    <div class="col-sm-4">
                        <input id="pic-upload" name="file-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="pic_path" name="song.cover_path" type="hidden"/>

                        <br>

                    </div>
                </div>
				<div class="form-group">
                    <label for="stave-upload" class="col-sm-2 control-label">五线谱</label>
                    <div class="col-sm-4">
                        <input id="stave-upload" name="file-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="stave_path" name="song.stave_path" type="hidden"/>

                        <br>

                    </div>
                </div>


                <div class="form-group">
                    <label for="midi-upload" class="col-sm-2 control-label">midi文件</label>
                    <div class="col-sm-4">
                        <input id="midi-upload" name="file-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="midi_path" name="song.midi_path" type="hidden"/>

                        <br>

                    </div>
                </div>

                <div class="form-group">
                    <label for="ogg-upload" class="col-sm-2 control-label">ogg文件</label>
                    <div class="col-sm-4">
                        <input id="ogg-upload" name="file-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="ogg_path" name="song.ogg_path" type="hidden"/>

                        <br>

                    </div>
                </div>
                <div class="form-group">
                    <label for="txt_a-upload" class="col-sm-2 control-label">txt_a文件</label>
                    <div class="col-sm-4">
                        <input id="txt_a-upload" name="file-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="txt_a_path" name="song.txt_a" type="hidden"/>

                        <br>

                    </div>
                </div>
				  <div class="form-group">
                    <label for="txt_b-upload" class="col-sm-2 control-label">txt_b文件</label>
                    <div class="col-sm-4">
                        <input id="txt_b-upload" name="file-upload" class="file" type="file" multiple
                               data-min-file-count="1">
                        <input id="txt_b_path" name="song.txt_b" type="hidden"/>

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
    
    	function submit1(){
    		if($("#name").val()==null||$("#name").val()==""){
    			alert("名称不能为空")
    			return false;
    		}
    		if($("#taginput").val()==null||$("#taginput").val()==""){
    			alert("至少选择一个标签")
    			return false;
    		}
    		if($("#click_num").val()==null || $("#click_num").val()==""){
    			alert("点击量不能为空");
    			return false;
    		}
    		if(isNaN($("#click_num").val())){
    			alert("点击量必须为数字");
    			return false;
    		}else{
    			if($("#click_num").val()<0){
    				alert("点击量不许大于等于零");
    				return false;
    			}
    		}
    		return true;
    	}
    	$("#tieshang").click(function(){
    		if($.trim($("#tag").val())==null || $.trim($("#tag").val())==""){
    			alert("标签不能为空");
    			return ;
    		}
    		$.ajax( {  
			     url:'/admin/song/addTag',// 跳转到 action  
			     data:{  
			    	 	tagName : $.trim($("#tag").val())
			     },
			     async:false,  //同步
			     type:'post', 
			     dataType:'json',  
			     success:function(data) {  
			         if(data.code=="200"){
			        	 $("#tag").val("");
			        	 addTag(data.detail.id,data.detail.name);
			        	 $("#tagsDiv").append('<span onclick="addTag('+data.detail.id+',\''+data.detail.name+'\')" style="display:inline-block;border:1px solid #999;padding:2px;margin:3px 3px;position: relative;background-color: #B4D1E6"><a href="javascript:;">'+data.detail.name+'</a></span>');
			         }else{
			        	 alert(data.description);
			         }
			      },  
			      error : function() {  
			           alert("异常！");  
			      }  
			 });
    	});
    	function diff(obj,id){
    		$(obj).parent().remove();
    		if($("#taginput").val()!=null && $("#taginput").val()!=""){
    			var tags= $("#taginput").val().split("_");
    			for(var i =0;i<tags.length;i++){
    				if(tags[i]==id){
    					tags[i]=0;
    					break;
    				}
    			}
    			$("#taginput").val("");
    			for(var i =0;i<tags.length;i++){
    				if(tags[i]!=0){
   						$("#taginput").val($("#taginput").val()+tags[i]+"_");
    				}
    			}
    		}
    	}
    	function addTag(id,name){
    		var text =	'<span onmouseover="mover(this)" onmouseout="mout(this)" style="display:inline-block;border:1px solid #999;padding:2px;margin:0 3px;position: relative;background-color: #FEF6CE">'+
    		'<span onclick="diff(this,'+id+')" id="xx" style="display:none;width:8px;height:9px;position: absolute;top: 0;right:0;line-height:8px;background-color:#000;color:red;"><a href="javascript:;">x</a></span>'+
    		name+
    		'</span>';
    		
    		if($("#taginput").val()!=null && $("#taginput").val()!=""){
    			var tags= $("#taginput").val().split("_");
    			var flag=true;
    			for(var i =0;i<tags.length;i++){
    				if(tags[i]==id){
    					flag=false;
    					break;
    				}
    			}
    			if(flag){
    				$("#taginput").val($("#taginput").val()+id+"_");
    				$("#div1").prepend(text);
    			}
    		}else{
    			$("#taginput").val(id+"_");
    			$("#div1").prepend(text);
    		}
    	}
    	function mover(obj){
			$(obj).find("span").css("display","block");
		 }
		 function mout(obj){
			$(obj).find("span").css("display","none");
		 }
		 function add1(obj){
			 var flag = $(obj).attr("flag");
			 if(flag==1){
				$(obj).attr("flag","2");
				$(obj).html("&nbsp;+&nbsp;关闭标签");
				$("#tagsDiv").css("display","block");
			 }else{
				$(obj).html("&nbsp;+&nbsp;添加标签");
				$(obj).attr("flag","1");
				$("#tagsDiv").css("display","none");
			 }
		 }
    
    
    


        $("#pic-upload").on('fileuploaded', function (event, data, previewId, index) {


            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#pic_path").val(data);
            }

        });
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
        $("#txt_a-upload").on('fileuploaded', function (event, data, previewId, index) {
            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#txt_a_path").val(data);
            }

        });
        $("#txt_b-upload").on('fileuploaded', function (event, data, previewId, index) {
            var data = data.response.detail;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            } else {
                $("#txt_b_path").val(data);
            }

        });

        initFileInputPic("pic-upload", "/admin/song/uploadPic?type=pic");
        //midi音乐
        initFileInputMidi("midi-upload", "/admin/song/uploadPic?type=midi");
        //五线谱
        initFileInputStave("stave-upload", "/admin/song/uploadPic?type=stave");
        //Ogg
        initFileInputOgg("ogg-upload", "/admin/song/uploadPic?type=ogg");
        initFileInputTxt("txt_a-upload", "/admin/song/uploadPic?type=txt");
        initFileInputTxt("txt_b-upload", "/admin/song/uploadPic?type=txt");
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
        function initFileInputStave(ctrlName, uploadUrl) {
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

        //初始化fileinput控件（第一次初始化） midi
        function initFileInputMidi(ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl, //上传的地址
                allowedFileExtensions: ['midi','mid'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }

        //初始化fileinput控件（第一次初始化）
        function initFileInputOgg(ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl, //上传的地址
                allowedFileExtensions: ['ogg'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            });
        }
        //初始化fileinput控件（第一次初始化）
        function initFileInputTxt(ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);

            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl, //上传的地址
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