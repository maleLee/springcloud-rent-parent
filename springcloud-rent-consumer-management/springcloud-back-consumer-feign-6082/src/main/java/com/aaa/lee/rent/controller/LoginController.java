package com.aaa.lee.rent.controller;

import com.aaa.lee.rent.base.BaseController;
import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.model.User;
import com.aaa.lee.rent.service.IRentBackService;
import com.aaa.lee.rent.status.LoginStatus;
import com.aaa.lee.rent.utils.CookieUtil;
import com.netflix.discovery.converters.Auto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/6 15:38
 * @Description
 **/
@Controller
@Api(value = "登录管理", tags = "登录管理")
public class LoginController extends BaseController {

    @Autowired
    private IRentBackService rentBackService;

    /**
     * @author Seven Lee
     * @description
     *      跳转登录页面
     * @param []
     * @date 2019/9/6
     * @return java.lang.String
     * @throws
    **/
    @GetMapping("/toLoginPage")
    @ApiOperation(value = "跳转登录页面", notes = "跳转登录页面")
    public String turnLoginPage() {
        return "login";
    }

    /**
     * @author Seven Lee
     * @description
     *      执行登录
     * @param []
     * @date 2019/9/6
     * @return java.lang.String
     * @throws 
    **/
    @RequestMapping("/login")
    @ResponseBody
    @ApiOperation(value = "执行登录操作", notes = "执行登录操作")
    public ResultData turnLoginPage(String username, String password) {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            // 当调用login方法的时候，就会直接跳转到shiro的认证阶段
            subject.login(token);// 当调用login方法的时候，被shiro的过滤器所拦截
            // 当login方法执行完毕后，也就是说当shiro的认证阶段执行完毕后，最终还是会回到controller
            // 通过subject调用getPrincipal()
            User user = (User)subject.getPrincipal(); // 是取决于认证阶段的第一个参数
            if(null != user) {
                // 直接返回ajax到前端
                return success(user);
            } else {
                throw new UnknownAccountException();
            }
        } catch (UnknownAccountException uae) {
            return failed(LoginStatus.USER_NOT_EXIST.getMsg());
        } catch (IncorrectCredentialsException ice) {
            return failed(LoginStatus.PASSWORD_WRONG.getMsg());
        } catch (LockedAccountException lae) {
            return failed(LoginStatus.USER_LOCKED.getMsg());
        } catch (AuthenticationException ae) {
            return failed(LoginStatus.LOGOUT_WRONG.getMsg());
        }
    }

    /**
     * @author Seven Lee
     * @description
     *      跳转index页面
     * @param []
     * @date 2019/9/6
     * @return java.lang.String
     * @throws 
    **/
    @GetMapping("/toIndexPage")
    @ApiOperation(value = "跳转index页面", notes = "跳转index页面")
    public String toIndexPage() {
        return "index";
    }

    /**
     * @author Seven Lee
     * @description
     *      获取当前登录管理员的菜单信息
     * @param [request]
     * @date 2019/9/19
     * @return com.aaa.lee.rent.base.ResultData
     * @throws 
    **/
    @RequestMapping("/menus")
    @ResponseBody
    @ApiOperation(value = "当前管理员菜单", notes = "查看当前管理员的菜单信息")
    public ResultData selectMenu(HttpServletRequest request) {
        // 调用service
        String cookieKey = CookieUtil.getCookieValue(request, "COOKIE_KEY");
        User user = (User)SecurityUtils.getSubject().getSession().getAttribute(cookieKey);
        ResultData resultData = rentBackService.selectMenuByUsername(user.getUsername());
        return resultData;
    }

    /**
     * @author Seven Lee
     * @description
     *      用户退出操作
     * @param []
     * @date 2019/9/6
     * @return java.lang.String
     * @throws 
    **/
    @GetMapping("/logout")
    @ApiOperation(value = "用户退出操作", notes = "用户退出操作")
    public String logout(HttpServletRequest request) {
        Object cookieKey = SecurityUtils.getSubject().getSession().removeAttribute(CookieUtil.getCookieValue(request, "COOKIE_KEY"));
        return "login";
    }

    /**
     * @author Seven Lee
     * @description
     *      跳转到mian页面
     * @param []
     * @date 2019/9/6
     * @return java.lang.String
     * @throws 
    **/
    @GetMapping("/toMainPage")
    @ApiOperation(value = "跳转main页面", notes = "跳转main页面")
    public String toMainPage() {
        return "main";
    }

}
