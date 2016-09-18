<#include "/page/school/common/_layout.ftl"/>
<@html title="设备管理 - ${siteTitle!}" description="">
<link rel="stylesheet" href="/static/school/css/property.css" />
<link rel="stylesheet" href="/static/school/css/jcDate.css" />
<script type="text/javascript" src="/static/school/js/property.js" ></script>
<script type="text/javascript" src="/static/school/js/jQuery-jcDate.js" ></script>

<div class="lr_tc"></div>
<div class="loading"><img src="/static/school/img/pic19.png"/></div>
<!--钢琴故障报修弹窗-->
<div class="repairs">
	<div class="repairs_top">钢琴故障报修</div>
	<div class="repairs_window">
	<form id="add_mal">
		<div class="repairs_window0 border_none">
			<span>钢琴ID</span>
			<input type="text" id="pianoMalfunction_piano_id"  readonly="readonly" value="" />
			<input type="hidden" id="pianoMalfunction_pid" name="pianoMalfunction.pid" />
		</div>
		<div class="repairs_window0 border_none">
			<span>所在教室</span>
			<input type="text" id="pianoMalfunction_building_name" readonly="readonly" value="B栋-101室" />
		</div>
		<div class="repairs_window0">
			<span>上报日期</span>
			<div class="repair_date">
				<input class="jcDate" id="pianoMalfunction_create_time" name="pianoMalfunction_create_time" readonly="readonly" type="text" value=""/>
				<span></span>
			</div>
		</div>
		<div class="repairs_window0 repairs_window_over">
			<span>故障类型</span>
			<div class="repair_select">
				<div class="repair_input">
					<input class="repair_input0"  type="text" value="" />
					<span class="repair_input1"></span>							
				</div>
				<div class="equipment">
					<input type="hidden" id="pianoMalfunction_type" name="pianoMalfunction.type"/>
					<ul>
						<li data-id="1">设备故障</li>
						<li data-id="2">人为损坏</li>
						<li data-id="3">钢琴换新</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="repairs_window0">
			<span>故障说明</span>
			<textarea name="pianoMalfunction.description"></textarea>
		</div>
		<div class="repairs_window0">
			<span>处理方式</span>
			<div class="repairs_mode">
			<input type="hidden" name="pianoMalfunction.dispose_mode" id="pianoMalfunction_dispose_mode" value="2" />
				<div class="repairs_mode0">
					<span class="repairs_check"></span>
					<span>自维修</span>
				</div>
				<div class="repairs_mode1">
					<span class="repairs_check repair_act"></span>
					<span>厂家维修</span>
				</div>
			</div>
		</div>
		<div class="repairs_window1">
			<input class="repairs_cancle" type="button" value="取消" />
			<input class="repairs_yes" type="button" value="确定" />
		</div>
		</form>
	</div>
</div>
<!--钢琴故障报修弹窗结束-->
<!--新增钢琴弹窗-->
<div class="allpinao"></div>
<div class="newpinao">
	<div class="newptop">新增钢琴</div>
	<div class="newcens">
		<form id="add_piano">
				<div class="newcen1">
					<span class="lab">入校时间</span>
					<div class="date">
						<input class="date1 jcDate" readonly="readonly" name="piano.create_time" type="text" value="" />
						<span class="date_logo"></span>
					</div>
				</div>
				<div class="clear"></div>
				<div class="newcen2">
					<span class="lab">钢琴ID</span>
					<input class="date2" name="piano.piano_id" type="text" placeholder="2012030506"  />
				</div>
				<div class="clear"></div>
				<div class="newcen3">
					<span class="lab">分配教室</span>
					<div class="cendates">
						<div class="cendate">
							<input class="date3"  readonly="readonly" type="text" value="" />
							<input type="hidden" id="piano_classroom_id" name="piano.classroom_id"  />
							<span></span>
						</div>
						<div class="cendown">
							<ul>
							<#list classrooms! as list>
								<li data-id="${list.id }">${list.building! }-${list.name! }</li>
							</#list>
							</ul>
						</div>
					</div>
					<input class="createclass" type="button" value="新建教室" />
				</div>
				<div class="cans">
					<input class="canres canres1" type="button" value="取消"/>
					<input class="canyes add_piano_save" type="button" value="确定"/>																		
				</div>
		</form>
	</div>
</div>
<!--新建教室-->
<div class="newclass"></div>
<div class="newc1">
	<div class="newctop">新建教室</div>
	<div class="newclasscen">
		<form id="add_classroom">
			<div class="newcla1">
				<span class="newtea">教学楼</span><input class="jxl" name="classroom.building" type="text" value="" />
			</div>
			<div class="newcla2">
				<span class="newtea">教室名称</span><input class="jsname" name="classroom.name" type="text" />
			</div>
			<div class="newbtn">
				<input class="newbtnc" type="button" value="取消" />
				<input class="newbtny" type="button" onclick="createclass()" value="确定" />
			</div>					
		</form>
	</div>
</div>
<!--新建教室结束-->
<!--弹窗结束-->
<!--申诉显示弹窗-->
    <!--<div class="screen"></div>-->
    <div class="propcontact">
    	<div class="pcontact">联系售后</div>
    	<div class="pques">
    		<div class="pcenter">
    			<div class="pcenter_tip">请拨打我们的售后联系电话，我们竭诚为您服务!</div>
    			<div class="pcenter_phone">
    				<div class="pcenter_all">
	    				<span></span>
	    				<p>010-51292950/010-57283548</p>		    					
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
<!--联系售后弹窗结束-->
<div class="property">		
	<!--添加-->
		<div class="common_top">
			<ul>
				<li>首页</li>
				<li><</li>
				<li>设备管理</li>
				<li><</li>
				<li class="fault">故障钢琴列表</li>
			</ul>
		</div>
		<!--添加结束-->
		<div class="propcenter">
			<div class="proptit">
				<div class="proptitleft">
					<span>设备资产</span>
					<span class="proptitnun">钢琴总数   <span class="ptitnun">${allCount!0}台</span></span>
				</div>
				<div class="proptitright">
					<div class="prop1">
						<p class="propnum1"><#if allCount?? && badCount??>${allCount-badCount}</#if>台</p>
						<p>正常</p>
					</div>
					<div class="prop2">
						<div class="procent1">
							<div class="procent2" style='<#if allCount?? && badCount??>width:${((allCount-badCount)/allCount*100)?string("0")}%</#if>'>
								<div class="procircle"><#if allCount?? && badCount??>${((allCount-badCount)/allCount*100)?string("0")}</#if>%</div>									
							</div>									
						</div>
					</div>
					<div class="prop3">
						<p class="propnum2">${badCount!0 }台</p>
						<p>报修</p>
					</div>
				</div>
			</div>
			<div class="propdetail">
				<div class="proplist">
				<input type="hidden" id="search_type" value="0" />
					<ul>
						<li class="act"><a href="javascript:;">故障钢琴列表</a></li>
						<li><a href="javascript:;">钢琴资产配置</a></li>
					</ul>
					<div class="propsear">
						<input type="text" id="search_piano_id" placeholder="请输入钢琴ID查询" />
						<span></span>
					</div>
				</div>
			 <div class="propsum">
			 	<div class="propdecen0">
			 		<div class="clear"></div>
			 		<div class="propmsg">
			 			<div class="maintain1">
			 			<div class="propm">
			 				<ul>
			 					<li class="main_li0"></li>
			 					<li class="main_li1">钢琴ID</li>
			 					<li class="main_li2">教室</li>
			 					<li class="main_li3">故障类型</li>
			 					<li class="main_li4">故障说明</li>
			 					<li class="main_li5">报修日期</li>
			 					<li class="main_li6">处理状态</li>
			 				</ul>
			 			</div>
			 		  <div class="sumpropall">
			 			<div class="sumprop1">
			 			  <#list malfunctions.list! as list>
			 				<div class="sumpropul">
				 				<ul class="sumpropul1">
				 					<li class="main_li0"><span class="<#if list.dispose_mode ??><#if list.dispose_mode=='1'>main_us<#else>main_vender</#if></#if>"></span></li>
				 					<li class="main_li1">${list.piano_id! }</li>
				 					<li class="main_li2">${list.building! }-${list.name! }</li>
				 					<li class="main_li3"><#if list.type ??><#if list.type=='1'>设备故障<#elseif list.type=='2'>人为损坏<#else>钢琴换新</#if></#if></li>
			 						<li class="main_li4">${list.description! }</li>
				 					<li class="main_li5">${list.create_time!?string('yyyy-MM-dd') }</li>
				 					<li class="main_li6" data-id="${list.id! }" data-pid="${list.pid! }" >
				 					<#if list.dispose_mode ??>
				 					  <#if list.dispose_mode=='1'>
				 						<#if list.status ??>
				 						<#if list.status=="1">
					 						<div class="main_ul">
					 							<div class="main_show" onclick="main_show_div(this)">
					 								<span class="main_span" data-id="1">未维修</span>
					 								<span class="main_ul_down"></span>
					 							</div>
					 							<div class="main_already">
					 							<span class="main_ul_li" data-id="3" onclick="main_ul_li_div(this)">已维修</span>
					 							<span class="main_ul_li" data-id="2" onclick="main_ul_li_div(this)">在维修</span>
					 							</div>
					 						</div>
				 						<#elseif list.status=="2">
				 							<div class="main_ul">
					 							<div class="main_show" onclick="main_show_div(this)">
					 								<span class="main_span" data-id="2">在维修</span>
					 								<span class="main_ul_down"></span>
					 							</div>
					 							<div class="main_already">
					 							<span class="main_ul_li" data-id="3" onclick="main_ul_li_div(this)">已维修</span>
					 							<span class="main_ul_li" data-id="1" onclick="main_ul_li_div(this)">未维修</span>
					 							</div>
				 							</div>
				 						<#else>
				 							<div class="main_ul">
					 							<div class="main_show" onclick="main_show_div(this)">
					 								<span class="main_span" data-id="3">已维修</span>
					 								<span class="main_ul_down"></span>
					 							</div>
					 							<div class="main_already">
					 							<span class="main_ul_li" data-id="1" onclick="main_ul_li_div(this)">未维修</span>
					 							<span class="main_ul_li" data-id="2" onclick="main_ul_li_div(this)">在维修</span>
					 							</div>
				 							</div>
				 						</#if>
				 						</#if>
				 					  <#else>
				 					  	<#if list.status ??>
				 						<#if list.status=="1">未维修<#elseif list.status=="2">在维修<#else>已维修</#if>
				 						</#if>
				 					  </#if>
				 					</#if>
				 					</li>
				 					<#if list.dispose_mode ??><#if list.dispose_mode=='2'><li class="spread" onclick="showHou(this,${list.id!})"><span></span></li></#if></#if>
				 				</ul>	
				 				<div class="sumpropde"></div>
			 				</div>
			 				</#list>
			 			</div>
			 		 </div>
				 		<#include "/page/school/common/_paginate_agax2.ftl"/>
                    	<@paginate_agax2 currentPage=malfunctions.pageNumber totalPage=malfunctions.totalPage actionUrl="/school/piano/getPageMalfunction" urlParas="" />
			 		</div>
			 		</div>
			 	</div>
				<div class="propdecen1">
					<div class="propsort">
						<input type="hidden" class="parameter" id="classroom_id" value="classroomId=" />
						<ul>
							<li class="class_act" data-id="">全部</li>
							<#list classrooms! as list>
							<li data-id="${list.id! }">${list.name! }</li>
							</#list>
						</ul>
						<input class="propadd" type="button" value="新增钢琴" />
					</div>
					<ul class="thead">
						<li class="propid">钢琴ID</li>
						<li class="propstate">状态</li>
						<li class="propde0">故障报修</li>
						<li class="propde1">查看详情</li>
					</ul>
					<div class="sumstate" style="min-height:500px;">
					  <div class="sumstate1">
						<div class="state">
							<#list pianos.list! as list>
							<ul>
								<li class="propid" style="text-align:left;">ID:<span>${list.piano_id! }</span></li>
								<li class="propstate"><#if list.status??><#if list.status=="1">正常<#else>报修中</#if></#if></li>
								<li class="propde propde0" data-crid="${list.classroom_id! }" data-id="${list.id!}">
									<#if list.status??><#if list.status=="1"><input type="button" value="报修" /></#if></#if>
								</li>
								<li class="propde propde1">
									<input type="button" onclick="javascript:location.href='/school/piano/detail/${list.id!}'" value="详情" />
								</li>
							</ul>
							</#list>
						</div>
						<#include "/page/school/common/_paginate_agax.ftl"/>
                    	<@paginate_agax currentPage=pianos.pageNumber totalPage=pianos.totalPage actionUrl="/school/piano/getPagePianoByClassroom" urlParas="" />
					    </div>							  
					</div>							
				</div>
			  </div>
			</div>
		</div>
</div>
<script>
$(".repairs_yes").click(function(){
	var tempBtn = $(this);
	var id = $("#pianoMalfunction_pid").val();
	
	  var options = {
             url: '/school/piano/addPianoMal',
             type: 'post',
             dataType: 'json',
             data: $("#add_mal").serialize(),
             success: function (data) {
                 if (data.code == '200') {
                	 $(".repairs").css("display","none");
                	 $(".allpinao").css("display","none");
                	 $(".state").find("[data-id='"+id+"']").empty().parent().find(".propstate").html("报修中");
                 } else {
                     alert(data.description);
                 }
             }
         };
         $.ajax(options);
         return false;  
});
$(".sumstate").on("click",".propde0",function(){
	$(".repairs").css("display","block");
	$(".allpinao").css("display","block");
	var crid=$(this).attr("data-crid");
	var id = $(this).attr("data-id");
	var name = $(this).parent().find(".propid span").text();
	$("#pianoMalfunction_piano_id").val(name);
	$("#pianoMalfunction_pid").val(id);
 	$.ajax( {  
	     url:'/school/piano/getClassroom',// 跳转到 action     
	     data:{
	    	 id : crid
	          },
	     async:false,  //同步
	     type:'post',      
	     dataType:'json',  
	     success:function(data) {  
	         if(data.code =="200" ){  
	        	 if(data.detail!=null){
	        	 	$("#pianoMalfunction_building_name").val(data.detail.building+"-"+data.detail.name);
	        	 }
	         }else{  
	            alert(data.description);  
	        }  
	     },  
	      error : function() {  
	           alert("异常！");  
	     }  
	}); 

});
$(".propsear span").click(function(){
	if($("#search_piano_id").val()==null || $("#search_piano_id").val()==""){
		//alert("请出入钢琴ID");
		$(".propsear input").addClass("protyact");//添加
		$("#search_piano_id").val("请输入钢琴ID");//添加
		$(".propsear input").blur();
		$(".propsear input").focus(function(){
			$(".propsear input").removeClass("protyact");
			$("#search_piano_id").val("");
		});
		return;
	}
	var searchType=$("#search_type").val();
	$(".propdecen"+searchType).css("display","block").siblings().css("display","none");
	$.ajax( {  
	     url:'/school/piano/searchPiano',// 跳转到 action     
	     data:{
 	    	 type : searchType,
 	    	 pianoId:$("#search_piano_id").val()
	    	 },
	     async:false,  //同步
	     type:'post',      
	     dataType:'json',  
	     success:function(data) {  
	         if(data.code =="200" ){  
	            if(data.detail!=null){
	            	$(".propdecen"+searchType).css("display","block").siblings().css("display","none");
	            	if(searchType==0){
	            		$('.sumprop1').empty();
	            		showMal(data.detail);
	            	}else{
	            		$('.state').empty();
	            		showPiano(data.detail);
	            	}
	            	$(".page").eq(searchType).css("display","none");
	            }else{
	            	alert("无此钢琴！");
	            }
	         }else{  
	            alert(data.description);  
	        }  
	     },  
	      error : function() {  
	           alert("异常！");  
	     }  
	});
});
//添加敲回车来进行搜索
$(".propsear input").keydown(function(e){
		var evt=e||event;
		if(evt.keyCode==13){
			if($("#search_piano_id").val()==null || $("#search_piano_id").val()==""|| $("#search_piano_id").val()=="请输入钢琴ID"){
				//alert("请出入钢琴ID");
				$(".propsear input").addClass("protyact");
				$("#search_piano_id").val("请输入钢琴ID");
				$("#search_piano_id").blur();
				$(".propsear input").focus(function(){
					$(".propsear input").removeClass("protyact");
					$("#search_piano_id").val("");
				});
				return;
			}
			var searchType=$("#search_type").val();
			$(".propdecen"+searchType).css("display","block").siblings().css("display","none");
			$.ajax( {  
				 url:'/school/piano/searchPiano',// 跳转到 action     
				 data:{
					 type : searchType,
					 pianoId:$("#search_piano_id").val()
					 },
				 async:false,  //同步
				 type:'post',      
				 dataType:'json',  
				 success:function(data) {  
					 if(data.code =="200" ){  
						if(data.detail!=null){
							$(".propdecen"+searchType).css("display","block").siblings().css("display","none");
							if(searchType==0){
								$('.sumprop1').empty();
								showMal(data.detail);
							}else{
								$('.state').empty();
								showPiano(data.detail);
							}
							$(".page").eq(searchType).css("display","none");
						}else{
							//alert("无此钢琴！");
							$("#search_piano_id").val("没有搜索结果");
						}
					 }else{  
						alert(data.description);  
					}  
				 },  
				  error : function() {  
					   alert("异常！");  
				 }  
			});
		}else{
			$(".propsear input").removeClass("protyact");
		}
	});	
//添加结束
function main_show_div(obj,event){
	stopEvent(event);
	if($(obj).parent().css("height")=="30px"){
		//$(".main_ul").css("height","30px");
		$(obj).parent().css("height","90px");
	}else{
		$(obj).parent().css("height","30px");
	}
}
function main_ul_li_div(obj){
	var main_ul = $(obj).parent().parent();
	var main_span = main_ul.find(".main_span");
	var id=main_ul.parent().attr("data-id");
	var pid=main_ul.parent().attr("data-pid");
	var str = main_span.html();
	var tempStatus =main_span.attr("data-id");
	var status=$(obj).attr("data-id");
	$.ajax( {  
	     url:'/school/piano/updatePianoStatus',// 跳转到 action     
	     data:{
	    	 id : id,
	    	 pid:pid,
	    	 status:status
	    	 },
	     async:false,  //同步
	     type:'post',      
	     dataType:'json',  
	     success:function(data) {  
	         if(data.code =="200" ){  
	        		main_span.html($(obj).html());
	        		main_span.attr("data-id",status);
	        		$(obj).html(str)
	        		$(obj).attr("data-id",tempStatus);
	        		main_ul.css("height","30px");
	         }else{  
	            alert(data.description);  
	        }  
	     },  
	      error : function() {  
	           alert("异常！");  
	     }  
	});
}
$(".allpinao").click(function(){
	if($(".propcontact").css("display")=="block"){
		$(this).css("display","none");
		$(".propcontact").css("display","none");
	}
});
function showHou(obj,id){
	$(".sumpropall").find(".sumpropde").stop().animate({"height":"0"},500);
	$(".sumpropall").find(".sumpropul1").css("background","#fff");
	$(".sumpropall").find(".spread").find("span").css("background"," url(/static/school/img/spirit_img.png) no-repeat -290px -53px");
	
	var sumpropul1=$(obj).parent();
	var sumpropde = sumpropul1.parent().find(".sumpropde");
	var curHeight=sumpropde.height();//获得该元素当前的高
	var autoHeight=sumpropde.css("height","auto").height();//获得该元素自适应以后的高
	if(autoHeight==0){
		$.ajax( {  
		     url:'/school/piano/getMalDetail',// 跳转到 action     
		     data:{malId : id},
		     async:false,  //同步
		     type:'post',      
		     dataType:'json',  
		     success:function(data) {  
		         if(data.code =="200" ){  
		        	 if(data.detail!=null && data.detail.length>0){
		        		 var text ='<div class="sumleft">'+
		 						'<ul>';
		        		 for(var i = 0;i<data.detail.length;i++){
		        			 var temp = data.detail[i];
		        			 var tempDate = "";
		        			 var tempTime="";
		        			 if(temp.create_time!=null && temp.create_time.length>=10){
		        				 tempDate=temp.create_time.substr(0,10);
		        			 }
		        			 if(temp.create_time!=null && temp.create_time.length>=16){
		        				 tempTime=temp.create_time.substr(11,5);
		        			 }
		        			 text+='<li>'+
								'<span>'+tempDate+'</span><span class="sumtime">'+tempTime+'</span>'+
 								'<span>'+temp.content+'</span>'+
 							'</li>';
		        		 }
		        		 text+='</ul>'+
			 					'</div>'+
		 					'<div class="sumright">'+
		 						'<input class="proplink" type="button" value="联系售后" />'+
		 					'</div>';
	        			sumpropde.html(text);
		        	 	autoHeight=sumpropde.css("height","auto").height();
		        	 }
		         }else{  
		            alert(data.description);  
		        }  
		     },  
		      error : function() {  
		           alert("异常！");  
		     }  
		});
	}
	if(curHeight==0 && autoHeight>0){
		sumpropde.css("display","block");
		sumpropde.height(curHeight).stop().animate({"height":autoHeight},500);
		sumpropul1.css("background","#f2f2f2");
		$(obj).find("span").css("background"," url(/static/school/img/spirit_img.png) no-repeat -266px -130px");
	}else{
		sumpropde.stop().animate({"height":"0"},500);
		sumpropul1.css("background","#fff");
		$(obj).find("span").css("background"," url(/static/school/img/spirit_img.png) no-repeat -290px -53px");
	} 
}
$(".add_piano_save").click(function(){
	var classroomid=$("#piano_classroom_id").val();
	if(createpinao()){
	 var options = {
                url: '/school/piano/add',
                type: 'post',
                dataType: 'json',
                data: $("#add_piano").serialize(),
                success: function (data) {
                    if (data.code == '200') {
                    	$(".allpinao").css("display","none");
						$(".newpinao").css("display","none");
                    	if($(".state ul").length<10 && ($("#classroom_id").val()==("classroomId="+classroomid) || $("#classroom_id").val()=="classroomId=")){
                       		 var temp = data.detail;
                       		 var text='<ul>'+
                   					'<li class="propid" style="text-align:left">ID:<span>'+temp.piano_id+'</span></li>'+
                   					'<li class="propstate">'+(temp.status=='1'?'正常':'报修中')+'</li>'+
                   					'<li class="propde propde0">'+
                   						'<input type="button" value="报修" />'+
                   					'</li>'+
                   					'<li class="propde propde1">'+
                   						'<input type="button" onclick="javascript:location.href=\'/school/piano/detail/'+temp.id+'\'" value="详情" />'+
                   					'</li>'+
                   				'</ul>';
                       		 $('.state').append(text);
                    	}
                    } else {
                        alert(data.description);
                    }
                }
            };
            $.ajax(options);
            return false; 
	}
})
$(".cendown li").mouseover(function(){
	$(this).css("background"," #F0F0F0").siblings().css("background","#FFF");;
});
function showPage(data){
	 if(data.code =="200" ){  
    	 $('.state').empty();
    	 for(var i = 0;i<data.detail.list.length;i++){
    		 var temp = data.detail.list[i];
    		 showPiano(temp);
    	 }
     }
}
function showPage2(data){
	 if(data.code =="200" ){  
   	 $('.sumprop1').empty();
   	 for(var i = 0;i<data.detail.list.length;i++){
		var temp = data.detail.list[i];
		showMal(temp);
   	 }
    }
}
function showPiano(temp){
	var text='<ul>'+
		'<li class="propid" style="text-align:left">ID:<span>'+temp.piano_id+'</span></li>'+
		'<li class="propstate">'+(temp.status=='1'?'正常':'报修中')+'</li>'+
		'<li class="propde propde0" data-crid="'+temp.classroom_id+'" data-id="'+temp.id+'">'+
		(temp.status=='1'?'<input type="button" value="报修" />':'')+
		'</li>'+
		'<li class="propde propde1">'+
			'<input type="button" onclick="javascript:location.href=\'/school/piano/detail/'+temp.id+'\'" value="详情" />'+
		'</li>'+
	'</ul>';
	$('.state').append(text);
}
function showMal(temp){
	var tempText="";
	if(temp.dispose_mode=="1"){
		if(temp.status=="1"){
			tempText='<div class="main_ul">'+
					'<div class="main_show" onclick="main_show_div(this)">'+
						'<span class="main_span" data-id="1">未维修</span>'+
						'<span class="main_ul_down"></span>'+
					'</div>'+
					'<div class="main_already">'+
					'<span class="main_ul_li" data-id="3" onclick="main_ul_li_div(this)">已维修</span>'+
					'<span class="main_ul_li" data-id="2" onclick="main_ul_li_div(this)">在维修</span>'+
					'</div>'+
				'</div>';
		}else if(temp.status=="2"){
			tempText='<div class="main_ul">'+
						'<div class="main_show" onclick="main_show_div(this)">'+
							'<span class="main_span" data-id="2">在维修</span>'+
							'<span class="main_ul_down"></span>'+
						'</div>'+
						'<div class="main_already">'+
						'<span class="main_ul_li" data-id="3" onclick="main_ul_li_div(this)">已维修</span>'+
						'<span class="main_ul_li" data-id="1" onclick="main_ul_li_div(this)">未维修</span>'+
						'</div>'+
					'</div>';
		}else{
			tempText='<div class="main_ul">'+
			'<div class="main_show" onclick="main_show_div(this)">'+
				'<span class="main_span" data-id="3">已维修</span>'+
				'<span class="main_ul_down"></span>'+
			'</div>'+
			'<div class="main_already">'+
			'<span class="main_ul_li" data-id="1" onclick="main_ul_li_div(this)">未维修</span>'+
			'<span class="main_ul_li" data-id="2" onclick="main_ul_li_div(this)">在维修</span>'+
			'</div>'+
		'</div>';
		}
	}else{
		tempText=(temp.status!="1"?(temp.status=="2"?"在维修":"已维修"):"未维修");
	}
	var tempDate='';
	if(temp.create_time!=null && temp.create_time.length>=10){
		tempDate=temp.create_time.substr(0,10);
	}
		 var text='<div class="sumpropul">'+
			'<ul class="sumpropul1">'+
				'<li class="main_li0"><span class="'+(temp.dispose_mode=='1'?'main_us':'main_vender')+'"></span></li>'+
				'<li class="main_li1">'+temp.piano_id+'</li>'+
				'<li class="main_li2">'+temp.building+'-'+temp.name+'</li>'+
				'<li class="main_li3">'+(temp.type=='1'?'设备故障':(temp.type=='2'?'人为损坏':'钢琴换新'))+'</li>'+
				'<li class="main_li4">'+temp.description+'</li>'+
				'<li class="main_li5">'+tempDate+'</li>'+
				'<li class="main_li6" data-id="'+temp.id+'" data-pid="'+temp.pid+'" >'+
				tempText+
				'</li>'+
			 		(temp.dispose_mode=='2'?'<li class="spread" onclick="showHou(this,'+temp.id+')"><span></span></li>':'')+
	 				'</ul>'+
	 				'<div class="sumpropde"></div>'+
 				'</div>';
				
		 $('.sumprop1').append(text);
}
</script>
</@html>