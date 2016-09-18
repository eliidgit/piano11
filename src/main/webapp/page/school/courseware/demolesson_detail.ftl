<#include "/page/school/common/_layout.ftl"/>
<@html title="学生首页 - ${siteTitle!}" description="">

<link rel="stylesheet" href="${baseUrl!}/static/school/css/demo_detail.css"/>
<link rel="stylesheet" href="/static/school/css/video-js.css" />
<script type="text/javascript" src="/static/school/js/video.js" ></script>
<script type="text/javascript" src="/static/school/js/demo_detail.js" ></script>
<!-- Jquery 异步提交表单-->
<script src="/static/js/jquery.form.js"></script>
<div class="lr_tc"></div>
<div class="loading"><img src="/static/school/img/pic19.png"/></div>
<div class="demo_detail">
				<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li><</li>
						<li>课件管理</li>
						<li><</li>
						<li>示范课</li>
						<li><</li>
						<li>示范课详情</li>
					</ul>
				</div>
				<!--添加结束-->
				<div class="demo_detail_center">
					<div class="demo_detail_center1">
						<p class="demo_det_dir">
                           <span>${(demolesson.name)! }</span>
						</p>
						<div class="demo_vedio">
							<!--示范课修改-->
							<div class="shade"></div>
							<div class="demo_vod">
								<video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="920" height="535" data-setup="{}" poster="${(demolesson.pic_path)! }">
							    <source src="${(demolesson.path)! }" type='video/mp4' />
							    <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
							    <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
							  </video>
							</div>
							<div class="clear"></div>
							<div class="demo_msg">
								<div class="demo_msg1">
									${(demolesson.know_point)! }								
									<span></span>
								</div>
								<div class="teach_top">
									<div class="teach_demo_top">
										<div class="teach_hx0"></div>
										<div class="teach_aim">教学目的</div>
										<div class="teach_hx1"></div>
									</div>
									<div class="teach_demo_bot">
										<p>${(demolesson.purpose)! }</p> 										
									</div>
								</div>
								<div class="teach_top">
									<div class="teach_demo_top">
										<div class="teach_hx0"></div>
										<div class="teach_aim">教学内容</div>
										<div class="teach_hx1"></div>										
									</div> 
									<div class="teach_demo_bot">
										<p>${(demolesson.content)! }</p>
										<!-- <p>
											<span>1.</span>
											<span class="teach_demotit">理论授课内容:</span>
										</p>
										<p class="teach_demo_cont">认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。</p>
										<p>
											<span>2.</span>
											<span class="teach_demotit">实践授课内容:</span>
										</p>
										<p class="teach_demo_cont">在钢琴上反复的弹中央C,练习曲《请弹吧》。 </p> -->
									</div>
								</div>
								<div class="teach_top">
									<div class="teach_demo_top">
										<div class="teach_hx0"></div>
										<div class="teach_aim">教学过程</div>
										<div class="teach_hx1"></div>
									</div>		
									<div class="teach_demo_bot">
										<p>${(demolesson.process)! }</p>
									</div>
								</div><!--修改-->
							</div>
						</div>
					</div>
				</div>
			</div>
<script>

</script>
</@html>