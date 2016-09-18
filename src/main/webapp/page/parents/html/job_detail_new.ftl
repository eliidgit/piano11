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
				<div class="job_music_theory">	
					<div class="job_center_title">
						<div class="job_center_title1">
							<a href="javascript:;" name="music_theory">
								<span>一</span><span class="yl">乐理</span>								
							</a>
						</div>
						<div class="clear"></div>
					</div>
					<div class="job_center_list">
						<!--一道题开始-->
						<#list homeworks! as list>
						<#if list.answer_type=="1">
						<div class="job_center_list1">
							<div class="job_cent_list">
								<div class="job_center_list2">
									<span>${list_index+1 }.</span>
									<span class="job_center_exp"> ${list.content! }</span>
								</div>
								<div class="job_center_list3">
									<ul>
										<li class="<#if list.answer??><#if 'A'==list.answer>job_right_answer</#if></#if>">
											<span class="job_circle"></span>
											<span>Do:  </span>
											<span class="options">${list.answer_a! }</span>
										</li>
										<li class="<#if list.answer??><#if 'B'==list.answer>job_right_answer</#if></#if>">
											<span class="job_circle"></span>
											<span>Re:  </span>
											<span class="options">${list.answer_b! }</span>
										</li>
										<li class="<#if list.answer??><#if 'C'==list.answer>job_right_answer</#if></#if>">
											<span class="job_circle"></span>
											<span>Mi:  </span>
											<span class="options">${list.answer_c! }</span>
										</li>
										<li class="<#if list.answer??><#if 'D'==list.answer>job_right_answer</#if></#if>">
											<span class="job_circle"></span>
											<span>Fa:  </span>
											<span class="options">${list.answer_d! }</span>
										</li>
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
									<span class="job_center_exp"> ${list.content! }</span>
								</div>
								<div class="job_center_list3_img">
									<ul>
										<li class="<#if list.answer??><#if 'A'==list.answer>job_right_answer</#if></#if>">
											<span class="job_circle"></span>
											<span>Do:  </span>
											<img class="img_option" src="${list.answer_a! }"/>
										</li>
										<li  class="<#if list.answer??><#if 'B'==list.answer>job_right_answer</#if></#if>">
											<span class="job_circle"></span>
											<span>Re:  </span>
											<img class="img_option" src="${list.answer_a! }"/>												
										</li>
										<li class="<#if list.answer??><#if 'C'==list.answer>job_right_answer</#if></#if>">
											<span class="job_circle"></span>
											<span>Mi:  </span>								
											<img class="img_option" src="${list.answer_a! }"/>
										</li>
										<li  class="<#if list.answer??><#if 'D'==list.answer>job_right_answer</#if></#if>">
											<span class="job_circle"></span>
											<span>Fa:  </span>
											<img class="img_option" src="${list.answer_a! }"/>
										</li>
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
				<!--乐理知识部分结束-->
				<!--乐曲演奏部分开始-->
				<div class="job_song">
					<div class="job_center_title">
						<div class="job_center_title1">
							<a href="javascript:;" name="rhythm">
								<span>二</span><span class="yl">节奏</span>
							</a>
						</div>
						<!--<div class="clear"></div>-->
					</div>
				</div>
				<!--乐曲演奏部分结束-->
				<!--节奏练习部分开始删除-->
				<div class="job_song">
					<div class="job_center_title">
						<div class="job_center_title1">
							<a href="javascript:;" name="songbook">
								<span>三</span><span class="yl">乐曲（选做）</span>								
							</a>
						</div>
					</div>
						<!--<div class="clear"></div>-->
						<!--节奏开始-->
						<!--结束-->
					</div>
				</div>
				<!--节奏练习部分结束-->
			</div>
		</div>
		<!--已完成作业详情页结束-->
	</body>
</html>
