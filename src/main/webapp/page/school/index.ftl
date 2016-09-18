<#include "/page/school/common/_layout.ftl"/>
<@html title="首页 - ${siteTitle!}" description="">
<link rel="stylesheet" href="/static/school/css/index.css" />
<script type="text/javascript" src="/static/school/js/index.js" ></script>
<div class="first_screen" style="display:none;"></div>
		<div class="first_alert" style="display:none;">
			<div class="f_title">首次登录</div>
			<div class="change_pwd">
				<form id="change_pwd_form" onsubmit="return checkpwd()">
					<div class="newpwd">
						<span>新密码</span><input name="new_password" type="password" value="" />
					</div>
					<div class="oldpwd">
						<span>确认密码</span><input name="new_password2" type="password" value="" />
					</div>
					<div class="sumbtn">
						<input class="sumbtn_cancel" type="button" value="取消" />
						<input class="sumbtn_confirm" type="button" value="登录" />
					</div>					
				</form>
			</div>
			<p class="change_tip">为了保障帐号安全请您首次登录更改密码</p>
		</div>
		<!--首次登陆弹窗提醒-->
		<div class="index">
			<div class="index_center">
				<div class="index_center_top">
					<div class="index_top_left">
						<div class="manage course">
							<a href="${baseUrl!}/school/courseware.html">
								<img src="/static/school/img/school_index_07.png"/>
								<p>课件管理</p>
							</a>
						</div>
						<div class="manage student">
							<a href="${baseUrl!}/school/student.html">
								<img src="/static/school/img/school_index_08.png"/>
								<p>学生管理</p>
							</a>
						</div>
						<div class="manage teacher">
							<a href="${baseUrl!}/school/teacher.html">
								<img src="/static/school/img/school_index_09.png"/>
								<p>教师管理</p>
							</a>
						</div>
						<div class="manage class">
							<a href="${baseUrl!}/school/class.html">
								<img src="/static/school/img/school_index_13.png"/>
								<p>班级管理</p>
							</a>
						</div>
						<div class="manage device">
							<a href="${baseUrl!}/school/piano.html">
								<img src="/static/school/img/school_index_14.png"/>
								<p>设备管理</p>
							</a>
						</div>
					</div>
					<div class="index_center_right">
						<div class="index_right_cen">
							<div class="index_news">
								<div class="index_newscen">
									<span class="index_newman">消息公告</span><a class="index_more" href="/school/notification">更多</a>									
								</div>
							</div>
							<div class="index_courseware">
								<ul>
								  <#list notifys! as list>
									<li data-id="${list.id! }" data-is_read="${list.is_read! }">
											<div class="mannews manage_pic">
												<a class="<#if list.type?? && list.is_read??>
												<#if list.type=='1'>
													<#if list.is_read=='1'>kj_logo2<#else>kj_logo6</#if>
												<#elseif list.type=='2'>
													<#if list.is_read=='1'>kj_logo0<#else>kj_logo5</#if>
												<#elseif list.type=='3'>
													<#if list.is_read=='1'>kj_logo1<#else>kj_logo1</#if>
												<#else>
													<#if list.is_read=='1'>kj_logo3<#else>kj_logo3</#if>
												</#if>
											</#if>" href="javascript:;">
												</a>
											</div>
											<div class="mannews manage_cont">
												<a href="javascript:;"><span class="manage_new"><#if list.type??><#if list.type=="1">通知<#elseif list.type=="2">示范课<#elseif list.type=="3">课件：<#else>${list.autho! }</#if></#if></span><p class="manage_detail">${list.message!}</p></a>
											</div>
											<div class="mannews manage_date">
												<span class="mandate">${(list.create_time)!?string('MM-dd') }</span>
											</div>											
									</li>
								  </#list>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="index_center_bot">
					<div class="index_bot_left">
						<div class="index_bcen">
							<div class="index_bcen_top">
								<span>钢琴故障报修列表</span>
								<p><a href="/school/piano.html">更多</a></p>
							</div>
							<div class="index_bcen_bot">
								<div class="index_botul">
									<ul>
										<li class="index_pinaoid">钢琴ID</li>
										<li class="index_class">教室</li>
										<li class="index_type">故障类型</li>
										<li class="index_exp">故障说明</li>
										<li class="index_repairs">报修日期</li>
										<li class="index_checkdet">查看详情</li>
									</ul>
								</div>
								<div class="index_bot_msg">
								  <#list pianoMals! as list>
									<div class="index_bot_msgul">
										<a class="index_bot_a <#if list.dispose_mode ??><#if list.dispose_mode=='1'>adaptive0<#else>adaptive1</#if></#if>" href="javascript:;">
										</a>
										<ul>										
											<li>${list.piano_id! }</li>
											<li>${list.building! }-${list.name! }</li>
											<li class="exp"><#if list.type ??><#if list.type=='1'>设备故障<#elseif list.type=='2'>人为损坏<#else>钢琴换新</#if></#if></li>
											<li class="bot_exp">${list.description! }</li>
											<li class="bot_date">${list.create_time!?string('MM-dd') }</li>
											<li class="bot_prev"><a href="/school/piano/detail/${list.pid! }"></a></li>
										</ul>
									</div>
							      </#list>	
								</div>
							</div>
						</div>
					</div>
					<div class="index_bot_right">
						<div class="index_bot1" onclick="location.href='/school/share.html'">
							<div class="index_bot2"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
<script type="text/javascript">
$(function(){
	$(".sumbtn_confirm").click(function(){
		if(checkpwd()){
			var options = {
	                url: '/school/user/changePassword',
	                type: 'post',
	                dataType: 'json',
	                data: $("#change_pwd_form").serialize(),
	                success: function (data) {
	                    if (data.code == '200') {
	                    	$(".first_screen").css("display","none");
	                		$(".first_alert").css("display","none");
	                    } else {
	                        alert(data.description);
	                    }
	                }
	            };
	            $.ajax(options);
	            return false; 
		}
	});
	if("${firstLogin!}"=="1"){
		$(".first_screen").css("display","block");
		$(".first_alert").css("display","block");
	}
	$(".index_courseware li").click(function(){
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
})

</script>
</@html>