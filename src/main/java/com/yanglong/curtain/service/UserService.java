package com.yanglong.curtain.service;

import com.yanglong.curtain.model.UserInfo;

/**
 * functional describe:用户查询
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-14
 */
public interface UserService {
    /**
     * 帐号密码登录
     * @param account 帐号
     * @param password 密码
     * @return 用户对象
     */
    UserInfo findByToken(String account, String password);
}
