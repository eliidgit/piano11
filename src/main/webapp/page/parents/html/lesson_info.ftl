<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1,user-scalable=no" />
		<title>课堂成绩</title>
		<link rel="stylesheet" href="/static/parents/css/common.css" />
		<link rel="stylesheet" href="/static/parents/css/class_score.css" />
	</head>
	<script type="text/javascript" src="/static/parents/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="/static/parents/js/common.js" ></script>
	<body>
		<div class="studymsg_center">
		<#list lessons! as list>
		<#if list_index==0>
			<div class="study_cent2">
				<div class="study_cent2_bot">
					<div class="study_cent2_prul">
						<span class="study_cent2_period">${list.lesson.name!}</span>
						<span class="study_cent2_reward">成绩</span>
						<ul>
						<#if (list.lesson.score)?? && (list.lesson.score) gt 0>
							<#list 1..list.lesson.score as list>
							<li><img src="/static/parents/img/study_msg/xingxing.png" /></li>
							</#list>
						</#if>
						</ul>
					</div>
					<div class="study_cent2_circula">
						<div class="study_cent2_cul">
						<#list list.lessonUnits! as lu>
							<#if lu_index==0>
							<div class="study_cent2_c a2">
								<div class="class_score_star">
									<ul class="study_cent2ul">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
									</ul>
								</div>
								<div class="study_cent2_cimgs">
									<div class="class_com"></div>
									<div class="class_score_com class_score_hx"></div>
								</div>
								<div class="study_cent2_start">${lu.name!}</div>
							</div>
							</#if>
							<#if lu_index==1>
							<div class="study_cent2_c a3">
								<div class="class_score_star">
									<ul class="study_cent2ul centul_margin">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
									</ul>
								</div>
								<div class="study_cent2_cimgs">
									<!--<img class="study_cent2_start1" src="/static/parents/img/study_msg/study_pc8.png"/>-->
									<div class="class_com"></div>
									<div class="class_score_com class_score_hx"></div>
								</div>
								<div class="study_cent2_start">${lu.name!}</div>
							</div>
							</#if>
							<#if lu_index==2>
							<div class="study_cent2_c a4">
								<div class="class_score_star">
									<ul class="study_cent2ul centul_margin">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
									</ul>
								</div>
								<div class="study_cent2_cimgs study_cent2_ps">
									<div class="class_com"></div>
									<img class="study_cent2_arch scpoint" src="/static/parents/img/study_msg/study_pc12.png"/>
								</div>								
								<div class="study_cent2_start">${lu.name!}</div>
							</div>
							</#if>
							<#if lu_index==3>
							<div class="study_cent2_c a5">
								<div class="class_score_star">
									<ul class="study_cent2ul">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
									</ul>									
								</div>
								<div class="study_cent2_cimgs">
									<div class="class_score_com class_score_hx"></div>
									<!--<img class="study_cent2_start1 start_margin" src="/static/parents/img/study_msg/study_pc8.png"/>-->
									<div class="class_com class_nomargin"></div>
								</div>
								<div class="study_cent2_start">${lu.name!}</div>
							</div>
							</#if>
							<#if lu_index==4>
							<div class="study_cent2_c a6">
								<div class="class_score_star">
									<ul class="study_cent2ul">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
									</ul>									
								</div>
								<div class="study_cent2_cimgs">
									<div class="class_score_com class_score_hx"></div>
									<div class="class_com"></div>
								</div>								
								<div class="study_cent2_start">${lu.name!}</div>
							</div>
							</#if>
							<#if lu_index==5>
							<div class="study_cent2_c a7">
								<div class="class_score_star">
									<ul class="study_cent2ul">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
								</div>
								<div class="study_cent2_cimgs">
									<!--<img class="study_cent2_start1 start_margin" src="/static/parents/img/study_msg/study_pc8.png">-->
									<div class="class_com"></div>
								</div>
								<div class="study_cent2_start">${lu.name!}</div>
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
							<p>${list.lesson.comments!}</p>
						</div>
					</div>
				</div>
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
				<div class="study_cent1_top">
					<img src="/static/parents/img/study_msg/class_score1.png"/>
				</div>
			   <div class="study_bot_cent">
				<div class="study_cent2_bot">
					<div class="study_cent2_prul">
						<span class="study_cent2_period">${list.lesson.name!}</span>
						<span class="study_cent2_reward">成绩 </span>
						<ul>
						<#if (list.lesson.score)?? && (list.lesson.score) gt 0>
							<#list 1..list.lesson.score as list>
							<li><img src="/static/parents/img/study_msg/xingxing.png" /></li>
							</#list>
						</#if>
						</ul>
					</div>
					<div class="study_cent2_circula">
						<div class="study_cent2_cul">							
						<#list list.lessonUnits! as lu>
							<#if lu_index==0>
							<div class="study_cent2_c a2">
								<div class="class_score_star">
									<ul class="study_cent2ul">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
									</ul>
								</div>
								<div class="study_cent2_cimgs">
									<div class="class_com"></div>
									<div class="class_score_com class_score_hx"></div>
								</div>
								<div class="study_cent2_start">${lu.name!}</div>
							</div>
							</#if>
							<#if lu_index==1>
							<div class="study_cent2_c a3">
								<div class="class_score_star">
									<ul class="study_cent2ul centul_margin">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
									</ul>
								</div>
								<div class="study_cent2_cimgs">
									<!--<img class="study_cent2_start1" src="/static/parents/img/study_msg/study_pc8.png"/>-->
									<div class="class_com"></div>
									<div class="class_score_com class_score_hx"></div>
								</div>
								<div class="study_cent2_start">${lu.name!}</div>
							</div>
							</#if>
							<#if lu_index==2>
							<div class="study_cent2_c a4">
								<div class="class_score_star">
									<ul class="study_cent2ul centul_margin">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
									</ul>
								</div>
								<div class="study_cent2_cimgs study_cent2_ps">
									<div class="class_com"></div>
									<img class="study_cent2_arch scpoint" src="/static/parents/img/study_msg/study_pc12.png"/>
								</div>								
								<div class="study_cent2_start">${lu.name!}</div>
							</div>
							</#if>
							<#if lu_index==3>
							<div class="study_cent2_c a5">
								<div class="class_score_star">
									<ul class="study_cent2ul">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
									</ul>									
								</div>
								<div class="study_cent2_cimgs">
									<div class="class_score_com class_score_hx"></div>
									<!--<img class="study_cent2_start1 start_margin" src="/static/parents/img/study_msg/study_pc8.png"/>-->
									<div class="class_com"></div>
								</div>
								<div class="study_cent2_start">${lu.name!}</div>
							</div>
							</#if>
							<#if lu_index==4>
							<div class="study_cent2_c a6">
								<div class="class_score_star">
									<ul class="study_cent2ul">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
									</ul>									
								</div>
								<div class="study_cent2_cimgs">
									<div class="class_score_com class_score_hx"></div>
									<div class="class_com"></div>
								</div>								
								<div class="study_cent2_start">${lu.name!}</div>
							</div>
							</#if>
							<#if lu_index==5>
							<div class="study_cent2_c a7">
								<div class="class_score_star">
									<ul class="study_cent2ul">
									<#if (lu.score)?? && (lu.score) gt 0>
									<#list 1..lu.score! as star>
										<li><img src="/static/parents/img/index/parents_index_13.png"/></li>
									</#list>
									</#if>
								</div>
								<div class="study_cent2_cimgs">
									<!--<img class="study_cent2_start1 start_margin" src="/static/parents/img/study_msg/study_pc8.png">-->
									<div class="class_com"></div>
								</div>
								<div class="study_cent2_start">${lu.name!}</div>
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
							<p>${list.lesson.comments!}</p>
						</div>
					</div>
				</div>
			</div>
			<div class="last_img">
				<img src="/static/parents/img/study_msg/class_score2.png" />
			</div>
			<!--添加结束-->
			</div>
		</#if>
		</#list>
		</div>
	</body>
</html>
