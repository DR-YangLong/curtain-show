package com.yanglong.curtain.domain;

import java.io.Serializable;

/**
 * functional describe:状态说明
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-14
 */
public enum StateMark implements Serializable{
    ZERO("0","厚重","较好","细滑","挂钩","正常"),ONE("1","适中","适中","柔软","打孔","已删除"),
    TWO("2","较薄","轻飘","适中","韩式S钩","异常标识"),THREE("3","轻薄","无描述","厚实","其他","异常标识"),
    DEFAULT("无描述描述","无描述","无描述","无描述","无描述","异常标识");
    private String index;
    private String thickness;
    private String vertical;
    private String handFeel;
    private String suspend;
    private String status;


    /**
     * 下表字符串获取enum
     * @param index "0","1","2","3"
     * @return StateMark
     */
    public static StateMark getStateMark(String index){
        switch (index){
            case "0":return ZERO;
            case "1":return ONE;
            case "2":return TWO;
            case "3":return THREE;
            default:
                return DEFAULT;
        }
    }
    StateMark(String index, String thickness, String vertical, String handFeel, String suspend, String status) {
        this.index = index;
        this.thickness = thickness;
        this.vertical = vertical;
        this.handFeel = handFeel;
        this.suspend = suspend;
        this.status = status;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }

    public String getThickness() {
        return thickness;
    }

    public void setThickness(String thickness) {
        this.thickness = thickness;
    }

    public String getVertical() {
        return vertical;
    }

    public void setVertical(String vertical) {
        this.vertical = vertical;
    }

    public String getHandFeel() {
        return handFeel;
    }

    public void setHandFeel(String handFeel) {
        this.handFeel = handFeel;
    }

    public String getSuspend() {
        return suspend;
    }

    public void setSuspend(String suspend) {
        this.suspend = suspend;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
