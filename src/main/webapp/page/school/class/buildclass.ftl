<#include "/page/school/common/_layout.ftl"/>
<@html title="新增班级 - ${siteTitle!}" description="">

<link rel="stylesheet" href="/static/school/css/buildclass.css"/>
<script type="text/javascript" src="/static/school/js/build.js"></script>

<!-- Jquery 异步提交表单-->
<script src="/static/js/jquery.form.js"></script>

		<div class="lr_success">
			<div class="lr_success_top">
				<span class="allready">已选学生</span>
				<input class="lr_go" type="button" value="继续添加" />
			</div>
			<div class="lr_success1">
				<ul>
				</ul>
			</div>
			<div class="lr_next">
				<input type="button" value="下一步" />
			</div>
		</div>
		<div class="buildclass">
			<!--添加-->
			<div class="common_top">
				<ul>
					<li>首页</li>
					<li><</li>
					<li>班级管理</li>
					<li><</li>
					<li>新增班级</li>
				</ul>
			</div>
			<!--添加结束-->
			<div class="build">
				<div class="build_center">
					<p class="buildtit">新增班级</p>
					<div class="buildcenter">
						<ul class="bc1">
							<li>建立班级</li>
							<li>录入教师</li>
							<li>录入学生</li>
							<li>完成</li>
						</ul>
						<div class="circle">
							<img src="/static/school/img/class/pic9.png" />
						</div>
					</div>
					<div class="allbuilds">
						<!--开始-->
						<div class="allbuild1">
							<div class="buclass">
							<form id="form1">
								<div class="busp">
									<span>年级</span>
									<div class="bnj">
										<input class="selecnj" readonly="readonly" type="text" />
										<input id="grade_id" type="hidden" name="grade.id" value="">
										<span></span>
									</div>
									<div class="njdown">
										<div class="nj_down_cont">
											<ul>
											<#list gradeList as list>
												<li value="${list.id! }">${list.name! }</li>
											</#list>
											</ul>
											<div class="addbtn">
												<div class="addbtn1">
													<span class="add1"></span><span class="add2">自定义</span>
												</div>
											</div>
										</div>
										<div class="addbtn2">
											<input class="addnj" type="text" value="" placeholder="示例：一年级" />
											<span class="addsub">新增</span>
										</div>
									</div>
								</div>
								<!--改变-->
								<div class="bj">
									<div class="bj_titl">
										<span>班级</span>
										<input type="text" name="classInfo.name" placeholder="示例:三班" value="" />
										<input id="class_id" type="hidden" value=""/>
									</div>
								</div>
								<!--结束-->
								<div class="sumb">
									<input class="bsub" type="button" value="下一步" />
								</div>
								</form>
							</div>
							
						</div>
						<div class="allbuild2">
							<div class="selteacher">
								<div class="selt1">
									<p class="seltit">选择教师</p>
									<div class="allselct">
										<!--<input class="allcheck" type="checkbox" value="" />-->
										<span class="allcheck"></span>
										<span class="allcekmsg">全选</span>
									</div>
								</div>
								<div class="newteacher">
									<div class="newtea">
										<ul>
										<#list teacherPage.list! as list>
											<li data-value="" default-value="${list.id!}" onclick="class_skip(this,${list.id!})">
												<img class="tcheck" src="/static/school/img/class/u45.png" />
												<div class="ntx">
													<img src="${(list.avatar)! }" />
												</div>
												<div class="ntp">
													<p class="tea_name">${(list.name)! }</p>
													<p><#if (list.job)??><#if list.job=="1">高级教师<#elseif list.job=="2">中级教师<#else>初级教师</#if></#if></p>
												</div>
											</li>
										 </#list>
										</ul>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							<!--添加跳过开始-->
							<div class="jump_teacher">
								<input class="jump_step2" type="button" value="跳过此步" />
								<input class="sub" type="submit" value="下一步" />
								<div class="clear"></div>
							</div>
						<#include "/page/school/common/_paginate_agax.ftl"/>
                    	<@paginate_agax currentPage=teacherPage.pageNumber totalPage=teacherPage.totalPage actionUrl="/school/class/getTeacherByPage" urlParas="" />
							<!--添加跳过结束-->
						</div>
						<div class="allbuild3">
							<div class="selteacher">
								<div class="selt1">
									<p class="seltit">选择学生</p>
									<div class="allselct1">
										<!--<input class="allcheck1" type="checkbox" value="" />-->
										<span class="allcheck1"></span>
										<span class="allcekmsg1">全选</span>
									</div>
								</div>
								<!--改变class名-->
								<div class="newteacher">
									<div class="newtea0">
										<ul class="newtea0_ul">
										<#list studentPage.list! as list>
											<li onclick="class_jump(this)" default-value="${list.id! }" data-value="">
												<img class="tcheck1" src="/static/school/img/class/u45.png" />
												<div class="ntx">
													<img src="${(list.avatar)! }" />
												</div>
												<div class="ntp">
													<p class="ntp0">${(list.name)! }</p>
													<p class="ntp1">无分配班级</p>
													<p class="ntp2">学籍:<span>${(list.student_number)! }</span></p>
												</div>
											</li>
										</#list>
										</ul>
										<div class="clear"></div>
										
									</div>
								</div>
							</div>
							<!--添加3个录入按钮-->
							<div class="build_btns">
								<input class="jump_step" type="button" value="跳过此步" />
								<input class="sub_com sub1" type="submit" value="录入" />
								<div class="clear"></div>
							</div>
							<div class="clear"></div>
							<#include "/page/school/common/_paginate_agax2.ftl"/>
                    		<@paginate_agax2 currentPage=studentPage.pageNumber totalPage=studentPage.totalPage actionUrl="/school/class/getStuByPage" urlParas="" />
						</div>
						<div class="allbuild4">
							<div class="over">
								<div class="allover">
									<span class="over_logo"></span>
									<span>新增班级成功</span>
									</div>
								<input class="btnback" onclick="location.href='/school/class.html'" type="button" value="返回班级管理" />
							</div>
						</div>
						<!--结束-->
					</div>
				</div>
			</div>
		</div>
<script type="text/javascript">
/*新增年级*/
$(".addsub").click(function () {

    $.ajax({
        url: "/school/grade/add",    //请求的url地址
        dataType: "json",   //返回格式为json
        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
        data: {"name": $(".addnj").val()},    //参数值
        type: "post",   //请求方式

        success: function (data) {
            //请求成功时处理
            if (data.code == '200') {
                $(".addnj").val(data.detail.name);
                var newli = $("<li value='"+ data.detail.id +"'>" + $(".addnj").val() + "</li>");
                $(".njdown ul").append(newli);
            } else {
                alert(data.description);
            }

        }
    });

});
function showAddStudentDiv(){
	$(".allbuild1").css("display","none");
   	$(".allbuild2").css("display","none");
   	$(".allbuild3").css("display","block");
   	$(".allbuild4").css("display","none");
   	$(".allselct").css("display","none");
    $(".circle img").attr("src","/static/school/img/class/pic11.png");
}
$(".jump_step2").click(function(){
	$(".newtea li").each(function(){
		$(this).attr("data-value","");
		showAddStudentDiv();
	});
});
$(".jump_step").click(function(){
	$(".newtea0 li").each(function(){
		$(this).attr("data-value","");
	});
});
$(".sub").click(function(){
 	var tids = [];
 	$(".newtea li").each(function(){
 		var tid = $(this).attr("data-value");
		 if(tid !=null&&tid!=""){
			 tids.push(tid);
		 }
 	});
 	if(tids.length<1){
 		alert("请选择教师");
 		return;
 	}
 	$.ajax( {  
 	     url:'addClassTeachers',// 跳转到 action     
 	     data:{  
 	             tids : tids,
 	            class_id:$("#class_id").val()
 	    },
 	     async:false,  //同步
 	     type:'post',      
 	     dataType:'json',  
 	     success:function(data) {  
 	         if(data.code =="200" ){
 	        	showAddStudentDiv();
 	         }else{  
 	            view(data.description);  
 	        }  
 	     },  
 	      error : function() {  
 	           alert("异常！");  
 	     }  
 	});

});
$(".lr_next input").click(function(){
 	if(global_sids.length<1){
 		alert("请选择学生");
 		return;
 	}
	$.ajax( {  
	     url:'addClassStudents',// 跳转到 action     
	     data:{  
	     		sids : global_sids,
	            class_id:$("#class_id").val()
	    },
	     async:false,  //同步
	     type:'post',      
	     dataType:'json',  
	     success:function(data) {  
	         if(data.code =="200" ){
	        	$(".allbuild1").css("display","none");
        	   	$(".allbuild2").css("display","none");
        	   	$(".allbuild3").css("display","none");
        	   	$(".allbuild4").css("display","block");
        	   	$(".lr_tc").css("display","none");
        	   	$(".lr_success").css("display","none");
        	   	$(".circle img").attr("src","/static/school/img/class/pic14.png");
	         }else{  
	            view(data.description);  
	        }  
	     },  
	      error : function() {  
	           alert("异常！");  
	     }  
	});	
   	
});
/*添加录入事件*/
$(".sub1").click(function(){
	var sids = [];
	$(".newtea0 li").each(function(){
		var sid = $(this).attr("data-value");
		if(sid !=null&&sid!=""){
			sids.push(sid);
		}
	});
	if(sids.length<1){
		alert("请选择学生！");
		return;
	}
	$(".newtea0 li").each(function(){
		var sid = $(this).attr("data-value");
		if(sid!=""){
			if($.inArray(sid,global_sids)==-1){
				global_sids.push(sid);
				var newtcheck1=$("<li data-value='"+sid+"' class='lr_success1_li'>" +
						"<span class='lr_del' onclick='removeStu(this,"+sid+")'></span>" +
					    "<div class='lr_tx'>" +
					    	"<img src='"+$(this).find(".ntx").find("img").attr('src')+"'/>" +
					    "</div>" +
					    "<div class='lr_msg'>" +
					    	"<p class='lr_msg1'>"+$(this).find(".ntp0").html()+"</p>" +
					    	"<p class='lr_msg2'>"+$(this).find(".ntp1").html()+"</p>" +
					    	"<p class='lr_msg3'>" +
					    	"学籍:<span>"+$(this).find(".ntp2 span").html()+"</span>" +
					    	"</p>" +
					    "</div></li>");
				$(".lr_success1 ul").append(newtcheck1);
				
			}
		}
	});
	if(global_sids.length>0){
		$(".lr_tc").css("display","block");
		$(".lr_success").css("display","block");	
	}
	
});
function showPage(data){
$(".newtea li").remove();
 var list = data.detail.list;
 for(var i =0;i<list.length;i++){
	 var tea = list[i];
	 var text='<li onclick="class_skip(this,'+tea.id+')" default-value="'+tea.id+'" data-value="">'+
		'<img src="/static/school/img/class/u45.png" class="tcheck">'+
		'<div class="ntx">'+
			'<img src="'+tea.avatar+'">'+
		'</div>'+
		'<div class="ntp">'+
			'<p class="tea_name">'+tea.name+'</p>'+
			'<p>'+(tea.job=="1"?"高级教师":(tea.job=="2"?"中级教师":"初级教师"))+'</p>'+
		'</div>'+
	'</li>';
	$(".newtea ul").append(text);
 }
	$(".allcheck").css("background","url('/static/school/img/spirit_img.png') -240px -54px no-repeat");
}
function showPage2(data){
	 $(".newtea0 li").remove();
	 var list = data.detail.list;
	 for(var i =0;i<list.length;i++){
		 var stu = list[i];
		 var text='<li onclick="class_jump(this)" default-value="'+stu.id+'" data-value="">'+
			'<img src="/static/school/img/class/u45.png" class="tcheck1">'+
			'<div class="ntx">'+
				'<img src="'+stu.avatar+'">'+
			'</div>'+
			'<div class="ntp">'+
				'<p class="ntp0">'+stu.name+'</p>'+
				'<p class="ntp1">无分配班级</p>'+
				'<p class="ntp2">学籍:<span>'+stu.student_number+'</span></p>'+
			'</div>'+
		'</li>';
		$(".newtea0 ul").append(text);
	 }
		$(".allcheck1").css("background","url('/static/school/img/spirit_img.png') -240px -54px no-repeat");
}
</script>

</@html>