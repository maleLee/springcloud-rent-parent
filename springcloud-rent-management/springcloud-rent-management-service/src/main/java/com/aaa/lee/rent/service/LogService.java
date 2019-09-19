package com.aaa.lee.rent.service;

import com.aaa.lee.rent.base.BaseService;
import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.mapper.LogMapper;
import com.aaa.lee.rent.model.Log;
import com.aaa.lee.rent.page.PageInfos;
import com.aaa.lee.rent.status.StatusEnum;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/11 8:57
 * @Description
 **/
@Service
public class LogService extends BaseService<Log> {

    @Autowired
    private LogMapper logMapper;

    @Override
    public Mapper<Log> getMapper() {
        return logMapper;
    }

    /**
     * @author Seven Lee
     * @description
     *      查询所有的日志信息
     * @param [pageInfos]
     * @date 2019/9/11
     * @return com.aaa.lee.rent.base.ResultData
     * @throws 
    **/
    public ResultData selectAllLogs(PageInfos<Log> pageInfos) {
        Log log = new Log();
        pageInfos.setData(log);
        ResultData<PageInfo<Log>> resultData = new ResultData<PageInfo<Log>>();
        PageInfo<Log> logPageInfo = selectPageInfo(pageInfos);
        if(logPageInfo.getList().size() > 0) {
            resultData.setCode(StatusEnum.SUCCESS.getCode());
            resultData.setMsg(StatusEnum.SUCCESS.getMsg());
            resultData.setData(logPageInfo);
        } else {
            resultData.setCode(StatusEnum.FAILED.getCode());
            resultData.setMsg(StatusEnum.FAILED.getMsg());
        }
        return resultData;
    }

}
