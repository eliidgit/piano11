<#include "/page/front/common/_layout.ftl"/>
<@html title="${current_user.nickname} 的个人主页 - ${siteTitle!}" description="${current_user.nickname} 的个人主页" sidebar_user_info="show" sidebar_create="show">
<div class="panel panel-default">
    <div class="panel-heading">
        <ol class="breadcrumb">
            <li><a href="${baseUrl!}/">首页</a></li>
            <li class="active">${current_user.nickname!}</li>
        </ol>
    </div>
    <div class="panel-body">
        <div class="media">
            <div class="media-left">
                <img class="big-avatar" src="${current_user.avatar!}" title="${current_user.nickname!}">
            </div>
            <div class="media-body">
                <h3 class="media-heading">
                    ${current_user.nickname!}
                </h3>
                <#if current_user.signature??>
                    <p class="signature">
                        <i>“ ${current_user.signature!} ” </i>
                    </p>
                </#if>
                <p>
                    <span class="glyphicon glyphicon-euro"></span>
                    积分: ${current_user.score!}
                </p>
                <p>
                    <span class="glyphicon glyphicon-log-in"></span>
                    注册时间 ${current_user.formatDate(current_user.in_time)!}&nbsp;&nbsp;
                    <#if day??>
                        已连续签到<a href="${baseUrl!}/mission/top10" style="font-size: 20px; color: red;"> ${day!} </a>天
                    </#if>
                </p>
            </div>
            <div class="media-right">
                <#if session.user?? && current_user.id != session.user.id>
                    <a href="javascript:void(0);" data-toggle="modal" data-target="#newMessageModal" class="btn btn-raised btn-sm btn-default">私信</a>
                </#if>
            </div>
            <ul class="nav nav-pills">
                <#if current_user.url?? && current_user.url != "">
                    <li>
                        <a href="${current_user.url!}" target="_blank">
                            <span class="glyphicon glyphicon-home"></span>
                            ${current_user.url!}
                        </a>
                    </li>
                </#if>

            </ul>
        </div>
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <span class="glyphicon glyphicon-th-list"></span>
        我的信息
    </div>
    <div class="panel-body">

    </div>
    <div style="padding: 10px;">
        <a class="dark" href="#">查看更多&gt;&gt;</a>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-heading">
        <span class="glyphicon glyphicon-th-list"></span>
        我的信息
    </div>
    <div class="panel-body">

    </div>
    <div style="padding: 10px;">
        <a class="dark" href="#">查看更多&gt;&gt;</a>
    </div>
</div>

</@html>