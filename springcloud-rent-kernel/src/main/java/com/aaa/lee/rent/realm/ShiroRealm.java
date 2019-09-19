package com.aaa.lee.rent.realm;

import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.model.User;
import com.aaa.lee.rent.service.IRentBackService;
import com.aaa.lee.rent.status.LoginStatus;
import com.aaa.lee.rent.utils.CookieUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/5 11:17
 * @Description
 **/
public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private IRentBackService loginService;

    /**
     * @author Seven Lee
     * @description
     *      认证方法
     * @param [authenticationToken]
     * @date 2019/9/6
     * @return org.apache.shiro.authc.AuthenticationInfo
     * @throws 
    **/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("我是认证方法，我被访问了！");
        // 1.获取用户名
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = token.getUsername();
        // 2.根据用户名查询该用户是否存在
        ResultData<User> resultData = loginService.selectUserByUsername(username);
        SimpleAuthenticationInfo info = null;
        User u = null;
        if((LoginStatus.USER_EXIST.getCode()).equals(resultData.getCode())) {
            u = resultData.getData();
            info = new SimpleAuthenticationInfo(u, u.getPassword(), ByteSource.Util.bytes(u.getSalt()), this.getName());
        } else {
            throw new UnknownAccountException(LoginStatus.USER_NOT_EXIST.getMsg());
        }
        if(null != info && null != u) {
            // 3.需要把用户存入session中
            Session session = SecurityUtils.getSubject().getSession();
            u.setPassword(null);
            // (1)存入到cookie中
            // (2)在user表中/session_key表中，有一个字段存储的是token，这么一个token就是session的key(而且还是加密的)
            // 主键，session_key，session的失效时间，当前状态，用户的id
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
            CookieUtil.setCookie(request, response,"COOKIE_KEY", u.getUsername());
            session.setAttribute(u.getUsername(), u);
        }
        return info;
    }

    /**
     * @author Seven Lee
     * @description
     *      授权方法
     * @param [principalCollection]
     * @date 2019/9/6
     * @return org.apache.shiro.authz.AuthorizationInfo
     * @throws 
    **/
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection)
    {
        System.out.println("我是授权方法，我被访问了！");
        return null;
    }

}