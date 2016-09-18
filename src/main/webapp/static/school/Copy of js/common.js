/*登录页表单提交*/
function handin(){
	var uname= /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
	var email=/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
	if($(".username").val()==""){	
		alert("请输入用户名");
		return false;
	}else if(uname.test($(".username").val())==false&&email.test($(".username").val())==false){
		alert("请输入正确的手机号格式和邮箱格式");
		return false;
	}else if($(".psd").val()==""){	
		alert("请输入密码");
		return false;
	}else{
	    return true;
	}
	if($(".auto").prop("checked")==true){
		localStorage.setItem("username",$(".username").val());
		localStorage.setItem("pwd",$(".psd").val());			
	}else{
		localStorage.removeItem("username");
		localStorage.removeItem("pwd");	
	}
}
$(function(){
   /*鼠标滑上*/
    $(".userexit").mouseover(function(){
    	$(".exit").css("display","block");
    });
    $(".userexit").mouseout(function(){
    	$(".exit").css("display","none");
    });
    $(".exit").mouseover(function(){
    	$(".exit").css("display","block");
    });
     $(".exit").mouseout(function(){
    	$(".exit").css("display","none");
    });
    /*鼠标滑上事件结束*/
    $(".topcenter li").click(function(){
    	$(this).addClass("act").siblings().removeClass("act");
    });
    $(".user_tx").click(function(){
		location.href="html/user.html";
	});
	/*导航跳转*/
	 $(".topcenter li").each(function(){  
        $this = $(this).find("a");  
        if($this[0].href==String(window.location)){  
            $(this).addClass("act");  
        }  
     });
});
/*封装tab切换*/
function tabnav(eleclick,change,classname){
	eleclick.click(function(){
		$(change+$(this).index()).css("display","block").siblings().css("display","none");
		$(this).addClass(classname).siblings().removeClass(classname);
	});
}
/*分别传入获取的class以及该点击元素的class名还有点击后要变化的div的class名以及点击完成后添加的样式的class名*/
function newtabnav(eleclick,ele,change,classname){
	for(var i=0;i<eleclick.length;i++){
		eleclick[i].index=i;
		eleclick[i].onclick=function(){
			$(change+this.index).css("display","block").siblings().css("display","none");
			$(ele).eq(this.index).addClass(classname).siblings().removeClass(classname);
		}
	}
}
/*js兼容ie的获取class名*/
function getClassNames(classStr,tagName){  
      if (document.getElementsByClassName) {  
            return document.getElementsByClassName(classStr)  
      }else {  
            var nodes = document.getElementsByTagName(tagName),ret = [];           
            for(i = 0; i < nodes.length; i++) {  
         if(hasClass(nodes[i],classStr)){  
                ret.push(nodes[i])  
         }  
      }  
      return ret;  
       }  
	}  
	function hasClass(tagStr,classStr){  
	     var arr=tagStr.className.split(/\s+/ );  //这个正则表达式是因为class可以有多个,判断是否包含  
	     for (var i=0;i<arr.length;i++){  
	            if (arr[i]==classStr){  
	                  return true ;  
	            }  
	     }  
	     return false ;  
	} 
/*点击按钮让某个元素出现*/
function show(ele1,ele2){
	ele1.click(function(){
		ele2.css("display","block");
	});
}
function hide(ele1,ele2){
	ele1.click(function(){
		ele2.css("display","none");
	});
}
/*按钮点击事件让元素出现和消失*/
function showele(ele1,ele2,ele3){
	ele1.click(function(){
		ele2.css("display","block");
		ele3.css("display","block");
	});
}
function hideele(ele1,ele2,ele3){
	ele1.click(function(){
		ele2.css("display","none");
		ele3.css("display","none");
	});
}
/*全部选择*/
function selectclass(ele,ele1){
	ele.click(function(){
		alert(ele1.css("display"))
		if(ele1.css("display")=="none"){
			ele1.css("display","block");
		}else{
			ele1.css("display","none");
		}
	});
}
/*班级选择*/
function shownew(hoverele,showele1,showele2,showele3,change_cont){
	var stu_str="";
	hoverele.mouseover(function(){
		showele1.css("display","block");
		$(showele2+$(this).index()).css("display","block").siblings().css("display","none");
		$(this).css("background","#ccc").siblings().css("background","#fff");
		stu_str=$(this).html();
	});
	showele1.mouseout(function(){
		showele1.css("display","none");
		showele3.css("display","none");
		flag=true;
	});
	showele3.mouseover(function(){
		showele1.css("display","block");
		$(this).css("display","block");
		$(this).find("li").click(function(){
			change_cont.val(stu_str+$(this).html());
			showele1.css("display","none");
			showele3.css("display","none");
			flag=true;
		})
		flag=false;
	});
	showele3.mouseout(function(){
		$(this).css("display","none");
		showele1.css("display","none");
		flag=true;
	});
	hoverele.click(function(){
		change_cont.val($(this).html());
		showele1.css("display","none");
		showele3.css("display","none");
		flag=true;
	});
}
/*添加班级*/
function addclass(ele1,ele2,ele3){
	ele1.click(function(){
		var newclass=$("<li><span>"+ele2.val()+"</span><img src='/static/school/img/teacher_del_10.png'/></li>");
		ele3.append(newclass);
	});
}
function addclass1(ele1,ele2,ele3){
	ele1.click(function(){
		var str=ele2.val().substr("0","1");
		switch (str){
			case "一":str="1";break;
			case "二":str="2";break;
			case "三":str="3";break;
			case "四":str="4";break;
			case "五":str="5";break;
		}
		var newclass=$("<div><span>"+str+ele2.val().substr("1")+"</span><img src='/static/school/img/teacher_del_10.png'/></div>");
		ele3.append(newclass);
	});
}
/*选择*/
function changesta(ele1,ele2,ele3,ele4){
	var flag9=true;
	ele1.click(function(){
		var str=ele2.val();
		ele2.val($(this).html());
		$(this).html(str);
		ele3.css("display","none");
		flag9=true;
	});
	ele4.click(function(){
		if(flag9){
			ele3.css("display","block");
			flag9=false;
		}else{
			ele3.css("display","none");
			flag9=true;
		}	
	});
}
var flag11=true;
function changesrc(ele){
	ele.click(function(){
		if(flag11){
			$(this).attr("src","/static/school/img/success2_07.png");
			flag11=false;
		}else{
			$(this).attr("src","/static/school/img/u45.png");
			flag11=true;
		}
	});
}
/*全选*/
 var flag10=true;
function allcheck(ele1,ele2,ele3){
	$("."+ele1).click(function(){
		var add_cen2=getClassNames(ele2);
		if(flag10){
			for(var i=0;i<add_cen2.length;i++){
				add_cen2[i].src="/static/school/img/success2_07.png";
			}
			flag10=false;
		}else{
			for(var i=0;i<add_cen2.length;i++){			
				add_cen2[i].src="/static/school/img/u45.png";
			}
			flag10=true;
		}
	});
	$("."+ele3).click(function(){
		if($("."+ele1).prop("checked")==true){
			var add_all_check1=getClassNames(ele1)[0];
			var add_cen2=getClassNames(ele2);
			for(var i=0;i<add_cen2.length;i++){			
				add_cen2[i].src="/static/school/img/u45.png";
			}
			add_all_check1.checked=false;
			flag10=true;			
		}
	});
}


/*封装录入选择*/
function insert_people(ele1,ele2){
	ele1.click(function(){
		var tcheck2=getClassNames(ele2);
		var sum=0;
		for(var i=0;i<tcheck2.length;i++){
			if(tcheck2[i].src.indexOf("success2_07.png")>=0){
				sum++;
			}
		}
		if(sum>0){
			$(".lr_tc").css("display","block");
			$(".lr_success").css("display","block");
		}else if(sum==0){
			alert("请选择要录入的学生");
		}
	});
}








