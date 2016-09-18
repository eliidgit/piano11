<#include "/page/school/common/_layout.ftl"/>
<@html title="学生详情 - ${siteTitle!}" description="">

<script type="text/javascript" src="/static/school/js/stu_detail.js"></script>
<link rel="stylesheet" href="/static/school/css/stu_detail.css"/>
<link rel="stylesheet" href="/static/school/css/jcDate.css" />
<script type="text/javascript" src="/static/school/js/stu_detail.js"></script>
<script type="text/javascript" src="/static/school/js/jQuery-jcDate.js"></script>

<!-- Jquery 异步提交表单-->
<script src="/static/js/jquery.form.js"></script>

<div class="allstu_screen"></div>
		<div class="all_parent">
			<div class="all_parent_tit">添加家长</div>
			<div class="allparent1">
				<div class="allp allp2">
					<span>亲属关系</span>
					<div class="parent1">
						<input type="text" value="爸爸" /><!--<img src="/static/school/img/down2_03.gif"/>-->
					</div>
					<div class="link_parent">
						<ul>
							<li>奶奶</li>
							<li>母亲</li>
							<li>弟弟</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
				<div class="allp2">
					<span>姓名</span><input class="all_name" type="text" value="" />
				</div>
				<div class="clear"></div>
				<div class="allp2">
					<span>联系电话</span>
					<input class="all_name" type="text" value=""/>
				</div>
				<div class="all_save1">
					<input class="all_cancel" type="button" value="取消" />		
					<input class="all_save" type="button" value="保存" />
				</div>
			</div>
		</div>
		<!--添加亲属结束-->
			<div class="teacher_detail">
				<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li><</li>
						<li>学生管理</li>
						<li><</li>
						<li class='stu_det_edit'>学生详情</li>
					</ul>
				</div>
				<!--添加结束-->
				<div class="teacher_decenter">
					<!--<div class="teacher_tit">
						<span>学生管理</span>><span>吴佳佳</span>
					</div>	-->
					<div class="teacher_top">
						<div class="teacher_top_img">
							<img src="${(student.avatar)! }"/>							
						</div>
					</div>
					<p class="teacher_name">${(student.name)! }</p>
					<div class="teacher_base">
						<div class="teacher_base1">
							<div class="teacher_base_tit">
								<div class="stu_base_tit1">
									<!--<div class="stu_base_tit2">基本信息</div>-->
									<div class="stu_left"></div>
									<div class="stu_center">基本信息</div>
									<div class="stu_right"></div>
								</div>
								<input class="teacher_edit" type="button" value="修改" />	<!--改变位置-->
							</div>
							<div class="teacher_basemsg">
							  <form id="form1">
								<div class="teacher_base_msg">
									<div class="tea_base_msg">
										<div class="tea_base_msg1">
											<span class="stu_com">姓名</span><span class="stu_name">${(student.name)! }</span>
											<input id="stuId" type="hidden" name="student.id" value="${(student.id)! }"/>
										</div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">姓名</span>
											 <div class="tea_base_sex">
											 	<input class="tea_name" type="text" name="student.name" value="${(student.name)! }" />
											 </div>
										</div>
										<div class="clear"></div>
									</div>
									<div class="tea_base_msg">
										<div class="tea_base_msg1">
											<span class="stu_com">性别</span><span class="sex"><#if (student.gender)??><#if student.gender=="1">男<#else>女</#if></#if></span>
										</div>
										<div class="tea_base_msg2 add_stu_overflow">
											 <span class="tea_sex_name">性别</span>
										     <div class="add_stu_sex ">
												<div class="boy">
													<span class="circle" style='<#if (student.gender)??><#if (student.gender)=="1">background: rgba(0, 0, 0, 0) url("/static/school/img/spirit_img.png") no-repeat scroll -197px -54px</#if></#if>'></span>
													<span style="line-height: 17px;">男</span>
												</div>
												<div class="girl">
													<span class="circle" style='<#if (student.gender)??><#if student.gender=="2">background: rgba(0, 0, 0, 0) url("/static/school/img/spirit_img.png") no-repeat scroll -197px -54px</#if></#if>'></span>
													<span style="line-height: 17px;">女</span>
												</div>
												<input type="hidden" value="2" id="gender" name="student.gender" />
											</div>
										</div>
										<div class="clear"></div>
									</div>
									<div class="tea_base_msg">
										<div class="tea_base_msg1">
											<span class="stu_com">年龄</span><span class="teacher_age">${(student.age)! }岁</span>
										</div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">年龄</span>
											 <div class="tea_base_sex">
											 	<input class="tea_age" type="text" value="${(student.age)! }" name="student.age" />
											 </div>
										</div>
										<div class="clear"></div>
									</div>
									<div>
										<div class="tea_base_msg1">
											<span class="stu_com">家庭地址</span><span id="stuAddress">${(student.address)! }</span>
										</div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">家庭地址</span>
											 <div class="tea_base_sex">
											 	<input type="text" value="${(student.address)!}" name="student.address" />
											 </div>
										</div>
										<div class="clear"></div>
									</div>
									<div>
										<div class="tea_base_msg1">
											<span class="stu_com">学籍</span><span id="stuNum">${(student.student_number)! }</span>
										</div>
										<div class="tea_base_msg2 tea_base_teacher">
											 <span class="tea_sex_name">学籍</span>
											 <div class="tea_base_sex">
											 	<input type="text" value="${(student.student_number)!}" name="student.student_number"/>
											 </div>
										</div>
										<div class="clear"></div>
									</div>
									<div>
										<div class="tea_base_msg1">
											<span class="stu_com">班级</span><span id="classGrade">${(student.gname)!'无分配班级' } ${(student.cname)! }</span>	
										</div>
										<div class="tea_base_msg2">
											 <div class="tea_base_sex stu_base_sex3">	
											 		<span class="tea_sex_name">年级班级</span>
												 	<div class="select_bj">
												 		<input type="text" readonly="readonly" id="gc_name" value="<#if student.gname??>${(student.gname)!} ${(student.cname)! }<#else>选择班级</#if>" />
												 		<Input type="hidden" id="cid" name="student.class_id" value="${(student.cid)!}" />
												 		<span></span>
												 	</div>
												 	<div class="all_stu_hover" style="left:70px;">
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
										<div class="clear"></div>
									</div>
									<div>
										<div class="tea_base_msg1">												
											<span class="stu_com">入学时间</span><span id="stuEntrancetime">${(student.entrancetime)!?string("yyyy-MM-dd")}</span>
										</div>
										<div class="tea_base_msg2">
											 <span class="tea_sex_name">入学时间</span>
											 <div class="tea_base_sex tea_base_sex1">
											 	<input class="tea_base_date1 jcDate"  readonly="readonly" type="text" name="student.entrancetime" value='{(student.entrancetime)!?string("yyyy-MM-dd")}' />
											 	<span class="stu_date"></span>
											 </div>
										</div>										
										<div class="clear"></div>
									</div>
									<div>
										<div class="tea_base_msg1">												
											<span class="stu_com">状态</span><span id="stuState"><#if (student.state)??> <#if student.state=="1">在读<#elseif student.state=="2">休学<#elseif student.state=="3">转学<#else>毕业</#if></#if></span>
										</div>
										<div class="tea_base_msg2">
											 <span class="stu_com stu_coms">状态</span>
											 <div class="stu_state">
											 	<input class="stu_sate_input" type="text" value='<#if (student.state)??><#if student.state=="1">在读<#elseif student.state=="2">休学<#elseif student.state=="3">转学<#else>毕业</#if></#if>' />
											 	<input id="stu_state" name="student.state" type="hidden" value="${(student.state)!}" />
											 	<span class="stu_sate_span"></span>
											 </div>
											 <ul class="stu_state_ul">
												<li data-value="1">在读</li>
												<li data-value="2">休学</li>
												<li data-value="3">转学</li>
												<li data-value="4">毕业</li>
											</ul>
										</div>	
									</div>
									<div class="clear"></div>
									<div>
										<div class="tea_base_msg1">												
											<span class="stu_com">学习时长</span><span id="stuStudy">${(student.study_time)! }小时</span>
										</div>
										<div class="tea_base_msg2">
											<span class="stu_com">学习时长</span>
											<input class="tea_stu_time" name="student.study_time" type="text" value="${(student.study_time)! }" />
										</div>
										<div class="clear"></div>
									</div>
									<div class="stu_btn">
										<input class="teacher_cancle" type="button" value="取消" />
										<input class="teacher_save" type="button" value="保存" />
									</div>
								</div>
							  </form>
							</div>
						</div>
						<div class="clear"></div><!--添加-->
						<div class="teacher_base2">
							<div class="teacher_base2_fruits">
								<div class="teacher_base2_tit">
									<div class="teacher_base2_left">
										<div class="stu_left"></div>
										<div class="stu_center">家长联系方式</div>
										<div class="stu_right1"></div>
										<!--<div class="tbleft">家长联系方式</div>-->
									</div>
									<!--<div class="teacher_base2_right">
										<span class="tea_add_stu">添加</span>
									</div>-->									
								</div>
								<div class="clear"></div><!--添加-->
								<div class="teacher_base2_msg">
									<!--<div class="teacher_bmsgs">
										<input class="teacher_base2_edit" type="button" value="编辑" />
										<div class="teacher_bmsg1">
											<div class="stu_circle"></div>
											<div class="stu_relation">
												<div class="stu_first">
													<span>父亲</span>													
													<span>吴家锡</span>
												</div>	
												<div class="stu_second">
													<span>18979893369</span>
												</div>											
											</div>
										</div>	
										<div class="teacher_bmsg2">
											<div class="teacher_base2_tit">
												<span class="tea_relation">亲属关系</span>
												<div class="tea_link">
													<input class="tea_link1" type="text" value="爸爸" />
													<img src="/static/school/img/down2_03.gif"/>
													<span class="tea_link_span"></span>
												</div>
												<div class="tea_stu_link">
													<ul>
														<li>妈妈</li>
														<li>奶奶</li>
														<li>爷爷</li>
													</ul>
												</div>
												<div class="clear"></div>
											</div>
											<div class="teacher_base2_time">
												<span>姓名</span>
												<input class="stu_add" type="text" value="吴家锡" />	
											</div>
											<div class="clear"></div>
											<div class="teacher_base2_content">
												<span>联系电话</span>
												<input class="stu_add" type="text" value="18979893369" />	
											</div>
											<div class="clear"></div>
											<div class="stubtn">
												<input class="teacher_base2_cancle" type="button" value="取消" />
												<input class="teacher_base2_contsave" type="button" value="保存" />
											</div>
										</div>
									</div>
									<div class="clear"></div>-->
									<div class="teacher_bmsgs">
										<input class="teacher_base2_edit" type="button" value="编辑" />
										<div class="teacher_bmsg1">
											<div class="stu_circle"></div>
											<div class="stu_relation">
												<div class="stu_first">
													<span>${(student.parent_type)! }</span>													
													<span>${(student.parent_name)! }</span>
												</div>	
												<div class="stu_second">
													<span>${(student.phone)! }</span>
													<span class="stu_tip">注：此手机号为学生和家长公用手机号</span>
												</div>											
											</div>										
										</div>
										<div class="teacher_bmsg2">
											<div class="teacher_base2_tit">
												<span class="tea_relation">亲属关系</span>
												<div class="tea_link">
													<input id="parentType" class="tea_link1" type="text" value="${(student.parent_type)! }" />
													<!--<img src="/static/school/img/down2_03.gif"/>	-->	
													<span class="tea_link_span"></span>
												</div>
												<div class="tea_stu_link">
													<ul>
														<li>爸爸</li>
														<li>妈妈</li>
														<li>爷爷</li>
													</ul>
												</div>
												<div class="clear"></div>
											</div>
											<div class="teacher_base2_time">
												<span>姓名</span>
												<input id="parentName" class="stu_add" type="text" value="${(student.parent_name)!}" />	
											</div>
											<div class="clear"></div>
											<div class="teacher_base2_content">
												<span>联系电话</span>
												<input id="stuPhone" class="stu_add" type="text" value="${(student.phone)!}" />	
											</div>
											<div class="clear"></div>
											<div class="stubtn">
												<input class="teacher_base2_cancle" type="button" value="取消" />
												<input class="teacher_base2_contsave" type="button" value="保存" />
											</div>
										</div>
									</div>
										<div class="clear"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<script>
$("#gc_name").click(function(){
	$(".all_stu4 ul").css("display","none");
	$(".all_stu3 li").css("background-color","#FFF");
	if($(".all_stu_hover").css("display")=="none"){
		$(".all_stu_hover").css("display","block");
	}else{
		$(".all_stu_hover").css("display","none");
	}
});
$(".all_stu_bj0").on("click","li",function(){
	$("#gc_name").val(gname+" "+$(this).text());
	$(".all_stu_hover").css("display","none");
	$(".all_stu_bj0").css("display","none");
	if($(this).attr("data-type")=="c"){
		$("#cid").val($(this).attr("value"));
	}
});
$(".stu_state_ul li").click(function(){
	$(".stu_state input").val($(this).html());
	$("#stu_state").val($(this).attr("data-value"));
	$(".stu_state_ul").css("display","none");
	flag10=true;
});
$(".add_stu_save").click(function () {
    
});
$(".teacher_save").click(function(){
	$(".stu_det_edit").html("学生详情");
	var options = {
	        url: '/school/student/edit',
	        type: 'post',
	        dataType: 'json',
	        data: $("#form1").serialize(),
	        success: function (data) {
	            if (data.code == '200') {
	            	$(".teacher_name").html($(".tea_name").val());
	            	$(".stu_name").html($(".tea_name").val());
	            	$(".sex").text($("#gender").val()=="1"?"男":"女");
	            	$(".teacher_age").html($(".tea_age").val()+"岁");
	            	$("#stuAddress").html($("[name='student.address']").val());
	            	$("#stuNum").html($("[name='student.student_number']").val());
	            	$("#classGrade").html($("#gc_name").val());
	            	$("#stuEntrancetime").html($(".jcDate").val());
	            	$("#stuState").html($(".stu_sate_input").val());
	            	$("#stuStudy").html($(".tea_stu_time").val()+"小时");
	            	
	            	$(".tea_base_msg1").css("display","block");
	            	$(".tea_base_msg2").css("display","none");
	            	$(".stu_btn").css("display","none");
	            	$(".teacher_edit").css("display","block")
	            	$(".stu_right").css("width","860px");
	            } else {
	                alert(data.description);
	            }
	        }
	    };
	    $.ajax(options);
	    return false;     
});
$(".teacher_base2_contsave").click(function () {
    $.ajax({
        url: "/school/student/editParentName",    //请求的url地址
        dataType: "json",   //返回格式为json
        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
        data: {
        	stuId:$("#stuId").val(),
        	phone:$("#stuPhone").val(),
        	parentType:$("#parentType").val(),
        	parentName:$("#parentName").val()
        },    //参数值
        type: "post",   //请求方式
        success: function (data) {
            //请求成功时处理
            if (data.code == '200') {
            	$(".teacher_bmsg1").css("display","block");
            	$(".teacher_bmsg2").css("display","none");
            	$(".teacher_base2_edit").css("display","block");
            	//点击保存修改数据对应的数据改变点击保存以后相应的数据就改变。
            	$(".stu_second").find("span").eq(0).html($("#stuPhone").val());
            	$(".stu_first").find("span").eq(0).html($("#parentType").val());
            	$(".stu_first").find("span").eq(1).html($("#parentName").val());
            	flag1=true;
            } else {
                alert(data.description);
            }

        }
    });
});
$(".stu_state").click(function(){
	if($(".stu_state_ul").css("display")=="none"){
		$(".stu_state_ul").css("display","block")
	}else{
		$(".stu_state_ul").css("display","none")
	}
});	
$(".tea_stu_link li").click(function(){
	$("#parentType").val($(this).html());
	$(".tea_stu_link").css("display","none");
})
$(".tea_link").click(function(){
	$(".tea_stu_link").css("display","block");
});
</script>
</@html>