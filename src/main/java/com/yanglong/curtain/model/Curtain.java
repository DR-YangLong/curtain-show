package com.yanglong.curtain.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Curtain implements Serializable{
    private static final long serialVersionUID = -4095771536366583233L;
    private Long curtainId;

    private String curtainNo;

    private String curtainName;

    private Date curtainDate;

    private String curtainCover;

    private String curtainDetail;

    private String curtainRecommend;

    private String curtainDesign;

    private String curtainPrice;

    private String curtainThickness;

    private String curtainVertical;

    private String curtainHandfeel;

    private String curtainSuspend;

    private String curtainStatus;

    List<CurtainImgs> images;

    public Long getCurtainId() {
        return curtainId;
    }

    public void setCurtainId(Long curtainId) {
        this.curtainId = curtainId;
    }

    public String getCurtainNo() {
        return curtainNo;
    }

    public void setCurtainNo(String curtainNo) {
        this.curtainNo = curtainNo;
    }

    public String getCurtainName() {
        return curtainName;
    }

    public void setCurtainName(String curtainName) {
        this.curtainName = curtainName;
    }

    public Date getCurtainDate() {
        return curtainDate;
    }

    public void setCurtainDate(Date curtainDate) {
        this.curtainDate = curtainDate;
    }

    public String getCurtainCover() {
        return curtainCover;
    }

    public void setCurtainCover(String curtainCover) {
        this.curtainCover = curtainCover;
    }

    public String getCurtainDetail() {
        return curtainDetail;
    }

    public void setCurtainDetail(String curtainDetail) {
        this.curtainDetail = curtainDetail;
    }

    public String getCurtainRecommend() {
        return curtainRecommend;
    }

    public void setCurtainRecommend(String curtainRecommend) {
        this.curtainRecommend = curtainRecommend;
    }

    public String getCurtainDesign() {
        return curtainDesign;
    }

    public void setCurtainDesign(String curtainDesign) {
        this.curtainDesign = curtainDesign;
    }

    public String getCurtainPrice() {
        return curtainPrice;
    }

    public void setCurtainPrice(String curtainPrice) {
        this.curtainPrice = curtainPrice;
    }

    public String getCurtainThickness() {
        return curtainThickness;
    }

    public void setCurtainThickness(String curtainThickness) {
        this.curtainThickness = curtainThickness;
    }

    public String getCurtainVertical() {
        return curtainVertical;
    }

    public void setCurtainVertical(String curtainVertical) {
        this.curtainVertical = curtainVertical;
    }

    public String getCurtainHandfeel() {
        return curtainHandfeel;
    }

    public void setCurtainHandfeel(String curtainHandfeel) {
        this.curtainHandfeel = curtainHandfeel;
    }

    public String getCurtainSuspend() {
        return curtainSuspend;
    }

    public void setCurtainSuspend(String curtainSuspend) {
        this.curtainSuspend = curtainSuspend;
    }

    public String getCurtainStatus() {
        return curtainStatus;
    }

    public void setCurtainStatus(String curtainStatus) {
        this.curtainStatus = curtainStatus;
    }

    public List<CurtainImgs> getImages() {
        return images;
    }

    public void setImages(List<CurtainImgs> images) {
        this.images = images;
    }
}