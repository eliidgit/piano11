<#include "/page/school/common/_layout.ftl"/>
<@html title="教师详情 - ${siteTitle!}" description="">

<script type="text/javascript" src="/static/school/js/teacher_detail.js"></script>
<link rel="stylesheet" href="/static/school/css/teacher_detail.css"/>
<link rel="stylesheet" href="/static/school/css/jcDate.css" />
<!-- Jquery 异步提交表单-->
<script src="/static/js/jquery.form.js"></script>
<script type="text/javascript" src="/static/school/js/jQuery-jcDate.js"></script>

<div class="tea_add_fruit"></div>
			<div class="tea_add_fut">
			<form id="add_teacher">
				<div class="tea_addtit">添加教学成果</div>
				<div class="tea_add_fut1">
					<div class="teacher_fut2_tit">
						<p class="teacher_p">标题</p>
						<input class="exam_title" name="teacherResult.title" type="text" value="考级通过率百分百" />
						<input type="hidden" name="teacherResult.tid" value="${(teacher.id)!}" /> 												
					</div>
					<div class="clear"></div>
					<div class="teacher_fut2_time">
						<p class="teacher_p">时间</p>
						<div class="teacher_fut2_time1">
							<input class="exam_startime jcDate" name="teacherResult.time_start" type="text" value="2013-3-4"/>
							<span></span>
						</div>
						<div class="teacher_fut2_hx">至</div>
						<div class="teacher_fut2_time1">
							<input class="exam_endtime jcDate" name="teacherResult.time_end" type="text" value="2013-3-4"/>
							<span></span>
							<!--<img src="/static/school/img/down2_03.gif"/>-->
						</div>
					</div>
					<div class="clear"></div>
					<div class="teacher_fut2_content">
						<p class="teacher_p">工作内容</p>
						<textarea name="teacherResult.content">自06年任教以来，每年全国音协考级通过率达百分百，优秀率于百分之80以上，连续7年被音乐家协会评为“优秀辅导教师”</textarea>
					</div>
					<div class="tea_btns">
						<input class="tea_can" type="button" value="取消" />
						<input class="tea_yes" type="button" value="保存" />					
					</div>
				</div>
				</form>
			</div>
			<!--添加按钮结束-->
			<div class="teacher_detail">
				<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li><</li>
						<li>教师管理</li>
						<li><</li>
						<li>谢依晨</li>
					</ul>
				</div>
				<!--添加结束-->
				<div class="teacher_decenter">
					<!--<div class="teacher_tit">
						<span>教师管理</span>><span>谢依晨</span>
					</div>	-->
					<div class="teacher_top">
						<img id="tea_img" src="${(teacher.avatar)! }"/>
					</div>
					<p class="teacher_name" class="tea_name">${(teacher.name)!}</p>
					<div class="teacher_base">
						<div class="teacher_base1">
							<div class="teacher_base_tit">
								<div class="teacher_sum_hx">
									<div class="teacher_base_hx0"></div>
									<div class="teacher_base_hx1">基本信息</div>
									<div class="teacher_base_hx2"></div>																	
								</div>
								<input class="teacher_edit" type="button" value="编辑" />	
							</div>
							<div class="teacher_basemsg">
								<div class="teacher_base_msg">
								  <form id="edit_teacher_form">
									<div class="tea_base_msg">
										<div class="tea_base_msg1">
											<span class="tea_tit">姓名</span>
											<span class="tea_name">${(teacher.name)!}</span>
										</div>
										<div class="clear"></div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">*姓名</span>
											 <div class="tea_base_sex">
											 	<input type="text" name="teacher.name" value="${(teacher.name)!}" />
											 	<input type="hidden" name="teacher.id" value="${(teacher.id)!}" /> 
											 </div>
										</div>
									</div>
									<div class="tea_base_msg">
										<div class="tea_base_msg1">
											<span class="tea_tit">性别</span>
											<span id="gender"><#if (teacher.gender)??><#if teacher.gender="1">男<#else>女</#if></#if></span>
										</div>
										<div class="clear"></div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">*性别</span>
											 <div class="tea_base_sex">
											 	<input class="tea_sex_select tea_sex_select1" <#if (teacher.gender)??><#if teacher.gender="1">checked="checked"</#if></#if>  type="radio" name="teacher.gender" value="1" /><label>男</label>
											 	<input class="tea_sex_select tea_sex_select2" <#if (teacher.gender)??><#if teacher.gender="2">checked="checked"</#if></#if> type="radio" name="teacher.gender" value="2" /><label>女</label>
											 </div>
										</div>
									</div>
									<div class="clear"></div>
									<div class="tea_base_msg">
										<div class="tea_base_msg1">
											<span class="tea_tit">年龄</span><span class="age1">${(teacher.age)!}岁</span>
										</div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">*年龄</span>
											 <div class="tea_base_sex">
											 	<input class="age2" type="text" value="${(teacher.age)!}" />
											 </div>
										</div>
									</div>
									<div class="clear"></div>
									<div>
										<div class="tea_base_msg1">
											<span class="tea_tit">联系电话</span><span class="phone1">${(teacher.phone)!}</span>
										</div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">*联系电话</span>
											 <div class="tea_base_sex">
											 	<input class="phone2" type="text" value="${(teacher.phone)!}" />
											 </div>
										</div>
									</div>
									<div class="clear"></div>
									<div>
										<div class="tea_base_msg1">
											<span class="tea_tit">家庭地址</span><span class="address1">${(teacher.address)!}</span>
										</div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">*家庭地址</span>
											 <div class="tea_base_sex">
											 	<input class="address2" name="teacher.address" type="text" value="${(teacher.address)!}" />
											 </div>
										</div>
									</div>
									<div class="clear"></div>
									<div>
										<div class="tea_base_msg1">
											<span class="tea_tit">职级</span><span id="job"><#if (teacher.job)??><#if teacher.job="1">高级教师<#elseif teacher.job="2">中级教师<#else>初级教师</#if></#if></span>
										</div>
										<div class="tea_base_msg2 tea_base_teacher">
											 <span class="tea_sex_name">*职级</span>
											 <div class="tea_base_sex2 tea_base_det">
											 	<input class="head_teacher" type="text" id="job2"  readonly="readonly" value='<#if (teacher.job)??><#if teacher.job="1">高级教师<#elseif teacher.job="2">中级教师<#else>初级教师</#if></#if>' />
											 	<input type="hidden" name="teacher.job" value="${(teacher.job)! }" />
											 	<span class="tea_down"></span>
											 </div>
											 <div class="select_teacher">
											 	<ul>
											 		<li data-value="1" >高级教师</li>
											 		<li data-value="2">中级教师</li>
											 		<li data-value="3">初级教师</li>
											 	</ul>
											 </div>
										</div>
									</div>
									<div class="clear"></div>
									<div>
										<div class="tea_base_msg1">
											<span class="tea_tit">排课班级</span>
											<div class="tea_class">
												<#list ct! as list>
												<span data-cid="${list.cid!}" data-value="${list.id!}">${list.gname! }${list.cname!}</span>
												</#list>
											</div>
										</div>
										<div class="tea_base_msg2">
											<div class="tea_base_pk">
												 <span class="tea_sex_name">排课班级</span>
												 <div class="tea_bjs">
												 <#list ct! as list>
													 <div class="tea_bj">
													 	<span>${list.gname! }${list.cname!}</span>
													 	<span data-value="${list.id!}" data-cid="${list.cid!}" class="tea_del" onclick="delClassGrade(this)"></span>		
													 </div>	
												 </#list>
												 </div>
											</div>
											 <div class="tea_base_sex tea_base_sex3">											 	
												 	<div class="select_bj">
												 		<div class="select_bj_border">
													 		<input type="text" data-value="0" readonly="readonly" value="选择班级" id="add_class" /><span></span>												 			
												 		</div>
													 	<div class="select_insert">确认添加</div>												 		
												 	</div>
											 	<div class="all_stu_hover" style="top:40px;">
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
										</div>										
									</div>
									<div class="clear"></div>
									<div>
										<div class="tea_base_msg1">
											<span class="tea_tit">毕业院校</span><span class="graduate_school1">${(teacher.graduated)! }</span>
										</div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">毕业院校</span>
											 <div class="tea_base_sex">
											 	<input class="graduate_school2" name="teacher.graduated" type="text" value="${(teacher.graduated)! }" />
											 </div>
										</div>									
									</div>
									<div class="clear"></div>
									<div>
										<div class="tea_base_msg1">
											<span class="tea_tit">教龄</span><span class="school_age1">${(teacher.teach_time)! }年</span>
										</div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">教龄</span>
											 <div class="tea_base_sex">
											 	<input class="school_age2" name="teacher.teach_time" type="text" value="${(teacher.teach_time)! }" />
											 </div>
										</div>											
									</div>
									<div class="clear"></div>
									<div>
										<div class="tea_base_msg1">												
											<span class="tea_tit">入职时间</span><span class="date1">${(teacher.entry_time)!?string("yyyy-MM-dd") }</span>
										</div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">入职时间</span>
											 <div class="tea_base_sex tea_base_sex1">
											 	<input class="tea_base_date1 jcDate date2" name="teacher.entry_time" readonly="readonly" type="text" value='${(teacher.entry_time)!?string("yyyy-MM-dd")}' />
											 	<span class="tea_date"></span>
											 </div>
										</div>										
									</div>
									<div class="clear"></div>
									<div>
										<div class="tea_base_msg1">												
											<span class="tea_tit">状态</span><span class="tea_base_job1"><#if (teacher.state)??><#if teacher.state="1">在职<#elseif teacher.state="2">休假<#else>离职</#if></#if></span>
										</div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">状态</span>
											 <div class="tea_base_sex tea_base_sex4">
											 	<input class="tea_base_job" readonly="readonly" type="text" value='<#if (teacher.state)??><#if teacher.state="1">在职<#elseif teacher.state="2">休假<#else>离职</#if></#if>' />
											 	<input type="hidden" name="teacher.state" value="${(teacher.state)!}" />
											 </div>
											 <div class="clear"></div>
											 <div class="tea_job">
											 	<ul>
											 		<li data-value="1">在职</li>
											 		<li data-value="2">休假</li>
											 		<li data-value="3">离职</li>
											 	</ul>
											 </div>
										</div>	
									</div>
									<div class="teacher_btn">
										<input class="teacher_cancle" type="button" value="取消" />
										<input class="teacher_save" type="button" value="保存" />
									</div>
									</form>
								</div>
								<!--<div class="clear"></div>-->
							</div>
						</div>
						<div class="clear"></div><!--添加-->
						<div class="teacher_base2">
							<div class="teacher_base2_fruits">
								<div class="teacher_base2_tit">
									<div class="teacher_base2_left">
										<!--<div class="tbleft">教学成果</div>-->
										<div class="teacher_base_hx0"></div>
										<div class="teacher_base_hx1">教学成果</div>
										<div class="teacher_base_hx2"></div>	
									</div>
									<div class="teacher_base2_right">
										添加
									</div>									
								</div>
								<div class="teacher_base2_msg">
								<#list tops! as list>
								<div class="teacher_bmsgs">
								 <form>
										<input class="teacher_base2_edit" type="button" onclick="edit_teacher_msg(this)" value="编辑" />
										<input type="hidden" name="teacherResult.id" value="${list.id! }"/>
										<div class="teacher_bmsg1">
											<div class="teacher_bmsg_left">
											</div>
											<div class="teacher_bmsg_right">
												<p class="teacher_title">${list.title! }</p>
												<div class="allp">
													<p class="teacher_date">${list.time_start!?string('yyyy年MM月') }</p>
													<p class="teacher_cont">${list.content! }</p>	
												</div>
											</div>											
										</div>	
										<div class="teacher_bmsg2 hide">
											<div class="teacher_base2_tit">
												<p>标题</p>
												<input class="pass" type="text" name="teacherResult.title" value="${list.title! }" />												
											</div>
											<div class="teacher_base2_time">
												<p>时间</p>
												<div class="teacher_bmsg2_time1">
													<input class="teacher_startime jcDate"  name="teacherResult.time_start" type="text" value="${list.time_start!?string('yyyy-MM-dd') }" />
													<span></span>
												</div>
												<div class="teacher_bmsg2_hx">至</div>
												<div class="teacher_bmsg2_time1">
													<input class="teacher_endtime jcDate" name="teacherResult.time_end" type="text" value="${list.time_end!?string('yyyy-MM-dd') }" />
													<span></span>
												</div>
											</div>
											<!--<div class="clear"></div>-->
											<div class="teacher_base2_content">
												<p>工作内容</p>
												<textarea name="teacherResult.content">${list.content! }</textarea>
											</div>
											<div class="tea_btn">
												<input class="teacher_base2_contcancle" onclick="cancle_teacher_msg(this)" type="button" value="取消" />
												<input class="teacher_base2_contsave" onclick="save_teacher_msg(this)" type="button" value="保存" />												
											</div>
										</div>
										</form>
									</div>
								</#list>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<script type="text/javascript">

//保存按钮的点击事件开始添加
	$(".teacher_save").click(function(){
		if($("[name='teacher.teach_time']").val().length>2){
			alert("教龄不能超过两位数");
			return;
		}
	 var options = {
            url: '/school/teacher/edit',
            type: 'post',
            dataType: 'json',
            data: $("#edit_teacher_form").serialize(),
            success: function (data) {
                if (data.code == '200') { 
                	$("#gender").text($('input:radio[name="teacher.gender"]:checked').val()=="1"?"男":"女");
                	$(".tea_name").text($("[name='teacher.name']").val());
                	$(".teacher_name").text($("[name='teacher.name']").val());
                	$(".address1").html($(".address2").val());
                	$(".phone1").html($(".phone2").val());
                	$(".age1").html($(".age2").val()+"岁");
                	$(".school_age1").html($(".school_age2").val()+"年");
                	$(".graduate_school1").html($(".graduate_school2").val());
                	$(".date1").html($(".date2").val());
                	$("#job1").text($("#job2").val());
                	$(".tea_base_job1").text($(".tea_base_job").val());
                	$(".tea_base_msg1").css("display","block");
                	$(".tea_base_msg2").css("display","none");
                	$(".teacher_btn").css("display","none");
                	$(".teacher_edit").css("display","block");
                	$(".teacher_base_hx2").eq(0).css("width","856px");
                 } else {
                    alert(data.description);
                }


            }
        };
        $.ajax(options);
        return false; 
	}); 
	function delClassGrade(obj){
		if(confirm("确定删除吗?")){
			var id = $(obj).attr("data-value");
			$.ajax( {  
			     url:'delClassTeacherById',// 跳转到 action     
			     data:{  
			             id : id
			    },
			     async:false,  //同步
			     type:'post',      
			     dataType:'json',  
			     success:function(data) {  
			         if(data.code =="200" ){
			        	 $(obj).parent().remove();
			        	 $(".tea_class").find("[data-value='"+id+"']").remove();
			         }else{
			        	 alert(data.description);
			         }
			     },  
			      error : function() {  
			           alert("异常！");  
			     }  
			});
			
		}
	}
	$(".all_stu4").on("click","li",function(){
		$("#add_class").val(gname+$(this).text());
		$("#add_class").attr("data-value",$(this).attr('value'));
		$(".all_stu_hover").css("display","none");
		//$(".all_stu4").css("display","none");
	});
	$(".select_insert").click(function(){
		var cid = $("#add_class").attr("data-value");
		if(cid!=0 && $(".tea_bjs").find("[data-cid='"+cid+"']").attr("class")!="tea_del"){
			if(confirm("确定分配此班级吗?")){
				$.ajax( {  
				     url:'/school/teacher/addClassTeacher',// 跳转到 action     
				     data:{  
				             tid : $('[name="teacher.id"]').val(),  
				             cid : cid
				    },
				     async:false,  //同步
				     type:'post',      
				     dataType:'json',  
				     success:function(data) {  
				         if(data.code =="200" ){  
				        	 var text='<div class="tea_bj">'+
							 	'<span>'+$("#add_class").val()+'</span>'+
							 	'<span data-cid="'+cid+'" onclick="delClassGrade(this)" class="tea_del" data-value="'+data.detail.id+'"></span>'+	
							' </div>';
							$(".tea_bjs").append(text);
							text='<span data-cid="'+cid+'" data-value="'+data.detail.id+'">'+$("#add_class").val()+'</span>';
							$(".tea_class").append(text);
				         }else{  
				            alert(data.description);
				        }  
				     },  
				      error : function() {  
				           alert("异常！");  
				     }  
				});
			}
		}
	});
	function cancle_teacher_msg(obj){
		var parentElementDiv=$(obj).parent().parent().parent();
		parentElementDiv.find(".teacher_bmsg1").css("display","block");
		parentElementDiv.find(".teacher_bmsg2").css("display","none");
		parentElementDiv.find(".teacher_base2_edit").css("display","block");
	}
	function save_teacher_msg(obj){
		var parentElementDiv=$(obj).parent().parent().parent();
		 var options = {
               url: '/school/teacher/updateTeacherResult',
               type: 'post',
               dataType: 'json',
               data: parentElementDiv.serialize(),
               success: function (data) {
                   if (data.code == '200') {
						parentElementDiv.find(".teacher_bmsg1").css("display","block");
						parentElementDiv.find(".teacher_title").html(parentElementDiv.find(".pass").val());
						parentElementDiv.find(".teacher_date").html(change_year(parentElementDiv.find(".teacher_startime").val()));
						parentElementDiv.find(".teacher_cont").html(parentElementDiv.find(".teacher_base2_content textarea").val());
						parentElementDiv.find(".teacher_bmsg2").css("display","none");
						parentElementDiv.find(".teacher_base2_edit").css("display","block");
                   } else {
                       alert(data.description);
                   }


               }
           };
           $.ajax(options);
           return false; 
		
	}
	function edit_teacher_msg(obj){
		var parentElementDiv=$(obj).parent();
		parentElementDiv.find(".teacher_bmsg1").css("display","none");
   		parentElementDiv.find(".teacher_bmsg2").css("display","block");
   		parentElementDiv.find(".teacher_base2_edit").css("display","none");
	}
</script>
</@html>