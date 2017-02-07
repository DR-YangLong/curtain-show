package com.yanglong.curtain.controller;

import com.yanglong.curtain.domain.PageResult;
import com.yanglong.curtain.model.Curtain;
import com.yanglong.curtain.service.CurtainService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * functional describe:前台展示控制器
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-14
 */
@Controller
public class FrontController {
    //分页时服务端页码在session中的key
    private static final String PAGE_IN_SESSION_KEY = "page_num";
    @Autowired
    private CurtainService curtainService;

    /**
     * 首页
     */
    @RequestMapping(value = {"/index", "/"})
    public ModelAndView index(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("app/index");
        PageResult<Curtain> result = curtainService.findByPagination(null, 1);
        if (result.isSuccess() && !result.isEmpty()) {
            modelAndView.addObject("list", result.getData());
        }
        //刷新重置页码
        session.setAttribute(PAGE_IN_SESSION_KEY, 1);
        return modelAndView;
    }

    /**
     * 首页分页
     */
    @RequestMapping("index/ajax")
    @ResponseBody
    public ModelAndView indexPagination(HttpSession session) {
        ModelAndView mv = new ModelAndView("app/ajax");
        //当前前端页码
        Integer pageNum = 1;
        Object page = session.getAttribute(PAGE_IN_SESSION_KEY);
        if (page != null && (page instanceof Integer)) {
            pageNum = (Integer) page;
        }
        //这次要查询的页码
        pageNum++;
        PageResult<Curtain> result = curtainService.findByPagination(null, pageNum);
        if (result.isSuccess() && !result.isEmpty()) {
            mv.addObject("pageId", pageNum);
            mv.addObject("list", result.getData());
            session.setAttribute(PAGE_IN_SESSION_KEY, pageNum);
        } else {
            //使用-1表示已经没有数据
            mv.addObject("pageId", -1);
        }
        return mv;
    }

    /**
     * 详情页
     */
    @RequestMapping(value = "detail", params = "id")
    public ModelAndView detail(Long id,HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("app/detail");
        modelAndView=this.findCurtain(modelAndView,id,session);
        return modelAndView;
    }

    @RequestMapping(value = "previous", params = "id")
    public ModelAndView previous(Long id,HttpSession session){
        ModelAndView modelAndView = new ModelAndView("app/detail");
        modelAndView=this.findCurtain(modelAndView,--id,session);
        return modelAndView;
    }

    @RequestMapping(value = "next", params = "id")
    public ModelAndView next(Long id,HttpSession session){
        ModelAndView modelAndView = new ModelAndView("app/detail");
        modelAndView=this.findCurtain(modelAndView,++id,session);
        return modelAndView;
    }

    //统一处理详情查询
    private ModelAndView findCurtain(ModelAndView mv,Long id,HttpSession session){
        Curtain curtain = curtainService.findById(id);
        if(curtain==null){
            mv=this.index(session);
            mv.addObject("modal","1");
        }else{
            mv.addObject("curtain", curtain);
        }
        return mv;
    }
}
