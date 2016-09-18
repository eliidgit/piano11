<#macro paginate currentPage totalPage actionUrl urlParas="">


    <#if (totalPage <= 0) || (currentPage > totalPage)><#return></#if>
    <#local startPage = currentPage - 2>
    <#if (startPage < 1)><#local startPage = 1></#if>

    <#local endPage = currentPage + 2>
    <#if (endPage > totalPage)><#local endPage = totalPage></#if>
    <style type="text/css">
	.page{
		overflow: hidden;
    	padding-bottom: 31px;
    }
</style>
<div  class="page">
    <ul class="pagenum">
        <#if (currentPage <= 3)>
            <#local startPage = 1>
        </#if>
        <#if ((totalPage - currentPage) < 2)>
            <#local endPage = totalPage>
        </#if>

        <#if (currentPage == 1)>
            <!--<li>上页</li>-->
        <#else>
            <li class="first"><a href="${actionUrl}?p=1${urlParas!}">第一页</a></li>
            <li class="prev"><a href="${actionUrl}?p=#{currentPage - 1}${urlParas!}">上一页</a></li>
        </#if>

        <#list startPage..endPage as i>
            <#if currentPage == i>
                <li  class="current"><a>#{i}</a></li>
            <#else>
                <li  class="current" ><a href="${actionUrl}?p=#{i}${urlParas!}">#{i}</a></li>
            </#if>
        </#list>

        <#if (currentPage == totalPage)>
            <!--<li>下页</li>-->
        <#else>
            <li class="next"><a href="${actionUrl}?p=#{currentPage + 1}${urlParas!}">下一页</a></li>
            <li class="last"><a href="${actionUrl}?p=#{totalPage}${urlParas!}">最后一页</a></li>
        </#if>
    </ul>
</div>
</#macro>