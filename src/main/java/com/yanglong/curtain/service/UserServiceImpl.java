package com.yanglong.curtain.service;

import com.yanglong.curtain.domain.Constant;
import com.yanglong.curtain.mapper.UserInfoMapper;
import com.yanglong.curtain.model.UserInfo;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * functional describe:用户服务实现
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-14
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserInfoMapper userInfoMapper;

    @Override
    @Cacheable(cacheNames = "userSessionCache")
    public UserInfo findByToken(final String account,final String password) {
        String realPwd=DigestUtils.md5Hex(password+ Constant.PASSWORD_SALT);
        UserInfo userInfo=userInfoMapper.selectByToken(account,realPwd);
        return userInfo;
    }
}
