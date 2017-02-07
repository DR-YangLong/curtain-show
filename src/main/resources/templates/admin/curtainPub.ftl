<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | User Profile</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
          name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/admin/css/libs/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/admin/css/libs/ionicons.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="${staticTools.getResourcePath()}/admin/plugins/select2/select2.min.css">
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
        <form class="form-horizontal" data-toggle="validator" role="form">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                商品主信息
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row" style="margin-left: 3%">
                <div class="tab-pane">
                        <div class="form-group">
                            <label for="curtainName" class="col-sm-2 control-label">名称</label>

                            <div class="col-sm-10">
                                <input pattern=".{,30}" type="text" style="width: 80%" class="form-control"
                                       id="curtainName" placeholder="御景园" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainNo" class="col-sm-2 control-label">货号</label>
                            <div class="col-sm-10">
                                <input type="text" pattern=".{,45}" style="width: 80%" class="form-control"
                                       id="curtainNo" placeholder="No.123" required>
                            </div>
                        </div>
                    <div class="form-group">
                        <label for="curtainPrice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-10">
                            <input type="text" pattern="[0-9]{1,3}" style="width: 80%" class="form-control"
                                   id="curtainPrice"  placeholder="输入999以下整数" required>
                        </div>
                    </div>
                        <div class="form-group">
                            <label for="curtainDesign"
                                   class="col-sm-2 control-label">窗帘图案设计说明</label>

                            <div class="col-sm-10">
                                <input type="text" pattern=".{,128}" style="width: 80%" class="form-control"
                                       id="curtainDesign" placeholder="牡丹印花" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainDetail" class="col-sm-2 control-label">整体介绍</label>

                            <div class="col-sm-10">
                                <textarea pattern=".{,1280}" style="width: 80%" class="form-control" id="curtainDetail"
                                          placeholder="整体介绍" required></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainRecommend"
                                   class="col-sm-2 control-label">推荐理由</label>

                            <div class="col-sm-10">
                                <textarea pattern=".{,256}" style="width: 80%" class="form-control"
                                          id="curtainRecommend" placeholder="特色等介绍" required></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainThickness" class="col-sm-2 control-label">厚度</label>
                            <div class="col-sm-10">
                                <select class="form-control select2" id="curtainThickness"
                                        style="width:40%;">
                                    <option selected="selected" value="1">适中</option>
                                    <option value="0">厚重</option>
                                    <option value="2">较薄</option>
                                    <option value="3">轻薄</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainVertical" class="col-sm-2 control-label">垂感</label>
                            <div class="col-sm-10">
                                <select class="form-control select2" id="curtainVertical"
                                        style="width:40%;">
                                    <option selected="selected" value="1">适中</option>
                                    <option value="0">较好</option>
                                    <option value="2">轻飘</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainHandfeel" class="col-sm-2 control-label">手感</label>
                            <div class="col-sm-10">
                                <select class="form-control select2" id="curtainHandfeel"
                                        style="width:40%;">
                                    <option selected="selected" value="2">适中</option>
                                    <option value="0">细滑</option>
                                    <option value="1">柔软</option>
                                    <option value="3">厚实</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="curtainCover"
                                   class="col-sm-2 control-label">效果图片1400x940，比例[1：1.4]</label>
                            <div class="col-sm-10">
                                <div id="curtainCover-co">
                                    <button id="curtainCover-bt" type="button" class="btn btn-warning">点击上传
                                    </button>
                                </div>
                                <div style="width: 368.25px;height: auto; margin-top: 5px;">
                                    <img id="curtainCover-show" src="${staticTools.getResourcePath()}/admin/img/demo/pic_1.jpg"
                                         class="img-responsive"/>
                                </div>
                                <input required type="text" data-error="请上传图片" class="form-control disabled" style="width: 40%;margin-top: 5px;"  id="curtainCover" value="" placeholder="图片上传后请勿修改"/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                </div>
            </div>
            <!-- /.row -->
        </section>
        <section class="content-header" style="margin-top: 20px;">
            <h1>
                图片说明
            </h1>
        </section>
        <section class="content">
            <div class="row" style="margin-left: 3%">
                <div class="tab-pane">
                        <div class="form-group">
                            <label for="curtainCover"
                                   class="col-sm-2 control-label">样式图片700x974，比例[1：1.4]</label>
                            <div class="col-sm-10">
                                <div id="designCover-co">
                                    <button id="designCover-bt" type="button" class="btn btn-warning">点击上传
                                    </button>
                                </div>
                                <div style="width: 368.25px;height: auto; margin-top: 5px;">
                                    <img id="designCover-show" src="${staticTools.getResourcePath()}/admin/img/demo/pic_1.jpg"
                                         class="img-responsive"/>
                                </div>
                                <input required data-error="请上传图片"  type="text" class="form-control disabled" style="width: 40%;margin-top: 5px;" id="designCover" value="" placeholder="图片上传后请勿修改"/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">花样、样式描述</label>
                            <div class="col-sm-10">
                                <textarea pattern=".{,1024}" style="width: 80%" class="form-control" id="designDesc"
                                          placeholder="花样、样式描" required></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="curtainCover"
                                   class="col-sm-2 control-label">材质图片700x974，比例[1：1.4]</label>
                            <div class="col-sm-10">
                                <div id="materialCover-co">
                                    <button type="button" class="btn btn-warning"
                                            id="materialCover-bt">点击上传
                                    </button>
                                </div>
                                <div style="width: 368.25px;height: auto; margin-top: 5px;">
                                    <img id="materialCover-show" src="${staticTools.getResourcePath()}/admin/img/demo/pic_1.jpg"
                                         class="img-responsive"/>
                                </div>
                                <input required  type="text" data-error="请上传图片" class="form-control disabled" style="width: 40%;margin-top: 5px;" id="materialCover" value="" placeholder="图片上传后请勿修改"/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">材质说明</label>
                            <div class="col-sm-10">
                                <textarea pattern=".{,1024}" style="width: 80%" class="form-control" id="materialDesc"
                                          placeholder="材质解说" required></textarea>
                            </div>
                        </div>


                        <div class="form-group" style="margin-top: 25px;">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-danger"
                                        onclick="createCurtain();">发布
                                </button>
                            </div>
                        </div>
                </div>
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
        </form>
    </div>
    <!-- /.content-wrapper -->
    <@macro.adminFooter/>
</div>
<!-- ./wrapper -->
<@macro.adminJs/>
<!-- Select2 -->
<script src="${staticTools.getResourcePath()}/admin/plugins/select2/select2.full.min.js"></script>
<!-- FastClick -->
<script src="${staticTools.getResourcePath()}/admin/plugins/fastclick/fastclick.js"></script>
<!-- validator-->
<script src="${staticTools.getResourcePath()}/bootstrap/js/validator.min.js"></script>
<script src="${staticTools.getResourcePath()}/plupload/plupload.full.min.js"></script>
<script src="${staticTools.getResourcePath()}/plupload/i18n/zh_CN.js"></script>
<script src="${staticTools.getResourcePath()}/plupload/moxie.min.js"></script>
<script src="${staticTools.getResourcePath()}/qiniu/qiniu.min.js"></script>
<script src="${staticTools.getResourcePath()}/qiniu-config.js"></script>
<script src="${staticTools.getResourcePath()}/uploadImg.js"></script>
<script type="text/javascript">
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
    });
</script>
</body>
</html>
