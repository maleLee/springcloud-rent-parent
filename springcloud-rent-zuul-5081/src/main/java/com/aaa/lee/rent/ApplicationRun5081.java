package com.aaa.lee.rent;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

import javax.swing.*;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/5 11:24
 * @Description
 **/
@SpringBootApplication
@EnableZuulProxy
public class ApplicationRun5081 {

    public static void main(String[] args) {
        SpringApplication.run(ApplicationRun5081.class, args);
    }

}
