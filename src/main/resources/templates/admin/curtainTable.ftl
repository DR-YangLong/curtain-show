<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Invoice</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
          name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/admin/css/libs/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/admin/css/libs/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/admin/plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/admin/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/admin/css/skins/skin-blue.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<@macro.adminHeader/>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                商品列表
                <small>最近发布在前</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="invoice" style="margin-top: 10px;">
            <!-- title row -->
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-xs-12 col-lg-3 col-md-4 pull-right">
                    <div class="input-group">
                        <input id="condition" type="text" class="form-control" placeholder="名称或货号">
                        <span class="input-group-addon"><a class="fa fa-search"
                                                           href="javascript:void(0);"
                                                           onclick="doSearch()">搜索</a></span>
                    </div>
                </div>
            </div>

            <!-- Table row -->
            <div class="row">
                <div class="col-xs-12 table-responsive">
                    <table class="table table-striped" style="text-align: center">
                        <thead>
                        <tr>
                            <th style="text-align: center">编号</th>
                            <th style="text-align: center">货号</th>
                            <th style="text-align: center">名称</th>
                            <th style="text-align: center">图案设计</th>
                            <th style="text-align: center">单价(元/平米)</th>
                            <th style="text-align: center">状态</th>
                            <th style="text-align: center">操作</th>
                        </tr>
                        </thead>
                        <tbody id="curtainList">
                        <!--15条合适 -->
                        <input type="hidden" id="total-page" value="1"/>
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
                        </tbody>
                    </table>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->

            <!-- this row will not appear when printing -->
            <div class="row no-print">
                <div class="col-xs-12" style="align-content: center;text-align:center;padding: 0">
                    <ul id="pagination" class="pagination"></ul>
                </div>
            </div>
        </section>
        <!-- /.content -->
        <div class="clearfix"></div>
    </div>
<@macro.adminFooter/>
</div>
<!-- ./wrapper -->
<@macro.adminJs/>
<!-- FastClick -->
<script src="${staticTools.getResourcePath()}/admin/plugins/fastclick/fastclick.js"></script>
<!-- DataTables -->
<script src="${staticTools.getResourcePath()}/admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${staticTools.getResourcePath()}/admin/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${staticTools.getResourcePath()}/callajax.js"></script>
<script src="${staticTools.getResourcePath()}/admin/js/jqPaginator.min.js"></script>
<script>
    $('#pagination').jqPaginator({
                                     totalPages: ${totalPage!0},
                                     visiblePages: 5,
                                     currentPage: 1,
                                     first: '<li class="first"><a href="javascript:void(0);">首页<\/a><\/li>',
                                     prev: '<li class="prev"><a href="javascript:void(0);"><i class="arrow arrow2"><\/i>上一页<\/a><\/li>',
                                     next: '<li class="next"><a href="javascript:void(0);">下一页<i class="arrow arrow3"><\/i><\/a><\/li>',
                                     last: '<li class="last"><a href="javascript:void(0);">末页<\/a><\/li>',
                                     page: '<li class="page"><a href="javascript:void(0);">{{page}}<\/a><\/li>',
                                     onPageChange: function (num, type) {
                                         if ("change" === type) {
                                             //获取页码，搜索条件
                                             var param = {};
                                             param.page = num;
                                             var condition = $("#condition").val();
                                             if (condition) {
                                                 param.curtainName = condition;
                                                 param.curtainNo = condition;
                                             }
                                             doPost('/manager/list/ajax', param, 'html',
                                                    function (data) {
                                                        $("#curtainList").html(data);
                                                    }, function () {
                                                         alert("服务不可用！");
                                                     });
                                         }
                                     }
                                 });
    //点击搜索按钮搜索
    var doSearch = function () {
        //获取页码，搜索条件
        var param = {};
        param.page = 1;
        var condition = $("#condition").val();
        if (condition) {
            param.curtainName = condition;
            param.curtainNo = condition;
        }
        doPost('/manager/list/ajax', param, 'html',
               function (data) {
                   $("#curtainList").html(data);
                   //重新初始化分页插件
                   var totalPage = $("#total-page").val();
                   if (!totalPage) {
                       totalPage = 1;
                   }
                   $('#pagination').jqPaginator('option', {
                       currentPage: 1,
                       totalPages: parseInt(totalPage)
                   });
               }, function () {
                    alert("服务不可用！");
                });
    };

    $(function () {
        $('#example2').DataTable({
                                     "paging": true,
                                     "lengthChange": false,
                                     "searching": true,
                                     "ordering": true,
                                     "info": true,
                                     "autoWidth": false
                                 });
    });

    var hideModal = function () {
        $(".modal").modal("hide");
    };
    //改变状态
    var changeCurtain = function (id, status, _this) {
        var field = $(_this).parent().prev();
        var params = {curtainId: id, curtainStatus: status};
        var url = '/manager/edit/ajax';
        doPost(url, params, 'json', function (data) {
            if (data.success) {
                if (status == '1') {
                    field.text("已删除");
                    //激活恢复按钮
                    $(_this).next().removeClass("disabled");
                    $(_this).next().attr("disabled", false);
                    $(_this).addClass("disabled");
                    $(_this).attr("disabled", true);
                } else if (status == '0') {
                    field.text("正常");
                    //激活删除按钮
                    $(_this).prev().removeClass("disabled");
                    $(_this).prev().attr("disabled", false);
                    $(_this).addClass("disabled");
                    $(_this).attr("disabled", true);
                }
                $(".modal").modal("show");
                setTimeout("hideModal()", 800);
            } else {
                alert("操作失败！");
            }
        }, function () {
            alert("服务不可用！");
        });
    };
    //跳转编辑
    var goEdit = function (id) {
        window.location.href = "/manager/edit?curtainId=" + id;
    }
</script>

<div class="modal fade" style="background: auto">
    <div class="modal-dialog" role="dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <p>操作成功</p>
            </div>
            <div class="modal-footer">
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</body>
</html>
