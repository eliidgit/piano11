<#include "/page/school/common/_layout.ftl"/>
<@html title="课件首页 - ${siteTitle!}" description="">

<link rel="stylesheet" href="${baseUrl!}/static/school/css/courseware.css"/>

<script type="text/javascript" src="/static/school/js/course_ware.js"></script>

<!-- Jquery 异步提交表单-->
<script type="text/javascript" src="/static/js/jquery.form.js"></script>
<div class="lr_tc"></div>
<div class="loading"><img src="/static/school/img/pic19.png"/></div>

<div class="courseware">
				<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li><</li>
						<li>课件管理</li>
						<li><</li>
						<li class="course_ware_li">课件</li>
					</ul>
				</div>
				<!--添加结束-->
				<div class="courseware_center">
					<div class="courseware_center1">
						<div class="course_top">
							<ul>
								<li class="course_topact">课件</li>
								<li>示范课</li>
							</ul>
							<div class="course_search" style="display:none;">
								<input class="classserach1" type="text" placeholder="请输入示范课名称查询" />
								<div class="classserach2"></div>
							</div>
						</div>	
						<div class="course_search_k">
							<div class="course_select">
								<div class="class_select0 class_select">
									<ul>
									<#list gradeList! as list>
										<li data-value="${list.course_id! }" class="<#if list_index==0>class_seact</#if>">${list.name! }</li>
									</#list>	
									</ul>
								</div>
								<div class="class_select1 class_select">
									<ul>
									<#list gradeList! as list>
										<#if list_index==0>
											<input type="hidden" id="courseId" class="parameter" value="course_id=${list.course_id! }"  />
										</#if>
										<li data-value="${list.course_id! }" class="<#if list_index==0>class_seact</#if>">${list.name! }</li>
									</#list>
									</ul>
								</div>
								<!--添加结束-->
							</div>
							<div class="clear"></div><!--添加div-->
						</div>
				<!--课件-->
				<div class="sumcourse" style="min-height:500px;">						
						<div class="courseware_center_sum0">
						<div class="courseware_center_s">
							<#list courseParts! as list>
							<div class="courseware_li">
								<div class="courseware0"></div>
								<div class="courseware1">
									<p class="courfirst1">${list.name! }</p>
									<p class="courfirst2"><label>课时</label><span>8课时</span></p>
								</div>
								<div class="courseware2">
									<div class="courfirst3">
										<!-- 大家一起来识谱
										<div class="courseware_update">更新</div> -->
									</div>
								</div>
								<div class="courseware3">
									<input type="button" onclick="location.href='/school/courseware/detail/${list.id}-${list.name! }'" value="查看课件"/>
								</div>								
							</div>
							</#list>
							<!--中心部分结束-->
						</div>
						</div>
						<!--示范课-->
					<div class="courseware_center_sum1  hide">
						<div class="courseware_center_s1">
						  <div class="demo_cens">
						  <#list pageDemolesson.list! as list>
							<a class="demo_cen" href="/school/courseware/demoDetail/${list.id! }">
								<div class="demo_cen1">
									<img src="${list.pic_path! }" />
									<div class="demo_cent_mask"></div><!--黑罩-->
									<div class="demo_start"></div>
									<#if list_index==0>
									<div class="new_demo"></div><!--添加的div-->
									</#if>
								</div>
								<p class="demo_name">${list.name! }</p>
							</a>
							</#list>
						</div>
					</div>
						<!--示范课结束-->
						<#include "/page/school/common/_paginate_agax.ftl"/>
                    		<@paginate_agax currentPage=pageDemolesson.pageNumber totalPage=pageDemolesson.totalPage actionUrl="/school/courseware/getPageDemoLessonByCourseId" urlParas="" />
					</div>
				</div>
				<!--页数-->
				</div>
			</div>
		</div>

<script>
function showPage(data){
	 if(data!=null && data.code =="200" ){
    	 $(".demo_cens").empty();
    	 for(var i = 0;i<data.detail.list.length;i++){
    		 var item=data.detail.list[i];
        	 var text='<a class="demo_cen" href="/school/courseware/demoDetail/'+item.id+'">'+
						'<div class="demo_cen1">'+
							'<img src="'+item.pic_path+'" />'+
							'<div class="demo_cent_mask"></div>'+
							'<div class="demo_start"></div>'+
							(i==0?'<div class="new_demo"></div>':'')+
						'</div>'+
						'<p class="demo_name">'+item.name+'</p>'+
					  '</a>';
        	 $(".demo_cens").append(text);
    	 }
     }
}
$(".classserach2").click(function(){
	if($(".classserach1").val()==null || $(".classserach1").val()==""|| $(".classserach1").val()=="名称不能为空"){
		$(".classserach1").addClass("classact");//添加
		$(".classserach1").val("名称不能为空");//添加
		$(".classserach1").focus(function(){
			$(".classserach1").removeClass("classact");
			$(".classserach1").val("");
		});
		return;
	}else{
		$(".demo_cens").empty();
		$.ajax( {  
		     url:'/school/courseware/getPageDemoLessonByName',// 跳转到 action     
		     data:{  
		             name : $(".classserach1").val()
		    },
		     async:false,  //同步
		     type:'post',      
		     dataType:'json',  
		     success:function(data) {  
		    	 $(".demo_cens").empty();
		         if(data.code =="200" && data.detail!=null){
		        	 for(var i=0;i<data.detail.list.length;i++){
		        		 var demolesson = data.detail.list[i];
			        	 var text='<a class="demo_cen" href="/school/courseware/demoDetail/'+demolesson.id+'">'+
										'<div class="demo_cen1">'+
											'<img src="'+demolesson.pic_path+'" />'+
											'<div class="demo_cent_mask"></div>'+
											'<div class="demo_start"></div>'+
											(i==0?'<div class="new_demo"></div>':'')+
										'</div>'+
										'<p class="demo_name">'+demolesson.name+'</p>'+
									'</a>';
			        	 $(".demo_cens").append(text);
		        	 }
		        	 return;
		         }else if(data.code =="201"){  
		            alert(data.description);  
		        } 
		         currentPage=1;
	        	 totalPage=1;
		     },  
		      error : function() {  
		           alert("异常！");  
		     }  
		});
	}
});
//敲回车来搜索
$(".classserach1").keydown(function(e){
	var evt=e||event;
	if(evt.keyCode==13){
		if($(".classserach1").val()==""){
			$(".classserach1").addClass("classact");
			$(".classserach1").val("名称不能为空");					
			$(".classserach1").focus(function(){
				$(".classserach1").removeClass("classact");
				$(".classserach1").val("");
			});
		}else{
			$(".classserach1").removeClass("classact");
			$(".demo_cens").empty();
			$.ajax( {  
				 url:'/school/courseware/getPageDemoLessonByName',// 跳转到 action     
				 data:{  
						 name : $(".classserach1").val()
				},
				 async:false,  //同步
				 type:'post',      
				 dataType:'json',  
				 success:function(data) {  
					 $(".demo_cens").empty();
					 if(data.code =="200" && data.detail!=null){
						 for(var i=0;i<data.detail.list.length;i++){
							 var demolesson = data.detail.list[i];
							 var text='<a class="demo_cen" href="/school/courseware/demoDetail/'+demolesson.id+'">'+
											'<div class="demo_cen1">'+
												'<img src="'+demolesson.pic_path+'" />'+
												'<div class="demo_cent_mask"></div>'+
												'<div class="demo_start"></div>'+
												(i==0?'<div class="new_demo"></div>':'')+
											'</div>'+
											'<p class="demo_name">'+demolesson.name+'</p>'+
										'</a>';
							 $(".demo_cens").append(text);
						 }
						 return;
					 }else if(data.code =="201"){  
						alert(data.description);  
					} 
					 currentPage=1;
					 totalPage=1;
				 },  
				  error : function() {  
					   alert("异常！");  
				 }  
			});
		}
	}else{
		$(".classserach1").removeClass("classact");
	}
});	
//结束
</script>
</@html>