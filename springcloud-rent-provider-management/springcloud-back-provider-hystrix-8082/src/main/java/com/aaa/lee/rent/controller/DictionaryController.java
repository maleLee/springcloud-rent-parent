package com.aaa.lee.rent.controller;

import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.model.Dictionary;
import com.aaa.lee.rent.page.PageInfos;
import com.aaa.lee.rent.service.DictionaryService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/7 10:59
 * @Description
 **/
@RestController
public class DictionaryController {

    @Autowired
    private DictionaryService dictionaryService;

    /**
     * @author Seven Lee
     * @description
     *      查询所有的字典数据
     * @param []
     * @date 2019/9/7
     * @return com.aaa.lee.rent.base.ResultData<com.aaa.lee.rent.model.Dictionary>
     * @throws 
    **/
    @RequestMapping("/allDictionary")
    public ResultData selectAllDictionary(@RequestBody PageInfos<Dictionary> pageInfos) {
        return dictionaryService.selectAllDictionary(pageInfos);
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
    @RequestMapping("/insertDictionary")
    public ResultData insertDictionary(@RequestBody Dictionary dictionary) {
        // 如果直接使用service父类，在controller就必须要写业务逻辑
        // 按照整体项目规范，controller中是绝对不允许
        return dictionaryService.insertDictionary(dictionary);

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
    @RequestMapping("/deleteDictionary")
    public ResultData deleteDictionary(@RequestParam("id") String id) {
        return dictionaryService.deleteDictionary(id);
    }

}
