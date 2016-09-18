<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>听原声</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/listen_original.css" />
	</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<script type="text/javascript" src="/static/parents/js/listen_original.js" ></script>
	<body>
		<!--头部开始-->
		<a class="top" href="#">
			<div class="back"><img src="/static/parents/img/index/parents_index_01_03.png"></div>
			<p>听原音</p>			
		</a>
		<!--头部结束-->
		<!--听原声中心部分开始-->
		<div class="listen_original">
			<div class="listen_original_top">
				<div class="listen_original_top1">
					<div class="listen_top_left">
						<img src="/static/parents/img/listen_music/listen_original_pic_03.png"/>
					</div>
					<div class="listen_top_right">
						<div class="music_title">《${(music.name)! }》<#if music.type==1>片段</#if></div>
						<div class="music_author">
							<span>作者:</span>
							<span class="music_author1">${(music.author)! }</span>
						</div>
					</div>					
				</div>
			</div>
			<!--第一部分结束-->
			<!--歌曲简介开始-->
			<div class="music_introduce">
				<div class="music_introduce_center">
					<p>《${(music.name)! }》简介</p>
					<p>${(music.author)! }</p>
					${(music.intro)! }
				</div>
			</div>
			<!--歌曲简介结束-->
			<!--歌曲播放开始-->
			<div class="music_play_center">
				<audio id="audio" preload="metadata">
					<source src="http://tq.llktop.com/version/haomingzi.mp3"></source>
				</audio>
				<div class="music_play">
					<div class="music_play_time">00:00</div>
					<div class="music_bar">
						<span class="music_circle" id="range_step"></span>
						<span class="music_songbar" id="bar"></span>
					</div>
					<div class="music_play_endtime">00:00</div>
				</div>
				<div class="music_play_btn">
					<img class="music_play_btn1" src="/static/parents/img/listen_music/song_prev_07.png"/>
					<img class="music_play_btn2" id="play" src="/static/parents/img/study_msg/study_pc8.png"/>
					<img class="music_play_btn3" src="/static/parents/img/listen_music/listen_next_13.png"/>
				</div>
			</div>
			<!--歌曲播放结束-->
		</div>
		<!--听原声中心部分结束-->
	</body>
</html>