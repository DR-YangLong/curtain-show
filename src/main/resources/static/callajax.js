/**
 *
 * @param url 请求地址
 * @param params 参数
 * @param dataType 返回数据类型
 * @param fnSuccess 成功回调
 * @param fnError 失败回调
 */
function doPost(url, params, dataType, fnSuccess, fnError) {
    $.ajax({
               data: params,
               method: 'post',
               dataType: dataType,
               url: url,
               success: function (data) {
                   fnSuccess(data);
               },
               error: function (XMLHttpRequest, textStatus, errorThrown) {
                   fnError();
               }
               //async: false
           }
    )
}