//处理新增上传完成
function uploadOver(btId, info) {
    if (btId) {
        console.log(btId);
        $("#" + btId).val(info.key);
        $("#" + btId + "-show").attr('src', domain + "/" + info.key);
    } else {
        alert('上传失败！');
    }
}

$(function () {
    Qiniu.uploader({
                       runtimes: 'html5,flash,html4',      // 上传模式，依次退化
                       browse_button: 'curtainCover-bt',         // 上传选择的点选按钮，必需
                       uptoken_url: token_url,         // Ajax请求uptoken的Url，强烈建议设置（服务端提供）
                       unique_names: true,              // 默认false，key为文件名。若开启该选项，JS-SDK会为每个文件自动生成key（文件名）
                       domain: domain,     // bucket域名，下载资源时用到，必需
                       container: 'curtainCover-co',             // 上传区域DOM ID，默认是browser_button的父元素
                       max_file_size: '20mb',             // 最大文件体积限制
                       flash_swf_url: swf_url,  //引入flash，相对路径
                       max_retries: 3,                     // 上传失败最大重试次数
                       dragdrop: false,                     // 开启可拖曳上传
                       //drop_element: 'container',          // 拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
                       chunk_size: '4mb',                  // 分块上传时，每块的体积
                       auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传
                       init: {
                           'FilesAdded': function (up, files) {
                               plupload.each(files, function (file) {
                                   // 文件添加进队列后，处理相关的事情
                               });
                           },
                           'BeforeUpload': function (up, file) {
                               // 每个文件上传前，处理相关的事情
                           },
                           'UploadProgress': function (up, file) {
                               // 每个文件上传时，处理相关的事情
                           },
                           'FileUploaded': function (up, file, info) {
                               //上传完成后
                               uploadOver('curtainCover', JSON.parse(info));
                           },
                           'Error': function (up, err, errTip) {
                               //上传出错时，处理相关的事情
                           },
                           'UploadComplete': function () {
                               //队列文件处理完毕后，处理相关的事情
                           },
                           'Key': function (up, file) {
                               // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                               // 该配置必须要在unique_names: false，save_key: false时才生效
                               var key = "";
                               // do something with key here
                               return key
                           }
                       }
                   });
    var q2 = new QiniuJsSDK();
    q2.uploader({
                    runtimes: 'html5,flash,html4',      // 上传模式，依次退化
                    browse_button: 'designCover-bt',         // 上传选择的点选按钮，必需
                    uptoken_url: token_url,         // Ajax请求uptoken的Url，强烈建议设置（服务端提供）
                    unique_names: true,              // 默认false，key为文件名。若开启该选项，JS-SDK会为每个文件自动生成key（文件名）
                    domain: domain,     // bucket域名，下载资源时用到，必需
                    container: 'designCover-co',             // 上传区域DOM ID，默认是browser_button的父元素
                    max_file_size: '20mb',             // 最大文件体积限制
                    flash_swf_url: swf_url,  //引入flash，相对路径
                    max_retries: 3,                     // 上传失败最大重试次数
                    dragdrop: false,                     // 开启可拖曳上传
                    //drop_element: 'container',          // 拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
                    chunk_size: '4mb',                  // 分块上传时，每块的体积
                    auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传
                    init: {
                        'FilesAdded': function (up, files) {
                            plupload.each(files, function (file) {
                                // 文件添加进队列后，处理相关的事情
                            });
                        },
                        'BeforeUpload': function (up, file) {
                            // 每个文件上传前，处理相关的事情
                        },
                        'UploadProgress': function (up, file) {
                            // 每个文件上传时，处理相关的事情
                        },
                        'FileUploaded': function (up, file, info) {
                            //上传完成后
                            uploadOver('designCover', JSON.parse(info));
                        },
                        'Error': function (up, err, errTip) {
                            //上传出错时，处理相关的事情
                        },
                        'UploadComplete': function () {
                            //队列文件处理完毕后，处理相关的事情
                        },
                        'Key': function (up, file) {
                            // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                            // 该配置必须要在unique_names: false，save_key: false时才生效
                            var key = "";
                            // do something with key here
                            return key
                        }
                    }
                });
    var q3 = new QiniuJsSDK();
    q3.uploader({
                    runtimes: 'html5,flash,html4',      // 上传模式，依次退化
                    browse_button: 'materialCover-bt',         // 上传选择的点选按钮，必需
                    uptoken_url: token_url,         // Ajax请求uptoken的Url，强烈建议设置（服务端提供）
                    unique_names: true,              // 默认false，key为文件名。若开启该选项，JS-SDK会为每个文件自动生成key（文件名）
                    domain: domain,     // bucket域名，下载资源时用到，必需
                    container: 'materialCover-co',             // 上传区域DOM ID，默认是browser_button的父元素
                    max_file_size: '20mb',             // 最大文件体积限制
                    flash_swf_url: swf_url,  //引入flash，相对路径
                    max_retries: 3,                     // 上传失败最大重试次数
                    dragdrop: false,                     // 开启可拖曳上传
                    //drop_element: 'container',          // 拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
                    chunk_size: '4mb',                  // 分块上传时，每块的体积
                    auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传
                    init: {
                        'FilesAdded': function (up, files) {
                            plupload.each(files, function (file) {
                                // 文件添加进队列后，处理相关的事情
                            });
                        },
                        'BeforeUpload': function (up, file) {
                            // 每个文件上传前，处理相关的事情
                        },
                        'UploadProgress': function (up, file) {
                            // 每个文件上传时，处理相关的事情
                        },
                        'FileUploaded': function (up, file, info) {
                            //上传完成后
                            uploadOver('materialCover', JSON.parse(info));
                        },
                        'Error': function (up, err, errTip) {
                            //上传出错时，处理相关的事情
                        },
                        'UploadComplete': function () {
                            //队列文件处理完毕后，处理相关的事情
                        },
                        'Key': function (up, file) {
                            // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                            // 该配置必须要在unique_names: false，save_key: false时才生效
                            var key = "";
                            // do something with key here
                            return key
                        }
                    }
                });
});

//提交form
var createCurtain = function () {
    //如果必填选项没有填，不提交
    if ($(":submit .btn .btn-danger").hasClass("disabled")) {
        return;
    }
    //获取主信息
    var curtain = {};
    curtain.curtainNo = $("#curtainNo").val();
    curtain.curtainName = $("#curtainName").val();
    curtain.curtainDesign = $("#curtainDesign").val();
    curtain.curtainDetail = $("#curtainDetail").val();
    curtain.curtainRecommend = $("#curtainRecommend").val();
    curtain.curtainThickness = $("#curtainThickness").val();
    curtain.curtainVertical = $("#curtainVertical").val();
    curtain.curtainHandfeel = $("#curtainHandfeel").val();
    curtain.curtainCover = $("#curtainCover").val();
    curtain.curtainPrice = $("#curtainPrice").val();
    var imgs = [];
    var designCover = $("#designCover").val();
    var designDesc = $("#designDesc").val();
    var materialCover = $("#materialCover").val();
    var materialDesc = $("#materialDesc").val();
    imgs[0] = {"img": designCover, "imgsDescribe": designDesc};
    imgs[1] = {"img": materialCover, "imgsDescribe": materialDesc};
    curtain.images = imgs;
    curtain = JSON.stringify(curtain);
    console.log(curtain);
    $.ajax({
               url: "/manager/add",
               type: "post",
               dataType: "json",
               data: curtain,
               success: function (data) {
                   if (data.success) {
                       window.location.href = "/manager/list";
                   } else {
                       alert(data.message);
                   }
               },
               contentType: "application/json",
               cache: false
           });
};