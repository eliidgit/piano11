<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>学习信息</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/studymsg.css" />
	</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<!-- <script type="text/javascript" src="/static/parents/js/study_msg.js" ></script> -->
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<body>
		<!--头部开始-->
		<a class="top" href="#">
			<div class="back"><img src="/static/parents/img/index/parents_index_01_03.png"></div>
			<p>学习信息</p>			
		</a>
		<!--头部结束-->
		<!--弹窗开始-->
		<div class="study_screen"></div>
		<div class="study_zj">
			<div class="study_titles">	
				<p class="study_title1">
					上传证件照
				</p>
				<p class="study_title2">
					能让老师更快的记住您的孩子
				</p>
			</div>
			<p class="study_photo">
				拍照	
			</p>
			<p class="study_select">
				从相册选择
			</p>
			<p class="study_zj_cancle">取消</p>
		</div>
		<!--弹窗结束-->
		<div class="studymsg_center">
			<div class="study_cent">
				<div class="study_opacity"></div>
				<div class="study_cent0 blur" id="back" style="background: url(${(session.user.avatar)! }) #fff no-repeat 50% -20px/70% 100%;"></div>
				<div class="study_cent1">
					<div class="study_cent1_tx">
						<a class="study_cent1_txhref" href="javascript:;"><img src="${(session.user.avatar)! }"/></a>
					</div>
					<div class="study_cent1_nickname">
						<p class="study_name">${(stu.name)! }</p>
						<#if (stu.gender)!="女">
						<img class="study_sex" src="/static/parents/img/study_msg/study_pc4.png"/>
						<#else>
						<img class="study_sex" src="/static/parents/img/study_msg/study_pc4.png"/>
						</#if>
					</div>
					<div class="study_cent1_ul">
						<ul>
							<li>
								<span class="study_cent_num1">年龄&nbsp;:&nbsp;</span>
								<span class="study_cent_num2">${(stu.age)! }岁</span>
							</li>
							<li class="study_cent_nums">
								<span class="study_cent_num1">班级&nbsp;:&nbsp;</span>
								<span class="study_cent_num2">${sGrade }${sClass }</span>
							</li>
							<li>
								<span class="study_cent_num1">积分&nbsp;:&nbsp;</span>
								<span class="study_cent_num2">${(stu.score)! }</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<#list lessons as lesson>
			<#if lesson_index==0>
			<div class="study_cent2">
				<div class="study_cent2_top">
					<span>课堂成绩</span>
				</div>
				<div class="study_cent2_bot">
					<div class="study_cent2_prul">
						<span class="study_cent2_period">lesson${(lesson.id)! }</span>
						<span class="study_cent2_reward">奖励</span>
						<ul>
						<#list 1..(lesson.level) as star>
							<li><img src="/static/parents/img/index/bigstar_07.png"/></li>
						</#list>
						</ul>
					</div>
					<div class="study_cent2_circula">
						<div class="study_cent2_cul">
						<#list (lesson.lus)! as lu>
							<#if lu_index==0>
							<div class="study_cent2_c a1">
								<div class="study_cent2_cimgs study_cent2_ps">
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/><img class="study_cent2_samll scpoint" src="/static/parents/img/study_msg/study_pc9.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==1>
							<div class="study_cent2_c a2">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_stop" src="/static/parents/img/study_msg/study_pc8.png"/>
									<img class="study_cent2_middle1 study_cent2_ps"  src="/static/parents/img/study_msg/study_pc10.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==2>
							<div class="study_cent2_c a3">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_start1" src="/static/parents/img/study_msg/study_pc1.png"/>
									<img class="study_cent2_middle2 study_cent2_ps" src="/static/parents/img/study_msg/study_pc11.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==3>
							<div class="study_cent2_c a4">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs study_cent2_ps">
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
									<img class="study_cent2_arch scpoint" src="/static/parents/img/study_msg/study_pc12.png"/>
								</div>								
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==4>
							<div class="study_cent2_c a5">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_big" src="/static/parents/img/study_msg/study_pc14.png"/>
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==5>
							<div class="study_cent2_c a6">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>	
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_big" src="/static/parents/img/study_msg/study_pc14.png"/>
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
								</div>								
								<div class="study_cent2_start">${lu.name }队</div>
							</div>
							</#if>
							<#if lu_index==6>
							<div class="study_cent2_c a7">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
						</#list>
						</div>
					</div>
					<div class="remark">
						<div class="remark1">
							<div class="remark_pic"><img src="/static/parents/img/index/parents_index_08.png"/></div>
							<p class="remark_msg">综合评语</p>
						</div>
						<div class="remark_hx">
							<img src="/static/parents/img/index/parents_index_09.png"/>
						</div>
						<div class="remark2">
							<p>${lesson.comment }</p>
						</div>
					</div>
				</div>
			</div>
			<#elseif lesson_index==(lessons?size-1)>
			<!-- 第三部分开始-->
			<div class="study_cent3">
				<div class="study_cent3_links">
					<div class="study_cent3_link1">
						<img src="/static/parents/img/study_msg/study_pc18.png"/>
					</div>
					<div class="study_cent3_link2">
						<img src="/static/parents/img/study_msg/study_pc18.png"/>
					</div>					
				</div>
				<div class="study_cent3_prul">
					<span class="study_cent3_period">lesson${(lesson.id)!}</span>
					<span class="study_cent3_reward">奖励</span>
					<ul>
					<#list 1..(lesson.level) as star>
							<li><img src="/static/parents/img/index/bigstar_07.png"/></li>
					</#list>
					</ul>
				</div>
				
				<!--添加-->
			<div class="study_cent2_bot_cent">
				<div class="study_cent2_bot">
					<div class="study_cent2_circula">
						<div class="study_cent2_cul">
						<#list (lesson.lus)! as lu>
							<#if lu_index==0>
							<div class="study_cent2_c a1">
								<div class="study_cent2_cimgs study_cent2_ps">
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/><img class="study_cent2_samll scpoint" src="/static/parents/img/study_msg/study_pc9.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==1>
							<div class="study_cent2_c a2">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_stop" src="/static/parents/img/study_msg/study_pc8.png"/>
									<img class="study_cent2_middle1 study_cent2_ps"  src="/static/parents/img/study_msg/study_pc10.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==2>
							<div class="study_cent2_c a3">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_start1" src="/static/parents/img/study_msg/study_pc1.png"/>
									<img class="study_cent2_middle2 study_cent2_ps" src="/static/parents/img/study_msg/study_pc11.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==3>
							<div class="study_cent2_c a4">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs study_cent2_ps">
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
									<img class="study_cent2_arch scpoint" src="/static/parents/img/study_msg/study_pc12.png"/>
								</div>								
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==4>
							<div class="study_cent2_c a5">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_big" src="/static/parents/img/study_msg/study_pc14.png"/>
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==5>
							<div class="study_cent2_c a6">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>	
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_big" src="/static/parents/img/study_msg/study_pc14.png"/>
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
								</div>								
								<div class="study_cent2_start">${lu.name }队</div>
							</div>
							</#if>
							<#if lu_index==6>
							<div class="study_cent2_c a7">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
						</#list>
						</div>
					</div>
					<div class="remark">
						<div class="remark1">
							<div class="remark_pic"><img src="/static/parents/img/index/parents_index_08.png"/></div>
							<p class="remark_msg">综合评语</p>
						</div>
						<div class="remark_hx">
							<img src="/static/parents/img/index/parents_index_09.png"/>
						</div>
						<div class="remark2">
							<p>${(lesson.comment)! }</p>
						</div>
					</div>
				</div>
				<div class="last_img">
					<img src="/static/parents/img/study_msg/study_msg_bot.png" />
				</div>
			</div>	
			<!--添加结束-->
			</div>
			<#else>
			<div class="study_cent3">
				<div class="study_cent3_links">
					<div class="study_cent3_link1">
						<img src="/static/parents/img/study_msg/study_pc18.png"/>
					</div>
					<div class="study_cent3_link2">
						<img src="/static/parents/img/study_msg/study_pc18.png"/>
					</div>					
				</div>
				<div class="study_cent3_prul">
					<span class="study_cent3_period">lesson${(lesson.id)! }</span>
					<span class="study_cent3_reward">奖励</span>
					<ul>
					<#list 1..(lesson.level) as star>
							<li><img src="/static/parents/img/index/bigstar_07.png"/></li>
					</#list>
					</ul>
				</div>
				
				<!--添加-->
			<div class="study_cent2_bot_cent">
				<div class="study_cent2_bot">
					<div class="study_cent2_circula">
						<div class="study_cent2_cul">
						<#list (lesson.lus)! as lu>
							<#if lu_index==0>
							<div class="study_cent2_c a1">
								<div class="study_cent2_cimgs study_cent2_ps">
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/><img class="study_cent2_samll scpoint" src="/static/parents/img/study_msg/study_pc9.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==1>
							<div class="study_cent2_c a2">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_stop" src="/static/parents/img/study_msg/study_pc8.png"/>
									<img class="study_cent2_middle1 study_cent2_ps"  src="/static/parents/img/study_msg/study_pc10.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==2>
							<div class="study_cent2_c a3">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_start1" src="/static/parents/img/study_msg/study_pc1.png"/>
									<img class="study_cent2_middle2 study_cent2_ps" src="/static/parents/img/study_msg/study_pc11.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==3>
							<div class="study_cent2_c a4">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs study_cent2_ps">
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
									<img class="study_cent2_arch scpoint" src="/static/parents/img/study_msg/study_pc12.png"/>
								</div>								
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==4>
							<div class="study_cent2_c a5">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_big" src="/static/parents/img/study_msg/study_pc14.png"/>
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
							<#if lu_index==5>
							<div class="study_cent2_c a6">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>	
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_big" src="/static/parents/img/study_msg/study_pc14.png"/>
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
								</div>								
								<div class="study_cent2_start">${lu.name }队</div>
							</div>
							</#if>
							<#if lu_index==6>
							<div class="study_cent2_c a7">
								<ul class="study_cent2ul">
								<#list 1..(lu.starNum) as stars>
									<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
								</#list>
								</ul>
								<div class="study_cent2_cimgs">
									<img class="study_cent2_point" src="/static/parents/img/study_msg/study_pc13.png"/>
								</div>
								<div class="study_cent2_start">${lu.name }</div>
							</div>
							</#if>
						</#list>
						</div>
					</div>
					<div class="remark">
						<div class="remark1">
							<div class="remark_pic"><img src="/static/parents/img/index/parents_index_08.png"/></div>
							<p class="remark_msg">综合评语</p>
						</div>
						<div class="remark_hx">
							<img src="/static/parents/img/index/parents_index_09.png"/>
						</div>
						<div class="remark2">
							<p>${(lesson.comment)! }</p>
						</div>
					</div>
				</div>
				<div class="last_img">
					<img src="/static/parents/img/study_msg/study_msg_bot_03.png" />
				</div>
			</div>	
			<!--添加结束-->
			</div>
			</#if>
			</#list>
			
			<!--  -->
		</div>
		<script type="text/javascript">
		
		$(function(){
			var appId="";
			var timestamp="";
			var nonceStr="";
			var sign="";
			$.ajax( {  
			     url:'/parents/getSignInfo',// 跳转到 action  
			     data:{  
		             url : window.location.href
			     },
			     async:false,  //同步
			     type:'post', 
			     dataType:'json',  
			     success:function(data) {
			    	 appId=data.appId;
			    	 sign=data.sign;
			    	 nonceStr=data.nonceStr;
			    	 timestamp=data.timestamp;
			      },  
			      error : function() {  
			           alert("异常！");  
			      }  
			 });
			$(".study_cent1_txhref").click(function(){
				$(".study_screen").css("display","block");
				$(".study_zj").css({"display":"block"});
				
			});
//			alert(sign)
			//微信配置
			wx.config({
			    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			    appId: appId, // 必填，公众号的唯一标识
			    timestamp:timestamp, // 必填，生成签名的时间戳
			    nonceStr: nonceStr, // 必填，生成签名的随机串
			    signature: sign,// 必填，签名，见附录1
			    jsApiList: [
			        'chooseImage',
			        'uploadImage'
			    ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
			});
			//点击事件
			var study_photo=document.getElementsByClassName("study_photo")[0];
			var study_select=document.getElementsByClassName("study_select")[0];
			wx.ready(function(){
				study_photo.onclick=function(){
						wx.chooseImage({
						    count: 1, // 默认9
						    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
						    sourceType: ['camera'], // 可以指定来源是相册还是相机，默认二者都有
						    success: function (res) {
						    	$(".study_screen").css("display","none");
								$(".study_zj").css({"display":"none"});
						        var localIds1 = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
						        $(".study_cent1_txhref img").attr("src",localIds1);
						        $("#back").css("background-image","url("+localIds1+")");
						        wx.uploadImage({
									 localId: localIds1.toString(), // 需要上传的图片的本地ID，由chooseImage接口获得
									 isShowProgressTips: 1, // 默认为1，显示进度提示
									 success: function (res) {							    	
									        var serverId = res.serverId; // 返回图片的服务器端ID
									        $.ajax( {  
											     url:'/parents/saveImg',// 跳转到 action  
											     data:{  
											    	 mediaId : serverId
											     },
											     async:false,  //同步
											     type:'post',
											     success:function(data) {
											      },  
											      error : function() {  
											           alert("异常！");  
											      }  
											 });
									    }
									});
						    }
						});
					}
				study_select.onclick=function(){
					wx.chooseImage({
						    count: 1, // 默认9
						    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
						    sourceType: ['album'], // 可以指定来源是相册还是相机，默认二者都有
						    success: function (res) {
						        $(".study_screen").css("display","none");
								$(".study_zj").css({"display":"none"});
						        var localIds1 = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
						        $(".study_cent1_txhref img").attr("src",localIds1);
						        $("#back").css("background-image","url("+localIds1+")");
						        wx.uploadImage({
									 localId: localIds1.toString(), // 需要上传的图片的本地ID，由chooseImage接口获得
									 isShowProgressTips: 1, // 默认为1，显示进度提示
									 success: function (res) {							    	
									        var serverId = res.serverId; // 返回图片的服务器端ID
									        $.ajax( {  
											     url:'/parents/saveImg',// 跳转到 action  
											     data:{  
											    	 mediaId : serverId
											     },
											     async:false,  //同步
											     type:'post',
											     success:function(data) {
											      },  
											      error : function() {  
											      }  
											 });
									    }
									});
						    }
					});
				  };
			});
			$(".study_zj_cancle").click(function(){
				$(".study_screen").css("display","none");
				$(".study_zj").css({"display":"none"});
			});
		})
		</script>
	</body>
</html>