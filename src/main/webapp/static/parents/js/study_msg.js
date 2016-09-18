$(function(){
//	var appId,sign,nonceStr,timestamp;
	/*$.ajax( {  
	     url:'/parents/getSignInfo',// 跳转到 action  
	     data:{  
             url : window.location.href
	     },
	     async:false,  //同步
	     type:'post', 
	     dataType:'json',  
	     success:function(data) {
	    	 appId=data.appId;
	    	 sign=data.sign;
	    	 nonceStr=data.nonceStr;
	    	 timestamp=data.timestamp;
	      },  
	      error : function() {  
	           alert("异常！");  
	      }  
	 });*/
	$(".study_cent1_txhref").click(function(){
		$(".study_screen").css("display","block");
		$(".study_zj").css({"display":"block"});
		
	});
//	alert(sign)
	//微信配置
	wx.config({
	    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	    appId: "wx1e05c97c32dfee5e", // 必填，公众号的唯一标识
	    timestamp:"1467710379", // 必填，生成签名的时间戳
	    nonceStr: "feaf0b03-6b96-4f3d-8c42-0ea80d704a2b", // 必填，生成签名的随机串
	    signature: "d79eb91cf767c44bffa2af7426ff1db75b0b7b18",// 必填，签名，见附录1
	    jsApiList: [
	        'chooseImage',
	        'uploadImage'
	    ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	});
	//点击事件
	var study_photo=document.getElementsByClassName("study_photo")[0];
	var study_select=document.getElementsByClassName("study_select")[0];
	wx.ready(function(){
		study_photo.onclick=function(){
				wx.chooseImage({
				    count: 1, // 默认9
				    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
				    sourceType: ['camera'], // 可以指定来源是相册还是相机，默认二者都有
				    success: function (res) {
				        var localIds1 = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
				        $(".study_cent1_txhref img").attr("src",localIds1);
				    }
				});
			}
		study_select.onclick=function(){
			wx.chooseImage({
				    count: 1, // 默认9
				    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
				    sourceType: ['album'], // 可以指定来源是相册还是相机，默认二者都有
				    success: function (res) {
				        $(".study_screen").css("display","none");
						$(".study_zj").css({"display":"none"});
				        var localIds1 = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
				        $(".study_cent1_txhref img").attr("src",localIds1);
				        $("#back").css("background-image","url("+localIds1+")");
				        wx.uploadImage({
							 localId: localIds1.toString(), // 需要上传的图片的本地ID，由chooseImage接口获得
							 isShowProgressTips: 1, // 默认为1，显示进度提示
							 success: function (res) {							    	
							        var serverId = res.serverId; // 返回图片的服务器端ID
							        
							    }
							});
				    }
			});
		  };
	});
	$(".study_zj_cancle").click(function(){
		$(".study_screen").css("display","none");
		$(".study_zj").css({"display":"none"});
	});
})