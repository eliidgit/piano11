<#macro header page_tab="">
<!-- 遮罩框 -->
<div class="lr_tc"></div>
<div class="loading"><img src="/static/school/img/pic19.png"/></div>
<!--页面头部-->
<div class="top">
    <div class="logo">
        <a class="logopic" href="${baseUrl!}/school/index.html" ><img width="138px;" src="${baseUrl!}/static/school/img/logo_2.png"/></a>
        <ul class="topcenter">
            <li><a href="${baseUrl!}/school/index.html">首页</a></li>
            <li><a href="${baseUrl!}/school/courseware.html">课件管理</a></li>
            <li><a href="${baseUrl!}/school/student.html">学生管理</a></li>
            <li><a href="${baseUrl!}/school/teacher.html">教师管理</a></li>

            <li><a href="${baseUrl!}/school/class.html">班级管理</a></li>
            <li><a href="${baseUrl!}/school/piano.html">设备管理</a></li>
            <li><a href="javascript:;">教学排名</a></li>
        </ul>

        <#if session.user??>


            <div class="userpic">
                <a class="userexit" href="javacript:;">
                    <img class="user_img1" src="${baseUrl!}/static/school/img/school_tx_05.png"/><a class="user_center" href="${baseUrl!}/school/user/setting">${session.user.nickname!}</a><img class="user_img2" src="${baseUrl!}/static/school/img/school_index_03.png"/>
                    <div class="exit"><a href="${baseUrl!}/school/logout">退出账户</a></div>
                </a>
            </div>


        <#else>
        <#--<li><a href="javascript:void(0);" data-toggle="modal" data-target="#loginModal">登录</a></li>-->
            <span><a href="${baseUrl!}/school/login">登录</a></span>
        </#if>



    </div>
</div>
<!-- <style>
    .user_center{
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        width:32px;

    }
</style> -->
<script>
    $(".user_tx").click(function(){
        location.href="${baseUrl!}/school/user/";
    });
</script>

<!--头部结束-->
</#macro>