package com.yanglong.curtain.config;

import com.yanglong.curtain.util.qiniu.QiniuApi;
import com.yanglong.curtain.util.qiniu.QiniuConfig;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * functional describe:配置单例的七牛API对象
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-23
 */
@Configuration
@EnableConfigurationProperties
@ConfigurationProperties(prefix = "qiniu")
public class QiniuApiConfig {
    private String accessKey;
    private String secretKey;

    @Bean
    public QiniuApi qiniuApi() {
        QiniuConfig config = new QiniuConfig(accessKey, secretKey);
        QiniuApi api = new QiniuApi();
        api.setQiniuConfig(config);
        return api;
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
