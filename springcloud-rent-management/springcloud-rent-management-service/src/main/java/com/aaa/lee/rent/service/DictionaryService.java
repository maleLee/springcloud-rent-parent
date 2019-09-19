package com.aaa.lee.rent.service;

import com.aaa.lee.rent.base.BaseService;
import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.mapper.DictionaryMapper;
import com.aaa.lee.rent.model.Dictionary;
import com.aaa.lee.rent.page.PageInfos;
import com.aaa.lee.rent.status.StatusEnum;
import com.aaa.lee.rent.utils.DateUtil;
import com.aaa.lee.rent.utils.IDUtil;
import com.aaa.lee.rent.utils.JSONUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/7 11:00
 * @Description
 **/
@Service
public class DictionaryService extends BaseService<Dictionary> {

    @Autowired
    private DictionaryMapper dictionaryMapper;

    @Override
    public Mapper<Dictionary> getMapper() {
        return dictionaryMapper;
    }

    /**
     * @author Seven Lee
     * @description
     *      查询所有的字典数据
     * @param []
     *      redundant:
     *          1:正常 2:删除
     * @date 2019/9/7
     * @return com.aaa.lee.rent.base.ResultData<com.aaa.lee.rent.model.Dictionary>
     * @throws 
    **/
    public ResultData selectAllDictionary(PageInfos<Dictionary> pageInfos) {
        Dictionary dictionary = new Dictionary();
        dictionary.setRedundant(StatusEnum.DICTIONARY_NORMAL.getCode());
        pageInfos.setData(dictionary);
        ResultData<PageInfo<Dictionary>> resultData = new ResultData<PageInfo<Dictionary>>();
        PageInfo<Dictionary> dictionaryPageInfo = selectPageInfo(pageInfos);
        if(dictionaryPageInfo.getList().size() > 0) {
            resultData.setCode(StatusEnum.SUCCESS.getCode());
            resultData.setMsg(StatusEnum.SUCCESS.getMsg());
            resultData.setData(dictionaryPageInfo);
        } else {
            resultData.setCode(StatusEnum.FAILED.getCode());
            resultData.setMsg(StatusEnum.FAILED.getMsg());
        }
        return resultData;
    }

    /**
     * @author Seven Lee
     * @description
     *      添加字典数据
     * @param [dictionary]
     * @date 2019/9/9
     * @return com.aaa.lee.rent.base.ResultData
     * @throws 
    **/
    public ResultData insertDictionary(Dictionary dictionary) {
        // 直接调用父类的save方法
        ResultData resultData = new ResultData();
        try {
            if(dictionary != null) {
                dictionary.setId(IDUtil.getUUID());
                String stringDate = DateUtil.formatDate(new Date(), "yyyy-MM-dd hh:mm:ss");
                dictionary.setCreateTime(stringDate);
                dictionary.setUpdateTime(stringDate);
            }
            Integer saveResult = save(dictionary);
            if(saveResult > 0) {
                // 说明保存成功
                resultData.setCode(StatusEnum.SUCCESS.getCode());
                resultData.setMsg(StatusEnum.SUCCESS.getMsg());
            } else {
                resultData.setCode(StatusEnum.FAILED.getCode());
                resultData.setMsg(StatusEnum.FAILED.getMsg());
            }
        } catch (Exception e) {
            resultData.setCode(StatusEnum.FAILED.getCode());
            resultData.setMsg(StatusEnum.FAILED.getMsg());
            e.printStackTrace();
        }
        return resultData;
    }

    /**
     * @author Seven Lee
     * @description
     *      删除字典数据
     * @param [id]
     * @date 2019/9/9
     * @return com.aaa.lee.rent.base.ResultData
     * @throws 
    **/
    public ResultData deleteDictionary(String id) {
        ResultData resultData = new ResultData();
        Dictionary dictionary = new Dictionary();
        dictionary.setId(id);
        dictionary.setRedundant(StatusEnum.DICTIONARY_DELETE.getCode());
        dictionary.setUpdateTime(DateUtil.formatDate(new Date(), "yyyy-MM-dd hh:mm:ss"));
        try {
            int updateResult = update(dictionary);
            if(updateResult > 0) {
                resultData.setCode(StatusEnum.SUCCESS.getCode());
                resultData.setMsg(StatusEnum.SUCCESS.getMsg());
            } else {
                resultData.setCode(StatusEnum.FAILED.getCode());
                resultData.setMsg(StatusEnum.FAILED.getMsg());
            }
        } catch (Exception e) {
            resultData.setCode(StatusEnum.FAILED.getCode());
            resultData.setMsg(StatusEnum.FAILED.getMsg());
            e.printStackTrace();
        }
        return resultData;
    }
}
