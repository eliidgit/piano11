$(function(){
	var flag=true
	$(".alldown").click(function(){
		if(flag){
			$(".colclass").css("display","block");
			flag=false;
		}else{
			$(".colclass").css("display","none");
			$(".colother0").css("display","none");
			flag=true;
		}
	});
	/*鼠标滑过效果*/
	var flag1=true;
	$(".colclass li").mouseout(function(){
		if(flag1){
			$(".colother0").css("display","none");
			flag1=false;
		}else{
			$(".colother0").css("display","block");
			flag1=true;
		}
	});
	$(".colothers ul").mouseover(function(){
		flag1=false;
	});
})
