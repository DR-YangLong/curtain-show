package com.yanglong.curtain.util.qiniu;

import com.qiniu.util.Auth;
import com.qiniu.util.StringUtils;

/**
 * 七牛云存储配置对象
 */
public class QiniuConfig {
    //单例配置对象
    private static Auth auth = null;
    //默认accesskey
    private static final String DEFAULT_ACCESSKEY = "6H4JXzaH9UFm65yjqcNSqgdEhcPNzdtVx8lJRfGy";
    //默认secretkey
    private static final String DEFAULT_SECRETKEY = "4Ua5Rc1jcWFimQfdFtLrx4PqS0IzGJ0QCP0fITgt";
    //token
    private String accessKey = DEFAULT_ACCESSKEY;
    //密钥
    private String secretKey = DEFAULT_SECRETKEY;

    public QiniuConfig() {
        this(DEFAULT_ACCESSKEY, DEFAULT_SECRETKEY);
    }

    public QiniuConfig(String accessKey, String secretKey) {
        this.accessKey = StringUtils.isNullOrEmpty(accessKey) ? DEFAULT_ACCESSKEY : accessKey;
        this.secretKey = StringUtils.isNullOrEmpty(secretKey) ? DEFAULT_ACCESSKEY : secretKey;
        auth = getAuthInstance();
    }

    /**
     * 获取密钥配置
     *
     * @return Auth
     */
    Auth getAuthInstance() {
        if (StringUtils.isNullOrEmpty(this.accessKey))
            this.accessKey = DEFAULT_ACCESSKEY;
        if (StringUtils.isNullOrEmpty(this.secretKey))
            this.secretKey = DEFAULT_SECRETKEY;
        if (auth == null) auth = Auth.create(this.accessKey, this.secretKey);
        return auth;
    }


    public String getAccessKey() {
        return accessKey;
    }

    public void setAccessKey(String accessKey) {
        this.accessKey = accessKey;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }
}
