package com.yanglong.curtain.service;

import com.yanglong.curtain.domain.PageResult;
import com.yanglong.curtain.model.Curtain;
import com.yanglong.curtain.model.CurtainImgs;

import java.util.List;

/**
 * functional describe:主业务service，curtain创建，查询，更新
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-14
 */
public interface CurtainService {

    /**
     * 新增主信息
     *
     * @param curtain curtain对象
     */
    void addCurtain(Curtain curtain);

    /**
     * 新增详情页面介绍图
     *
     * @param imgs 图片
     */
    void addImgs(List<CurtainImgs> imgs);

    /**
     * 新增
     *
     * @param curtain 主体信息
     * @param img     详情页图片
     */
    void addCurtain(Curtain curtain, List<CurtainImgs> img);

    /**
     * 更新主体信息
     *
     * @param curtain curtain对象
     */
    void modifyCurtain(Curtain curtain);

    /**
     * 更新图片对象
     *
     * @param img 图片对象
     */
    void modifyImg(CurtainImgs img);

    /**
     * 查询详情
     *
     * @param id 记录id
     * @return Curtain
     */
    Curtain findById(Long id);

    /**
     * 分页查询
     *
     * @param curtain  条件对象
     * @param startRow 其实记录
     * @param pageSize 分页大小
     * @return Curtain list
     */
    List<Curtain> findByCondition(Curtain curtain, Integer startRow, Integer pageSize);

    /**
     * 查询符合条件的记录总数
     *
     * @param curtain 条件对象
     * @return int
     */
    int findNumByCondition(Curtain curtain);

    /**
     * 分页查询,每页16条
     *
     * @param curtain 条件对象
     * @param page    页码
     * @return PageResult
     */
    PageResult<Curtain> findByPagination(Curtain curtain, Integer page);
}
