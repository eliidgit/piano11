$(function(){
	$(".topcenter li").eq(1).addClass("act");
	$(".course_top li").click(function(){
		$(".courseware_center_sum"+$(this).index()).css("display","block").siblings().css("display","none");
		$(this).addClass("course_topact").siblings().removeClass("course_topact");
		$(".class_select"+$(this).index()).css("display","block").siblings().css("display","none");
		$(".course_ware_li").html($(this).html());
		if($(this).index()==1){
			$(".course_search").css("display","block");
		}else{
			$(".course_search").css("display","none");
		}
	});	
	/*年级的点击事件*/
	$(".class_select0 li").click(function(){
		$(".courseware_center_s").empty();
		var courseId = $(this).attr("data-value");
		$.ajax( {  
		     url:'/school/courseware/getAllLessonByCourseId',// 跳转到 action     
		     data:{  
		             course_id : courseId
		    },
		     async:false,  //同步
		     type:'post',      
		     dataType:'json',  
		     success:function(data) {  
		    	 $(".courseware_center_s").empty();
		         if(data.code =="200" ){
		        	 for(var i=0;i<data.detail.length;i++){
		        		 var lesson = data.detail[i];
			        	 var text='<div class="courseware_li">'+
								'<div class="courseware0"></div>'+
								'<div class="courseware1">'+
									'<p class="courfirst1">'+lesson.name+'</p>'+
									'<p class="courfirst2"><label>课时</label><span>8课时</span></p>'+
								'</div>'+
								'<div class="courseware2">'+
									'<div class="courfirst3">'+
									'</div>'+
								'</div>'+
								'<div class="courseware3">'+
									'<input type="button" onclick="location.href=\'/school/courseware/detail/'+lesson.id+'-'+lesson.name+'\'" value="查看课件"/>'+
								'</div>'+						
							'</div>';
			        	 $(".courseware_center_s").append(text);
		        	 }
		         }else{  
		            alert(data.description);  
		        }  
		     },  
		      error : function() {  
		           alert("异常！");  
		     }  
		});
		$(this).addClass("class_seact").siblings().removeClass("class_seact");
	});
	$(".class_select1 li").click(function(){
		$(".demo_cens").empty();
		var courseId = $(this).attr("data-value");
		$.ajax( {  
		     url:'/school/courseware/getPageDemoLessonByCourseId',// 跳转到 action     
		     data:{  
		             course_id : courseId
		    },
		     async:false,  //同步
		     type:'post',      
		     dataType:'json',  
		     success:function(data) {  
		    	 $(".demo_cens").empty();
		         if(data.code =="200" && data.detail!=null){
		        	 currentPage=data.detail.pageNumber;
		        	 totalPage=data.detail.totalPage;
		        	 for(var i=0;i<data.detail.list.length;i++){
		        		 var demolesson = data.detail.list[i];
			        	 var text='<a class="demo_cen" href="/school/courseware/demoDetail/'+demolesson.id+'">'+
										'<div class="demo_cen1">'+
											'<img src="'+demolesson.pic_path+'" />'+
											'<div class="demo_cent_mask"></div>'+
											'<div class="demo_start"></div>'+
											(i==0?'<div class="new_demo"></div>':'')+
										'</div>'+
										'<p class="demo_name">'+demolesson.name+'</p>'+
									'</a>';
			        	 $(".demo_cens").append(text);
		        	 }
		        	 return;
		         }else if(data.code =="201"){  
		            alert(data.description);  
		        } 
		         currentPage=1;
	        	 totalPage=1;
		     },  
		      error : function() {  
		           alert("异常！");  
		     }  
		});
		$(this).addClass("class_seact").siblings().removeClass("class_seact");
	});
	/*鼠标滑过*/
	ul_hover($(".courseware_li"));
});
