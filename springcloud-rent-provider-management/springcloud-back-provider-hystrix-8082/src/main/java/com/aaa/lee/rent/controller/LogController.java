package com.aaa.lee.rent.controller;

import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.model.Log;
import com.aaa.lee.rent.page.PageInfos;
import com.aaa.lee.rent.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/11 8:56
 * @Description
 **/
@RestController
public class LogController {

    @Autowired
    private LogService logService;

    @RequestMapping("/allLogs")
    public ResultData selectAllLogs(@RequestBody PageInfos<Log> pageInfos) {
        return logService.selectAllLogs(pageInfos);
    }

}
