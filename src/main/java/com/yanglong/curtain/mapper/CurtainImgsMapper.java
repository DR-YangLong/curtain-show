package com.yanglong.curtain.mapper;

import com.yanglong.curtain.config.mybatis.MyBatisRepository;
import com.yanglong.curtain.model.CurtainImgs;

import org.apache.ibatis.annotations.Param;

import java.util.List;

@MyBatisRepository
public interface CurtainImgsMapper {
    int deleteByPrimaryKey(Long imgId);

    int insert(CurtainImgs record);

    int insertSelective(CurtainImgs record);

    CurtainImgs selectByPrimaryKey(Long imgId);

    int updateByPrimaryKeySelective(CurtainImgs record);

    int updateByPrimaryKey(CurtainImgs record);

    int insertBatch(@Param("imgs") List<CurtainImgs> imgs);
}