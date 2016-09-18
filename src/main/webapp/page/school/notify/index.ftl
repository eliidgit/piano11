<#include "/page/school/common/_layout.ftl"/>
<@html title="消息公告- ${siteTitle!}" description="">
	<link rel="stylesheet" href="/static/school/css/msg_news.css" />
	<script type="text/javascript" src="/static/school/js/msg_news.js" ></script>
		<div class="lr_tc"></div>
		<div class="loading"><img src="/static/school/img/pic19.png"/></div>
		<!--头部结束-->
		<div class="msg_center">
			<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li><</li>
						<li>消息公告</li>
					</ul>
				</div>
				<!--添加结束-->
			<div class="msg_center1">
				<div class="msg_center2">
					<div class="msg_centit">消息公告</div>
					<div class="msg_center_kj">
						<ul>
						<#list notify.list! as list>
							<li data-id="${list.id! }" data-is_read="${list.is_read! }">
								<div class="kj_center">
									<div class="kj_mag">
										<div class="kj_logo_com <#if list.type?? && list.is_read??>
												<#if list.type=='1'>
													<#if list.is_read=='1'>kj_logo2<#else>kj_logo6</#if>
												<#elseif list.type=='2'>
													<#if list.is_read=='1'>kj_logo0<#else>kj_logo5</#if>
												<#elseif list.type=='3'>
													<#if list.is_read=='1'>kj_logo1<#else>kj_logo1</#if>
												<#else>
													<#if list.is_read=='1'>kj_logo3<#else>kj_logo3</#if>
												</#if>
											</#if>"></div>
										<div class="kj_cont">
											<span class="color_tit"><#if list.type??><#if list.type=="1">通知<#elseif list.type=="2">示范课<#elseif list.type=="3">课件：<#else>${list.autho! }</#if></#if></span>
											<span class="new_msg">${list.message!}</span>										
										</div>
									</div>
									<div class="kj_date">${(list.create_time)!?string('MM-dd') }</div>									
								</div>
							</li>
						  </#list>
						</ul>
					</div>		
					<#include "/page/school/common/_paginate.ftl"/>
                    <@paginate currentPage=notify.pageNumber totalPage=notify.totalPage actionUrl="${baseUrl!}/school/notification" urlParas="" />
				</div>
			</div>
		</div>
<script type="text/javascript">
$(".msg_center_kj li").click(function(){
	var id = $(this).attr("data-id");
	var is_read = $(this).attr("data-is_read");
	if(is_read==1){
		$.ajax( {  
		     url:'/school/updateNotifyRead',// 跳转到 action     
		     data:{
		            id : id
		          },
		     async:false,  //同步
		     type:'post',      
		     dataType:'json',  
		     success:function(data) {  
		         if(data.code =="200" ){  
		        	 
		         }else{  
		            alert(data.description);  
		        }  
		     },  
		      error : function() {  
		           alert("异常！");  
		     }  
		});

	}
	
});
</script>
</@html>