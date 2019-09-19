package com.aaa.lee.rent.controller;

import com.aaa.lee.rent.base.BaseController;
import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.model.Dictionary;
import com.aaa.lee.rent.page.PageInfos;
import com.aaa.lee.rent.service.IRentBackService;
import com.aaa.lee.rent.status.StatusEnum;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/7 10:46
 * @Description
 **/
@Controller
@Api(value = "字典管理", tags = "字典管理")
public class DictionaryController extends BaseController {

    @Autowired
    private IRentBackService rentBackService;

    /**
     * @author Seven Lee
     * @description
     *      跳转到字典页面
     * @param []
     * @date 2019/9/7
     * @return java.lang.String
     * @throws 
    **/
    @RequestMapping("/toDictionaryPage")
    @ApiOperation(value = "跳转字典页面", notes = "跳转字典页面")
    public String toDictionaryPage() {
        return "dictionary";
    }

    /**
     * @author Seven Lee
     * @description
     *      加载所有字典数据
     * @param []
     * @date 2019/9/7
     * @return com.aaa.lee.rent.base.ResultData<com.aaa.lee.rent.model.Dictionary>
     * @throws 
    **/
    @RequestMapping("/allDictionary")
    @ResponseBody
    @ApiOperation(value = "字典数据", notes = "加载所有的字典数据")
    public ResultData selectAllDictionary(Integer currentPage, Integer pageSize) {
        PageInfos<Dictionary> pageInfos = new PageInfos<Dictionary>();
        pageInfos.setPageNum(currentPage);
        pageInfos.setPageSize(pageSize);
        ResultData resultData = rentBackService.selectAllDictionary(pageInfos);
        if(null != resultData && (StatusEnum.SUCCESS.getCode()).equals(resultData.getCode())) {
            return success(StatusEnum.SUCCESS.getMsg(), resultData.getData());
        } else {
            return failed(StatusEnum.FAILED.getMsg());
        }
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
    @RequestMapping("/saveDictionary")
    @ResponseBody
    @ApiOperation(value = "字典数据", notes = "添加字典数据")
    public ResultData insertDictionary(Dictionary dictionary){
        ResultData resultData = rentBackService.insertDictionary(dictionary);
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
    @RequestMapping("/deleteDictionary")
    @ResponseBody
    @ApiOperation(value = "字典数据", notes = "删除字典数据")
    public ResultData deleteDictionary(String id) {
        return rentBackService.deleteDictionary(id);
    }

}
