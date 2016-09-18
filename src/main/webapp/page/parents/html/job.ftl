<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>作业练习</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/job.css" />
	</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<body>
		<!--中间部分-->
		<div class="job_center">
			<div class="job_cent1">
				<!--中间详细内容-->
				<div class="job_cent">
					<div class="job_part1">			
						<div class="job_centit">
							<div class="job_centit_center">
								<a href="/parents/stuNewTaskDetail?pid=<#if nextTasks?? && nextTasks?size gt 0>${nextTasks[0].id! }</#if>">
									<span class="job_hour">${(nextCP.name)! }</span>
									<img class="job_detail" src="/static/parents/img/index/parents_index_10.png"/>
								</a>
							</div>
						</div>
						<div class="job_cont_bot">
							<div class="job_cont">
								<div class="job_cont_right">
									<p class="new_job">新作业内容</p>
									<div class="new_job_cont">
										<div class="new_job_cont0">
											<div class="new_job_cont0_left">
												<a href="/parents/stuNewTaskDetail?pid=<#if nextTasks?? && nextTasks?size gt 0>${nextTasks[0].id! }</#if>#music_theory">
													<img class="music_theroy" src="/static/parents/img/work/yueli.jpg"/>
												</a>
											</div>
											<span class="job_align"><#if nextTasks?? && nextTasks?size gt 0>${nextTasks[0].name! }</#if></span>																									
											<div class="new_job_cont0_right"></div>
										</div>
										<div class="new_job_cont0">
											<div class="new_job_cont0_left">
												<a href="/parents/stuNewTaskDetail?pid=<#if nextTasks?? && nextTasks?size gt 0>${nextTasks[0].id! }</#if>#rhythm">
													<img src="/static/parents/img/class_score/kaishi.png" />
												</a>
											</div>
											<span class="job_align"><#if nextTasks?? && nextTasks?size gt 1>${nextTasks[1].name! }</#if></span>		
											<div class="new_job_cont0_right"></div>
										</div>
										<div class="new_job_cont0">
											<div class="new_job_cont0_left">
												<a href="/parents/stuNewTaskDetail?pid=<#if nextTasks?? && nextTasks?size gt 0>${nextTasks[0].id! }</#if>#songbook">
													<img src="/static/parents/img/class_score/kaishi.png" />
												</a>
											</div>
											<span class="job_align"><#if nextTasks?? && nextTasks?size gt 2>${nextTasks[2].name! }</#if></span>		
										</div>
									</div>
								</div>
								<div class="clear"></div>
							</div>						
							<div class="clear"></div>	
						</div>
					</div>
					<!--第二部分开始-->
					<#list tasks as list>
					<div class="job_part2">
						<div class="job_part2_imgs">
							<img class="job_part2_img1" src="/static/parents/img/study_msg/study_pc18.png"/>
							<img class="job_part2_img2" src="/static/parents/img/study_msg/study_pc18.png"/>
						</div>
						<div class="job_part2_center">
							<a href="/parents/stuTaskDetail?pid=${list.part_id! }">
								<div class="job_centit">
									<div class="job_centit_center1">
										<div class="job_centit_center1_left">
											<span class="job_hour1">${list.name! }</span>
											<span class="reward">成绩</span>
											<div class="job_star">
											<#if (list.score)?? && (list.score) gt 0>
												<#list 1..list.score as start>
												<img src="/static/parents/img/class_score/xingxing.png"/>
												</#list>
											</#if>
											</div>										
										</div>
										<img class="job_detail1" src="/static/parents/img/index/parents_index_10.png"/>
									</div>
								</div>
							</a>
							<div class="job_cont_bot1">
								<div class="job_cont">
									<div class="job_cont_right">
										<div class="job_sort">
											<div class="job_sort1">
												<div class="job_sort1_left">
													<a href="/parents/stuTaskDetail?pid=${list.part_id! }#music_theory">
														<div class="job_stars">
															<div class="job_star_img">
															<#if list.task?size gt 0 && (list.task[0].score)?? && (list.task[0].score) gt 0>
																<#list 1..list.task[0].score as star>
																<img src="/static/parents/img/class_score/huixingxing.png"/>
																</#list>
																</#if>													
															</div>
														</div>
														<div class="job_circle">
															<img class="music_theroy" src="/static/parents/img/work/yueli.jpg"/>
														</div>
														<div class="clear"></div>
													</a>
												</div>
														<p class="job_exp job_align"><#if list.task?size gt 0> ${list.task[0].name }<#else>乐理</#if></p>	
												<div class="job_sort1_right"></div>
											</div>
											<div class="job_sort1">
												<div class="job_sort1_left">
													<#if list.task?size gt 1><a href="/parents/stuTaskDetail?pid=${list.part_id! }#songbook"></#if>
														<div class="job_stars">
															<div class="job_star_img">																
															<#if list.task?size gt 1 && list.task[1].score?? && list.task[1].score gt 0>
																<#list 1..list.task[1].score as star>
																<img src="/static/parents/img/class_score/huixingxing.png"/>
																</#list>														
															</#if>
															</div>
														</div>
														<div class="job_circle">
															<#if list.task?size gt 1>
															<img class="job_circle3" src="/static/parents/img/class_score/kaishi.png"/>
															<#else>
																<img  src="/static/parents/img/work/huibofang.png"/>
															</#if>
														</div>
														<div class="clear"></div>
													<#if list.task?size gt 2></a></#if>
												</div>
														<p class="job_exp<#if list.task?size lt 2>1</#if> job_align"><#if list.task?size gt 1> ${list.task[1].name }<#else>节奏</#if></p>
												<div class="job_sort1_right"></div>				
											</div>
											<div class="job_sort1">
												<div class="job_sort1_left">
												<#if list.task?size gt 2><a href="/parents/stuTaskDetail?pid=${list.part_id! }#rhythm"></#if>
														<div class="job_stars">
															<div class="job_star_img">																
															<#if list.task?size gt 1 && list.task[1].score?? && list.task[1].score gt 0>
																<#list 1..list.task[1].score as star>
																<img src="/static/parents/img/class_score/huixingxing.png"/>
																</#list>														
															</#if>
															</div>
														</div>
														<div class="job_circle">
														<#if list.task?size gt 2>
															<img class="job_circle3" src="/static/parents/img/class_score/kaishi.png"/>
														<#else>
															<img  src="/static/parents/img/work/huibofang.png"/>
														</#if>
														</div>
														<div class="clear"></div>
												<#if list.task?size gt 2></a></#if>
												</div>
														<p class="job_exp<#if list.task?size lt 2>1</#if> job_align"><#if list.task?size gt 2> ${list.task[2].name }<#else>乐曲</#if></p>
											</div>
										</div>
										<div class="clear"></div>
										<div class="teacher_remark">
											<div class="teacher_remark_left">
												<div class="tea_remark_top">
													<img src="/static/parents/img/work/laoshipingyun.png"/>
												</div>
												<p>老师评语</p>												
											</div>
											<div class='teacher_hx'></div>
											<div class="teacher_remark_right">
												<p>${list.comment! }</p>												
											</div>
										</div>
									</div>
								</div>						
							</div>
						</div>
					</div>
					</#list>
				</div>
			</div>
		</div>
	</body>
</html>
