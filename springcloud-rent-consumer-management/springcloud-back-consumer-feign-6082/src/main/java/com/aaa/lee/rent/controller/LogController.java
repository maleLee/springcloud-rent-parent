package com.aaa.lee.rent.controller;

import com.aaa.lee.rent.base.BaseController;
import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.model.Log;
import com.aaa.lee.rent.page.PageInfos;
import com.aaa.lee.rent.service.IRentBackService;
import com.aaa.lee.rent.status.StatusEnum;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/11 8:45
 * @Description
 **/
@Controller
public class LogController extends BaseController {

    @Autowired
    private IRentBackService rentBackService;

    @RequestMapping("/toLogPage")
    @ApiOperation(value = "日志数据", notes = "跳转到日志页面")
    public String toLogPage() {
        return "log";
    }

    @RequestMapping("/allLogs")
    @ResponseBody
    @ApiOperation(value = "日志数据", notes = "查询所有日志信息")
    public ResultData selectAllLogs(Integer currentPage, Integer pageSize) {
        PageInfos<Log> pageInfos = new PageInfos<Log>();
        pageInfos.setPageNum(currentPage).setPageSize(pageSize);
        ResultData resultData = rentBackService.selectAllLogs(pageInfos);
        if(null != resultData && (StatusEnum.SUCCESS.getCode()).equals(resultData.getCode())) {
            return success(StatusEnum.SUCCESS.getMsg(), resultData.getData());
        } else {
            return failed(StatusEnum.FAILED.getMsg());
        }

    }

}
