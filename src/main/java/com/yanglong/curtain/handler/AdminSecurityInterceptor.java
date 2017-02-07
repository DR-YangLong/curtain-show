package com.yanglong.curtain.handler;

import com.yanglong.curtain.domain.Constant;
import com.yanglong.curtain.model.UserInfo;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * functional describe:权限验证器，简单的从session中获取用户信息，如果有则成功，如果没有则失败
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-14
 */
public class AdminSecurityInterceptor implements HandlerInterceptor {

    /**
     * 请求处理之前调用
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object obj= request.getSession().getAttribute(Constant.USER_SESSION_KEY);
        if(obj!=null&& obj instanceof UserInfo){
            return true;
        }else {
            response.sendRedirect("/login");
        }
        return false;
    }

    /**
     * controller方法执行之后，视图渲染之前执行 需要preHandle返回true
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    /**
     * 渲染视图完成之后执行 需要preHandle返回true
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
