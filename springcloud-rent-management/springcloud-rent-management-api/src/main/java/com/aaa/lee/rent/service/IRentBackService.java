package com.aaa.lee.rent.service;

import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.fallback.RentBackFallbackService;
import com.aaa.lee.rent.model.Dictionary;
import com.aaa.lee.rent.model.Log;
import com.aaa.lee.rent.model.User;
import com.aaa.lee.rent.page.PageInfos;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/6 20:46
 * @Description
 **/

@FeignClient(value = "springcloud-provider", fallbackFactory = RentBackFallbackService.class)
public interface IRentBackService {

    @RequestMapping("/byUsername")
    ResultData<User> selectUserByUsername(@RequestParam("username") String username);

    @RequestMapping("/allDictionary")
    ResultData selectAllDictionary(@RequestBody PageInfos<Dictionary> pageInfos);

    @RequestMapping("/insertDictionary")
    ResultData insertDictionary(@RequestBody Dictionary dictionary);

    @RequestMapping("/deleteDictionary")
    ResultData deleteDictionary(@RequestParam("id") String id);

    @RequestMapping("/allLogs")
    ResultData selectAllLogs(@RequestBody PageInfos<Log> pageInfos);

    @RequestMapping("/selectMenuByUsername")
    ResultData selectMenuByUsername(@RequestParam("username") String username);

}
