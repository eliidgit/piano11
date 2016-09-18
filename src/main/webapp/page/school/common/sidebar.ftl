<#macro sidebar sidebar_user_info="" sidebar_topic_user="" sidebar_checkin="" sidebar_create="" sidebar_scoretop=""
    sidebar_create_info="" sidebar_about="" sidebar_other_topic=""
    sidebar_not_reply_topic="" sidebar_xgtopic="" sidebar_jfbbs_run_status="" sidebar_app="">


<div class="panel panel-default">
    <#if session.user??>
        <div class="panel-heading">
            <span class="glyphicon glyphicon-user"></span>
            <b>个人信息</b>
        </div>
        <div class="panel-body">
            <div class="media">
                <div class="media-left">
                    <a href="${baseUrl!}/user/${session.user.id!}" style="text-decoration: none;">
                        <img src="${session.user.avatar!}" title="${session.user.nickname!}" class="avatar">
                    </a>
                </div>
                <div class="media-body">
                    <div class="media-heading">
                        <a href="${baseUrl!}/user/${session.user.id!}">${session.user.nickname!}</a>
                    </div>
                </div>
                <#if session.user.signature?? && session.user.signature != "">
                    <div style="color: #7A7A7A; font-size: 12px; margin-top:5px;">
                        <i>“ ${session.user.signature!} ” </i>
                    </div>
                </#if>
            </div>
        </div>
    <#else>
        <div class="panel-body">
            <h5> 体验</h5>
            <p>欢迎 家庭</p>
        </div>
    </#if>
</div>

</#macro>