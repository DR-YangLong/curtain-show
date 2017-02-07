<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>帘艺坊</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="质优价廉，窗帘定制，手工制作。"/>
    <meta name="keywords"
          content="窗帘, 窗帘定制, 手工制作"/>
    <meta name="author" content="YangLong"/>
    <!-- Place /favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="/favicon.ico">
    <!-- Google Fonts -->
    <link href='${staticTools.getResourcePath()}/app/css/font.css' rel='stylesheet' type='text/css'>
    <!-- Animate -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/app/css/animate.css">
    <!-- Icomoon -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/app/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" href="${staticTools.getResourcePath()}/app/css/style.css">


    <!-- Modernizr JS -->
    <script src="${staticTools.getResourcePath()}/app/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="${staticTools.getResourcePath()}/app/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<@macro.appHeader/>
<#if curtain?exists>
<a href="/previous?id=${(curtain.curtainId)!"1"}" class="fh5co-post-prev"><span><i
        class="icon-chevron-left"></i> 上一款</span></a>
<a href="/next?id=${(curtain.curtainId)!"1"}" class="fh5co-post-next"><span>下一款 <i
        class="icon-chevron-right"></i></span></a>
</#if>
<!-- END #fh5co-header -->
<div class="container-fluid">
    <div class="row fh5co-post-entry single-entry">
    <#if curtain?exists>
        <article
                class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12 col-xs-offset-0">
            <!--封面大图-->
            <figure class="animate-box">
                <img src="${staticTools.getDetailCover(curtain.curtainCover)}" alt="Image" class="img-responsive">
            </figure>
            <!-- 名称，日期-->
            <span class="fh5co-meta animate-box"><a style="color:#f50808;font-size: 35px;"
                                                    href="javascript:void(0);"><#if curtain.curtainPrice?exists>${curtain.curtainPrice}
                元/平米<#else>请微信咨询</#if></a></span>
            <h2 class="fh5co-article-title animate-box"><a
                    href="javascript:void(0);">${curtain.curtainName!"暂无名称"}</a></h2>
            <span class="fh5co-meta fh5co-date animate-box">${curtain.curtainDate?string("yyyy年MM月dd日")}</span>
            <span class="fh5co-meta fh5co-date animate-box" style="font-size:30px;color:#f35209">货号：${curtain.curtainNo!""}</span>
            <div class="col-lg-12 col-lg-offset-0 col-md-12 col-md-offset-0 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-left content-article">
                <div class="row">
                    <!--整体介绍 -->
                    <div class="col-lg-8 cp-r animate-box">
                        <p>
                        ${(curtain.curtainDetail)!"暂无介绍"}
                        </p>
                    </div>
                    <!--推荐理由 -->
                    <div class="col-lg-4 animate-box">
                        <div class="fh5co-highlight right">
                            <h4>此款特点</h4>
                            <p>${(curtain.curtainRecommend)!"暂无介绍"}</p>
                        </div>
                    </div>
                </div>
                <!-- 图案设计介绍 -->
                <div class="row rp-b">
                    <div class="col-md-12 animate-box">
                        <blockquote>
                            <p>${(curtain.curtainDesign)!"暂无介绍"}</p>
                        </blockquote>
                    </div>
                </div>
                <!--图片展示-->
                <#if curtain.images?exists && curtain.images?size gt 0>
                    <#list curtain.images as img>
                        <#if img?exists>
                        <div class="row rp-b">
                            <#if img_index%2==0>
                            <div class="col-lg-6 col-md-12 animate-box">
                            <#else>
                            <div class="col-lg-6 col-lg-push-6 col-md-12 col-md-push-0 animate-box">
                            </#if>
                            <figure>
                                <img src="${staticTools.getIndexImg((img.img)!"")}" alt="Img"
                                     class="img-responsive">
                                <figcaption>实图展示</figcaption>
                            </figure>
                        </div>
                            <#if img_index%2==0>
                            <div class="col-lg-6 col-md-12 cp-l animate-box">
                            <#else>
                            <div class="col-lg-6 col-lg-pull-6 col-md-12 col-md-pull-0 cp-r animate-box">
                            </#if>
                            <p>${(img.imgsDescribe)!"暂无描述"}</p>
                        </div>
                        </div>
                        </#if>
                    </#list>
                </#if>
                <!--通用静态部分，加工方式-->
                <div class="row">
                    <div class="col-md-12 animate-box">
                        <h2>悬挂加工方式</h2>
                    </div>
                    <div class="col-md-4 animate-box">
                        <p>挂钩式-普通挂钩</p>
                        <figure>
                            <img src="${staticTools.getResourcePath()}/app/images/1.png"
                                 alt="普通挂钩"
                                 class="img-responsive">
                            <figcaption>
                                根据需要调节窗帘褶皱宽度;需要一定动手能力;拆洗麻烦。
                            </figcaption>
                        </figure>
                    </div>
                    <div class="col-md-4 animate-box">
                        <p>打孔式</p>
                        <figure>
                            <img src="${staticTools.getResourcePath()}/app/images/2.png"
                                 alt="打孔方式"
                                 class="img-responsive">
                            <figcaption>
                                美观大方立体感强;清洗时需要拆下挂环。
                            </figcaption>
                        </figure>
                    </div>
                    <div class="col-md-4 animate-box">
                        <p>挂钩式-韩式S钩</p>
                        <figure>
                            <img src="${staticTools.getResourcePath()}/app/images/3.png"
                                 alt="韩式S钩"
                                 class="img-responsive">
                            <figcaption>
                                固定褶美观大方;清洗时拆卸方便;固定褶皱窗帘高度可微调1-2cm，宽度不变。
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 animate-box">
                        <p>挂钩式测量方式</p>
                        <figure>
                            <img src="${staticTools.getResourcePath()}/app/images/4.png"
                                 alt="挂钩测量方式"
                                 class="img-responsive">
                            <figcaption style="color:red;text-align: center">
                                如不清楚，微信咨询！
                            </figcaption>
                        </figure>
                    </div>
                    <div class="col-md-6 animate-box">
                        <p>打孔式测量方式</p>
                        <figure>
                            <img src="${staticTools.getResourcePath()}/app/images/5.png"
                                 alt="打孔测量方式"
                                 class="img-responsive">
                            <figcaption style="color: red;text-align: center">
                                如不清楚，微信咨询！
                            </figcaption>
                        </figure>
                    </div>
                </div>
            </div>
        </article>
    <#else>
        <article
                class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12 col-xs-offset-0">
            <span>不存在！<a href="/" target="_self">点击返回首页</a></span>
        </article>
    </#if>
    </div>
</div>

<@macro.appFooter/>

<!-- jQuery -->
<script src="${staticTools.getResourcePath()}/app/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="${staticTools.getResourcePath()}/app/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="${staticTools.getResourcePath()}/bootstrap/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="${staticTools.getResourcePath()}/app/js/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="${staticTools.getResourcePath()}/app/js/main.js"></script>

</body>
</html>

