<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>弹奏记录</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/play.css" />
	</head>
		<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
		<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<body>
		<!--头部开始-->
		<a class="top" href="#" onclick="location.href=document.referrer;">
			<div class="back"><img src="/static/parents/img/index/parents_index_01_03.png"></div>
			<p>弹奏记录</p>			
		</a>
		<!--头部结束-->
		<!--中心部分开始-->
		<div class="play_center">
			<!--右侧内容-->
			<div class="play_center_right">
				<div class="play_center_sort">
				<#list mls as ml>
					<div class="play_sort1">
							<div class="play_sort_part1"  style="<#if ml_index == 0>border: 0;</#if>">
								<img class="play_node_pic"  style="width: 0.26rem; height: 0.26rem; left: -0.06rem;" src="/static/parents/img/play/play_circle1_21.png"/>
									<div class="play_sum_part" style="background: #fff; padding-bottom: 0;">
									  <p>${ml.date }</p>
									</div>
							</div>
					</div>
					<div class="play_sort1">
						<#list (ml.musics)! as music>
							<div class="play_sort_part1">
								<img class="play_node_pic" src="/static/parents/img/job/circle_10.png"/>
								<div class="play_sum_part">
									<div class="play_part1_left">
										<div class="play_part_exp1">
											<span>《${music.name }》<#if music.type==1>片段</#if></span>
											<span>${music.author }</span>
											<span class="play_part_js"><#if music.recordType==1>学生录<#else>教师录</#if></span>
											<span class="play_partz_time">${music.time }</span>
										</div>
										<div class="play_part_exp2">
											<span>奖励</span>
											<div class="play_part_star">
											<#list 1..(music.starNum)! as star>
												<img src="/static/parents/img/play/play_reward_25.png"/>
											</#list>
											</div>
										</div>
									</div>
									<div class="play_part1_right">
										<a href="/parents/playMusicH"><img src="/static/parents/img/play/play1_21.png"/></a>
									</div>
								</div>
								<div class="all">
									<div class="clear"></div>
									<div class="borderleft"></div>
								</div>
							</div>
						</#list>
					</div>
					<div class="clear"></div>
				</#list>
				</div>
			</div>
		</div>
		<!--中心部分结束-->
	</body>
</html>