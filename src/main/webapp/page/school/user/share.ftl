<#include "/page/school/common/_layout.ftl"/>
<@html title="教师首页 - ${siteTitle!}" description="">
		<link rel="stylesheet" href="/static/school/css/school_introduce.css" />
		<link rel="stylesheet" href="/static/school/css/jcDate.css" />
	</head>
	<script type="text/javascript" src="/static/school/js/school_introduce.js" ></script>
	<script type="text/javascript" src="/static/school/js/jQuery-jcDate.js" ></script>
	<body>
		<div class="lr_tc"></div>
		<div class="loading"><img src="/static/school/img/pic19.png"/></div>
		<!--页面头部-->
			<!--头部结束-->
		<div class="school_intro">
			<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li><</li>
						<li>学校信息编辑</li>
					</ul>
				</div>
			<!--添加结束-->
			<div class="school_intro_cent">
				<div class="school_intro_all">
					<div class="school_intro_alltop">
						<p class="school_title">${(school.name)! }</p>
					</div>
					<div class="school_edit_cent">
						<!--学校简介开始-->
						<div class="school_intro_exp">
							<div class="school_exp_top">
								<div class="school_name">
									<div class="school_hx school_hx0"></div>
									<p class="sc_exp">学校简介</p>		
									<div class="school_hx school_hx1"></div>
								</div>
								<!-- <input class="school_title_edit" type="button" value="编辑" /> -->
							</div>
							<div class="school_exp_sum">
								<div class="school_img">
									<img src="${(school.pic)! }"/>
									<p>建议上传图片不超过300kb大小</p>
								</div>
								<div class="school_exp_cont school_exp_change_sum">
									<div class="school_exp">
										<div class="school_sump1">${(school.intro)! }</div>										
									</div>
									<div class="school_exp_save">保存</div>
								</div>
								<div class="clear"></div>
							</div>
						</div>	
						<!--学校简介结束-->
						<!--历史沿革开始-->
						<div class="school_history">
							<div class="school_history_top">								
								<div class="school_name">
									<div class="school_hx school_hx0"></div>
									<p class="sc_exp">历史沿革</p>		
									<div class="school_hx school_hx1"></div>
								</div>
								<div class="school_history_top2">
									<span>展开</span>									
								</div>
								<input class="school_history_edit" type="button" value="编辑" />
								<div class="clear"></div>
							</div>
							<div class="school_history_cent">
								<div class="school_history_p">
									<div class="school_sump">${(school.history)! }</div>
								</div>
								<div class="school_other">
									<textarea>${(school.history)! }</textarea>
									<div class="school_other1">
										<span class="school_name1">校名</span>
										<input class="school_name_input" type="text" value="" />
									</div>
									<!--<div class="clear"></div>-->
									<!--<div class="school_other2">-->
										<div class="school_other2_left">
											<span class="school_name1">创办时间</span>
											<div class="school_create_time">
												<input class="jcDate" type="text" value="" />
												<!--<img src="/static/school/img/pinaoedit_03.gif" />-->
												<span class="school_date"></span>
											</div>
										</div>
										<div class="clear"></div><!--添加-->
										<div class="school_other2_right">
											<span class="school_name1">地区</span>
											<input type="text" value="" />
										</div>
										<!--<div class="clear"></div>-->
									<!--</div>-->
									<div class="school_other3">
										<span class="school_name1">专业</span>
										<input type="text" value="钢琴、管弦、民乐" />
									</div>
									<div class="clear"></div>
									<input class="school_save" type="button" value="保存" />
								</div>
							</div>
						</div>
						<!--历史沿革结束-->
						<!--办学特点开始-->
						<div class="school_history">
							<div class="school_history_top">																
								<div class="school_name">
									<div class="school_hx school_hx0"></div>
									<p class="sc_exp">办学特点</p>		
									<div class="school_hx school_hx1"></div>
								</div>
								<div class="school_history_top2">
									<span>展开</span>
								</div>
								<input class="school_history_edit" type="button" value="编辑" />
								<div class="clear"></div>
							</div>
							<div class="school_history_cent">
								<div class="school_history_p">
									<div class="school_sump">
										<p>
											${(school.trait)! }
										</p>		
									</div>
								</div>
								<div class="school_other">
									<textarea>${(school.trait)! }</textarea>
									<input class="school_save" type="button" value="保存" />
								</div>
							</div>
						</div>
						<!--办学特点结束-->
						<!--学科介绍开始-->
						<div class="school_history">
							<div class="school_history_top">
								<div class="school_name">
									<div class="school_hx school_hx0"></div>
									<p class="sc_exp">学科介绍</p>		
									<div class="school_hx school_hx1"></div>
								</div>
								<div class="school_history_top2">
									<span>展开</span>									
								</div>
								<input class="school_history_edit" type="button" value="编辑" />
								<div class="clear"></div>
							</div>
							<div class="school_history_cent">
								<div class="school_history_p">
									<div class="school_sump">${(school.description)! }</div>
								</div>
								<div class="school_other">
									<textarea>${(school.description)! }</textarea>
									<input class="school_save" type="button" value="保存" />
								</div>
							</div>
						</div>
						<!--学校介绍结束-->
						<!--招生报名开始-->
						<div class="school_history">
							<div class="school_history_top">
								<div class="school_name">
									<div class="school_hx school_hx0"></div>
									<p class="sc_exp">招生报名</p>		
									<div class="school_hx school_hx1"></div>
								</div>
								<div class="school_history_top2">
									<span>展开</span>									
								</div>
								<input class="school_history_edit" type="button" value="编辑" />
								<div class="clear"></div>
							</div>
							<div class="school_history_cent">
								<div class="school_history_p">
									<div class="school_sump">${(school.recruit)! }</div>
								</div>
								<div class="school_other">
									<textarea>1、广州(校本部)考点:1)网上报名时间:由2013年3月8日上午9:00至3月16日下午17:00止2)现场确认时间:暂定2013年3月20日、21日上午9:00-11:30,下午14:30-16:30逾期未确认者,一律做报名无效处理3)因故未在网上报名的考生，可在现场确认时进行补报4)考试时间:3月23日起初试
									</textarea>
									<input class="school_save" type="button" value="保存" />
								</div>
							</div>
						</div>
						<!--招生报名结束-->
					</div>					
				</div>
			</div>
		</div>
</@html>
