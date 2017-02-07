package com.yanglong.curtain.config.datasource;


import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

import com.alibaba.druid.support.http.StatViewServlet;

/**
 * functional describe:druid监控servlet配置
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-10-14
 */
@WebServlet(urlPatterns = "/druid/*",
        initParams = {
                @WebInitParam(name = "allow", value = ""),// IP白名单(没有配置或者为空，则允许所有访问)
                //@WebInitParam(name = "allow", value = "127.0.0.1,192.168.163.1"),// IP白名单(没有配置或者为空，则允许所有访问)
                @WebInitParam(name = "deny", value = "192.168.1.73"),// IP黑名单 (存在共同时，deny优先于allow)
                @WebInitParam(name = "loginUsername", value = "yanglong"),// 用户名
                @WebInitParam(name = "loginPassword", value = "13626878988"),// 密码
                @WebInitParam(name = "resetEnable", value = "false")// 禁用HTML页面上的“Reset All”功能
        })
public class DruidStatServlet extends StatViewServlet {
}
