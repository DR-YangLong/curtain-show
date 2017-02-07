//更新详情
function uploadOver(index, info) {
    if (index >= 0) {
        console.log(index);
        //获取id
        var _id_img = $("#img-bt-" + index).attr("data-id");
        var name = info.key;
        var param = {imgId: _id_img, img: name};
        doPost("/manager/img/ajax", param, "json", function (data) {
            if (data.success) {
                $("#show-img-" + index).attr('src', domain + "/" + name);
            } else {
                alert("更新失败，服务器错误！");
            }
        }, function () {
            alert("上传错误！")
        });
    } else {
        alert('获取不到上传按钮ID！');
    }
}

//更新封面
function updateCover(btId, info) {
    if (btId) {
        var _id_curtain = $("#curtain_data_id").attr("data-id");
        var param = {curtainId: _id_curtain, curtainCover: info.key};
        console.log(param.toString());
        doPost("/manager/edit/ajax", param, "json", function (data) {
            if (data.success) {
                $("#" + btId + "-show").attr('src', domain + "/" + info.key);
            } else {
                alert("更新失败，服务器错误！")
            }
        }, function () {
            alert("上传错误！")
        });

    } else {
        alert('获取不到上传按钮ID！');
    }
}

/**
 * 用this传递过来更新
 * @param _this 触发对象
 * @param type 类型，0更新主体，1更新图片描述
 */
function updateCurtain(_this, type) {
    var value = $(_this).val();
    var old = $(_this).attr("placeholder");
    var _update_flag = false;
    //判断新值和老值
    if (value === old || "" === value) {
        return;
    }
    if (type === 0) {
        var _id_curtain = $("#curtain_data_id").attr("data-id");
        var key = $(_this).attr("id");
        var param = '{"' + key + '":"' + value + '","curtainId":"' + _id_curtain + '"}';
        param = JSON.parse(param);
        doPost("/manager/edit/ajax", param, "json", function (data) {
            if (!data.success) {
                alert("服务器内部错误！");
            } else {
                _update_flag = true;
            }
        }, function () {
            alert("请求错误！");
        });
        return;
    }
    if (type === 1) {
        var _id_img = $(_this).attr("data-id");
        doPost("/manager/img/ajax", {imgId: _id_img, imgsDescribe: value}, "json",
               function (data) {
                   if (!data.success) {
                       alert("服务器内部错误！");
                   } else {
                       _update_flag = true;
                   }
               }, function () {
                alert("请求错误！");
            });
    }
    if (_update_flag) {
        $(_this).attr("placeholder", value);
    }
}

$(function () {
    if ($("#img_size")) {
        var size = $("#img_size").attr("data-size");
        var _i_index = 0;
        for (_i_index; _i_index < size; _i_index++) {
            if (_i_index == 0) {
                Qiniu.uploader({
                                   runtimes: 'html5,flash,html4',      // 上传模式，依次退化
                                   browse_button: 'img-bt-' + 0,         // 上传选择的点选按钮，必需
                                   uptoken_url: token_url,         // Ajax请求uptoken的Url，强烈建议设置（服务端提供）
                                   unique_names: true,              // 默认false，key为文件名。若开启该选项，JS-SDK会为每个文件自动生成key（文件名）
                                   domain: domain,     // bucket域名，下载资源时用到，必需
                                   container: 'container-' + 0,             // 上传区域DOM
                                                                            // ID，默认是browser_button的父元素
                                   max_file_size: '20mb',             // 最大文件体积限制
                                   flash_swf_url: swf_url,  //引入flash，相对路径
                                   max_retries: 3,                     // 上传失败最大重试次数
                                   dragdrop: false,                     // 开启可拖曳上传
                                   //drop_element: 'container',          //
                                   // 拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
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
                                           uploadOver(0, JSON.parse(info));
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
            }
            if (_i_index == 1) {
                new QiniuJsSDK().uploader({
                                              runtimes: 'html5,flash,html4',      // 上传模式，依次退化
                                              browse_button: 'img-bt-' + 1,         // 上传选择的点选按钮，必需
                                              uptoken_url: token_url,         // Ajax请求uptoken的Url，强烈建议设置（服务端提供）
                                              unique_names: true,              // 默认false，key为文件名。若开启该选项，JS-SDK会为每个文件自动生成key（文件名）
                                              domain: domain,     // bucket域名，下载资源时用到，必需
                                              container: 'container-' + 1,             // 上传区域DOM
                                                                                       // ID，默认是browser_button的父元素
                                              max_file_size: '20mb',             // 最大文件体积限制
                                              flash_swf_url: swf_url,  //引入flash，相对路径
                                              max_retries: 3,                     // 上传失败最大重试次数
                                              dragdrop: false,                     // 开启可拖曳上传
                                              //drop_element: 'container',          //
                                              // 拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
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
                                                      uploadOver(1, JSON.parse(info));
                                                  },
                                                  'Error': function (up, err, errTip) {
                                                      //上传出错时，处理相关的事情
                                                  },
                                                  'UploadComplete': function () {
                                                      //队列文件处理完毕后，处理相关的事情
                                                  },
                                                  'Key': function (up, file) {
                                                      // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                                                      // 该配置必须要在unique_names: false，save_key:
                                                      // false时才生效
                                                      var key = "";
                                                      // do something with key here
                                                      return key
                                                  }
                                              }
                                          })
            }
        }
    }

    new QiniuJsSDK().uploader({
                                  runtimes: 'html5,flash,html4',      // 上传模式，依次退化
                                  browse_button: 'curtainCover-bt',         // 上传选择的点选按钮，必需
                                  uptoken_url: token_url,         // Ajax请求uptoken的Url，强烈建议设置（服务端提供）
                                  unique_names: true,              // 默认false，key为文件名。若开启该选项，JS-SDK会为每个文件自动生成key（文件名）
                                  domain: domain,     // bucket域名，下载资源时用到，必需
                                  container: 'curtainCover-co',             // 上传区域DOM
                                                                            // ID，默认是browser_button的父元素
                                  max_file_size: '20mb',             // 最大文件体积限制
                                  flash_swf_url: swf_url,  //引入flash，相对路径
                                  max_retries: 3,                     // 上传失败最大重试次数
                                  dragdrop: false,                     // 开启可拖曳上传
                                  //drop_element: 'container',          //
                                  // 拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
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
                                          updateCover('curtainCover', JSON.parse(info));
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