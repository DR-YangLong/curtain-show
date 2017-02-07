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
    <link href='${staticTools.getResourcePath()}/app/css/font.css' type='text/css'>
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

<div class="container-fluid">
    <div class="row fh5co-post-entry">
        <div class="data_id" id="1">
        <#if list?exists&&list?size gt 0>
            <#list list as curtain>
                <article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
                    <figure>
                        <a href="/detail?id=${(curtain.curtainId)!""}"><img
                                src="${staticTools.getIndexImg((curtain.curtainCover)!"")}"
                                alt="Image"
                                class="img-responsive"></a>
                    </figure>
                    <span class="fh5co-meta"><a style="color:#f50808;font-size: 20px;"
                                                href="javascript:void(0);"><#if curtain.curtainPrice?exists>${curtain.curtainPrice}
                        元/平米<#else>请微信咨询</#if></a></span>
                    <h2 class="fh5co-article-title"><a
                            href="/detail?id=${(curtain.curtainId)!""}">${curtain.curtainName!"暂无名称"}</a>
                    </h2>
                    <span class="fh5co-meta fh5co-date">${curtain.curtainDate?string("yyyy年MM月dd日")}</span>
                    <span class="fh5co-meta fh5co-date" style="font-size: 18px; color: #f35209;">货号：${curtain.curtainNo!""}</span>
                </article>
                <#if (curtain_index+1)%2==0&&(curtain_index+1)%4!=0>
                    <div class="clearfix visible-xs-block"></div>
                </#if>
                <#if (curtain_index+1)%4==0>
                    <div class="clearfix visible-lg-block visible-md-block visible-sm-block visible-xs-block"></div>
                </#if>
            </#list>
        <#else>
            <div class="data_id" id="-1">
                <article class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-xxs-12">
                    <h1 class="fh5co-article-title" style="font-size: 3em">已经到底了</h1>
                </article>
            </div>
        </#if>
        </div>
        <!--分页分割 -->
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true" style="display: none; padding-right: 0 px; margin-top: 15%">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    <i class="icon icon-warning"></i>
                </h4>
            </div>
            <div class="modal-body" style="text-align: center">
                没有您要查看的商品，已经为您跳转首页！
            </div>
            <div class="modal-footer">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
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
<#--如果数据满一页-->
<#if list?exists&&list?size gt 15>
<script src="${staticTools.getResourcePath()}/callajax.js"></script>
<script type="text/javascript">
    var _scroll_flag = true;//是否可以滚动
    $(window).scroll(function () {
        if (!_scroll_flag) {
            return;
        }//还没有完成，中断
        var _doc_height, _scroll_height, _now_height;
        _doc_height = $(document).height();//当前dom高度
        _scroll_height = $(this).scrollTop();//滚动条距离顶部距离
        _now_height = $(this).height();//滚动条长度
        var _bottom_height = _doc_height - _scroll_height - _now_height;//距离底部距离
        _bottom_height = _bottom_height / _doc_height;
        if (_bottom_height <= 0.4 && _scroll_flag) {
            _scroll_flag = false;
            doPost("/index/ajax", {page: 'next'}, 'html', function (data) {
                //添加效果
                var id = $(data).filter('div.data_id').attr('id');
                $('div .row.fh5co-post-entry').append(data);
                if (id === '-1') {
                    return;
                }
                var start = Date.now();
                contentWayPoint(id);
                var end = Date.now();
                var time = end - start;
                console.log("执行时间：" + time);
                _scroll_flag = true;
            }, function () {
                alert('分页错误');
            });
        }
    });
    //添加效果函数
    var contentWayPoint = function (id) {
        $('#' + id).children('.animate-box').waypoint(function (direction) {
            if (direction === 'down') {
                $(this.element).addClass('item-animate');
                setTimeout(function () {
                    $('body .animate-box.item-animate').each(function (k) {
                        var el = $(this);
                        setTimeout(function () {
                            el.addClass('fadeInUp animated');
                            el.removeClass('item-animate');
                        }, k * 200, 'easeInOutExpo');
                    });

                }, 100);

            }

        }, {offset: '85%'});
    };

        <#if modal?exists>
        $(function () {
            $("#myModal").modal('show');
            setTimeout(function () {
                $("#myModal").modal('hide');
            }, 2000);
        });
        </#if>
</script>
</#if>
</body>
</html>

