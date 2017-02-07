package com.yanglong.curtain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * functional describe:see properties error-page
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-18
 */
@Controller
public class ErrorController {

    @RequestMapping("400")
    public ModelAndView badRequest() {
        ModelAndView mv=new ModelAndView("error");
        return mv;
    }

    @RequestMapping("404")
    public ModelAndView notFound() {
        ModelAndView mv=new ModelAndView("error");
        return mv;
    }

    @RequestMapping("500")
    public ModelAndView serverError() {
        ModelAndView mv=new ModelAndView("error");
        return mv;
    }

    @RequestMapping("401")
    public ModelAndView unauthorized() {
        ModelAndView mv=new ModelAndView("error");
        return mv;
    }

}
