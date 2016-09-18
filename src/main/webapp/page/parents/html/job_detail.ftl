<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>作业详情</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/job_detail.css" />
	</head>
		<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
		<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<body>
		<!--已完成作业详情页开始-->
		<div class="job_detail">
			<div class="job_detail_center">
				<!--乐理知识部分开始-->
				<#if tasks?size gt 0>
				<div class="job_music_theory">	
					<div class="job_center_title">
						<div class="job_center_title1">
							<a href="javascript:;" name="music_theory">
								<span>一</span><span class="yl">${(tasks[0].task.name)! }</span>								
							</a>
						</div>
						<div class="job_reward">
							<span class="job_reward1">成绩</span>
							<div class="job_reward2">
							<#if (tasks[0].task.score)?? && (tasks[0].task.score) gt 0>
							<#list 1..(tasks[0].task.score) as star>
								<img src="/static/parents/img/class_score/xingxing.png"/>
							</#list>
							</#if>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="job_center_list">
						<!--一道题开始-->
						<#list tasks[0].xzt! as list>
						<#if list.answer_type=="1">
						<div class="job_center_list1">
							<div class="job_cent_list">
								<div class="job_center_list2">
									<span>${list_index+1 }.</span>
									<span class="job_center_exp"> ${list.content! }</span>
								</div>
								<div class="job_center_list3">
									<ul>
									<#if list.answer_a??>
										<li class="<#if list.right_answer?? && list.answer??><#if 'A'==list.answer>job_right_answer<#elseif 'A'==list.right_answer>job_right_error</#if></#if>">
											<span class="job_circle"></span>
											<span>Do:  </span>
											<span class="options">${list.answer_a! }</span>
										</li>
									</#if>
									<#if list.answer_b??>
										<li class="<#if list.right_answer?? && list.answer??><#if 'B'==list.answer>job_right_answer<#elseif 'B'==list.right_answer>job_right_error</#if></#if>">
											<span class="job_circle"></span>
											<span>Re:  </span>
											<span class="options">${list.answer_b! }</span>
										</li>
									</#if>
									<#if list.answer_c??>
										<li class="<#if list.right_answer?? && list.answer??><#if 'C'==list.answer>job_right_answer<#elseif 'C'==list.right_answer>job_right_error</#if></#if>">
											<span class="job_circle"></span>
											<span>Mi:  </span>
											<span class="options">${list.answer_c! }</span>
										</li>
									</#if>
									<#if list.answer_d??>
										<li class="<#if list.right_answer?? && list.answer??><#if 'D'==list.answer>job_right_answer<#elseif 'D'==list.right_answer>job_right_error</#if></#if>">
											<span class="job_circle"></span>
											<span>Fa:  </span>
											<span class="options">${list.answer_d! }</span>
										</li>
									</#if>
									</ul>
									<div class="clear"></div>
									<div class="job_correct">
										<span class="job_correct1">正确答案：</span>
										<span>
											<#if list.answer??>
												<#if list.answer='A'>Do<#elseif list.answer='B'>Re<#elseif list.answer='C'>Mi<#else>Fa</#if>
											</#if>
										</span>
										<span></span>
									</div>
								</div>
							</div>
						</div>
						<#else>
						<div class="job_center_list1">
							<div class="job_cent_list">
								<div class="job_center_list2">
									<span>${list_index+1 }.</span>
									<span class="job_center_exp">${list.content! }</span>
								</div>
								<div class="job_center_list3_img">
									<ul>
									<#if list.answer_a??>
										<li class="<#if list.right_answer?? && list.answer??><#if 'A'==list.answer>job_right_answer<#elseif 'A'==list.right_answer>job_right_error</#if></#if>">
											<span class="job_circle"></span>
											<span>Do:  </span>
											<div class='img_option'>											
												<img src="${list.answer_a! }"/>
											</div>
										</li>
									</#if>
									<#if list.answer_b??>
										<li  class="<#if list.right_answer?? && list.answer??><#if 'B'==list.answer>job_right_answer<#elseif 'B'==list.right_answer>job_right_error</#if></#if>">
											<span class="job_circle"></span>
											<span>Re:  </span>
											<div class='img_option'>
												<img src="${list.answer_b! }"/><!--修改-->
											</div>
										</li>
									</#if>
									<#if list.answer_c??>
										<li class="<#if list.right_answer?? && list.answer??><#if 'C'==list.answer>job_right_answer<#elseif 'C'==list.right_answer>job_right_error</#if></#if>">
											<span class="job_circle"></span>
											<span>Mi:  </span>	
											<div class='img_option'>											
												<img src="${list.answer_c! }"/>
											</div>
										</li>
									</#if>
									<#if list.answer_d??>
										<li  class="<#if list.right_answer?? && list.answer??><#if 'D'==list.answer>job_right_answer<#elseif 'D'==list.right_answer>job_right_error</#if></#if>">
											<span class="job_circle"></span>
											<span>Fa:  </span>
											<div class="img_option">
											<img src="${list.answer_d! }"/>
											</div>
										</li>
									</#if>
									</ul>
									<div class="clear"></div>
									<div class="job_correct">
										<span class="job_correct1">正确答案：</span>
										<span>
											<#if list.answer??>
												<#if list.answer='A'>Do<#elseif list.answer='B'>Re<#elseif list.answer='C'>Mi<#else>Fa</#if>
											</#if>
										</span>
										<span></span>
									</div>
								</div>
							</div>
						</div>
						</#if>
						
						</#list>
						
						<!--一道题结束-->
					</div>
				</div>
				</#if>
				<!--乐理知识部分结束-->
				<!--乐曲演奏部分开始-->
				<#if tasks?size gt 1>
				<div class="job_song">
					<div class="job_center_title">
						<div class="job_center_title1">
							<a href="javascript:;" name="rhythm">
								<span>二</span><span class="yl">${(tasks[1].task.name)! }</span>
							</a>
						</div>
						<div class="job_reward">
							<span class="job_reward1">成绩</span>
							<div class="job_reward2">
								<#if (tasks[1].task.score)?? && (tasks[1].task.score) gt 0>
								<#list 1..(tasks[1].task.score) as star>
									<img src="/static/parents/img/class_score/xingxing.png"/>
								</#list>
								</#if>
							</div>
						</div>
						<!--<div class="clear"></div>-->
					</div>
					<div class="job_song_center">
						<div class="job_song_list1">
							<div class="job_song_percent">
								<div class="job_song_list1_left">
									<span>节奏</span>
								</div>
								<div class="job_song_list1_center">
									<div class="job_song_plan"></div>
									<div class="job_song_bar1" style="<#if (tasks[1].task.s_jiezou)??>width:${5.34/100*tasks[1].task.s_jiezou }rem</#if>"></div>
								</div>
								<div class="job_song_list1_right">
									<!--<img src="/static/parents/img/play/play1_21.png"/>-->
									<span>${(tasks[1].task.s_jiezou)! }%</span>
								</div>
								<div class="clear"></div>
							</div>
							<div class="job_song_percent">
								<div class="job_song_list1_left">
									<span>时值</span>
								</div>
								<div class="job_song_list1_center">
									<div class="job_song_plan"></div>
									<div class="job_song_bar2" style="<#if (tasks[1].task.s_jiezou)??>width:${5.34/100*tasks[1].task.s_shizhi }rem</#if>"></div>
								</div>
								<div class="job_song_list1_right">
									<span>${(tasks[1].task.s_shizhi)! }%</span>
								</div>
								<div class="clear"></div>
							</div>
					 	</div>
					</div>
				</div>
				</#if>
				<!--乐曲演奏部分结束-->
				<!--节奏练习部分开始删除-->
				<#if tasks?size gt 2>
				<div class="job_song job_song1">
					<div class="job_center_title">
						<div class="job_center_title1">
							<a href="javascript:;" name="songbook">
								<span>三</span><span class="yl">${(tasks[2].task.name)! }（选做）</span>								
							</a>
						</div>
						<div class="job_reward">
							<span class="job_reward1">成绩</span>
							<div class="job_reward2">
								<#if (tasks[2].task.score)?? && (tasks[2].task.score) gt 0>
								<#list 1..(tasks[2].task.score) as star>
									<img src="/static/parents/img/class_score/xingxing.png"/>
								</#list>
								</#if>
							</div>
						</div>
					</div>
						<!--<div class="clear"></div>-->
						<!--节奏开始-->
						<div class="job_song_list1">
							<div class="job_song_percent">
								<div class="job_song_list1_left">
									<span>音高</span>
								</div>
								<div class="job_song_list1_center">
									<div class="job_song_plan"></div>
									<div class="job_song_bar1"style="<#if (tasks[1].task.s_jiezou)??>width:${5.34/100*tasks[2].task.s_yingao }rem</#if>"></div>
								</div>
								<div class="job_song_list1_right">
									<span>${(tasks[2].task.s_yingao)! }%</span>
								</div>
								<div class="clear"></div>
							</div>
							<div class="job_song_percent">
								<div class="job_song_list1_left">
									<span>节奏</span>									
								</div>
								<div class="job_song_list1_center">
									<div class="job_song_plan"></div>
									<div class="job_song_bar2" style="<#if (tasks[1].task.s_jiezou)??>width:${5.34/100*tasks[2].task.s_jiezou }rem</#if>"></div>
								</div>
								<div class="job_song_list1_right">
									<span>${(tasks[2].task.s_jiezou)! }%</span>
								</div>
								<div class="clear"></div>
							</div>
							<div class="job_song_percent">
								<div class="job_song_list1_left">
									<span>时值</span>
								</div>
								<div class="job_song_list1_center">
									<div class="job_song_plan"></div>
									<div class="job_song_bar3" style="<#if (tasks[1].task.s_jiezou)??>width:${5.34/100*tasks[2].task.s_shizhi }rem</#if>"></div>
								</div>
								<div class="job_song_list1_right">
									<span>${(tasks[2].task.s_shizhi)! }%</span>
								</div>
								<div class="clear"></div>
							</div>
						</div>
						<!--结束-->
					</div>
					</#if>
				</div>
				<!--节奏练习部分结束-->
			</div>
		</div>
		<!--已完成作业详情页结束-->
	</body>
</html>
