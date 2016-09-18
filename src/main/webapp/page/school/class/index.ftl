<#include "/page/school/common/_layout.ftl"/>
<@html title="班级管理 - ${siteTitle!}" description="">

<link rel="stylesheet" href="/static/school/css/classmag.css"/>
<script type="text/javascript" src="/static/school/js/classmag.js"></script>
<!-- Jquery 异步提交表单-->
<script src="/static/js/jquery.form.js"></script>

<div class="classcenter">
			<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li><</li>
						<li>班级管理</li>
					</ul>
				</div>
				<!--添加结束-->
			<div class="class">
				<div class="magcenter">
					<div class="search">
						<div class="class_msg" style="display:none;">
							<input type="text" placeholder="请输入学籍、姓名查询" />
							<a href="javascript:;"></a>
						</div>
					</div>
					<div class="selctclass">
						<div class="selectleft">
							<div class="allclass">
								<input class="alldown" type="button" value="全部班级"/>
								<span class="down">
								</span>
								<div class="all_stu_hover">
								<div class="all_stu3">
									<ul>
										<li data-type='g' value="-1" onmouseover="overGrade(this)">全部</li>
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
							<span class="sumclass">共36个班级</span>
						</div>
						<input class="selectright" onclick="location.href='/school/class/buildClass.html'" value="新建班级" type="button"/>
						<div class="clear"></div>
					</div>
					<!--<div class="clear"></div>-->
					<div class='sum_table'>
						<table class="own">
							<tr class="thead">
								<th>班级</th>
								<th>进行中/课时总数</th>
								<th>老师数</th>
								<th>学生人数</th>
								<th>历史成绩</th>
								<th>班级课表</th>
							</tr>
							<#list voPage.list as list>
							<tr onclick="location.href='/school/class/detail/${list.id!}-${list.nowLesson! }-${list.allLesson! }'" class="own_hover">
								<td><a href="javascript:;">${list.gradeClass! }</a></td>
								<td><span class="numcolor">${list.nowLesson! }</span>/${list.allLesson! }</td>
								<td>${list.teacherNum! }人</td>
								<td>${list.studentNum! }人</td>
								<td><input class="score" type="button" value="成绩"/></td>
								<td><input class="classtable" type="button"  value="课表"/></td>
							</tr>
							</#list>
						</table>
					</div>
					<!--页数选择-->
                    <#include "/page/school/common/_paginate.ftl"/>
                    <@paginate currentPage=voPage.pageNumber totalPage=voPage.totalPage actionUrl="${baseUrl!}/school/class/index" urlParas="" />
				</div>
			</div>
		</div>

<script>
$(".all_stu_hover").on("click","li",function(){
	$(".all_brn_stu").val($(this).text());
	$(".all_stu3").css("display","none");
	$(".all_stu_bj0").css("display","none");
	if($(this).attr("data-type")=="g"){
		location.href="/school/class?grade_id="+$(this).attr("value");
	}else{
		location.href="/school/class?class_id="+$(this).attr("value");
	}
})
</script>
</@html>