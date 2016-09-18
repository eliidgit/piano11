<#include "/page/school/common/_layout.ftl"/>
<@html title="班级管理 - ${siteTitle!}" description="">

<link rel="stylesheet" href="/static/school/css/score.css"/>


<script type="text/javascript" src="/static/school/js/score.js"></script>
<script type="text/javascript" src="/static/school/js/jQuery-jcDate.js" ></script>

<!-- Jquery 异步提交表单-->
<script src="/static/js/jquery.form.js"></script>


<!-- 记录所选班级id -->
<input id="class_id" type="hidden" value="${classVO.id!}"/>
<input id="course_id" type="hidden" value="${courseId!0}"/>


<div class="alert_screen"></div>
			<!--添加学生开始-->
			<div class="add_student">
				<div class="add_student_title">绑定学生</div>
				<div class="add_student_banji">
					<ul>
					</ul>
					<div class="add_all_check">
						<!--<input class="add_all_check11" type="checkbox" value="" />-->
						<span class="add_all_check11"></span>
						<span>全选</span>
					</div>
					<div class="clear"></div>
				</div>
				
				<!--添加学生中心部分-->
				<div class="add_center">
					<ul class="add_center0">
					<#list studentPage.list as list>
						<li default-value="${list.id! }" onclick="goto_addstudent(this)">
								<div class="add_cen1">
									<img src="${list.avatar! }"/>
								</div>
								<img  class="add_cen2"src="/static/school/img/class/u45.png"/>
								<p class="add_cen3">${list.name! }</p>
								<p class="add_cen4">无分配班级</p>
								<p class="add_cen5">
									<span>学籍：</span>
									<span>${list.student_number! }</span>
								</p>
						</li>
					</#list>
					</ul>
				</div>
				<div class="clear"></div>
				<#include "/page/school/common/_paginate_agax3.ftl"/>
             	<@paginate_agax3 currentPage=studentPage.pageNumber totalPage=studentPage.totalPage actionUrl="/school/class/getStuByPage" urlParas="" />
					<div class="add_student_btn">
						<input class="add_student_cancle" type="button" value="取消" />
						<input class="add_student_save" type="button" value="确定" />
					</div>
				</div>
			</div>
			<!--添加学生结束-->
			<!--学生更改班级开始-->
			<div class="change_stu">
				<p class="change_stu_bj">更改班级</p>
				<div class="change_stu1">
					<span class="change_student1">年级班级</span>
					<div class="change_student2">
						<input class="change_select" readonly="readonly" data-value="0" type="text" value="选择" />
						<span class="change_down_img"></span>
						<div class="change_hover" style="top: 39px;">
							<div class="change_hover_div1">
								<ul>
									<#if gradeList??>
	                                    <#list gradeList as grade>
	                                        <li data-type='g' value="${grade.id!}" onmouseover="overGrade(this)">${grade.name!}</li>
	                                    </#list>
		                            </#if>
								</ul>
							</div>
							<div class="change_hover_div2">
								<ul>
								</ul>
							</div>
						</div>
					</div>
					<div class="change_student3"></div>
				</div>
				<div class="clear"></div>
				<div class="change_stu2">
					<input class="change_stu2_cancle" type="button" value="取消" />
					<input class="change_stu2_save" type="button" value="保存" />
				</div>
			</div>
			<!--学生更改班级结束-->
			<!--学生更改状态开始-->
			<div class="stu_change_statu">
				<p class="stu_change_statue">更改状态</p>
				<div class="stu_change_statu1">
					<span class="stu_change_stat">更改状态</span>
					<div class="stu_change1">
					    <input class="stu_change1_input" data-value="1" type="text" readonly="readonly" value="在读" />
					    <!--<img src="/static/school/img/down2_03.gif"/>-->
					    <span class="add_stu_down"></span>
					</div>
					<div class="stu_change2">
						<ul>
							<li data-value="2">休学</li>
							<li data-value="3">转学</li>
							<li data-value="4">毕业</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
				<div class="stu_change_statu2">
					<input class="stu_sta_cancle" type="button" value="取消" />
					<input class="stu_sta_save" type="button" value="保存" />
				</div>
			</div>
			<!--学生更改状态结束-->
			<!--排课班级开始-->
			<div class="class_start">
				<p class="change_stu_bj">排课班级</p>
				<div class="change_sum_stu">
					<span class="class_start_name">排课班级</span>
					<!--修改为ul-->
					<div class="sum_class_start">
						<ul class="class_start1" style="min-height: 27px;">
						</ul>
						<!--结束修改为ul-->
						<div class="clear"></div>
						<div class="class_sum">
								<div class="clasore1">
									<div class="class_sum1">
										<div class="select_class_sum">
											<input class="class_sum_select" readonly="readonly" type="text" data-value="0" value="选择班级"/>
											<span class="select_class_down"></span>
										</div>
										<!--<img class="class_sum_down" src="/static/school/img/down2_03.gif"/>-->
										<div class="class_sum2">确认添加</div>
									</div>
									<div class="all_stu_hover" style="top:41px;">
										<div class="all_stu3">
											<ul>
											<#if gradeList??>
			                                    <#list gradeList as grade>
			                                        <li data-type='g' value="${grade.id!}" onmouseover="overGrade(this)">${grade.name!}</li>
			                                    </#list>
				                            </#if>
											</ul>
										</div>
										<div class="all_stu4">
											<ul class="all_stu_bj0">
											</ul>
										</div>
									</div>
								</div>
							<!--<div class="clear"></div>-->
						</div>
					</div>
				</div>
				<div class="clear"></div>
			<div class="class_btns">
				<input class="class_btns1" type="button" value="取消" />
				<input class="class_btns2" type="button" value="保存" />
			</div>
		</div>
			<!---排课班级结束->
			<!--更改状态开始-->
			<div class="change_class_statue">
				<p class="change_stu_bj">更改状态</p>
				<div class="change_class_statue1">
					<span class="change_class_stat1">更改状态</span>
					<div class="change_statue1">
						<input class="change_input" readonly="readonly" type="text" data-value="1" value="在职" />
						<span class="change_simg"></span>
					</div>
					<div class="change_statue2">
						<ul>
							<li data-value="2">休假</li>
							<li data-value="3">离职</li>
						</ul>
					</div>
				</div>
				<div class="change_class_statue2">
					<input class="change_class_cancle" type="button" value="取消" />
					<input class="change_class_save" type="button" value="保存" />
				</div>
			</div>
			<!--更改状态结束-->
			<!--移除教师开始-->
			<div class="remove_tea">
				<p class="remove_tip">确定移除该教师在本班的教学？</p>
				<div class="remove_btns">
					<input class="remove_cancle" type="button" value="取消" />
					<input class="remove_comfirm" type="button" value="发送" />
				</div>
			</div>
			<!--移除教师结束-->
			<!--添加教师弹窗-->
			<div class="alert_window">
				<div class="alert_tit">绑定教师</div>
				<div class="alert_check">
					<div class="alert_right">
						<!--<input class="alert_right1" type="checkbox" />-->
						<span class="alert_right1"></span>
						<span>全选</span>
					</div>					
				</div>
				<div class="alert_all">
					<ul class="alert_all_teacher">
					  <#list teacherPage.list as list>
						<li onclick="goto_addteacher(this)" default-value="${list.id! }">
							<img class="alert_check1" src="/static/school/img/class/u45.png"/>
								<div class="alert_tx">
									<img src="${list.avatar! }"/>
								</div>
								<p class="alert_name">${list.name! }</p>
								<p class="alert_post"><#if (list.job)??><#if list.job=="1">高级教师<#elseif list.job=="2">中级教师<#else>初级教师</#if></#if></p>
						</li>
					  </#list>
					</ul>
					<#include "/page/school/common/_paginate_agax2.ftl"/>
                	<@paginate_agax2 currentPage=teacherPage.pageNumber totalPage=teacherPage.totalPage actionUrl="/school/class/notCurrentClassTeacher?cid=${classVO.id }" urlParas="" />
					<div class="alert_btns">
						<input class="alert_cancel" type="button" value="取消" />
						<input class="alert_comfirm" type="button" value="确定" />
					</div>
				</div>
			</div>
		<!--添加教师弹窗结束-->
		<!--课表添加音乐课开始-->
		<div class="add_music">
			<div class="add_music_tit">添加音乐课程</div>
			<div class="add_music_center">
			<form id="class_lesson">
				<div class="music_tit">
					<span class="music_kc">课程</span>
					<input class="music_class" name="schedule.title" type="text" placeholder="音乐课"/>
					<input type="hidden" name="schedule.id" id="lesson_id" />
					<input type="hidden" name="schedule.am_pm" id="lesson_apm" />
					<input type="hidden" name="schedule.week" id="lesson_week" />
					<input type="hidden" name="schedule.class_id" id="lesson_class_id" value="${(classVO.id)! }" />
				</div>
				<div class="music_time">
					<span class="music_kc">时间</span>
					<div class="music_time1">
					<div class='music_time_sum'>
						<input type="text" name="schedule.time_start"  placeholder="09:00" />
						<span class="timedate"></span>
					</div>
						<div class="time_select">
							<ul>
								<li>01:00</li>
								<li>02:00</li>
								<li>03:00</li>
								<li>04:00</li>
								<li>05:00</li>
								<li>06:00</li>
								<li>07:00</li>
								<li>08:00</li>
								<li>09:00</li>
								<li>10:00</li>
								<li>11:00</li>
								<li>12:00</li>
								<li>13:00</li>
								<li>14:00</li>
								<li>15:00</li>
								<li>16:00</li>
								<li>17:00</li>
								<li>18:00</li>
								<li>19:00</li>
								<li>20:00</li>
								<li>21:00</li>
								<li>22:00</li>
								<li>23:00</li>
								<li>24:00</li>
							</ul>
						</div>
					</div>
					<span class="most">至</span>
					<div class="music_time2">
						<div class='music_time_sum'>
							<input type="text" name="schedule.time_end" placeholder="09:00" />
							<span class="timedate"></span>
						</div>						
						<div class="time_select">
							<ul>
								<li>01:00</li>
								<li>02:00</li>
								<li>03:00</li>
								<li>04:00</li>
								<li>05:00</li>
								<li>06:00</li>
								<li>07:00</li>
								<li>08:00</li>
								<li>09:00</li>
								<li>10:00</li>
								<li>11:00</li>
								<li>12:00</li>
								<li>13:00</li>
								<li>14:00</li>
								<li>15:00</li>
								<li>16:00</li>
								<li>17:00</li>
								<li>18:00</li>
								<li>19:00</li>
								<li>20:00</li>
								<li>21:00</li>
								<li>22:00</li>
								<li>23:00</li>
								<li>24:00</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="music_bz">
					<span class="music_kc">备注</span>
					<textarea name="schedule.intro"></textarea>
				</div>
				<div class="music_btn">
					<input class="music_btn1" type="button" value="取消" />
					<input class="music_btn_yes" type="button" value="确定"/>
				</div>
				</form>
			</div>
		</div>
		<div class="scorecenter">
			<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li><</li>
						<li>班级管理</li>
						<li><</li>
						<li>${(	classVO.gradeClass)! }</li>
						<li><</li>
						<li class='class_tit'>教师</li>
					</ul>
				</div>
				<!--添加结束-->
			<div class="score">
				<div class="scoreall">
					<div class="scoretit">
					    <span>${(classVO.gradeClass)! }</span>
					    <span class="scoretime">本学期课时<span class="scored">${(classVO.nowLesson)! }</span>/${(classVO.allLesson)! }</span>
					</div>
					<div class="scorec">
						<ul class="scoreul">
							<li class="scoact"><a href="javascript:;"><span>教师</span><span><span id="teaNum">${classTeacher?size }</span>人</span></a></li>
							<li><a href="javascript:;"><span>学生</span><span><span id="stuNum">${(classPageStudent.totalRow)!}</span>人</span></a></li>
							<li><a href="javascript:;">成绩</a></li>
							<li><a href="javascript:;">课表</a></li>
						</ul>
						<!--添加-->
						<div class="add_tea_sum">
							<div class="add_teacher">
								<input class="add_teacher1" type="button" value="绑定教师" />
								<input class="add_teacher2" type="button" value="批量管理" />									
							</div>
							<div class="edit_people">
								<!--<input class="score_check" type="checkbox" />-->
								<span class="score_check"></span>
								<span class="score_all_check">全选</span>
								<div class="score_edit">
									<input class="score_edit1" type="button" value="取消" />
									<div class="score_sum">
										<div class="score_edit_check">
											<input class="score_edit2" type="button" value="编辑" />
											<!--<img src="/static/school/img/down_11.gif"/>-->											
										</div>
										<div class="score_select">
											<ul>
												<li class="score_pk">排课班级</li>
												<li class="score_change_login">更改状态</li>
												<li class="score_remove_teach">移除教学</li>
											</ul>
										</div>											
									</div>
								</div>
							</div>		
						</div>
						<div class="stu_add_sum">
							<div class="stu_add_student">
								<input class="stu_add_student1" type="button" value="绑定学生" />
								<input class="stu_add_student2" type="button" value="批量管理" />									
							</div>
							<div class="stu_edit_people">
								<!--<input class="stu_score_check" type="checkbox" />-->
								<span class="stu_score_check"></span>
								<span class="stu_score_all_check">全选</span>
								<div class="stu_score_edit">
									<input class="stu_score_cbj1" type="button" value="取消" />
									<div class="stu_score_cbj">
										<div class="stu_bj">
											<input class="stu_bj1" type="button" value="编辑" />
											<!--<img src="/static/school/img/down_11.gif"/>-->
										</div>
										<div class="stu_score_select">
											<ul>
												<li class="stu_change_b1">更改班级</li>
												<li class="stu_change_b2">更改状态</li>
											</ul>
										</div>												
									</div>
								</div>
							</div>							
						</div>
						<div class="scoresearch">
							<div class="scall">
								<input class="clasore" type="button" value="课时成绩" />	
								<!--<img class="scoredown" src="/static/school/img/down_11.gif"/>-->		
								<span class="scoredown"></span>
							</div>
							<div class="so_scall">
								<input class="period" type="text" placeholder="请输入查询课时" />
								<input class="refer" type="button" value="查询" />								
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<!--添加结束-->
					<div class="sumscore">
					<!--教师页面-->
						<div class="score0">
							<div class="score_btn">
							</div>
							<div class="clear"></div>
							<div class="score_teachpic">
								<ul>
									<#list classTeacher! as list>
									<li onclick="goto1(this,${list.id! })" default-value="${list.id! }">
											<img class="score_checked" src="/static/school/img/class/u45.png"/>
											<div class="score_tx">
												<img src="${list.avatar! }"/>
											</div>
											<p class="score_name">${list.name!}</p>
											<p class="score_post"><#if (list.job)??><#if list.job=="1">高级教师<#elseif list.job=="2">中级教师<#else>初级教师</#if></#if></p>
									</li>
									</#list>
								</ul>
							</div>
						</div>
						<!--教师页面结束-->
						<!--学生管理页面-->
						<div class="score1 hide">
							<div class="student_center">
								<div class="stu_score_btn">
								</div>
								<div class="clear"></div>
								<!--上面筛选按钮-->
								<!--下面学生信息部分-->
								<div class="student_msg">
									<ul>
									<#list classPageStudent.list as list>
										<li default-value="${(list.id)! }" onclick="stu_jump(this)">
												<div class="student_tx">
													<img src="${(list.avatar)! }"/>
												</div>
												<img class="student_check" src="/static/school/img/class/u45.png"/>
												<p class="student_name">${list.name! }</p>
												<p class="student_class">${list.gradeName! } ${list.className! }</p>
												<p class="student_study">
													<span>学籍：</span>
													<span>${list.student_number! }</span>
												</p>												
										</li>
									</#list>
									</ul>
								</div>
							</div>
							<div class="clear"></div>
							<#include "/page/school/common/_paginate_agax.ftl"/>
                    		<@paginate_agax currentPage=classPageStudent.pageNumber totalPage=classPageStudent.totalPage actionUrl="/school/class/getClassStuByPage?cid=${classVO.id! }" urlParas="" />
						</div>
						<!--学生页面结束-->
						<!--成绩页面-->
						<div class="score2 hide">
							<div class="scoretable">
								<ul class="scoresort">
									<li class="scsort1">班级排名</li>
									<li class="scsort2">姓名</li>
									<!-- <li class="scsort3">成绩</li>		 -->						
									<li class="scsort4">成绩</li>
								</ul>
							<div class="tables">
								<div class="scoretable1">
									<#list stuScores! as list>
									<ul>
										<li class="scsort1">${list_index+1 }</li>
										<li class="scorename scsort2">${list.name! }</li>
										<!-- <li class="scsort3">100</li> -->
										<li class="rank scsort4">${list.score! }</li>
									</ul>
									</#list>
								</div>
							</div>
							<div class="clear"></div>
							</div>
						</div>
						<!--成绩页面结束-->
						<!--课表页面开始-->
						<div class="score3 time_table hide">
						<div class="timetable">
							<div class="timetable_tit">音乐课表</div>
							<div class="time_date">
								<ul class="time_date_ul">
									<li class="sw"></li>
									<li>周日</li>
									<li>周一</li>
									<li>周二</li>
									<li>周三</li>
									<li>周四</li>
									<li>周五</li>
									<li>周六</li>
								</ul>
								<ul class="time_date1">
									<li class="sw">上午</li>
									<#if amLesson??&&amLesson.get("1")??>
										<li data-value="${amLesson['1'].id }" data-week="1" class="time_already add_kb">
											<p>${amLesson.get("1").title! }</p>
											<p><span>${amLesson.get("1").time_start! }</span>~<span>${amLesson.get("1").time_end! }</span></p>
											<p>${amLesson["1"].intro! }</p>
										</li>
									<#else>
										<li class="kb add_kb">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if>
									<#if amLesson??&&amLesson.get("2")??>
										<li data-value="${amLesson['2'].id }" data-week="2" class="time_already add_kb">
											<p>${amLesson.get("2").title! }</p>
											<p><span>${amLesson.get("2").time_start! }</span>~<span>${amLesson.get("2").time_end! }</span></p>
											<p>${amLesson["2"].intro! }</p>
										</li>
									<#else>
										<li data-week="2" class="kb add_kb">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if><#if amLesson??&&amLesson.get("3")??>
										<li data-week="3" data-value="${amLesson['3'].id }" class="time_already add_kb">
											<p>${amLesson.get("3").title! }</p>
											<p><span>${amLesson.get("3").time_start! }</span>~<span>${amLesson.get("3").time_end! }</span></p>
											<p>${amLesson["3"].intro! }</p>
										</li>
									<#else>
										<li data-week="3" class="kb add_kb">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if><#if amLesson??&&amLesson.get("4")??>
										<li data-value="${amLesson['4'].id }" data-week="4" class="time_already add_kb">
											<p>${amLesson.get("4").title! }</p>
											<p><span>${amLesson.get("4").time_start! }</span>~<span>${amLesson.get("4").time_end! }</span></p>
											<p>${amLesson["4"].intro! }</p>
										</li>
									<#else>
										<li data-week="4" class="kb add_kb">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if><#if amLesson??&&amLesson.get("5")??>
										<li data-value="${amLesson['5'].id }" data-week="5" class="time_already add_kb">
											<p>${amLesson.get("5").title! }</p>
											<p><span>${amLesson.get("5").time_start! }</span>~<span>${amLesson.get("5").time_end! }</span></p>
											<p>${amLesson["5"].intro! }</p>
										</li>
									<#else>
										<li data-week="5" class="kb add_kb">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if><#if amLesson??&&amLesson.get("6")??>
										<li data-value="${amLesson['1'].id }" data-week="6" class="time_already add_kb">
											<p>${amLesson.get("6").title! }</p>
											<p><span>${amLesson.get("6").time_start! }</span>~<span>${amLesson.get("6").time_end! }</span></p>
											<p>${amLesson["6"].intro! }</p>
										</li>
									<#else>
										<li data-week="6" class="kb add_kb">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if><#if amLesson??&&amLesson.get("7")??>
										<li data-value="${amLesson['7'].id }" data-week="7" class="time_already add_kb">
											<p>${amLesson.get("7").title! }</p>
											<p><span>${amLesson.get("7").time_start! }</span>~<span>${amLesson.get("7").time_end! }</span></p>
											<p>${amLesson["7"].intro! }</p>
										</li>
									<#else>
										<li data-week="7" class="kb add_kb">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if>
								</ul>
								<div class="kb_height"></div>
								<ul class="time_date2"><!--添加class名-->
									<li class="sw">下午</li>
									<#if pmLesson??&&pmLesson.get("1")??>
										<li data-value="${pmLesson['1'].id }" data-week="1" class="time_already add_kb1">
											<p>${pmLesson.get("1").title! }</p>
											<p><span>${pmLesson.get("1").time_start! }</span>~<span>${pmLesson.get("1").time_end! }</span></p>
											<p>${pmLesson["1"].intro! }</p>
										</li>
									<#else>
										<li data-week="1" class="kb add_kb1">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if>
									<#if pmLesson??&&pmLesson.get("2")??>
										<li data-value="${pmLesson['2'].id }" data-week="2" class="time_already add_kb1">
											<p>${pmLesson.get("2").title! }</p>
											<p><span>${pmLesson.get("2").time_start! }</span>~<span>${pmLesson.get("2").time_end! }</span></p>
											<p>${pmLesson["2"].intro! }</p>
										</li>
									<#else>
										<li data-week="2" class="kb add_kb1">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if><#if pmLesson??&&pmLesson.get("3")??>
										<li data-value="${pmLesson['3'].id }" data-week="3" class="time_already add_kb1">
											<p>${pmLesson.get("3").title! }</p>
											<p><span>${pmLesson.get("3").time_start! }</span>~<span>${pmLesson.get("3").time_end! }</span></p>
											<p>${pmLesson["3"].intro! }</p>
										</li>
									<#else>
										<li data-week="3" class="kb add_kb1">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if><#if pmLesson??&&pmLesson.get("4")??>
										<li data-value="${pmLesson['4'].id }" data-week="4" class="time_already add_kb1">
											<p>${pmLesson.get("4").title! }</p>
											<p><span>${pmLesson.get("4").time_start! }</span>~<span>${pmLesson.get("4").time_end! }</span></p>
											<p>${pmLesson["4"].intro! }</p>
										</li>
									<#else>
										<li data-week="4" class="kb add_kb1">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if><#if pmLesson??&&pmLesson.get("5")??>
										<li data-value="${pmLesson['5'].id }" data-week="5" class="time_already add_kb1">
											<p>${pmLesson.get("5").title! }</p>
											<p><span>${pmLesson.get("5").time_start! }</span>~<span>${pmLesson.get("5").time_end! }</span></p>
											<p>${pmLesson["5"].intro! }</p>
										</li>
									<#else>
										<li  data-week="5" class="kb add_kb1">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if><#if pmLesson??&&pmLesson.get("6")??>
										<li data-value="${pmLesson['6'].id }" data-week="6" class="time_already add_kb1">
											<p>${pmLesson.get("6").title! }</p>
											<p><span>${pmLesson.get("6").time_start! }</span>~<span>${pmLesson.get("6").time_end! }</span></p>
											<p>${pmLesson["6"].intro! }</p>
										</li>
									<#else>
										<li data-week="6" class="kb add_kb1">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if>
									<#if pmLesson??&&pmLesson.get("7")??>
										<li data-value="${pmLesson['7'].id }" data-week="7" class="time_already add_kb1">
											<p>${pmLesson.get("7").title! }</p>
											<p><span>${pmLesson.get("7").time_start! }</span>~<span>${pmLesson.get("7").time_end! }</span></p>
											<p>${pmLesson["7"].intro! }</p>
										</li>
									<#else>
										<li  data-week="7" class="kb add_kb1">
											<img class="kb_add" src="/static/school/img/class/pic6.png"/>
										</li>
									</#if>
								</ul>
							</div>
						</div>
						</div>
						<!--课表页面结束-->
					</div>
					<div class="clear"></div><!--添加-->
				</div>
			</div>
		</div>
<script type="text/javascript">
$(".add_student_save").click(function(){
	var arr = [];
    $(".add_center0 li").each(function(){
		var id=$(this).attr("data-value");
		if(id !=null&&id!=""){
			arr.push(id);
		}
	});
    if(arr==null || arr.length<1){
    	alert("请选择学生");
    	return;
    }
    $.ajax( {  
	     url:'/school/class/addClassStudents',// 跳转到 action     
	     data:{  
	     		sids : arr,
	            class_id:$("#class_id").val()
	    },
	     async:false,  //同步
	     type:'post',      
	     dataType:'json',  
	     success:function(data) {  
	         if(data.code =="200" ){
	        	 $("stuNum").text((parseInt($("stuNum").text())+arr.length));
	        	 $(".add_center0 li").each(function(){
	        			var id=$(this).attr("data-value");
	        			if(id !=null&&id!=""){
	        				if($(".student_msg li").length<10){
	        					$(".student_msg ul").append('<li onclick="stu_jump(this)" default-value="'+id+'">'+
																'<div class="student_tx">'+
																'<img src="'+$(this).find(".add_cen1 img").attr("src")+'">'+
																'</div>'+
																'<img src="/static/school/img/class/u45.png" class="student_check">'+
																'<p class="student_name">'+$(this).find(".add_cen3").html()+'</p>'+
																'<p class="student_class">${(classVO.gradeClass)! }</p>'+
																'<p class="student_study">'+
																	'<span>学籍：</span>'+
																	'<span>'+$(this).find(".add_cen5 span").eq(1).html()+'</span>'+
																'</p>'+												
															'</li>');
	        				}
	        			}
	        			$(".add_student").css("display","none");
	        			$(".alert_screen").css("display","none");
	        			$(".add_center0 li").removeClass("add_student_act");
	        			$(".add_center0 .add_cen2").attr("src","/static/school/img/class/u45.png");
	        			$.ajax( {  
		   				     url:'/school/class/getStuByPage',// 跳转到 action     
		   				     data:{  
		   				             p :currentPage3
		   				    },
		   				     async:false,  //同步
		   				     type:'post',      
		   				     dataType:'json',  
		   				     success:function(data) {  
		   				         if(data.code =="200" ){
		   				        	 showPage3(data);
		   				         }else{  
		   				            view(data.description);  
		   				        }  
		   				     },  
		   				      error : function() {  
		   				           alert("异常！");  
		   				     }  
		   				});
	        	});
	        	 
	         }else{  
	            view(data.description);  
	        }  
	     },  
	      error : function() {  
	           alert("异常！");  
	     }  
	});	
});
$(".stu_sta_save").click(function(){
	var arr = [];
    $(".student_msg li").each(function(){
		var id=$(this).attr("data-value");
		if(id !=null&&id!=""){
			arr.push(id);
		}
	});
    if(arr==null || arr.length<1){
    	alert("请选择学生");
    	return;
    }
    //已经准备好选中数组
    $.ajax({
        url: "/school/student/updateStates",    //请求的url地址
        dataType: "json",   //返回格式为json
        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
        data: {"sids": arr, "state": $(".stu_change1_input").attr("data-value")},    //参数值
        type: "post",   //请求方式

        success: function (data) {
            //请求成功时处理
            if (data.code == '200') {
                $(".stu_change_statu").css("display","none");
            	$(".alert_screen").css("display","none");
            	stuCancel();
            } else {
                alert(data.description);
            }

        }
    });
});
function stuCancel(){
	$(".stu_edit_people").css("display","none");
	$(".student_check").css("display","none");
	$(".stu_add_student").css("display","block");
	$(".student_msg li").removeClass("li_act");
	$(".student_check").attr("src","/static/school/img/class/u45.png");
	$(".stu_score_check").css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
	flag4=true;
}
$(".change_hover_div2").on("click","li",function(){
	$(".change_select").val(gname+$(this).text());
	$(".change_hover").css("display","none");
	$(".change_select").attr("data-value",$(this).attr("value"));
});
$(".change_stu2_save").click(function(){
	var arr = [];
    $(".student_msg li").each(function(){
		var id=$(this).attr("data-value");
		if(id !=null&&id!=""){
			arr.push(id);
		}
	});
    if(arr==null || arr.length<1){
    	alert("请选择学生");
    	return;
    }
    if($(".change_select").attr("data-value")=="0"){
    	alert("请选择班级");
    	return;
    }
    if($(".change_select").attr("data-value")==$("#class_id").val()){
    	alert("不能选本班级");
    	return;
    }
    //已经准备好选中数组
    $.ajax({
        url: "/school/student/updateClass",    //请求的url地址
        dataType: "json",   //返回格式为json
        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
        data: {"sids": arr, "cid": $(".change_select").attr("data-value")},    //参数值
        type: "post",   //请求方式
        success: function (data) {
            //请求成功时处理
            if (data.code == '200') {
                $(".change_stu").css("display","none");
				$(".alert_screen").css("display","none");
				$(".student_msg li").each(function(){
					var id=$(this).attr("data-value");
					if(id !=null&&id!=""){
						$(this).remove();
					}
				});
				$("#stuNum").text($("#stuNum").text()-arr.length);
				stuCancel();
				$.ajax( {  
				     url:'/school/class/getClassStuByPage?cid='+$("#class_id").val(),// 跳转到 action     
				     data:{  
				             p :currentPage
				    },
				     async:false,  //同步
				     type:'post',      
				     dataType:'json',  
				     success:function(data) {  
				         if(data.code =="200" ){
				        	 showPage(data);
				         }else{  
				            view(data.description);  
				        }  
				     },  
				      error : function() {  
				           alert("异常！");  
				     }  
				});
				
				
            } else {
                alert(data.description);

            }

        }
    });
});
$(".alert_comfirm").click(function(){
	var arr = [];
    $(".alert_all_teacher li").each(function(){
		var id=$(this).attr("data-value");
		if(id!=null&&id!=""){
			arr.push(id);
		}
	});
    if(arr==null || arr.length<1){
    	alert("请选择教师");
    	return;
    }
    if(confirm("确定给该班级分配教师吗？")){
	    $(".alert_window").css("display","none");
		$(".alert_screen").css("display","none");
	    $.ajax({
	        url: "/school/class/assignClassTeacher",    //请求的url地址
	        dataType: "json",   //返回格式为json
	        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
	        data: {
	        	"tids": arr, 
	        	"cid": $("#class_id").val()
	        	},    //参数值
	        type: "post",   //请求方式
	
	        success: function (data) {
	            //请求成功时处理
	            if (data.code == '200') {
	            	$("#teaNum").text((parseInt($("#teaNum").text())+arr.length));
	            	$(".alert_all_teacher li").each(function(){
	            		var id=$(this).attr("data-value");
	            		if(id!=null&&id!=""){
	            			$(".score_teachpic ul").append('<li default-value="'+id+'" onclick="goto1(this,'+id+')">'+
									'<img src="/static/school/img/class/u45.png" class="score_checked">'+
									'<div class="score_tx">'+
										'<img src="'+$(this).find(".alert_tx img").attr("src")+'">'+
									'</div>'+
									'<p class="score_name">'+$(this).find(".alert_name").html()+'</p>'+
									'<p class="score_post">'+$(this).find(".alert_post").html()+'</p>'+
							'</li>');
	            			$(this).remove();
	            			
	            		}
	            	});
					$(".alert_all li").removeClass("alert_li_act");
					$(".alert_check1").attr("src","/static/school/img/class/u45.png");
	            	
	            } else {
	                alert(data.description);
	            }
	
	        }
	    });
    }
});
$(".remove_comfirm").click(function(){
	var arr = [];
    $(".score_teachpic li").each(function(){
		var id=$(this).attr("data-value");
		if(id!=null&&id!=""){
			arr.push(id);
		}
	});
    if(arr==null || arr.length<1){
    	alert("请选择教师");
    	return;
    }
    $(".remove_tea").css("display","none");
	$(".alert_screen").css("display","none");
    $.ajax({
        url: "/school/class/relieveClassTeacher",    //请求的url地址
        dataType: "json",   //返回格式为json
        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
        data: {
        	"tids": arr, 
        	"cid": $("#class_id").val()
        	},    //参数值
        type: "post",   //请求方式

        success: function (data) {
            //请求成功时处理
            if (data.code == '200') {
            	$("#teaNum").text($("#teaNum").text()-arr.length);
            	$(".score_teachpic li").each(function(){
            		var id=$(this).attr("data-value");
            		if(id!=null&&id!=""){
            			if($("alert_all_teacher li").length<10){
	            			$(".alert_all_teacher").append('<li default-value="'+id+'" onclick="goto_addteacher(this)">'+
								'<img src="/static/school/img/class/u45.png" class="alert_check1">'+
									'<div class="alert_tx">'+
										'<img src="'+$(this).find(".score_tx img").attr("src")+'">'+
									'</div>'+
									'<p class="alert_name">'+$(this).find(".score_name").html()+'</p>'+
									'<p class="alert_post">'+$(this).find(".score_post").html()+'</p>'+
							'</li>');
            			}
            			$(this).remove();
            			
            		}
            	});
            	cancleTeacher();
            	
            } else {
                alert(data.description);
            }

        }
    });
	
});
$(".score_remove_teach").click(function(){
	var arr = [];
    $(".score_teachpic li").each(function(){
		var id=$(this).attr("data-value");
		if(id!=null&&id!=""){
			arr.push(id);
		}
	});
    if(arr==null || arr.length<1){
    	alert("请选择教师");
    	return;
    }
    $(".remove_tea").css("display","block");
    $(".alert_screen").css("display","block");
});
$(".change_class_save").click(function(){
	var arr = [];
    $(".score_teachpic li").each(function(){
		var id=$(this).attr("data-value");
		if(id!=null&&id!=""){
			arr.push(id);
		}
	});
    if(arr==null || arr.length<1){
    	alert("请选择教师");
    	return;
    }
    //已经准备好选中数组
    $.ajax({
        url: "/school/teacher/updateStates",    //请求的url地址
        dataType: "json",   //返回格式为json
        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
        data: {
        	"tids": arr, 
        	"state": $(".change_input").attr("data-value")
        	},    //参数值
        type: "post",   //请求方式

        success: function (data) {
            //请求成功时处理
            if (data.code == '200') {
            	$(".change_class_statue").css("display","none");
        		$(".alert_screen").css("display","none");
        		cancleTeacher();
            } else {
                alert(data.description);
            }

        }
    });
	
})
function cancleTeacher(){
	$(".score_teachpic li").each(function(){
		$(this).attr("data-value","");
	});
	$(".score_checked").css("display","none");
	$(".edit_people").css("display","none");
	$(".add_teacher").css("display","block");
	$(".score_teachpic li").removeClass("li_act");
	$(".score_checked").attr("src","/static/school/img/class/u45.png");
	$(".score_check").css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
	flag8=true;
}
$(".class_btns2").click(function(){
	var arr = [];
    $(".score_teachpic li").each(function(){
		var id=$(this).attr("data-value");
		if(id!=null&&id!=""){
			arr.push(id);
		}
	});
    if(arr==null || arr.length<1){
    	alert("请选择教师");
    	return;
    }
    var cids = [];
    $(".class_start1").find("[name='cid']").each(function(){
		var id=$(this).val();
		if(id!=""){
			cids.push(id);
		}
	});
    if(cids==null || cids.length<1){
    	alert("请选择年级班级");
    	return;
    }
    
    //已经准备好选中数组
    $.ajax({
        url: "/school/teacher/updateClass",    //请求的url地址
        dataType: "json",   //返回格式为json
        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
        data: {
        	"tids": arr, 
        	"cids": cids
        	},    //参数值
        type: "post",   //请求方式

        success: function (data) {
            //请求成功时处理
            if (data.code == '200') {
            	$(".score_teachpic li").each(function(){
        			$(this).attr("data-value","");
        		});
            	$(".class_start").css("display","none");
				$(".alert_screen").css("display","none");
				$(".class_start1").empty();
	            $(".class_sum_select").val("选择班级");
	            $(".class_sum_select").attr("data-value","0");	
        		cancleTeacher();
            } else {
                alert(data.description);
            }

        }
    });
});
$(".class_sum2").click(function(){
	var cid=$(".class_sum_select").attr("data-value");
	if($(".class_start1").find("[value='"+cid+"']").attr("name")!="cid" && cid!=0 ){
		var text1='<li class="class_start2">'+
				'<span>'+$(".class_sum_select").val()+'</span>'+
				'<span class="class_del"></span>'+
				'<input type="hidden" name="cid" value="'+cid+'" />'+
			'</li>';
    	$(".class_start1").append(text1);
	}
});
$(".all_stu_bj0").on("click","li",function(){
	$(".all_stu_hover").css("display","none");
	var cid=$(this).attr("value");
	$(".class_sum_select").val(gname+$(this).text());
	$(".class_sum_select").attr("data-value",cid);
});
//移动
var num0=0;
var extent=$(".score_teachpic li").size();
$(".score_check").click(function(){
		if(flag8){
			$(".score_teachpic li").each(function(){
				$(this).attr("data-value",$(this).attr("default-value"));
			});
			$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -240px -54px");
			$(".score_teachpic li").addClass("li_act");
			$(".score_checked").attr("src","/static/school/img/class/success2_07.png");
			flag8=false;
			num0=extent;
		}else{
			$(".score_teachpic li").each(function(){
				$(this).attr("data-value","");
			});
			$(this).css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
			$(".score_teachpic li").removeClass("li_act");
			$(".score_checked").attr("src","/static/school/img/class/u45.png");
			flag8=true;
			num0=0;
		}
});
function goto1(obj,id){
	if($(obj).find(".score_checked").css("display")=="none"){		
	}else{
		if($(obj).find(".score_checked").attr("src").indexOf("success2_07")<0){
			$(obj).attr("data-value",id);
			$(obj).addClass("li_act");
			$(obj).find(".score_checked").attr("src","/static/school/img/class/success2_07.png");	
			num0++;
		}else{
			$(obj).attr("data-value","");
			$(obj).removeClass("li_act");
			$(obj).find(".score_checked").attr("src","/static/school/img/class/u45.png");		
			num0--;		
		}
		if(num0==extent){
			$(".score_check").css({"background":"url('/static/school/img/spirit_img.png') -240px -54px no-repeat"});	
			flag8=false;			
		}else{
			$(".score_check").css({"background":"url('/static/school/img/spirit_img.png') -218px -54px no-repeat"});
			flag8=true;	
		}
	}
}
//添加
function showPage(data){
	$(".student_msg li").remove();
	 var list = data.detail.list;
	 for(var i =0;i<list.length;i++){
		 var stu = list[i];
		 var text='<li onclick="stu_jump(this)" default-value="'+stu.id+'">'+
			'<div class="student_tx">'+
				'<img src="'+stu.avatar+'">'+
			'</div>'+
			'<img src="/static/school/img/class/u45.png" class="student_check">'+
			'<p class="student_name">'+stu.name+'</p>'+
			'<p class="student_class">'+stu.gradeName+' '+stu.className+'</p>'+
			'<p class="student_study">'+
				'<span>学籍：</span>'+
				'<span>'+stu.student_number+'</span>'+
			'</p>'+												
		'</li>';
		$(".student_msg ul").append(text);
	 }
}
function showPage2(data){
	$(".alert_all_teacher li").remove();
	 var list = data.detail.list;
	 for(var i =0;i<list.length;i++){
		 var tea = list[i];
		 var text='<li default-value="'+tea.id+'" onclick="goto_addteacher(this)">'+
					'<img src="/static/school/img/class/u45.png" class="alert_check1">'+
				'<div class="alert_tx">'+
					'<img src="'+tea.avatar+'">'+
				'</div>'+
				'<p class="alert_name">'+tea.name+'</p>'+
				'<p class="alert_post">'+(tea.job=="1"?"高级教师":(tea.job=="2"?"中级教师":"初级教师"))+'</p>'+
				'</li>';
		 $(".alert_all_teacher").append(text);
	 }
	 $(".alert_check").find(".alert_right1").css("background","url('/static/school/img/spirit_img.png') -218px -54px no-repeat");
}
function showPage3(data){
	$(".add_center0 li").remove();
	 var list = data.detail.list;
	 for(var i =0;i<list.length;i++){
		 var stu = list[i];
		 var text='<li onclick="goto_addstudent(this)" default-value="'+stu.id+'">'+
				'<div class="add_cen1">'+
				'<img src="'+stu.avatar+'">'+
			'</div>'+
			'<img src="/static/school/img/class/u45.png" class="add_cen2">'+
			'<p class="add_cen3">'+stu.name+'</p>'+
			'<p class="add_cen4">无分配班级</p>'+
			'<p class="add_cen5">'+
				'<span>学籍：</span>'+
				'<span>'+stu.student_number+'</span>'+
			'</p>'+
		'</li>';
		 $(".add_center0").append(text);
	 }
	 $(".add_all_check").find(".add_all_check11").css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
}
$(".refer").click(function(){
	var lessonName=$(".period").val();
	if(lessonName==null || lessonName==""){
		alert("请输入课程名称！");
		return;
	}
	$.ajax({
        url: "/school/class/getAllStuScoreByLessonName",    //请求的url地址
        dataType: "json",   //返回格式为json
        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
        data: {
        	"cid": $("#class_id").val(), 
        	"courseId": $("#course_id").val(),
        	"lessonName": lessonName
        	},    //参数值
        type: "post",   //请求方式

        success: function (data) {
            //请求成功时处理
            if (data.code == '200') {
            	$(".scoretable1").empty();
            	for(var i=0;i<data.detail.length;i++){
            		var stuScore= data.detail[i];
            		$(".scoretable1").append('<ul>'+
							'<li class="scsort1">'+(i+1)+'</li>'+
							'<li class="scorename scsort2">'+stuScore.name+'</li>'+
							'<li class="rank scsort4">'+stuScore.score+'</li>'+
						'</ul>');
            	}
            } else {
                alert(data.description);
            }

        }
    });
})
$(".music_btn1").click(function(){
	$(".add_music").css("display","none");
	$(".alert_screen").css("display","none");
	$("#lesson_id").val("");
	$("#lesson_apm").val("");
	$(".add_music").find("[name='schedule.title']").val("");
	$(".add_music").find("[name='schedule.time_start']").val("");
	$(".add_music").find("[name='schedule.time_end']").val("");
	$(".add_music").find("[name='schedule.intro']").val("");
});

</script>
</@html>