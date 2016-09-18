<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>作业详情</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/job_detail.css" />
		<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
		<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	</head>
	<body>
		<!--头部开始-->
		<a class="top" href="#">
			<div class="back"><img src="/static/parents/img/index/parents_index_01_03.png"></div>
			<p>作业详情</p>			
		</a>
		<!--头部结束-->
		<!--已完成作业详情页开始-->
		<div class="job_detail">
			<div class="job_detail_center">
				<!--乐理知识部分开始-->
				<div class="job_music_theory">	
					<div class="job_center_title">
						<div class="job_center_title1">
							<span>一,</span><span class="yl">${(yueLi.name)! }</span>
						</div>
						<div class="job_reward">
							<span class="job_reward1">答题时间20min</span>
						</div>
						<div class="clear"></div>
					</div>
					<div class="job_center_list">
					<#list (yueLi.ylus)! as ylu>
					<!--一道题开始-->
						<div class="job_center_list1">
							<div class="job_center_list2">
								<span>${ylu_index+1 }</span>
								<span class="job_center_exp">${(ylu.name)! }</span>
							</div>
							<div class="job_center_list3">
								<ul>
								<#list (ylu.yluis)! as list>
									<li>
										<span class="job_circle"></span>
										<span class='<#if (list.id)==(ylu.rightAnswer)>job_right_answer</#if>'>${(list.id)! },${(list.result)! }</span>
									</li>
								</#list>
								</ul>
								<div class="clear"></div>
								<p class="job_correct">正确答案：<span>${(ylu.rightAnswer)! }</span>${(ylu.answerInfo)! }</p>
							</div>
						</div>
						<!--一道题结束-->
					</#list>
					</div>
				</div>
				<!--乐理知识部分结束-->
				<!--乐曲演奏部分开始-->
				<div class="job_song">
					<div class="job_center_title">
						<div class="job_center_title1">
							<span>二,</span><span class="yl">${(yueQu.name)! }(选做题)</span>
						</div>
						<div class="job_reward">
							<span class="job_reward1">练习不少于5遍</span>
						</div>
						<div class="clear"></div>
					</div>
					<div class="job_song_center">
					<#list (yueQu.musics)! as music>
						<div class="job_song_list1">
							<div class="job_song_list1_left">
								<div class="job_song_top">
									<span>${music_index+1 }</span>
									<span>《${(music.name)! }》<#if (music.type)==1> 片段</#if></span>
									<span class="job_song_author">${(music.author)! }</span>
								</div>
								<div class="clear"></div>
							</div>
							<div class="job_song_list1_right">
								<a class="listen_song" href="/parents/listenMusic">听原声</a>
							</div>
							<div class="clear"></div>
						</div>
					</#list>
					</div>
				</div>
				<!--乐曲演奏部分结束-->
				<!--节奏练习部分开始-->
				<div class="rhythm">
					<div class="job_center_title">
						<div class="job_center_title1">
							<span>三,</span><span class="yl">${(jieZou.name)! }</span>
						</div>
						<div class="job_reward">
							<span class="job_reward1">练习不少于5遍</span>
						</div>
					</div>
						<div class="clear"></div>
						<!--节奏开始-->
						<#list (jieZou.musics)! as music>
						<div class="job_song_list1">
							<div class="job_song_list1_left">
								<div class="job_song_top">
									<span>${music_index+1 }</span>
									<span>《${(music.name)! }》<#if (music.type)==1> 片段</#if></span>
									<span class="job_song_author">${(music.author)! }</span>
								</div>
								<div class="clear"></div>
							</div>
							<div class="job_song_list1_right">
								<a class="listen_song" href="/parents/listenMusic">听原声</a>
							</div>
							<div class="clear"></div>
						</div>
						</#list>
						<!--结束-->
						
					</div>
				</div>
				<!--节奏练习部分结束-->
			</div>
		</div>
		<!--已完成作业详情页结束-->
	</body>
</html>
