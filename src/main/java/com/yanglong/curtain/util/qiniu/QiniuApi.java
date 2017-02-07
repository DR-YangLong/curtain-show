package com.yanglong.curtain.util.qiniu;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.processing.OperationManager;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.util.StringMap;
import com.yanglong.curtain.domain.Result;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;

/**
 * functional describe:七牛API简单封装。<br/>
 * 七牛文件系统是一个key-value文件系统，sdk中的key指的是空间内文件的文件名，需要唯一。<br/>
 * 如果需要目录，用"/"分割如："static/img/a.jpg"，但是七牛不会生成目录，会将整个key字符串作为文件名存储。<br/>
 * 注意如果空间名称和文件名称是非英文的，都需要经过URL编码。可以调用{@link com.qiniu.util.UrlSafeBase64#encodeToString(String)}
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-5-25
 * @see <a href="http://developer.qiniu.com/code/v7/sdk/java.html">SDK</a>
 * @see <a href='http://developer.qiniu.com/article/developer/security/put-policy.html'>策略</a>
 * @see <a href="http://developer.qiniu.com/code/v6/api/dora-api/pfop/pfop.html">持久化操作说明</a>
 */
public class QiniuApi {
    //日志组件
    private static Logger logger = LoggerFactory.getLogger(QiniuApi.class);
    //配置项
    private QiniuConfig qiniuConfig;
    //上传管理器
    private static final UploadManager uploadManager = new UploadManager();
    //空间管理器
    private static BucketManager bucketManager;
    //持久化操作管理器
    private static OperationManager operationManager;

    /**
     * 使用默认策略进行文件上传
     *
     * @param spaceName  七牛空间名称,对应bucket
     * @param filePath   本地文件绝对路径
     * @param remoteName 上传后文件在七牛空间的名称,对应SDK key,可以使用"/"来指定概念上的目录 (及文件名,如:static/user_header/68f03b0f00894c239457f642c868cd3f.jpeg)
     * @return status
     */
    public Result upload(String spaceName, String filePath, String remoteName) {
        Result result = new Result();
        String token = this.getToken(spaceName);
        Response response = null;
        try {
            response = uploadManager.put(filePath, remoteName, token);
        } catch (QiniuException e) {
            logger.error("简单上传出错", e);
            response = e.response;
        }
        wrapperResult(response, result);
        return result;
    }

    /**
     * 自定义策略上传,如果使用回调，remoteName设置为null，
     * 七牛将回调服务器url接口，并将文件名和文件大小回传给服务器
     *
     * @param spaceName  七牛空间名称,对应bucket
     * @param filePath   本地文件绝对路径
     * @param remoteName 上传后文件在七牛空间的名称,对应SDK key，可以使用"/"来指定概念上的目录
     * @param policy     策略map
     * @param strict     是否去除非限定的策略字段，默认true
     * @return status
     */
    public Result upload(String spaceName, String filePath, String remoteName, StringMap policy, boolean strict) {
        Result result = new Result();
        String token = this.getToken(spaceName, remoteName, 3600, policy, strict);
        Response response = null;
        try {
            response = uploadManager.put(filePath, remoteName, token);
        } catch (QiniuException e) {
            logger.error("自定义策略上传出错！", e);
            response = e.response;
        }
        wrapperResult(response, result);
        return result;
    }

    /**
     * 上传图片文件到七牛
     * @param spaceName  七牛空间名称,对应bucket
     * @param file       图片文件
     * @param remoteName 上传后文件在七牛空间的名称,对应SDK key，可以使用"/"来指定概念上的目录
     * @param policy     策略map
     * @param strict     是否去除非限定的策略字段，默认true
     * @return status
     */
    public Result upload(String spaceName, File file, String remoteName, StringMap policy, boolean strict) {
        Result result = new Result();
        String token = this.getToken(spaceName, remoteName, 3600, policy, strict);
        Response response = null;
        try {
            response = uploadManager.put(file, remoteName, token);
        } catch (QiniuException e) {
            logger.error("自定义策略上传出错！", e);
            response = e.response;
        }
        wrapperResult(response, result);
        return result;
    }


    /**
     * 获取文件的下载地址
     *
     * @param domain   空间绑定域名
     * @param fileName 空间中文件的名称
     * @return 下载链接
     */
    public String download(final String domain, final String fileName) {
        String url = domain.endsWith("/") ? domain + fileName : domain + "/" + fileName;
        return qiniuConfig.getAuthInstance().privateDownloadUrl(url);
    }


    /**
     * 获取空间中的文件信息
     *
     * @param spaceName 空间名
     * @param fileName  空间中文件名
     * @return fileInfo
     */
    public FileInfo getFileInfo(final String spaceName, final String fileName) {
        FileInfo fileInfo = null;
        try {
            fileInfo = getBucketManager().stat(spaceName, fileName);
        } catch (QiniuException e) {
            Response response = e.response;
            logger.error("获取文件信息出错！\n" + response.toString());
        }
        return fileInfo;
    }

    /**
     * 在2个空间之间移动单个文件，如果<code>spaceName</code>==<code>toSpaceName</code>,相当于重命名
     *
     * @param spaceName   原空间名称
     * @param fileName    原文件名
     * @param toSpaceName 目标空间名
     * @param toFileName  目标文件名
     */
    public boolean moveFile(final String spaceName, final String fileName, final String toSpaceName, final String toFileName) {
        try {
            getBucketManager().move(spaceName, fileName, toSpaceName, toFileName);
            return true;
        } catch (QiniuException e) {
            logger.error("移动文件出错！" + spaceName + "：" + fileName + "==>" + toSpaceName + ":" + toFileName + "\n" + e.response.toString());
        }
        return false;
    }

    /**
     * 复制单个文件，在不同的空间之间复制
     *
     * @param spaceName   原空间名称
     * @param fileName    原文件名
     * @param toSpaceName 目标空间名
     * @param toFileName  目标文件名
     */
    public boolean copyFile(final String spaceName, final String fileName, final String toSpaceName, final String toFileName) {
        try {
            getBucketManager().copy(spaceName, fileName, toSpaceName, toFileName);
            return true;
        } catch (QiniuException e) {
            logger.error("复制文件出错！" + spaceName + "：" + fileName + "==>" + toSpaceName + ":" + toFileName + "\n" + e.response.toString());
        }
        return false;
    }


    /**
     * 删除单个文件
     *
     * @param spaceName 空间名称
     * @param fileName  文件名
     */
    public boolean deleteFile(final String spaceName, final String fileName) {
        try {
            getBucketManager().delete(spaceName, fileName);
            return true;
        } catch (QiniuException e) {
            logger.error("删除文件出错！" + spaceName + "：" + fileName + "\n" + e.response.toString());
        }
        return false;
    }

    /**
     * 对空间文件进行操作，转码等
     *
     * @param spaceName 空间名
     * @param fileName  文件名
     * @param pfops     指令列表，需要使用UrlSafeBase64.encodeToString(param)进行编码
     * @param params    参数列表
     * @return 操作id，可用于查询操作是否完成，如果失败，返回null
     * @see <a href="http://developer.qiniu.com/code/v6/api/dora-api/pfop/pfop.html">pfop说明</a>
     */
    public String operateFile(String spaceName, String fileName, String pfops, StringMap params) {
        String persitentId = null;
        try {
            persitentId = getOperationManager().pfop(spaceName, fileName, pfops, params);
        } catch (QiniuException e) {
            logger.error("添加云文件处理操作失败！\n" + e.response.toString());
        }
        return persitentId;
    }


    /**
     * 获取空间管理对象
     *
     * @return BucketManager
     */
    private BucketManager getBucketManager() {
        if (bucketManager == null) {
            bucketManager = new BucketManager(qiniuConfig.getAuthInstance());
        }
        return bucketManager;
    }

    /**
     * 获取持久化管理器对象
     *
     * @return OperationManager
     */
    private OperationManager getOperationManager() {
        if (operationManager == null) {
            operationManager = new OperationManager(qiniuConfig.getAuthInstance());
        }
        return operationManager;
    }

    private void wrapperResult(final Response response, final Result result) {
        if (result == null) return;
        if (response.isOK()) {//成功
            result.setSuccess(true);
        } else {//失败
            result.setMessage(response.toString());
        }
    }

    public void setQiniuConfig(QiniuConfig qiniuConfig) {
        this.qiniuConfig = qiniuConfig;
    }

    /**
     * 获取七牛上传图片时需要的token值
     * @param bucket 七牛空间名称
     * @return
     */
    public String getToken(String bucket) {
        return this.getToken(bucket, null, 300, null, true);
    }

    /**
     * 获取七牛上传图片时需要的token值
     * @param bucket 七牛空间名称
     * @param key 原文件名
     * @return
     */
    public String getToken(String bucket, String key) {
        return this.getToken(bucket, key, 300, null, true);
    }

    /**
     * 获取七牛上传图片时需要的token值
     * @param bucket 七牛空间名称
     * @param key 原文件名
     * @param expires token值保存的时间戳
     * @param policy 策略map
     * @return
     */
    public String getToken(String bucket, String key, long expires, StringMap policy) {
        return this.getToken(bucket, key, expires, policy, true);
    }

    /**
     * 获取七牛上传图片时需要的token值
     * @param bucket 七牛空间名称
     * @param key 原文件名
     * @param expires token值保存的时间戳
     * @param policy 策略map
     * @param strict 是否去除非限定的策略字段，默认true
     * @return
     */
    public String getToken(String bucket, String key, long expires, StringMap policy, boolean strict) {
        return qiniuConfig.getAuthInstance().uploadToken(bucket, key, expires, policy, strict);
    }


}