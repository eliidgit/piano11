<#macro paginate_agax2 currentPage totalPage actionUrl urlParas="">
    <style type="text/css">
	.page{
		overflow: hidden;
    	padding-bottom: 31px;
    }
</style>
<script>
var currentPage2=${currentPage}
var totalPage2=${totalPage}
function page2(flag){
	if(flag){
		if(currentPage2>=totalPage2){
			alert("没有下一页");
			return;
		}
		currentPage2+=1;
	}else{
		if(currentPage2<2){
			alert("已在第一页");
			return;
		}
		currentPage2-=1;
	}
	//参数
	var url='${actionUrl!}';
	//动态添加参数
	$(".parameter2").each(function(){
		if($(this).val!=null && $(this).val()!=""){
			if(url.indexOf("?")==-1){
				url+="?";
			}
			if(url.indexOf("&")!=-1){
				url+="&";
			}
			url+=$(this).val();
		}
	});
	$.ajax( {  
	     url:url,// 跳转到 action     
	     data:{  
	             p :currentPage2
	    },
	     async:false,  //同步
	     type:'post',      
	     dataType:'json',  
	     success:function(data) {  
	         if(data.code =="200" ){  
	        	 showPage2(data);
	         }else{  
	        	 alert(data.description);  
	        }  
	     },  
	      error : function() {  
	           alert("异常！");  
	     }  
	});
	
}
</script>
<#if totalPage??>
<#if totalPage gt 1>
<div  class="page">
    <ul class="pagenum">
    		<li class="next"><a href="javascript:page2(false)">上一页</a></li>
            <li class="next"><a href="javascript:page2(true)">下一页</a></li>
    </ul>
</div>
</#if>
</#if>
</#macro>