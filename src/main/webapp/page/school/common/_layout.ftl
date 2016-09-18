<#macro html title description>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <meta charset="utf-8" />
    <title>${title!"iano"}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
    <link rel="stylesheet" href="${baseUrl!}/static/school/css/common.css" />
    <script type="text/javascript" src="${baseUrl!}/static/school/js/jquery-1.11.0.js" ></script>
    <script type="text/javascript" src="${baseUrl!}/static/school/js/common.js" ></script>
</head>
<body>
<#--页面头部信息-->
    <#include "/page/school/common/header.ftl"/>
    <@header page_tab=page_tab/>

    <#nested>

                <#--
                  <#include "/page/school/common/sidebar.ftl"/>
                <@sidebar sidebar_user_info=sidebar_user_info sidebar_topic_user=sidebar_topic_user sidebar_checkin=""
                sidebar_create=sidebar_create sidebar_scoretop=sidebar_scoretop
                sidebar_create_info=sidebar_create_info sidebar_about=sidebar_about sidebar_other_topic=sidebar_other_topic
                sidebar_not_reply_topic=sidebar_not_reply_topic sidebar_xgtopic=sidebar_xgtopic sidebar_jfbbs_run_status=sidebar_jfbbs_run_status
                sidebar_app=sidebar_app />
                -->


<#--footer-->
    <#include "/page/school/common/footer.ftl"/>
    <@footer/>
</body>
</html>
</#macro>