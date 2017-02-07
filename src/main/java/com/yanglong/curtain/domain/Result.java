package com.yanglong.curtain.domain;

import java.io.Serializable;

/**
 * functional describe:返回对象
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-20
 */
public class Result implements Serializable {
    private static final long serialVersionUID = 8367702839819660519L;
    //回复信息
    private String message;
    //是否成功
    private boolean success;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }
}
