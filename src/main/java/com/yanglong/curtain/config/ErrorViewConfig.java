package com.yanglong.curtain.config;

import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

/**
 * functional describe:
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-18
 */
@Configuration
@EnableConfigurationProperties
@ConfigurationProperties(prefix = "error-path")
public class ErrorViewConfig {
    private String notFount;
    private String serverError;
    private String unauthorized;
    private String badRequest;

    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer(){
        return new EmbeddedServletContainerCustomizer() {
            @Override
            public void customize(ConfigurableEmbeddedServletContainer container) {
                container.addErrorPages(new ErrorPage(HttpStatus.BAD_REQUEST,badRequest));
                container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR,badRequest));
                container.addErrorPages(new ErrorPage(HttpStatus.UNAUTHORIZED,unauthorized));
                container.addErrorPages(new ErrorPage(HttpStatus.FORBIDDEN,unauthorized));
                container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND,notFount));
            }
        };
    }

    public String getNotFount() {
        return notFount;
    }

    public void setNotFount(String notFount) {
        this.notFount = notFount;
    }

    public String getServerError() {
        return serverError;
    }

    public void setServerError(String serverError) {
        this.serverError = serverError;
    }

    public String getUnauthorized() {
        return unauthorized;
    }

    public void setUnauthorized(String unauthorized) {
        this.unauthorized = unauthorized;
    }

    public String getBadRequest() {
        return badRequest;
    }

    public void setBadRequest(String badRequest) {
        this.badRequest = badRequest;
    }
}
