package com.aaa.lee.rent.config;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import com.aaa.lee.rent.realm.ShiroRealm;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.DependsOn;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/5 11:18
 * @Description
 **/
@SpringBootApplication
public class ShiroConfig {

    /**
     * @author Seven Lee
     * @description
     *      LifecycleBeanPostProcessor:表示把shiro的生命周期交给spring进行托管
     *      相当于在application.xml配置文件中配置<bean id="lifecycleBeanPostProcessor" class="LifecycleBeanPostProcessor.class"></bean>信息
     * @param []
     * @date 2019/8/17
     * @return org.apache.shiro.spring.LifecycleBeanPostProcessor
     * @throws
     **/
    @Bean(name = "lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        LifecycleBeanPostProcessor processor = new LifecycleBeanPostProcessor();
        return processor;
    }


    /**
     * @author Seven Lee
     * @description
     *      密码加密
     *      setHashAlgorithmName:根据名称设置密码的加密方式
     *      setHashIterations:设置的加密次数
     *      setStoredCredentialsHexEncoded:把用户所提交的密码转换成16进制
     * @param []
     * @date 2019/8/17
     * @return org.apache.shiro.authc.credential.HashedCredentialsMatcher
     * @throws
     **/
    @Bean(name = "hashedCredentialsMatcher")
    public HashedCredentialsMatcher hashedCredentialsMatcher() {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher();
        matcher.setHashAlgorithmName("MD5");
        matcher.setHashIterations(1024);
        matcher.setStoredCredentialsHexEncoded(true);
        return matcher;
    }


    /**
     * @author Seven Lee
     * @description
     *      配置了shiroRealm
     *      在application.xml配置文件中，<bean id="密码加密"></bean>
     *      <bean id="密码加密" class="xxxxx">
     *           加密次数
     *           加密的方式
     *           转换16进制
     *      </bean>
     *      <bean id="myRealm" class="com.aaa.lee.shiro.realm.MyRealm">
     *          加载密码加密的bean<bean id="密码加密"></bean>
     *      </bean>
     *      @DependsOn:
     *         DependsOn:翻译过来就是依赖于xxxx
     *         所以最终所有的Realm都必须要依赖于shiro的生命周期
     *
     * @param []
     * @date 2019/8/17
     * @return com.aaa.lee.shiro.realm.ShiroRealm
     * @throws
     **/
    @Bean(name = "shiroRealm")
    @DependsOn("lifecycleBeanPostProcessor")
    public ShiroRealm shiroRealm() {
        ShiroRealm shiroRealm = new ShiroRealm();
        // 在shiro的认证阶段中，配置了密码的加密
        shiroRealm.setCredentialsMatcher(hashedCredentialsMatcher());
        // 在开发阶段，不需要缓存
        // shiroRealm.setCacheManager(ehCacheManager());
        return shiroRealm;
    }


    /**
     * @author Seven Lee
     * @description
     *      配置了shiro所必须使用的ehcache的缓存
     * @param []
     * @date 2019/8/17
     * @return org.apache.shiro.cache.ehcache.EhCacheManager
     * @throws
     **/
    @Bean(name = "ehCacheManager")
    @DependsOn("lifecycleBeanPostProcessor")
    public EhCacheManager ehCacheManager() {
        return new EhCacheManager();
    }


    /**
     * @author Seven Lee
     * @description
     *      创建SecurityManager对象
     *      相当于在applicaiton.xml配置文件中
     *      <bean id="securityManager" class="xxxxxx">
     *          引入myRealm
     *      </bean>
     * @param []
     * @date 2019/8/17
     * @return org.apache.shiro.web.mgt.DefaultWebSecurityManager
     * @throws
     **/
    @Bean(name = "securityManager")
    public DefaultWebSecurityManager securityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(shiroRealm());
        //securityManager.setCacheManager(ehCacheManager());
        return securityManager;
    }


    /**
     * @author Seven Lee
     * @description
     *      shiro的过滤器
     * @param []
     * @date 2019/8/17
     * @return org.apache.shiro.spring.web.ShiroFilterFactoryBean
     * @throws
     **/
    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean shiroFilterFactoryBean() {
        ShiroFilterFactoryBean filter = new ShiroFilterFactoryBean();
        filter.setSecurityManager(securityManager());
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
        /**
         *  1.logout:退出当前所登录用户
         *  2.anon:匿名可以访问(不进行认证可以直接访问的地址)
         *  3.authc:需要认证后所访问@RequestMapping("/xxxx")
         *  4.*和**的区别:
         *      *:com.aaa.lee.shiro
         *          -- realm :com.aaa.lee.shiro.realm/*只会代表当前目录的子目录(一级)
         *              -- myrealm
         *                  -- myAuthentication(认证)
         *      **:
         *          当前目录下的所有目录都进行匹配
         *  5.setLoginUrl():登录的路径
         *  6.setSuccessUrl():登录成功后所要跳转的路径
         *  7.setUnauthorizedUrl:如果权限的时候所需要跳转的路径
         *  8./static/** = user:所有认证成功后的用户可以访问的路径
         *  9./public/** = role["admin"]：当拥有admin角色的时候可以访问的路径
         *      role["admin","user","book_manager"]：这三个同时满足的时候才可以访问
         *  10.permission
         */
        filterChainDefinitionMap.put("/logout", "logout");
        filterChainDefinitionMap.put("/favicon.ico", "anon");
        filterChainDefinitionMap.put("/static/**", "anon");
        filterChainDefinitionMap.put("/toLoginPage", "anon");
        filterChainDefinitionMap.put("/login", "anon");
        filterChainDefinitionMap.put("/**", "authc");
        filter.setLoginUrl("/toLoginPage");
        // filter.setSuccessUrl("/index");
        filter.setUnauthorizedUrl("/404");


        filter.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return filter;
    }


    /**
     * @author Seven Lee
     * @description
     *      @ConditionalOnMissingBean:条件注解
     *          当找不到某一个bean的时候才会被加载
     *       在springboot的源码中拥有DefaultAdvisorAutoProxyCreator bean的配置
     *       在自己的配置类中如果再次配置DefaultAdvisorAutoProxyCreator bean，则bean冲突报错！
     *       当无法加载springboot所自带的bean的时候，自己配置bean信息才会被加载
     *      创建一个shiro代理构建器(java自带的，还有cglib)
     *          通过动态代理创建出shiro的代理对象，再把这个对象交给spring进行托管
     * @param []
     * @date 2019/8/17
     * @return org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator
     * @throws
     **/
    @Bean
    @ConditionalOnMissingBean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAAP = new DefaultAdvisorAutoProxyCreator();
        defaultAAP.setProxyTargetClass(true);
        return defaultAAP;
    }


    /**
     * @author Seven Lee
     * @description
     *      AuthorizationAttributeSourceAdvisor:
     *          授权源适配器
     *          源数据
     * @param []
     * @date 2019/8/17
     * @return org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor
     * @throws
     **/
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor() {
        AuthorizationAttributeSourceAdvisor aASA = new AuthorizationAttributeSourceAdvisor();
        aASA.setSecurityManager(securityManager());
        return aASA;
    }


    /**
     * @author Seven Lee
     * @description
     *      thymeleaf所支持shiro的标签
     * @param []
     * @date 2019/8/17
     * @return at.pollux.thymeleaf.shiro.dialect.ShiroDialect
     * @throws
     **/
    @Bean(name = "shiroDialect")
    public ShiroDialect shiroDialect(){
        return new ShiroDialect();
    }

}
