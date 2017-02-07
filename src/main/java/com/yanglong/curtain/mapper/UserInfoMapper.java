package com.yanglong.curtain.mapper;

import com.yanglong.curtain.config.mybatis.MyBatisRepository;
import com.yanglong.curtain.model.UserInfo;

import org.apache.ibatis.annotations.Param;

@MyBatisRepository
public interface UserInfoMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Long userId);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    UserInfo selectByToken(@Param("userName") String userName, @Param("password") String password);
}