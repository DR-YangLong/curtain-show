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
<body class="hold-transition skin-blue sidebar-mini" id="curtain_data_id" data-id="${curtain.curtainId}">
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
                                <input type="text" style="width: 80%" class="form-control"
                                       id="curtainName" placeholder="${curtain.curtainName!""}"
                                       required onblur="updateCurtain(this,0)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainNo" class="col-sm-2 control-label">货号</label>
                            <div class="col-sm-10">
                                <input type="text" style="width: 80%" class="form-control"
                                       id="curtainNo" placeholder="${curtain.curtainNo!""}"
                                       required onblur="updateCurtain(this,0)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainPrice" class="col-sm-2 control-label">价格</label>
                            <div class="col-sm-10">
                                <input type="text" pattern="[0-9]{1,3}" style="width: 80%"
                                       class="form-control"
                                       id="curtainPrice"
                                       placeholder="${curtain.curtainPrice!"3位以下整数"}" required onblur="updateCurtain(this,0)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainDesign"
                                   class="col-sm-2 control-label">窗帘图案设计说明</label>

                            <div class="col-sm-10">
                                <input type="text" style="width: 80%" class="form-control"
                                       id="curtainDesign" placeholder="${curtain.curtainDesign!""}"
                                       required onblur="updateCurtain(this,0)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainDetail" class="col-sm-2 control-label">整体介绍</label>

                            <div class="col-sm-10">
                                <textarea style="width: 80%" class="form-control" id="curtainDetail"
                                          placeholder="${curtain.curtainDetail!"详情"}"
                                          required onblur="updateCurtain(this,0)"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainRecommend"
                                   class="col-sm-2 control-label">推荐理由</label>

                            <div class="col-sm-10">
                                <textarea style="width: 80%" class="form-control"
                                          id="curtainRecommend"
                                          placeholder="${curtain.curtainRecommend!"特色等"}"
                                          required onblur="updateCurtain(this,0)"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainThickness" class="col-sm-2 control-label">厚度</label>
                            <div class="col-sm-10">
                                <select class="form-control select2" id="curtainThickness"
                                        style="width:40%;" placeholder="${curtain.curtainThickness}" onchange="updateCurtain(this,0)">
                                    <option selected="selected"
                                            value="">${staticTools.getStateMark(curtain.curtainThickness,"1")}</option>
                                    <option value="0">厚重</option>
                                    <option value="1">适中</option>
                                    <option value="2">较薄</option>
                                    <option value="3">轻薄</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainVertical" class="col-sm-2 control-label">垂感</label>
                            <div class="col-sm-10">
                                <select class="form-control select2" id="curtainVertical"
                                        style="width:40%;" placeholder="${curtain.curtainVertical}" onchange="updateCurtain(this,0)">
                                    <option selected="selected"
                                            value="">${staticTools.getStateMark(curtain.curtainThickness,"2")}</option>
                                    <option value="1">适中</option>
                                    <option value="0">较好</option>
                                    <option value="2">轻飘</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="curtainHandfeel" class="col-sm-2 control-label">手感</label>
                            <div class="col-sm-10">
                                <select class="form-control select2" id="curtainHandfeel"
                                        style="width:40%;" onchange="updateCurtain(this,0)" placeholder="${curtain.curtainHandfeel}">
                                    <option selected="selected"
                                            value="">${staticTools.getStateMark(curtain.curtainThickness,"3")}</option>
                                    <option value="2">适中</option>
                                    <option value="0">细滑</option>
                                    <option value="1">柔软</option>
                                    <option value="3">厚实</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="curtainCover"
                                   class="col-sm-2 control-label">效果图片，比例[1：1.4]</label>
                            <div class="col-sm-10">
                                <div id="curtainCover-co">
                                    <button id="curtainCover-bt" type="button"
                                            class="btn btn-warning">点击上传
                                    </button>
                                </div>
                                <div style="width: 368.25px;height: auto; margin-top: 5px;">
                                    <img id="curtainCover-show"
                                         src="${staticTools.getIndexImg(curtain.curtainCover)}"
                                         class="img-responsive"/>
                                </div>
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
        <#if curtain.images?exists&&curtain.images?size gt 0>
            <#assign size=curtain.images?size/>
            <section class="content" data-size="${size}" id="img_size">
                <div class="row" style="margin-left: 3%">
                    <div class="tab-pane">
                        <#list curtain.images as img>
                            <#if img?exists>
                                <div class="form-group">
                                    <label for="img-${img.imgId}"
                                           class="col-sm-2 control-label">图片，比例[1：1.4]</label>
                                    <div class="col-sm-10">
                                        <div id="container-${img_index}">
                                            <button id="img-bt-${img_index}" type="button"
                                                    class="btn btn-warning" data-id="${img.imgId}">点击上传
                                            </button>
                                        </div>
                                        <div style="width: 368.25px;height: auto; margin-top: 5px;">
                                            <img id="show-img-${img_index}"
                                                 src="${staticTools.getIndexImg(img.img)}"
                                                 class="img-responsive"/>
                                        </div>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="desc-${img.imgId}" class="col-sm-2 control-label">描述</label>
                                    <div class="col-sm-10">
                                <textarea style="width: 80%" class="form-control" data-id="${img.imgId}" id="desc-${img.imgId}"
                                          placeholder="${img.imgsDescribe}" required onblur="updateCurtain(this,1)"></textarea>
                                    </div>
                                </div>
                            </#if>
                        </#list>
                    </div>
                </div>
                <!-- /.row -->
            </section>
        </#if>
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
<script src="${staticTools.getResourcePath()}/callajax.js"></script>
<script src="${staticTools.getResourcePath()}/editImg.js"></script>
<script type="text/javascript">
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
    });
</script>
</body>
</html>