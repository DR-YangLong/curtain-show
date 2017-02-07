package com.yanglong.curtain.service;

import com.yanglong.curtain.domain.PageHelper;
import com.yanglong.curtain.domain.PageResult;
import com.yanglong.curtain.mapper.CurtainImgsMapper;
import com.yanglong.curtain.mapper.CurtainMapper;
import com.yanglong.curtain.model.Curtain;
import com.yanglong.curtain.model.CurtainImgs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * functional describe:
 *
 * @author DR.YangLong [410357434@163.com]
 * @version 1.0    16-9-14
 */
@Service
public class CurtainServiceImpl implements CurtainService {
    @Autowired
    private CurtainMapper curtainMapper;
    @Autowired
    private CurtainImgsMapper imgsMapper;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void addCurtain(Curtain curtain) {
        curtainMapper.insertSelective(curtain);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void addImgs(List<CurtainImgs> imgs) {
        imgsMapper.insertBatch(imgs);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    @CacheEvict(cacheNames = "listCache",allEntries = true)
    public void addCurtain(Curtain curtain, List<CurtainImgs> img) {
        curtain.setCurtainDate(new Date());
        this.addCurtain(curtain);
        Long id = curtain.getCurtainId();
        if (id != null&& !img.isEmpty()) {
            for (CurtainImgs image : img) {
                image.setCurtainId(id);
            }
            this.addImgs(img);
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    @CacheEvict(cacheNames = "detailCache",key = "'curtain_'+#curtain.curtainId")
    public void modifyCurtain(Curtain curtain) {
        curtainMapper.updateByPrimaryKeySelective(curtain);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    @CacheEvict(cacheNames = "detailCache",key = "'img_'+#img.imgId")
    public void modifyImg(CurtainImgs img) {
        imgsMapper.updateByPrimaryKeySelective(img);
    }

    @Override
    @Cacheable(cacheNames = "detailCache",key = "'curtain_'+#id")
    public Curtain findById(Long id) {
        Curtain curtain = curtainMapper.selectDetailById(id);
        return curtain;
    }

    @Override
    @Cacheable(cacheNames = "listCache")
    public List<Curtain> findByCondition(Curtain curtain, Integer startRow, Integer pageSize) {
        List<Curtain> list = curtainMapper.selectCurtains(curtain, startRow, pageSize);
        return list;
    }

    @Override
    @Cacheable(cacheNames = "listCache")
    public int findNumByCondition(Curtain curtain) {
        int num = curtainMapper.selectCount(curtain);
        return num;
    }

    @Override
    @Cacheable(cacheNames = "listCache")
    public PageResult<Curtain> findByPagination(Curtain curtain, Integer page) {
        PageResult<Curtain> result = new PageResult<>();
        if (page != null && page > 0) {
            int num = this.findNumByCondition(curtain);
            if (num > 0) {
                PageHelper helper = new PageHelper(num, 16);
                if(page<=helper.getPageCount()) {
                    helper.setCurrentPage(page);
                    List<Curtain> list = this.findByCondition(curtain, helper.getStartRow(), helper.getPageSize());
                    result.setData(list);
                    result.setTotalNum(helper.getPageCount());
                    result.setSuccess(true);
                }
            }
        }
        return result;
    }
}
