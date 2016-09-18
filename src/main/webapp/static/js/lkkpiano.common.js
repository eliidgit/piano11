function checkNull(obj,vline){
    //判断输入框是否为空，为空时弹出提示框
    var v=document.getElementById(obj).value;
    v=v.replace(/(^\s*)|(\s*$)/g,"");///去除空格的方法
    if (v.length==0){
        alert(vline+" 输入值为空！");
        return false;
    }
    return true;
}