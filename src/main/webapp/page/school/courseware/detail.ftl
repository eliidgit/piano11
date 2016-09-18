<#include "/page/school/common/_layout.ftl"/>
<@html title="学生首页 - ${siteTitle!}" description="">

<link rel="stylesheet" href="${baseUrl!}/static/school/css/course_ware.css"/>

<script src="/static/school/js/course_ware.js"></script>

<!-- Jquery 异步提交表单-->
<script src="/static/js/jquery.form.js"></script>
<div class="lr_tc"></div>
<div class="loading"><img src="/static/school/img/pic19.png"/></div>
<div class="course_ware">
				<div class="course_ware_center">
					<!--添加-->
					<div class="common_top">
						<ul>
							<li>首页</li>
							<li><</li>
							<li>课件管理</li>
							<li><</li>
							<li>课件</li>
							<li><</li>
							<li>课件详情</li>
						</ul>
					</div>
					<!--添加结束-->
					<div class="course_cen">
						<!--<p class="cour_title">课件>课件详情</p>-->
						<!--修改开始-->
						<div class="course_hour">
							<div class="course_title">
								<span class="course_title1">${lessonName! }</span>
								<!-- <span class="course_title2">钢琴弹奏知识、姿势、手形及非连音弹奏方法</span> -->
							</div>
						</div>
						<!--修改结束-->
						<div class="course_det">
							<div class="course_detleft">
							<#list lessonDetail! as list>
								<div class="course_cen1">
									<div class="course_line">
										<div class="course_hx0"></div>
										<div class="course_cen1_tit1">${list.name! }</div>
										<div class="course_hx1"></div>
									</div>
									<div class="course_cen1_right">
										<div class="course_intro1">
											${list.content! }
										</div>
										<div class="course_cen1_float">
											<a href="javascript:;"><img src="${list.pic_path! }"/></a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
								</#list>
							</div>
						</div>
					</div>
				</div>

</@html>