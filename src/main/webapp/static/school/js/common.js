 /*二级联动班级年级*/
var gname="";
function overGrade(gradeli) {
    var gradeId = $(gradeli).attr("value");
    var nextDiv = $(gradeli).parent().parent().next();
    nextDiv.find("ul").html("");
    nextDiv.find("ul").css("display", "none");
    gname=$(gradeli).text();
    $(gradeli).css("background","#e5e5e5").siblings().css("background","#fff");
    if(gradeId!=-1){
        $.ajax({
            url: "/school/class/getClassesByGid",
            async: true,
            cache: false,
            type: 'post',
            dataType: "json",
            data: {
                grade_id: gradeId
            },
            success: function (data) {
                if (data.code == '200') {
                	nextDiv.find("ul").html("");
                    for (var i = 0; i < data.detail.length; i++) {
                        var newli ="<li data-type='c' value=" + data.detail[i].id + ">" + data.detail[i].name + "</li>";
                        nextDiv.find("ul").append(newli);
                    }
                    if(gradeId!="0" && data.detail.length!=0){
                    	nextDiv.css("top",$(gradeli).index()*parseInt($(gradeli).css("line-height"))+10);
                    	nextDiv.find("ul").css("display", "block");
                    	
                    }
                } else {
                    alert("根据年级获取班级失败，原因是" + data.description);

                }
            }
        });
    }
}
/*登录页表单提交*/
function handin(){
	var uname= /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
	var email=/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
	if($(".username").val()==""){	
		$(".phone_email p").html("请输入手机号");
		return false;
	}else if(uname.test($(".username").val())==false&&email.test($(".username").val())==false){
		//alert("请输入正确的手机号格式和邮箱格式");
		$(".phone_email p").html("手机号或邮箱格式错误");
		return false;
	}else if($(".psd").val()==""){	
		//alert("请输入密码");
		$(".phone_pwd p").html("请输入密码");
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
	$(".username").focus(function(){
		$(".phone_email p").html("");
	});
	$(".psd").focus(function(){
		$(".phone_pwd p").html("");
	})
	//性别的点击事件
	$(".boy").click(function(){
		$(".boy .circle").css("background","url(/static/school/img/spirit_img.png) no-repeat -197px -54px");
		$(".girl .circle").css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
		$("#gender").val("1");
	});
	$(".girl").click(function(){
		$(".boy .circle").css("background","url(/static/school/img/spirit_img.png) no-repeat -218px -54px");
		$(".girl .circle").css("background","url(/static/school/img/spirit_img.png) no-repeat -197px -54px");
		$("#gender").val("2");
	});
	$(".all_stu_hover,.change_hover").mouseout(function(){
		$(this).css("display","none");
	});
	$(".all_stu_hover,.change_hover").mouseover(function(){
		$(this).css("display","block");
	});
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
	/* $(".topcenter li").each(function(){  
        $this = $(this).find("a");  
        if($this[0].href==String(window.location)){  
            $(this).addClass("act").siblings().removeClass("act");  
        }  
    });*/
    $(document).click(function(evt){
		//$(".all_stu_hover").css("display","none");
		//$(".change_hover").css("display","none");
	});
    var flag=true;
	$(".alogin").click(function(){
	   	if(flag){
			$(this).find(".auto").addClass("next_login");  
			flag=false;
	   	}else{
	   		$(this).find(".auto").removeClass("next_login"); 	   		
			flag=true;
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
            return document.getElementsByClassName(classStr);  
      }else {  
            var nodes = document.getElementsByTagName(tagName),ret = [];           
            for(var i = 0; i < nodes.length; i++) {  
         if(hasClass(nodes[i],classStr)){  
                ret.push(nodes[i]); 
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
	     return false;  
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
	ele.click(function(event){
		stopEvent(event);
		$(".all_stu4 ul").css("display","none");
		$(".change_hover_div2 ul").css("display","none");
		$(".all_stu3 li").css("background-color","#FFF");
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
		$(this).css("background","#e5e5e5").siblings().css("background","#fff");
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
		var newclass=$("<li><span>"+ele2.val()+"</span><span class='bj_del'></span></li>");
		ele3.append(newclass);
	});
}
function addclass1(ele1,ele2,ele3,classname1,classname2){
	ele1.click(function(){
		var str=ele2.val().substr("0","1");
		switch (str){
			case "一":str="1";break;
			case "二":str="2";break;
			case "三":str="3";break;
			case "四":str="4";break;
			case "五":str="5";break;
		}
		//修改过
		//var newclass=$("<div class='tea_bj'><span>"+str+ele2.val().substr("1")+"</span><span class='tea_del'><img src='../img/teacher_del_10.png'/></span></div>");
		var newclass=$("<div class='"+classname1+"'><span>"+str+ele2.val().substr("1")+"</span><span class='"+classname2+"'></span></div>");
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
function changesta1(ele1,ele2,ele3,ele4){
	var flag10=true;
	ele1.click(function(){
		ele2.val($(this).html());
		ele3.css("display","none");
		flag10=true;
	});
	ele4.click(function(){
		if(flag10){
			ele3.css("display","block");
			flag10=false;
		}else{
			ele3.css("display","none");
			flag10=true;
		}	
	});
}
function changesrc(ele,way){
	var flag11=true;
	ele.click(function(){
		if(flag11){
			$(this).attr("src","/static/school/img/"+way+"/success2_07.png")
			flag11=false;
		}else{
			$(this).attr("src","/static/school/img/"+way+"/u45.png")
			flag11=true;
		}
	});
}
/*全选*/
function allcheck(ele1,ele2,ele3){
 var flag10=true;
	$("."+ele1).click(function(){
		var add_cen2=getClassNames(ele2,"img");
		if(flag10){
			for(var i=0;i<add_cen2.length;i++){
				add_cen2[i].src="/static/school/img/student/success2_07.png";
			}
			flag10=false;
		}else{
			for(var i=0;i<add_cen2.length;i++){			
				add_cen2[i].src="/static/school/img/student/u45.png";
			}
			flag10=true;
		}
	});
	$("."+ele3).click(function(){
		if($("."+ele1).prop("checked")==true){
			var add_all_check1=getClassNames(ele1,"input")[0];
			var add_cen2=getClassNames(ele2,"img");
			for(var i=0;i<add_cen2.length;i++){			
				add_cen2[i].src="/static/school/img/student/u45.png";
			}
			add_all_check1.checked=false;
			flag10=true;			
		}
	});
}
/*鼠标滑过去边框*/
function ul_hover(hover_ele){
	hover_ele.mouseover(function(){
		$(this).css("border-bottom","1px solid #fff");
		$(this).prev().css("border-bottom","1px solid #fff");
	});
	hover_ele.mouseout(function(){
		$(this).css("border-bottom","1px solid #ebe8e7");
		$(this).prev().css("border-bottom","1px solid #ebe8e7");
	});
}
window.onload=function(){
	$(".lr_tc").css("display","none");
	$(".loading").css("display","none");
}
function stopEvent(event){ //阻止冒泡事件
     //取消事件冒泡
     var e=arguments.callee.caller.arguments[0]||event; //若省略此句，下面的e改为event，IE运行可以，但是其他浏览器就不兼容
     if (e && e.stopPropagation) {
     // this code is for Mozilla and Opera
     e.stopPropagation();
     } else if (window.event) {
     // this code is for IE
      window.event.cancelBubble = true;
    }
}