<input type="hidden" id="total-page" value="${totalPage!1}"/>
<#if curtains?exists&&curtains?size gt 0>
    <#list curtains as curtain>
    <tr>
        <td>${curtain.curtainId}</td>
        <td>${curtain.curtainNo}</td>
        <td>${curtain.curtainName}</td>
        <td>${curtain.curtainDesign}</td>
        <td>${curtain.curtainPrice!'0'}</td>
        <td>${staticTools.getStateMark(curtain.curtainStatus,"5")}</td>
        <td style="text-align: center">
            <button type="button" class="btn btn-info"
                    onclick="goEdit(${curtain.curtainId})">编辑
            </button>
            <button type="button"
                    class="btn btn-danger <#if curtain.curtainStatus=='1'>disabled</#if>"
                    <#if curtain.curtainStatus=='1'>disabled</#if>
                    onclick="changeCurtain(${curtain.curtainId},'1',this)"
                    style="margin: 4px 4px 4px 4px">删除
            </button>
            <button type="button"
                    class="btn btn-info <#if curtain.curtainStatus=='0'>disabled</#if>"
                    <#if curtain.curtainStatus=='0'>disabled</#if>
                    onclick="changeCurtain(${curtain.curtainId},'0',this)">
                恢复
            </button>
        </td>
    </tr>
    </#list>
<#else>
<tr>
    <td colspan="7">没有符合条件的商品</td>
</tr>
</#if>