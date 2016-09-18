<#include "/page/school/common/_layout.ftl"/>
<@html title="钢琴详情 - ${siteTitle!}" description="">
<link rel="stylesheet" href="/static/school/css/piano.css" />
<script type="text/javascript" src="/static/school/js/pinaodetail.js" ></script>
<script type="text/javascript" src="/static/school/js/jQuery-jcDate.js" ></script>
<link rel="stylesheet" href="/static/school/css/jcDate.css" />
<div class="lr_tc"></div>
<div class="loading"><img src="/static/school/img/pic19.png"/></div>
<div class="pianodetail">
			<!--添加-->
				<div class="common_top">
					<ul>
						<li>首页</li>
						<li><</li>
						<li>设备管理</li>
						<li><</li>
						<li>钢琴资产配置</li>
						<li><</li>
						<li class='pinao_det'>钢琴详情</li>
					</ul>
				</div>
			<!--添加结束-->
				<div class="pdetail">
					<div class="pianotit">
						<p class="detailtit">钢琴详情</p>
					</div>					
					<div class="sumdetail">
					  <div class="sdetcenter">
					  	<!--添加-->
					  	<div class="det_detail">
					  		<div class="pinao_detail">
					  			<div class="pinao_left_hx0"></div>
					  			<div class="pinao_left_center">钢琴详情</div>
					  			<div class="pinao_left_hx1"></div>
					  		</div>
						  	<input type="button" class="cancel" value="编辑" />
					  	</div>
					  	<!--添加结束-->
						<div class="sum1">
						<form id="update_piano">
							<div class="sum2s">
								<div class="sum2">
									<div class="sum_edit1">
										<span class="sum_edit1_title">钢琴乐器ID</span>
										<span id="piano_piano_id1">${(piano.piano_id)! }</span><input type="hidden" name="piano.id" value="${piano.id }" />
									</div>
									<div class="sum_edit2">
										<span>钢琴乐器ID</span>
										<input id="piano_piano_id2" type="text" name="piano.piano_id" value="${(piano.piano_id)! }" />										
									</div>
								</div>
								<div class="clear"></div>
								<div class="sum2">
									<div class="sum_edit1">
										<span class="sum_edit1_title">所在教室</span>
										<span id="piano_building_name1">${(piano.building)!}-${(piano.name)!}</span>
									</div>
									<div class="sum_edit2">
										<span class="sum_class_now">所在教室</span>
										<div class="sum_class_select">
											<input id="piano_building_name2" class="sum_select_input" type="text" value="${(piano.building)!}-${(piano.name)!}" />
											<input type="hidden" id="piano_classroom_id" name="piano.classroom_id" value="${piano.classroom_id! }" />
											<span></span>
										</div>
										<div class="sum_class_sel">
											<ul class="sum_class_ul">
												<#list classrooms! as list>
													<li data-id="${list.id }">${list.building! }-${list.name! }</li>
												</#list>
											</ul>
										</div>
									</div>
								</div>
								<div class="clear"></div>
								<div class="sum2">
									<div class="sum_edit1">
										<span class="sum_edit1_title">使用时间</span>
										<span id="piano_create_time1">${(piano.create_time)!?string('yyyy-MM-dd')}起</span>																							
									</div>
									<div class="sum_edit2">
										<span class="time">使用时间</span>
										<div class="date">
											<input id="piano_create_time2" type="text" class="jcDate" name="piano.create_time" value="${(piano.create_time)!?string('yyyy-MM-dd')}" />
										</div>
									</div>
								</div>
								<div class="clear"></div>
								<div class="sum2">
									<div class="sum_edit1">
										<span class="sum_edit1_title">使用程度</span>										
										<span id="y1">${y! }年</span>								
									</div>
									<div class="sum_edit2">
										<span>使用程度</span>
										<input class="use_time" id="y2" readonly="readonly" type="text" value="${y! }年" />
									</div>
								</div>								
							</div>
							<div class="clear"></div>
							<div class="sum_btn">
								<input type="button" class="btn_cancle" value="取消" />
								<input type="button" class="save" value="保存" />
								<div class="clear"></div>
							</div>
							</form>
						</div>
						<div class="param">
							<div class="pinao_detail">
					  			<div class="pinao_left_hx0"></div>
					  			<div class="pinao_left_center">产品参数</div>
					  			<div class="pinao_left_hx1"></div>
					  		</div>
					  		<div class="clear"></div>
					  		<div class="para_sum"><!--添加-->
						  		<div class="para_left"></div><!--添加-->
								<div class="paras">
									<p>PSR-E33</p>
									<p>键盘     61个力度标准感应键</p>
									<p>最大同时发音数 32个音符 (最大)</p>
									<p>萤幕    LCD萤幕</p>
									<p>音色 497(140种面板音色+13组打击乐/SFX音色+344种XGlite音色)</p>
									<p>伴奏型态 106</p>
									<p>音乐资料库 100</p>
									<p>预设乐曲 102 (New Demo Song)</p>
									<p>效果 9种残响+4种叠奏+26种和声类型+3种超宽立体声类型</p>
									<p>录音功能 5首2轨式录音</p>
									<p>第五代教学功能 steps(Listening/Timing/Waiting)+Special Lesson</p>
									<p>和絃字典 有</p>
									<p>General MIDI 有</p>
									<p>USB (TO HOST) 有</p>
									<p>扩大机 2.5W x2</p>
									<p>尺寸(宽×深×高) 945×369×132mm</p>
									<p>重量 4.9公斤</p>
								</div>
					  		</div>
						</div>
					</div>
					</div>
				</div>
				</div>
<script type="text/javascript">
$(".sum_class_select").click(function(event){
	stopEvent(event);
	if($(".sum_class_sel").css("display")=="block"){
		$(".sum_class_sel").css("display","none");
	}else{
		$(".sum_class_sel").css("display","block");
	}
});
$(".sum_class_ul li").click(function(){
	$(".sum_class_sel").css("display","none");
	$(".sum_select_input").val($(this).text());
	$("#piano_classroom_id").val($(this).attr("data-id"));
})
</script>				
</@html>
