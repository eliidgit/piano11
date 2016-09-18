<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
    <title>我的孩子</title>
    <link rel="stylesheet" href="/static/parents/css/common.css" />
	<link rel="stylesheet" href="/static/parents/css/index.css" />
</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<script type="text/javascript" src="/static/parents/js/index.js" ></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<body>
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
			<p class="study_photo">拍照</p>
			<p class="study_select">从相册选择</p>
			<p class="study_zj_cancle">取消</p>
		</div>
	<!--弹窗结束-->
	<div class="indexcenter">
		<!--头像开始-->
		<div class="study_cent">
				<div class="study_opacity"></div>
				<img  class="study_cent0 blur" id="back" src='${(session.user.avatar)! }'/>
				<div class="study_cent1">
					<div class="study_cent1_tx">
						<a class="study_cent1_txhref" href="javascript:;"><img src="${(session.user.avatar)! }"/></a>
					</div>
					<div class="study_cent1_nickname">
						<div class="study_nickname">
							<p class="study_name">${(stu.name)! }</p>
							<#if (stu.gender)!="女">
							<img class="study_sex" src="/static/parents/img/study_msg/study_pc4.png"/>
							<#else>
							<img class="study_sex" src="/static/parents/img/study_msg/study_pc4.png"/>
							</#if>
						</div>
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
						</ul>
					</div>
				</div>				
			</div>
		<!--头像结束-->
		<div class="parents_center1">
			<a href="/parents/showLessonInfo?lessonId=${lessonId!}&courseId=${courseId!}" class="parents_ctop">
				<div class="parent_center">
						<p class="study_msg">课堂成绩</p>
						<div class="study_prev"></div>											
				</div>
			</a>
			<div class="parents_cent1">
			<!--课堂成绩部分开始-->
			<div class="ctop_lesson1">
				<div class="ctoplesson">
					<div class="allrea allready1">
						<ul class="allul">
						<#if prevScore??>
						<#list 1..(prevScore.score)! as list>
							<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
						</#list>
						</#if>
						</ul>
						<div class="allreaimg">
							<img class="img1" src="/static/parents/img/index/parents_index_14.png"/>
							<div class="img_com img_hx"></div>
						</div>
						<p class="lessoname lname1">${(prevScore.pname)!}</p>
					</div>						
					<div class="allrea allready2">
						<div class="allul2">
							<!--学生头像-->
							<div class="allulimg">
								<img src="${(session.user.avatar)! }"/>								
							</div>
						</div>
						<div class="bigstars">
							<ul>
							<#if score??>
								<#list 1..(score.score)! as list>
								<li><img src="/static/parents/img/index/xingxing.png"/></li>
								</#list>
							</#if>
							</ul>
						</div>
						<div class="allreaimg">
							<img class="img3" src="/static/parents/img/index/parents_index_19.png"/>
							<div class="img_com img_hx1"></div>
						</div>
						<p class="lessoname lname2">${(score.pname)! }</p>
					</div>
					<div class="allrea allready3">
						<!--<img class="img5" src="/static/parents/img/index/parents_index_16.png"/>-->
						<div class="img5"></div>
						<p class="lessoname lname3">${(nextCP.name)! }</p>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="parents_compre">
				<div class="parents_compre_left">
					<div class="parents_com">
						<img class="pcompre_left_pic1" src="/static/parents/img/index/parents_index_08.png"/>
						<p class="pcompre_left_msg">综合评语</p>						
					</div>
					<div class="pcompre_left_pic3"></div>
				</div>
				<div class="parents_compre_right">
					<p class="parents_compre_p">
						${(score.comments)! }
					</p>
				</div>
			</div>
		</div>
		</div>
		<div class="clear"></div>
		<div class="parents_center2">
			<a class="parents_center2_top" href="/parents/stuTaskH?lessonId=${lessonId!}&courseId=${courseId!}">
				<div class="parent_center">
					<p class="study_msg">作业练习</p>
					<div class="study_prev"></div>											
				</div>
			</a>
			<div class="parents_center2_cen">
				<div class="parents_center2_cen1 allrea">
					<ul class="parents_center2_ul1">
						<#if prevTask??>
						<#list 1..(prevTask.score)! as list>
						<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
						</#list>
						</#if>
					</ul>
					<div class="allreaimg">
						<img class="img1" src="/static/parents/img/index/parents_index_14.png"/>
						<div class="img_com img_hx2"></div>
					</div>
					<p class="lessoname lname1">${(prevScore.pname)!}</p>
				</div>
				<div class="parents_center2_cen2 allrea ">
					<ul class="parents_center2_ul2">
						<#if task??>
						<#list 1..(task.score)! as list>
						<li><img src="/static/parents/img/index/xingxing.png"/></li>
						</#list>
						</#if>
					</ul>
					<div class="allreaimg">
						<div class="img6"></div>
						<div class="img_com img_hx3"></div>
					</div>
					<p class="lessoname lname2">${(score.pname)!}</p>
				</div>
				<div class="parents_center2_cen3 allrea ">
					<div class="allreaimg">
						<div class="img5"></div>
					</div>
					<p class="lessoname lname3">${(nextCP.name)!}</p>
				</div>
			</div>
				<div class="parents_center2_cen4">
					<div class="parents_compre">
						<div class="parents_compre_left">
							<div class="parents_com">
								<img class="pcompre_left_pic1" src="/static/parents/img/index/parents_index_17.png"/>
								<p class="pcompre_left_msg msg_color">综合评语</p>						
							</div>
							<div class="pcompre_left_pic2"></div>
						</div>
						<div class="parents_compre_right">
							<p class="parents_compre_p">
								${(task.comments)! }
							</p>
						</div>
					</div>
				</div>
		</div>
		<div class="clear"></div>
	</div>
	<script type="text/javascript">
		
		$(function(){
			var appId="";
			var timestamp="";
			var nonceStr="";
			var sign="";
			$.ajax( {  
			     url:'/parents/getSignInfo',  
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
						        $(".allulimg img").attr("src",localIds1);
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
						        $(".allulimg img").attr("src",localIds1);
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