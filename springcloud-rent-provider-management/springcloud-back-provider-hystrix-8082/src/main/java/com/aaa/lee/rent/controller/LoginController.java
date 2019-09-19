package com.aaa.lee.rent.controller;

import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.model.User;
import com.aaa.lee.rent.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/6 20:55
 * @Description
 **/
@RestController
public class LoginController {

    @Autowired
    private LoginService loginService;

    /**
     * @author Seven Lee
     * @description
     *      通过用户名查询用户信息
     * @param [username]
     * @date 2019/9/6
     * @return com.aaa.lee.rent.base.ResultData<com.aaa.lee.rent.model.User>
     * @throws 
    **/
    @RequestMapping("/byUsername")
    public ResultData<User> selectUserByUsername(@RequestParam("username") String username) {
        return loginService.selectUserByUsername(username);
    }

    /**
     * @author Seven Lee
     * @description
     *      根据用户名查询菜单信息
     * @param [username]
     * @date 2019/9/19
     * @return com.aaa.lee.rent.base.ResultData
     * @throws 
    **/
    @RequestMapping("/selectMenuByUsername")
    public ResultData selectMenuByUsername(@RequestParam("username") String username) {
        return loginService.selectMenuByUsername(username);
    }

}
