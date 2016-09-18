<#include "/page/school/common/_layout.ftl"/>
<@html title="学生首页 - ${siteTitle!}" description="">

<link rel="stylesheet" href="${baseUrl!}/static/school/css/stu_msg.css"/>
<link rel="stylesheet" href="${baseUrl!}/static/school/css/jcDate.css" />
<script type="text/javascript" src="/static/school/js/student_msg.js"></script>
<script type="text/javascript" src="/static/school/js/jQuery-jcDate.js" ></script>

<!-- Jquery 异步提交表单-->
<script src="/static/js/jquery.form.js"></script>

	<div class="stusent_batch">
			<div class="stu_all_change"></div>
			<!--新增学生弹窗开始-->
			<div class="add_new_student">
				<div class="add_new_top">新增学生</div>
				<div class="add_new_center">
					<div class="add_new_tit">
						<div class="add_new_hx0"></div>
						<div class="add_new_cent">基本信息</div>
						<div class="add_new_hx1"></div>
					</div>
					<div class="add_stu_cent">
						<form id="form1" >
						<div class="add_stu_cent1">
							<div class="add_stu_name">*姓名</div>
							<input type="text" value="张亮亮" name="student.name" />
						</div>
						<div class="clear"></div>
						<div class="add_stu_cent1 add_stu_overflow">
							<div class="add_stu_name">*性别</div>
							<div class="add_stu_sex">
								<div class="boy">
									<span class="circle" style='background: url(/static/school/img/spirit_img.png) no-repeat -197px -54px;'></span>
									<span>男</span>
								</div>
								<div class="girl">
									<span class="circle"></span>
									<span>女</span>
								</div>
								<input type="hidden" value="1" id="gender" name="student.gender" />
							</div>
						</div>
						<div class="clear"></div>
						<div class="add_stu_cent1">
							<div class="add_stu_name">*年龄</div>
							<input type="text" value="12" name="student.age" />
						</div>
						<div class="clear"></div>
						<div class="add_stu_cent1">
							<div class="add_stu_name">*学籍号</div>
							<input type="text" value="2015091003219" name="student.student_number" />
						</div>
						<div class="clear"></div>
						<div class="add_stu_cent1">
							<div class="add_stu_name">*入学时间</div>
							<div class="add_insert">
								<input class="add_insert_time jcDate" type="text" value="2016-3-4" name="student.entrancetime" />
								<span class="insert_down"></span>
							</div>
						</div>
						<div class="clear"></div>
						<div class="add_stu_cent1">
							<div class="add_stu_name">*亲属联系电话</div>
							<!--<input type="text" value="18712752351" />-->
							<div class="add_relation">
								<div class="add_relate">
									<div class="add_relate_down">
										<input class="add_relation_name0" type="text" value="爸爸"  name="student.parent_type" />
										<span class="add_span"></span>										
									</div>
									<ul class="add_relation_ul">
										<li>妈妈</li>
										<li>爷爷</li>
									</ul>
								</div>
								<input class="add_relation_nam1" type="text" value="张明" name="student.parent_name" />
								<input class="add_relation_phone" type="text" value="18712752351" name="student.phone" />
							</div>
						</div>
						<div class="clear"></div>
						<div class="add_stu_cent1">
							<div class="add_stu_name">*学习时长</div>
							<input type="text" value="20" name="student.study_time" />
						</div>
						<div class="clear"></div>
						<div class="add_stu_cent1">
							<div class="add_stu_name">*家庭地址</div>
							<input type="text" value="北京市朝阳区鹿港小镇A2单元605室" name="student.address" />
						</div>
						<div class="clear"></div>
						</form>
					</div>
				</div>
				<div class="add_stu_btn">
					<input class="add_stu_cancle" type="button" value="取消" />
					<input class="add_stu_save" type="button" value="确定" />
				</div>
			</div>
			<!--新增学生弹窗结束-->
			<!--更改弹窗-->
			<div class="change_class">
				<p class="change_class_tit">更改班级</p>
				<div class="change_class1">
					<span class="change_class2">年级班级</span>
					<div class="change_class3">
						<input class="change_class4" data-gname="" data-value="0" readonly="readonly" value="选择"/>
						<span class="change_class3_down"></span>
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
								<ul>
								</ul>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="change_btn">
					<input class="change_btn_cancle" type="button" value="取消" />
					<input class="change_btn_save" type="button" value="保存" />
				</div>
			</div>
			<div class="change_statue">
				<p class="change_tit">更改状态</p>
				<div class="change_statue1">
					<span class="change_statue2">更改状态</span>
					<div class="change_statue3">
						<input class="change_statue4" data-value="1" readonly="readonly" value="在读"/>
						<span class="change_statue3_down"></span>
						<!--<img class="change_statue3_down" src="/static/school/img/down2_03.gif" />-->						
					</div>
						<div class="change_statue_bj">
							<ul>
								<li data-value="2">休学</li>
								<li data-value="3">转学</li>
								<li data-value="4">毕业</li>
							</ul>
						</div>
				</div>
				<div class="clear"></div><!--添加-->
				<div class="change_statue_btn">
					<input class="change_statue_cancle" type="button" value="取消" />
					<input class="change_statue_save" type="button" value="保存" />
				</div>
			</div>
			
			<!--更改结束-->
		<div class="stusent_mag">
			<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li><</li>
						<li>学生管理</li>
					</ul>
				</div>
				<!--添加结束-->
			<div class="stu_center">
				<div class="stu_cen">
					<div class="stu_search">
						<div class="stu_searchk">
							<input type="text" id="stuName" placeholder="请输入学生名字查询" />
							<div class="stu_search1"></div>
						</div>
					</div>
					<div class="all_stu">
						<div class="all_stu1">
							<input class="all_brn_stu" type="button" value="${showTitle!'全部学生'}" />
							<div class="stu_down"></div>
							<div class="all_stu_hover">
								<div class="all_stu3">
									<ul>
										<li data-type='g' value="-1" onmouseover="overGrade(this)">全部</li>
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
						<span class="stu_num">共${(page.totalRow)!'0'}人</span>
						<div class="all_stu2">
							<div class="all_stu2_batch">
								<div class="all_stu2_check">
									<a class="stu_check" href="javascript:;"></a><span>全选</span>
								</div>
								<a class="batch_href1" href="javascript:void(0)">新增学生</a>
								<input class="batch_href2" type="button" value="批量管理"/>
								<input class="all_stu_import" type="button" value="导入excle表格" />
								<input class="all_stu2_cancel" type="button" value="取消" />
								<div class="all_stu2_edit">
									<input class="all_stu2_edit1" type="button" value="编辑" />
									<!--<img src="/static/school/img/down_11.gif"/>-->
								</div>
								<ul class="stu_change">
									<li class="change_alter">更改班级</li>
									<li class="change_state">更改状态</li>
								</ul>
							</div>
						</div>
					</div>
				 <#if page??>
					<div class="every_stu">
						<ul class="every_stu1">
                   		<#list page.getList() as student>
							<li data-default-val="${student.id!}" data-value="" onclick="jump(this,${student.id!})">
								<img class="stu_batch_check" src="/static/school/img/student/u45.png"/>
									<div class="stu_tx">
										<img src="${student.avatar!}"/>
									</div>
									<p class="stu_name">${student.name!}</p>
									<p class="stu_class">${student.gradeName!'无分配班年级'}&nbsp;&nbsp;${student.className!}</p>	
									<p class="stu_number"><span>学籍：</span><span>${student.student_number!}</span></p>
								<!--</a>-->
							</li>	
						</#list>
						</ul>
						<div class="clear"></div><!--添加-->
					</div>
					<#include "/page/school/common/_paginate.ftl"/>
                    <@paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${baseUrl!}/school/student/index" urlParas="&grade_id=${grade_id!}&class_id=${class_id! }&showTitle=${showTitle! }" />
					</#if>
				</div>
			</div>
		</div>
	</div>
    <script>
	function stuCancle(){
		$(".batch_href1").css("display","block");
		$(".batch_href2").css("display","block");
		$(".all_stu2_cancel").css("display","none");
		$(".all_stu2_check").css("display","none");
		$(".all_stu2_edit").css("display","none");
		$(".stu_batch_check").css("display","none");
		$(".stu_change").css("display","none");
		$(".every_stu1 li").removeClass("li_act");
		$(".stu_batch_check").attr("src","/static/school/img/student/u45.png");
		$(".stu_check").css("background","url('/static/school/img/spirit_img.png') -218px -54px no-repeat;")
		$(".every_stu1 li").each(function(){
			$(this).attr("data-value","");
		});
		flag5=true;
		flag8=true;
	}
	 $(".change_hover_div2").on("click","li",function(){
        	$(".change_class4").val(gname+$(this).text());
        	$(".change_hover").css("display","none");
        	$(".change_class4").attr("data-value",$(this).attr("value"));
        });
	 $(".change_btn_save").click(function(){
		var arr = [];
        $(".every_stu1 li").each(function(){
    		var id=$(this).attr("data-value");
    		if(id !=null&&id!=""){
    			arr.push(id);
    		}
    	});
        if(arr==null || arr.length<1){
        	alert("请选择学生");
        	return;
        }
        if($(".change_class4").attr("data-value")=="0"){
        	alert("请选择班级");
        	return;
        }
        //已经准备好选中数组
        $.ajax({
            url: "/school/student/updateClass",    //请求的url地址
            dataType: "json",   //返回格式为json
            async: true, //请求是否异步，默认为异步，这也是ajax重要特性
            data: {"sids": arr, "cid": $(".change_class4").attr("data-value")},    //参数值
            type: "post",   //请求方式
            success: function (data) {
                //请求成功时处理
                if (data.code == '200') {
                    $(".every_stu1 li").each(function(){
		        		var id=$(this).attr("data-value");
		        		if(id!=""){
		        			$(this).find(".stu_class").text(gname+" "+$(".change_class4").val());
		        		}
		        	});
                    $(".stu_all_change").css("display","none");
					$(".change_class").css("display","none");
					stuCancle();
                } else {
                    alert(data.description);

                }

            }
        });
	 })
        /*批量更改学生状态*/
        $(".change_statue_save").click(function () {
            var arr = [];
            $(".every_stu1 li").each(function(){
        		var id=$(this).attr("data-value");
        		if(id !=null&&id!=""){
        			arr.push(id);
        		}
        	});
            if(arr==null || arr.length<1){
            	alert("请选择学生");
            	return;
            }
            //已经准备好选中数组
            $.ajax({
                url: "/school/student/updateStates",    //请求的url地址
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {"sids": arr, "state": $(".change_statue4").attr("data-value")},    //参数值
                type: "post",   //请求方式

                success: function (data) {
                    //请求成功时处理
                    if (data.code == '200') {
                        $(".change_statue").css("display","none");
                    	$(".stu_all_change").css("display","none");
                    	stuCancle();
                    } else {
                        alert(data.description);
                    }

                }
            });
        });
        
        $(".all_stu1").on("click","li",function(){
        	$(".all_brn_stu").val($(this).text());
        	$(".all_stu3").css("display","none");
        	$(".all_stu_bj0").css("display","none");
        	if($(this).attr("data-type")=="g"){
        		location.href="/school/student?grade_id="+$(this).attr("value")+"&showTitle="+$(this).text();
        	}else{
        		location.href="/school/student?class_id="+$(this).attr("value")+"&showTitle="+$(this).text();
        	}
        });
        
        $(".stu_search1").click(function(){
        	if($("#stuName").val()==""||$("#stuName").val()=="学生姓名不能为空"){
				$("#stuName").addClass("stuact");
				$("#stuName").val("学生姓名不能为空");
				$("#stuName").blur();
				$("#stuName").focus(function(){
						$("#stuName").removeClass("stuact");
						$("#stuName").val("");
					});		
        		return;
        	}
        	location.href="/school/student?name="+$("#stuName").val()+"&&showTitle=学生";
        });
      //添加敲回车来搜索
		$("#stuName").keydown(function(e){
			var evt=e||event;
			if(evt.keyCode==13){
				if($("#stuName").val()==""||$("#stuName").val()=="学生姓名不能为空"){
					$("#stuName").addClass("stuact");
					$("#stuName").val("学生姓名不能为空");	
					$("#stuName").blur();
					$("#stuName").focus(function(){
							$("#stuName").removeClass("stuact");
							$("#stuName").val("");
						});					
				}else{
					location.href="/school/student?name="+$("#stuName").val()+"&&showTitle=学生";
				}
			}else{
				$("#stuName").removeClass("stuact");
			}
		});	
		//添加结束
		//添加全选
		var flag8=true;
		var num2=0;
		var extend2=$(".every_stu1 li").size();
		$(".stu_check").click(function(){
			var all_check=getClassNames("stu_batch_check","img");
			if(flag8){
				$(".every_stu1 li").addClass("li_act");
				$(".stu_batch_check").attr("src","/static/school/img/student/success2_07.png");
				$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -240px -54px");
				$(".every_stu1 li").each(function(){
					$(this).attr("data-value",$(this).attr("data-default-val"));
				});
				flag8=false;
				num2=extend2;
			}else{
				$(".every_stu1 li").removeClass("li_act");
				$(".stu_batch_check").attr("src","/static/school/img/student/u45.png");
				$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
				$(".every_stu1 li").each(function(){
					$(this).attr("data-value","");
				});
				num2=0;
				flag8=true;
			}
		});		
        function jump(obj,id){
        	if($(obj).find(".stu_batch_check").css("display")=="none"){
        			location.href="/school/student/detail?id="+id;
        	}else{
        		if($(obj).find(".stu_batch_check").attr("src").indexOf("success2_07")<0){
        			$(obj).addClass("li_act");
        			$(obj).find(".stu_batch_check").attr("src","/static/school/img/student/success2_07.png");
        			$(obj).attr("data-value",id);
					num2++;
        		}else{
        			$(obj).removeClass("li_act");
        			$(obj).find(".stu_batch_check").attr("src","/static/school/img/student/u45.png");				
        			$(obj).attr("data-value","");
					num2--;
        		}
				if(num2==extend2){
					$(".stu_check").css({"background":"url('/static/school/img/spirit_img.png') -240px -54px no-repeat"});	
					flag8=false;			
				}else{
					$(".stu_check").css({"background":"url('/static/school/img/spirit_img.png') -218px -54px no-repeat"});						
					flag8=true;
				}
        	}
        }
		//添加结束
        $(".add_stu_save").click(function () {
            var options = {
                url: '/school/student/add',
                type: 'post',
                dataType: 'json',
                data: $("#form1").serialize(),
                success: function (data) {
                    if (data.code == '200') {
                    	if($(".every_stu1 li").length==10){
                    		$(".every_stu1 li").eq($(".every_stu1 li").length-1).remove();
                    	}
                    	 var stu_li ='<li data-default-val="'+data.detail.id+'" data-value="" onclick="jump(this,'+data.detail.id+')">'+
	            			'<img class="stu_batch_check" src="/static/school/img/student/u45.png"/>'+
	            			'<div class="stu_tx">'+
	            				'<img src="/static/img/default_avatar.png"/>'+
	            			'</div>'+
	            			'<p class="stu_name">'+$("[name='student.name']").val()+'</p>'+
	            			'<p class="stu_class">无分配班年级</p>'+	
	            			'<p class="stu_number"><span>学籍：</span><span>'+$("[name='student.student_number']").val()+'</span></p></li>'; 
                		$(".every_stu1").prepend(stu_li);
                        $(".add_new_student").css("display","none");
                    	$(".stu_all_change").css("display","none");
                    } else {
                        alert(data.description);
                    }


                }
            };
            $.ajax(options);
            return false; 
        });
    </script>
</@html>