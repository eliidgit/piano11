<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>弹奏播放</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/play_music.css" />
	</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<script type="text/javascript" src="/static/parents/js/play_music.js" ></script>
	<body>
		<!--头部开始-->
		<a class="top" href="#" onclick="location.href=document.referrer;">
			<div class="back"><img src="/static/parents/img/index/parents_index_01_03.png"></div>
			<p>弹奏播放</p>			
		</a>
		<!--头部结束-->
		<!--弹奏播放第一部分标题开始-->
		<div class="play_music_top">
			<div class="play_top_left">
				<img class="play_logo" src="/static/parents/img/listen_music/listen_original_pic_03.png"/>
				<div class="teacher_song"></div>
				<span class="teacher_exp"><#if music.recordType==1>学生录<#else>教师录</#if></span>
			</div>
			<div class="play_top_right">
				<div class="play_top_right1">
					<span>《${music.name }》<#if music.type==1>片段</#if></span>
					<span class="play_author_name">${(music.author)! }</span>
					<span class="time">${(music.time)! }</span>
				</div>
				<div class="clear"></div>
				<div class="play_top_right2">
					<span>弹奏：</span>
					<span>${(music.player)! }</span>
				</div>
				<div class="clear"></div>
				<div class="play_top_right3">
					<span class="play_top_reward">奖励</span>
					<div class="play_top_right_imgs">
					<#list 1..(music.starNum)! as star>
						<img src="/static/parents/img/index/parents_index_13.png"/>
					</#list>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!--弹奏播放第一部分标题结束-->
		<!--曲目简介开始-->
		<div class="song_list">
			<div class="song_list1">
				<ul>
					<li class="song_list_act">曲目简介</li>
					<li>查看曲谱</li>
				</ul>
			</div>
			<div class="song_list2">
				<!--曲目介绍开始-->
				<div class="tracks0">
					<p>《${music.name }》简介</p>
					<p>${music.author }</p>
					${(music.intro)! }
				</div>
				<!--曲目介绍结束-->
				<!--查看曲谱开始-->
				<div class="tracks1">
					<div class="tracks1_title">
						<p class="track1_play">弹奏曲谱</p>
						<div class="tracks1_comment">
							<span>评语:</span>
							<span>${(music.comment)! }</span>
						</div>
					</div>
					<div class="track1_score">
						<img src="/static/parents/img/play_music/opear_19.png"/>
					</div>
				</div>
				<!--查看曲谱结束-->
			</div>
		</div>
		<!--曲目简介结束-->
		<!--播放进度开始-->
		<div class="play_plan">
			<div class="play_plan_center">
				<div class="play_plan_time">
					<span class="play_startime">00:00</span>
					<div class="play_bar">
						<span class="play_circle" id="range_step"></span>
						<span class="play_songbar" id="bar"></span>
					</div>
					<span class="play_endime">00:00</span>
				</div>
				<div class="clear"></div>
				<div class="play_btns">
					<audio id="audio" preload="metadata">
						<!-- <source src="/static/parents/audio/beautiful_music.mp3"></source> -->
						<source src="http://tq.llktop.com/version/haomingzi.mp3"></source>
					</audio>
					<div class="play_btn1">
						<img src="/static/parents/img/play_music/download_19_02.png"/>	
						<span class="play_download">20%</span>
					</div>
					<img class="play_btn2" src="/static/parents/img/listen_music/song_prev_07.png"/>
					<img class="play_btn3" id="play" src="/static/parents/img/study_msg/study_pc8.png" />
					<img class="play_btn4" src="/static/parents/img/listen_music/listen_next_13.png"/>
					<a href="share.html"><img class="play_btn5"src="/static/parents/img/play_music/share_22.png"/></a>
				</div>		
			</div>
		</div>
		<!--播放进度结束-->
	</body>
