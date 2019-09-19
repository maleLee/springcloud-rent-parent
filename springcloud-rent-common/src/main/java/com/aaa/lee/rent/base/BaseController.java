package com.aaa.lee.rent.base;

import com.aaa.lee.rent.status.LoginStatus;
import com.aaa.lee.rent.status.StatusEnum;
import org.springframework.stereotype.Controller;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/5 11:02
 * @Description
 **/
@Controller
public class BaseController {

    /**
     * @author Seven Lee
     * @description
     *      成功，使用系统消息
     * @param []
     * @date 2019/9/6
     * @return com.aaa.lee.rent.base.ResultData
     * @throws 
    **/
    protected ResultData success() {
        ResultData resultData = new ResultData();
        resultData.setCode(LoginStatus.LOGIN_SUCCESS.getCode());
        resultData.setMsg(LoginStatus.LOGIN_SUCCESS.getMsg());
        return resultData;
    }

    /**
     * @author Seven Lee
     * @description
     *      如果不需要返回数据，则使用这个方法(自定义返回消息)
     * @param
     * @date 2019/8/10
     * @return com.aaa.lee.es.base.ResultData
     * @throws
     **/
    protected ResultData success(String msg) {
        ResultData resultData = new ResultData();
        resultData.setCode(LoginStatus.LOGIN_SUCCESS.getCode());
        resultData.setMsg(msg);
        return resultData;
    }

    /**
     * @author Seven Lee
     * @description
     *      成功，返回数据，使用系统消息
     * @param [data]
     * @date 2019/9/6
     * @return com.aaa.lee.rent.base.ResultData
     * @throws 
    **/
    protected ResultData success(Object data) {
        ResultData resultData = new ResultData();
        resultData.setCode(LoginStatus.LOGIN_SUCCESS.getCode());
        resultData.setMsg(LoginStatus.LOGIN_SUCCESS.getMsg());
        resultData.setData(data);
        return resultData;
    }

    /**
     * @author Seven Lee
     * @description
     *      需要返回前端页面数据，则使用这个方法(自定义消息)
     * @param [msg, data]
     * @date 2019/8/10
     * @return com.aaa.lee.es.base.ResultData
     * @throws
     **/
    protected ResultData success(String msg, Object data) {
        ResultData resultData = new ResultData();
        resultData.setCode(LoginStatus.LOGIN_SUCCESS.getCode());
        resultData.setMsg(msg);
        resultData.setData(data);
        return resultData;
    }

    /**
     * @author Seven Lee
     * @description
     *      失败，不需要返回前端数据，自定义消息
     * @param [msg]
     * @date 2019/9/6
     * @return com.aaa.lee.rent.base.ResultData
     * @throws
    **/
    protected ResultData failed(String msg) {
        ResultData resultData = new ResultData();
        resultData.setCode(LoginStatus.LOGIN_FAILED.getCode());
        resultData.setMsg(msg);
        return resultData;
    }

    /**
     * @author Seven Lee
     * @description
     *      失败，返回数据，自定义消息
     * @param [msg, data]
     * @date 2019/9/6
     * @return com.aaa.lee.rent.base.ResultData
     * @throws 
    **/
    protected ResultData failed(String msg, Object data) {
        ResultData resultData = new ResultData();
        resultData.setCode(LoginStatus.LOGIN_FAILED.getCode());
        resultData.setMsg(msg);
        resultData.setData(data);
        return resultData;
    }

}
