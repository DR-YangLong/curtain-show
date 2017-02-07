<#if pageId?exists&&pageId gt 0>
<div class="data_id" id="${pageId}">
    <#if list?exists&&list?size gt 0>
        <#list list as curtain>
            <article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
                <figure>
                    <a href="/detail?id=${(curtain.curtainId)!""}"><img src="${staticTools.getIndexImg((curtain.curtainCover)!"")}" alt="Image"
                                                                        class="img-responsive"></a>
                </figure>
                <span class="fh5co-meta"><a style="color:#f50808;font-size: 20px;" href="javascript:void(0);"><#if curtain.curtainPrice?exists>${curtain.curtainPrice}元/平米<#else>请微信咨询</#if></a></span>
                <h2 class="fh5co-article-title"><a href="/detail?id=${(curtain.curtainId)!""}">${curtain.curtainName!"暂无名称"}</a>
                </h2>
                <span class="fh5co-meta fh5co-date">${curtain.curtainDate?string("yyyy年MM月dd日")}</span>
            </article>
            <#if (curtain_index+1)%2==0&&(curtain_index+1)%4!=0>
                <div class="clearfix visible-xs-block"></div>
            </#if>
            <#if (curtain_index+1)%4==0>
                <div class="clearfix visible-lg-block visible-md-block visible-sm-block visible-xs-block"></div>
            </#if>
        </#list>
    </#if>
</div>
<#else>
<div class="data_id" id="-1">
    <article class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-xxs-12">
        <h1 class="fh5co-article-title" style="font-size: 3em">已经到底了</h1>
    </article>
</div>
</#if>