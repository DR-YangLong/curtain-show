package com.yanglong.curtain.model;

import java.io.Serializable;

public class UserInfo implements Serializable {
    private static final long serialVersionUID = 7045717840296825541L;
    private Long userId;

    private String userName;

    private String userPassword;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
}