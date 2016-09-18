$(function(){
	/*个人中心页面编辑的点击事件*/
	var flag2=true;
	$(".pwdedit2").click(function(){
		if(flag2){
			$(".pwdslide").css("height","225px");	
			flag2=false;
		}else{
			$(".pwdslide").css("height","0");
			flag2=true;
		}
	});
})
