package com.yanglong.curtain.model;

import java.io.Serializable;

public class CurtainImgs implements Serializable{
    private static final long serialVersionUID = -1861194682793744161L;
    private Long imgId;

    private Long curtainId;

    private String imgsDescribe;

    private String imgStatus;

    private String img;

    public Long getImgId() {
        return imgId;
    }

    public void setImgId(Long imgId) {
        this.imgId = imgId;
    }

    public Long getCurtainId() {
        return curtainId;
    }

    public void setCurtainId(Long curtainId) {
        this.curtainId = curtainId;
    }

    public String getImgsDescribe() {
        return imgsDescribe;
    }

    public void setImgsDescribe(String imgsDescribe) {
        this.imgsDescribe = imgsDescribe;
    }

    public String getImgStatus() {
        return imgStatus;
    }

    public void setImgStatus(String imgStatus) {
        this.imgStatus = imgStatus;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}