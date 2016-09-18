<#include "/page/school/common/_layout.ftl"/>
<@html title="用户信息- ${siteTitle!}" description="${user.nickname} 的个人主页">
<div class="panel panel-default">
    <div class="panel-heading">
        <ol class="breadcrumb">
            <li><a href="${baseUrl!}/admin">首页</a></li>
            <li class="active">${user.nickname!}</li>
        </ol>
    </div>
    <div class="panel-body">
        <div class="media">
            <div class="media-left">
                <img class="big-avatar" src="${user.avatar!}" title="${user.nickname!}">
            </div>
            <div class="media-body">
                <h3 class="media-heading">
                ${user.nickname!}
                </h3>
                <#if user.signature??>
                    <p class="signature">
                        <i>“ ${user.signature!} ” </i>
                    </p>
                </#if>

            </div>
            <ul class="nav nav-pills">
                <#if user.url?? && user.url != "">
                    <li>
                        <a href="${user.url!}" target="_blank">
                            <span class="glyphicon glyphicon-home"></span>
                        ${user.url!}
                        </a>
                    </li>
                </#if>

            </ul>
        </div>
    </div>
</div>



</@html>