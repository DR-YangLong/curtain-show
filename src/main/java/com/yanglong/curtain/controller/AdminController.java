package com.yanglong.curtain.controller;

import com.yanglong.curtain.domain.Constant;
import com.yanglong.curtain.domain.PageResult;
import com.yanglong.curtain.domain.Result;
import com.yanglong.curtain.model.Curtain;
import com.yanglong.curtain.model.CurtainImgs;
import com.yanglong.curtain.model.UserInfo;
import com.yanglong.curtain.service.CurtainService;
import com.yanglong.curtain.service.UserService;
import com.yanglong.curtain.util.qiniu.QiniuApi;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * functional describe:管理后台视图控制器
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-14
 */
@RestController
public class AdminController {
    private static Logger logger = LoggerFactory.getLogger(AdminController.class);
    private static final String BUCKET = "wpimg";
    @Autowired
    private UserService userService;
    @Autowired
    private CurtainService curtainService;
    @Autowired
    private QiniuApi qiniuApi;

    /**
     * 登录
     *
     * @param account  帐号
     * @param password 密码
     * @return 登录页
     */
    @RequestMapping("/login")
    public ModelAndView login(String account, String password, HttpSession session) {
        ModelAndView view = new ModelAndView("admin/login");
        if (getUser(session) != null) {
            view.setViewName("redirect:/manager/list");
        }
        if (!StringUtils.isEmpty(account) && !StringUtils.isEmpty(password)) {
            UserInfo userInfo = userService.findByToken(account.trim(), password.trim());
            if (userInfo != null) {
                session.setAttribute(Constant.USER_SESSION_KEY, userInfo);
                view.setViewName("redirect:/manager/list");
            }
        }
        return view;
    }

    /**
     * 列表页
     */
    @RequestMapping("/manager/list")
    public ModelAndView skuList() {
        ModelAndView view = new ModelAndView("admin/curtainTable");
        PageResult<Curtain> result = curtainService.findByPagination(null, 1);
        view.addObject("curtains", result.getData());
        view.addObject("totalPage", result.getTotalNum());
        return view;
    }


    /**
     * 列表页分页查询
     */
    @RequestMapping("/manager/list/ajax")
    public ModelAndView skuList(Integer page, Curtain curtain) {
        ModelAndView view = new ModelAndView("admin/curtainList");
        PageResult<Curtain> result = curtainService.findByPagination(curtain, page);
        if (result.isSuccess()) {
            view.addObject("curtains", result.getData());
            view.addObject("totalPage", result.getTotalNum());
        }
        return view;
    }


    /**
     * 跳转更新页
     */
    @RequestMapping(value = "/manager/edit", params = {"curtainId"})
    public ModelAndView skuEdit(Long curtainId) {
        ModelAndView view = new ModelAndView("admin/curtainEdit");
        if (curtainId == null || curtainId <= 0) {
            view = this.skuList();
        } else {
            Curtain detail = curtainService.findById(curtainId);
            view.addObject("curtain", detail);
        }
        return view;
    }


    /**
     * 更新主体信息
     *
     * @param curtain 对象
     * @return Result
     */
    @RequestMapping(value = "manager/edit/ajax", params = {"curtainId"})
    public Result modifyCurtain(Curtain curtain) {
        Result result = new Result();
        try {
            curtainService.modifyCurtain(curtain);
            result.setSuccess(true);
        } catch (Exception e) {
            logger.error("更新主题信息出错", e);
        }
        return result;
    }

    /**
     * 更新图片
     *
     * @param img 对象
     * @return Result
     */
    @RequestMapping(value = "manager/img/ajax", params = {"imgId"})
    public Result modifyImg(CurtainImgs img) {
        Result result = new Result();
        try {
            curtainService.modifyImg(img);
            result.setSuccess(true);
        } catch (Exception e) {
            logger.error("更新图片信息出错", e);
        }
        return result;
    }

    /**
     * 跳转新增页
     */
    @RequestMapping("/manager/pub")
    public ModelAndView skuPub() {
        ModelAndView view = new ModelAndView("admin/curtainPub");
        return view;
    }

    /**
     * 新增
     */
    @RequestMapping(value = "manager/add", consumes = {"application/json"})
    public Result addSku(@RequestBody Curtain curtain, HttpServletRequest request) {
        Result result = new Result();
        try {
            curtainService.addCurtain(curtain, curtain.getImages());
            result.setSuccess(true);
        } catch (Exception e) {
            logger.error("新增商品出错！", e);
            result.setMessage("服务器内部错误！");
        }
        return result;
    }

    /**
     * 获取七牛上传token
     */
    @RequestMapping(value = "manager/uptoken")
    public Map<String, String> getUpToken() {
        String token = qiniuApi.getToken(BUCKET);
        Map<String, String> map = new HashMap<>(2);
        map.put("uptoken", token);
        return map;
    }

    /**
     * 获取session中的用户
     *
     * @param session HttpSession
     * @return UserInfo
     */
    private UserInfo getUser(HttpSession session) {
        Object object = session.getAttribute(Constant.USER_SESSION_KEY);
        if (object != null && object instanceof UserInfo) {
            return (UserInfo) object;
        } else {
            return null;
        }
    }
}
