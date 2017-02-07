package com.yanglong.curtain.domain;

import java.io.Serializable;
import java.util.List;

/**
 * functional describe:分页对象封装
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-18
 */
public class PageResult<T extends Serializable> extends Result implements Serializable {
    private static final long serialVersionUID = -2421079387655963936L;
    //总页数
    private int totalNum;
    //数据
    private List<T> data;

    public boolean isEmpty(){
        return this.data==null||this.data.isEmpty();
    }

    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
