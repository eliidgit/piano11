<#include "/page/school/common/_layout.ftl"/>
<@html title="教师首页 - ${siteTitle!}" description="">

<link rel="stylesheet" href="${baseUrl!}/static/school/css/teacher_msg.css"/>
<link rel="stylesheet" href="${baseUrl!}/static/school/css/jcDate.css" />
<script type="text/javascript" src="/static/school/js/teacher_msg.js"></script>
<script type="text/javascript" src="${baseUrl!}/static/school/js/jQuery-jcDate.js"></script>

<!-- Jquery 异步提交表单-->
<script src="/static/js/jquery.form.js"></script>

<div class="teacher_batch">
			<div class="tea_all_change"></div>
			<!--更改弹窗-->
			<div class="tea_change_class">
				<p class="tea_change_title">排课班级</p>
				<div class="tea_change_class2">
					<span class="tea_class_name">排课班级</span>
					<div class="tea_change_sum">
						<div class="tea_change_csum">
						</div>
						<div class="clear"></div>
						<div class="tea_change_class1">					
							<div class="tea_change_class3">
								<div class="tea_check">
									<!--<span>-->
									<div class="tea_check_select">
										<input class="tea_change_class4" data-value="0"  readonly="readonly" value="选择班级"/>		
										<span></span>	
									</div>
									<div class="tea_confirm">确认添加</div>
								</div>
								<div class="all_stu_hover" style="top:41px;">
								<div class="all_stu3">
									<ul>
									<#if gradeList??>
	                                    <#list gradeList as grade>
	                                        <li data-type='g' value="${grade.id!}" onmouseover="overGrade(this)">${grade.name!}</li>
	                                    </#list>
		                            </#if>
									</ul>
								</div>
								<div class="all_stu4">
									<ul class="all_stu_bj0">
									</ul>
								</div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="tea_change_btn">
					<input class="tea_btn_cancle" type="button" value="取消" />
					<input class="tea_btn_save" type="button" value="保存" />
				</div>
			</div>
			<!--更改状态-->
			<div class="tea_change_statue">
				<p class="tea_change_title">更改状态</p><!---->
				<div class="tea_change_statue1">
					<span class="tea_change_statue2">更改状态</span>
					<div class="tea_change_statue3">
						<input class="tea_change_statue4" data-value="1" readonly="readonly" value="在职"/>
						<!--<img class="tea_change_statue3_down" src="/static/school//img/down2_03.gif" />-->		
						<span class="pull_down"></span>
					</div>
						<div class="tea_change_statue_bj">
							<ul>
								<li data-value="2">休假</li>
								<li data-value="3">离职</li>
							</ul>
						</div>
				</div>
				<div class="tea_change_statue_btn">
					<input class="tea_state1" type="button" value="取消" />
					<input class="tea_state2" type="button" value="保存" />
				</div>
			</div>
			<!--更改结束-->
		<!--弹窗新增教师-->
		<div class="add_all_screen"></div>
		<div class="add_teacher">
		<form id="add_teacher_form">
			<div class="add_teacher_top">新增教师</div>
			<div class="add_teacher_cen">
				<div class="add_teacher_cent">
					<div class="add_teacher_ct">
						<div class="add_tea_hx0"></div>
						<div class="add_tea_center">基本信息</div>
						<div class="add_tea_hx1"></div>
					</div>
				</div>
				<div class="add_teacher_detail">
					<div class="add_teacher_det1">
						<div class="add_tea_name">		
						<!--	<span class="add_tea_start"></span>--><span>*姓名</span>
						</div>
						<input class="add_tea_newname" name="teacher.name" type="text" value="谢依晨" />
						
					</div>
					<div class="clear"></div>
					<div class="add_teacher_det1">
						<div class="add_tea_name">		
							<span>*性别</span>
						</div>
						<div class="add_tea_sex">
							<div class="boy">
								<span class="circle"></span>
								<span>男</span>
							</div>
							<div class="girl">
								<span class="circle"></span>
								<span>女</span>
							</div>
							<input type="hidden" id="gender" value="2" name="teacher.gender" />
						</div>
					</div>
					<div class="clear"></div>
					<div class="add_teacher_det1">
						<div class="add_tea_name">		
							<span>*年龄</span>
						</div>
						<input class="add_tea_newname" name="teacher.age" type="text" value="22" />
					</div>
					<div class="clear"></div>
					<div class="add_teacher_det1">
						<div class="add_tea_name">		
							<span>*联系电话</span>
						</div>
						<input class="add_tea_newname" name="teacher.phone" type="text" value="18979893369" />
					</div>
					<div class="clear"></div>
					<div class="add_teacher_det1">
						<div class="add_tea_name">		
							<span>*家庭住址</span>
						</div>
						<input class="add_tea_newname" name="teacher.address" type="text" value="北京市朝阳区鹿港小镇A2单元605室" />
					</div>
					<div class="clear"></div>
					<div class="add_teacher_det1">
						<div class="add_tea_name">		
							<span>*毕业学校</span>
						</div>
						<input class="add_tea_newname" name="teacher.graduated" type="text" value="北京舞蹈学院" />
					</div>
					<div class="clear"></div>
					<div class="add_teacher_det1">
						<div class="add_tea_name">		
							<span>*教龄</span>
						</div>
						<input class="add_tea_newname" name="teacher.teach_time" type="text" value="5" />
					</div>
					<div class="clear"></div>
					<div class="add_teacher_det1 add_teacher_det2">
						<div class="add_tea_name">		
							<span>*职级</span>
						</div>
							<input class="add_tea_newname add_tea_level" readonly="readonly" type="text" value="高级教师" />
							<input type="hidden" id="teacher_job" name="teacher.job" value="1"/>
						<div class="add_tea_sort">
							<ul>
								<li data-value="1">高级教师</li>
								<li data-value="2">中级教师</li>
								<li data-value="3">初级教师</li>
							</ul>
						</div>
					</div>
					<div class="clear"></div>
					<div class="add_teacher_det1">
						<div class="add_tea_name">		
							<span>*排课班级</span>
						</div>
						<div class="add_tea_class">
							<div class="add_tea_class1">
								<ul>
								</ul>
							</div>
							<div class="add_select_class add_select_class3">
								<div class="add_select_comfirm">
									<div class="add_select_class2">
										<input class="add_tea_newname" data-value="0" id="gcname" readonly="readonly" type="text" value="选择班级" />	
										<span></span>
									</div>
									<div class="add_confirm">确认添加</div>
								</div>
								<div class="change_hover">
									<div class="change_hover_div1">
										<ul>
												<#if gradeList??>
				                                    <#list gradeList as grade>
				                                        <li data-type='g' value="${grade.id!}" onmouseover="overGrade(this)">${grade.name!}</li>
				                                    </#list>
			                                	</#if>
										</ul>
									</div>
									<div class="change_hover_div2">
										<ul >
										</ul>
									</div>	
								</div> 	
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="add_tea_sum">
					<div class="add_teacher_ct">
						<div class="add_tea_hx0"></div>
						<div class="add_tea_center">教学成果</div>
						<div class="add_tea_hx1"></div>
					</div>
					<div class="add_tea_title">
						<div class="add_tea_tit1">
							<span>标题</span>
							<input type="text" name="title" value="标题信息标题信息" />
						</div>
						<div class="add_tea_tit1">
							<span>时间</span>
							<div class="add_tea_time">
								<div class="add_tea_startime">
									<input class="jcDate" name="startDate" type="text" value="2013-3-4" /><span></span>
								</div>
								<div class="add_tea_conttime">至</div>
								<div class="add_tea_startime">
									<input class="jcDate" name="endDate" type="text" value="2013-3-4" /><span></span>
								</div>
							</div>
						</div>
						<div class="add_tea_tit1">
							<span>工作内容</span>
							<textarea  id="content" name="content">内容详细内容详细内容详细内容详细内容详细内容详细</textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="add_tea_btn">
				<input id="cancle" type="button" value="取消" />
				<input type="button" id="save_teacher" value="保存" />
			</div>
			</form>
		</div>
		<!--新增教师结束-->
		<div class="teacher_msg">
			<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li>&gt;&gt;</li>
						<li>教师管理</li>
					</ul>
				</div>
				<!--添加结束-->
			<div class="teacher_msg_center">
				<div class="teacher_mc">
					<div class="tea_title">
						<p class="teacher_tit">本校音乐老师</p>
						<div class="teacher_search_left">
						<!--<form id="form-search"   method="get" action="${baseUrl!}/school/teacher"> -->
							<input type="text" value="${name! }" name="name" placeholder="请输入教师姓名查询" />
							<div class="tea_search"></div>
						<!--</form>  -->
						</div>						
					</div>
					<div class="teacher_search">
						<!--<div class="teacher_search_left">
							<input type="text" placeholder="请输入学籍、名称查询" />
							<img src="/static/school//img/classserach_07.gif"/>
						</div>-->
						<div class="teacher_search_right">
							<div class="tea_allcheck">
								<!--<input class="tea_check1" type="checkbox" />-->
								<a class="tea_check1" href="javascript:;"></a>
								<span>全选</span>
							</div>
							<input id="add" type="button" value="新增教师" />
							<input id="batch_tea" type="button" value="批量管理" />
							<input class="all_tea2_cancel" type="button" value="取消" />
							<div class="all_tea2_batch">
								<div class="all_tea2_edit">
									<input class="all_btn_edit" type="button" value="编辑" />
								    <span></span>
								</div>
								<ul class="tea_change">
									<li class="tea_pk">排课班级</li>
									<li class="tea_sta">更改状态</li>
								</ul>								
							</div>
						</div>
					</div>	
					<!--<div class="clear"></div>-->
					<div class="taecher_pic">
						<ul>
							<#list page.getList() as teacher>
							<li data-default-val="${teacher.id!}" data-value="" onclick="skip(this,${(teacher.id)!})">
								<img class="tea_batch_check" src="/static/school/img/teacher/u45.png"/>
								<!--<a href="teacher_detail.html">-->
									<div class="teacher_tx">
										<img src="${(teacher.avatar)! }"/>
									</div>
									<p class="teacher_name">${teacher.name!}</p>
									<p class="teacher_post"><#if (teacher.job)??><#if teacher.job=="1">高级教师<#elseif teacher.job=="2">中级教师<#else>初级教师</#if></#if></p>									
								<!--</a>-->
							</li>
							</#list>
						</ul>
						<div class="clear"></div>
					</div>
				</div>
					<#include "/page/school/common/_paginate.ftl"/>
                    <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/school/teacher/index" urlParas="" />
			</div>
		</div>
	</div>
    <script>
    function cancleTeacher(){
    	$(".tea_batch_check").css("display","none");
		$("#add").css("display","block");
		$("#batch_tea").css("display","block");
		$(".all_tea2_edit").css("display","none");
		$(".all_tea2_cancel").css("display","none");
		$(".tea_allcheck").css("display","none");
		$(".taecher_pic li").removeClass("li_act");
		$(".taecher_pic .tea_batch_check").attr("src","/static/school/img/teacher/u45.png");
		$(".tea_check1").css("background","url('/static/school/img/spirit_img.png') -218px -54px no-repeat;")
		$(".taecher_pic li").each(function(){
				$(this).attr("data-value","");
		});
		flag8=true;	
    }
	//添加
	var flag8=true;
	var num1=0;
	var extend1=$(".taecher_pic li").size();
	$(".tea_check1").click(function(){
		var all_check=getClassNames("tea_batch_check","img");
		if(flag8){
			$(".taecher_pic li").addClass("li_act");
			for(var i=0;i<all_check.length;i++){
				all_check[i].src="/static/school/img/teacher/success2_07.png";
			}
			$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -240px -54px");
			$(".taecher_pic li").each(function(){
				$(this).attr("data-value",$(this).attr("data-default-val"));
			});
			num1=extend1;
			flag8=false;			
		}else{
			$(".taecher_pic li").removeClass("li_act");
			for(var i=0;i<all_check.length;i++){			
				all_check[i].src="/static/school/img/teacher/u45.png";
			}
			$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
			$(".taecher_pic li").each(function(){
				$(this).attr("data-value","");
			});
			num1=0;
			flag8=true;
		}
	});
    function skip(obj,id){
		if($(obj).find(".tea_batch_check").css("display")=="none"){
			location.href="${baseUrl!}/school/teacher/detail?id="+id;
		}else{
			if($(obj).find(".tea_batch_check").attr("src").indexOf("success2_07")<0){
				$(obj).addClass("li_act");
				$(obj).find(".tea_batch_check").attr("src","/static/school/img/teacher/success2_07.png");
				$(obj).attr("data-value",id);
				num1++;
			}else{
				$(obj).removeClass("li_act");
				$(obj).find(".tea_batch_check").attr("src","/static/school/img/teacher/u45.png");
				$(obj).attr("data-value","");
				num1--;
			}
			if(num1==extend1){
				$(".tea_check1").css({"background":"url('/static/school/img/spirit_img.png') -240px -54px no-repeat"});	
				flag8=false;			
			}else{
				$(".tea_check1").css({"background":"url('/static/school/img/spirit_img.png') -218px -54px no-repeat"});						
				flag8=true;
			}
		}
	}//结束
        $(".tea_state2").click(function () {
            var arr = [];
            $(".taecher_pic li").each(function(){
        		var id=$(this).attr("data-value");
        		if(id !=null&&id!=""){
        			arr.push(id);
        		}
        	});
            if(arr==null || arr.length<1){
            	alert("请选择教师");
            	return;
            }
            //已经准备好选中数组
            $.ajax({
                url: "/school/teacher/updateStates",    //请求的url地址
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {
                	"tids": arr, 
                	"state": $(".tea_change_statue4").attr("data-value")
                	},    //参数值
                type: "post",   //请求方式

                success: function (data) {
                    //请求成功时处理
                    if (data.code == '200') {
                    	$(".tea_all_change").css("display","none");
                		$(".tea_change_statue").css("display","none");
                		cancleTeacher();
                    } else {
                        alert(data.description);
                    }

                }
            });
        });

        $("#add").click(function () {
            $(".add_all_screen").css("display", "block");
            $(".add_teacher").css("display", "block");
        });
        $("#cancle").click(function () {
            $(".add_all_screen").css("display", "none");
            $(".add_teacher").css("display", "none");
        });

        $("#btnAjaxSubmit").click(function () {
            var options = {
                url: 'teacher/add',
                type: 'post',
                dataType: 'json',
                data: $("#form1").serialize(),
                success: function (data) {
                    if (data.code == '200') {
                        alert(data.detail);
                    } else {
                        alert(data.description);
                    }


                }
            };
            $.ajax(options);
            return false;
        });

      //修改
        $(".tea_search").click(function () {
			if($(".teacher_search_left input").val()==""||$(".teacher_search_left input").val()=="请输入教师姓名"){
				$(".teacher_search_left input").addClass("teaact");
				$(".teacher_search_left input").val("请输入教师姓名");
				$(".teacher_search_left input").blur();					
				$(".teacher_search_left input").focus(function(){
					$(".teacher_search_left input").removeClass("teaact");
					$(".teacher_search_left input").val("");	
				});
			}else{
				$(".teacher_search_left input").removeClass("teaact");
				//$("#form-search").submit();
				location.href="/school/teacher?name="+$(".teacher_search_left input").val()+"&&showTitle=教师";
			}            
        });
		//添加敲回车搜索页面
		$(".teacher_search_left input").keydown(function(e){
			var evt=e||event;
			if(evt.keyCode==13){
				if($(".teacher_search_left input").val()==""||$(".teacher_search_left input").val()=="请输入教师姓名"){
					$(".teacher_search_left input").addClass("teaact");	
					$(".teacher_search_left input").val("请输入教师姓名");	
					$(".teacher_search_left input").blur();					
					$(".teacher_search_left input").focus(function(){
						$(".teacher_search_left input").removeClass("teaact");
						$(".teacher_search_left input").val("");	
					});
				}else{
					$(".teacher_search_left input").removeClass("teaact");
					location.href="/school/teacher?name="+$(".teacher_search_left input").val()+"&&showTitle=教师";
				}
			}else{
				$(".teacher_search_left input").removeClass("teaact");
			}
		});	
		//添加结束
		$("#save_teacher").click(function(){
			//$("#content_input").val($("#content").val());
			 var options = {
		                url: '/school/teacher/add',
		                type: 'post',
		                dataType: 'json',
		                data: $("#add_teacher_form").serialize(),
		                success: function (data) {
		                    if (data.code == '200') {
		                    	if($(".taecher_pic li").length==10){
		                    		$(".taecher_pic li").eq($(".every_stu1 li").length-1).remove();
		                    	}
		                    	var text='<li onclick="skip(this,'+data.detail.id+')" data-value="" data-default-val="'+data.detail.id+'">'+
									'<img src="/static/school/img/teacher/u45.png" class="tea_batch_check" style="display: none;">'+
									'<div class="teacher_tx">'+
										'<img src="/static/school/img/teacher/pic2.png">'+
									'</div>'+
									'<p class="teacher_name">'+$("[name='teacher.name']").val()+'</p>'+
									'<p class="teacher_post">'+$(".add_tea_level").val()+'</p>'+								
									'</li>';
		                    	$(".taecher_pic ul").prepend(text);
		                    	$(".add_all_screen").css("display", "none");
		                        $(".add_teacher").css("display", "none");
		                    } else {
		                        alert(data.description);
		                    }


		                }
		            };
		            $.ajax(options);
		            return false; 
		})
		$(".change_hover_div2").on("click","li",function(){
			$("#gcname").val(gname+$(this).text());
			$("#gcname").attr("data-value",$(this).attr("value"));
			$(".change_hover").css("display","none");
		});
		$(".add_confirm").click(function(){
			var cid=$("#gcname").attr("data-value");
				if($(".add_tea_class1").find("[value='"+cid+"']").attr("name")!="cid" && cid!=0 ){
				var text='<li>'+
					'<span>'+$("#gcname").val()+'</span>'+
					'<input name="cid" type="hidden" value="'+cid+'" />'+
					'<span class="bj_del"></span>'+
					'</li>';
				$(".add_tea_class1 ul").append(text);
			}
		});
		$(".tea_confirm").click(function(){
			var cid=$(".tea_change_class4").attr("data-value");
			if($(".tea_change_csum").find("[value='"+cid+"']").attr("name")!="cid" && cid!=0 ){
	        	var text1='<div class="tea_change_c1">'+
					'<span>'+$(".tea_change_class4").val()+'</span>'+
					'<input type="hidden" name="cid" value="'+cid+'" />'+
					'<span class="new_bj_del"></span>'+
					'</div>';
	        	$(".tea_change_csum").append(text1);
			}
		});
		 $(".all_stu_bj0").on("click","li",function(){
	        	$(".all_stu_hover").css("display","none");
	        	var cid=$(this).attr("value");
	        	$(".tea_change_class4").val(gname+$(this).text());
	        	$(".tea_change_class4").attr("data-value",cid);
	        });
		 $(".tea_btn_cancle").click(function(){
				$(".tea_all_change").css("display","none");
				$(".tea_change_class").css("display","none");
			});
		 $(".tea_btn_save").click(function(){
				var arr = [];
	            $(".taecher_pic li").each(function(){
	        		var id=$(this).attr("data-value");
	        		if(id !=null&&id!=""){
	        			arr.push(id);
	        		}
	        	});
	            if(arr==null || arr.length<1){
	            	alert("请选择教师");
	            	return;
	            }
	            var cids = [];
	            $("[name='cid']").each(function(){
	        		var id=$(this).val();
	        		if(id!=""){
	        			cids.push(id);
	        		}
	        	});
	            if(cids==null || cids.length<1){
	            	alert("请选择年级班级");
	            	return;
	            }
	            
	            //已经准备好选中数组
	            $.ajax({
	                url: "/school/teacher/updateClass",    //请求的url地址
	                dataType: "json",   //返回格式为json
	                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	                data: {
	                	"tids": arr, 
	                	"cids": cids
	                	},    //参数值
	                type: "post",   //请求方式

	                success: function (data) {
	                    //请求成功时处理
	                    if (data.code == '200') {
	                    	$(".tea_all_change").css("display","none");
							$(".tea_change_class").css("display","none");
							$(".tea_change_csum").empty();
				            $(".tea_change_class4").val("选择班级");
				            $(".tea_change_class4").attr("data-value","0");	
	                		cancleTeacher();
	                    } else {
	                        alert(data.description);
	                    }

	                }
	            });
		 });
    </script>
</@html>