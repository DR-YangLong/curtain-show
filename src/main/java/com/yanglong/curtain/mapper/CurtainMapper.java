package com.yanglong.curtain.mapper;

import com.yanglong.curtain.config.mybatis.MyBatisRepository;
import com.yanglong.curtain.model.Curtain;

import org.apache.ibatis.annotations.Param;

import java.util.List;

@MyBatisRepository
public interface CurtainMapper {
    int deleteByPrimaryKey(Long curtainId);

    int insert(Curtain record);

    int insertSelective(Curtain record);

    Curtain selectByPrimaryKey(Long curtainId);

    int updateByPrimaryKeySelective(Curtain record);

    int updateByPrimaryKey(Curtain record);

    /**
     * 查询详情，包含图片
     * @param curtainId id
     * @return Curtain
     */
    Curtain selectDetailById(Long curtainId);

    /**
     * 查询数量
     * @param record 条件对象
     * @return int
     */
    int selectCount(Curtain record);

    /**
     * 分页查询
     * @param record 条件对象
     * @return list
     */
    List<Curtain> selectCurtains(@Param("curtain") Curtain record, @Param("startRow") Integer startRow, @Param("pageSize") Integer pageSize);
}