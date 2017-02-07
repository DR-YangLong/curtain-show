package com.yanglong.curtain.util;

import com.yanglong.curtain.domain.StateMark;

import org.springframework.util.StringUtils;

/**
 * functional describe:ftl静态代码调用
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-14
 */
public class FreemarkerStaticTools {
    //七牛域名
    private static final String QINIU_DOMAIN="http://wpimg.qiniudn.com";
    //七牛等比缩放API地址，IMG_NAME替换为图片名称，WIDTH替换为缩放的宽，HEIGHT替换为缩放的高
    private static final String QINIU_URL = QINIU_DOMAIN+"/IMG_NAME?imageView2/1/w/WIDTH/h/HEIGHT";

    /**
     * 获取厚度对应的描述
     *
     * @param index 下标
     * @param type  类型:1厚度，2垂感，3手感，4悬挂方式，5状态
     * @return String
     */
    public static String getStateMark(String index, String type) {
        String desc = "无描述";
        switch (type) {
            case "1":
                desc = StateMark.getStateMark(index).getThickness();
                break;
            case "2":
                desc = StateMark.getStateMark(index).getVertical();
                break;
            case "3":
                desc = StateMark.getStateMark(index).getHandFeel();
                break;
            case "4":
                desc = StateMark.getStateMark(index).getSuspend();
                break;
            case "5":
                desc = StateMark.getStateMark(index).getStatus();
                break;
        }
        return desc;
    }

    /**
     * 获取首页的图片访问地址
     * @param img 图片名称
     * @return 图片地址
     */
    public static String getIndexImg(final String img) {
        String path = QINIU_DOMAIN+"/static/app/images/pic_1.jpg";
        if (!StringUtils.isEmpty(img)) {
            path = QINIU_URL.replace("IMG_NAME", img).replace("WIDTH", "700").replace("HEIGHT", "974");
        }
        return path;
    }

    /**
     * 获取详情页面封面图片
     * @param img 图片名称
     * @return 图片地址
     */
    public static String getDetailCover(final String img){
        String path = QINIU_DOMAIN+"/static/app/images/single_1.jpg";
        if (!StringUtils.isEmpty(img)) {
            path = QINIU_URL.replace("IMG_NAME", img).replace("WIDTH", "1400").replace("HEIGHT", "940");
        }
        return path;
    }

    /**
     * 获取静态资源前缀
     * @return
     */
    public static String getResourcePath(){
        return QINIU_DOMAIN+"/static";
    }
}
