package com.yanglong.curtain.config;

import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * functional describe:跨域设置，可以使用{@link org.springframework.web.bind.annotation.CrossOrigin}
 * 在controller上注解
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-10-20
 */
@WebFilter(filterName = "cors",urlPatterns = "/*")
public class CorsFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
        httpServletResponse.addHeader("Access-Control-Allow-Origin", "*");
        httpServletResponse.addHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
        httpServletResponse.addHeader("Access-Control-Allow-Headers", "Content-Type");
        httpServletResponse.addHeader("Access-Control-Max-Age", "3600");//60 min
        filterChain.doFilter(httpServletRequest,httpServletResponse);
    }
}
