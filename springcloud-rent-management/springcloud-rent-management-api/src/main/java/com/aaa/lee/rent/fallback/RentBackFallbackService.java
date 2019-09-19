package com.aaa.lee.rent.fallback;

import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.model.Dictionary;
import com.aaa.lee.rent.model.Log;
import com.aaa.lee.rent.model.User;
import com.aaa.lee.rent.page.PageInfos;
import com.aaa.lee.rent.service.IRentBackService;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;


/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/6 20:48
 * @Description
 **/
@Component
public class RentBackFallbackService implements FallbackFactory<IRentBackService> {

    @Override
    public IRentBackService create(Throwable throwable) {
        IRentBackService loginService = new IRentBackService() {
            @Override
            public ResultData<User> selectUserByUsername(String username) {
                System.out.println("测试数据！！！！");
                // 是从主库中取数据(redis缓存中取数据)
                return null;
            }

            @Override
            public ResultData selectAllDictionary(PageInfos<Dictionary> pageInfos) {
                System.out.println("测试字典断容数据！！！");
                return null;
            }

            @Override
            public ResultData insertDictionary(Dictionary dictionary) {
                System.out.println("测试字典断容数据！！！");
                return null;
            }

            @Override
            public ResultData deleteDictionary(String id) {
                System.out.println("测试字典断容数据！！！");
                return null;
            }

            @Override
            public ResultData selectAllLogs(PageInfos<Log> pageInfos) {
                System.out.println("测试日志断容数据！！！");
                return null;
            }

            @Override
            public ResultData selectMenuByUsername(String username) {
                System.out.println("测试菜单断容数据！！！");
                return null;
            }
        };
        return loginService;
    }
}
