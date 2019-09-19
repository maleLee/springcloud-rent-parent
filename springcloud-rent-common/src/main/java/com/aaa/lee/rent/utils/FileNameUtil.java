package com.aaa.lee.rent.utils;

import java.util.Random;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/8/31 16:24
 * @Description
 **/
public class FileNameUtil {

    /**
     * @author Seven Lee
     * @description
     *      文件名的生成
     * @param [userId]
     * @date 2019/8/31
     * @return java.lang.String
     * @throws
    **/
    public static String getFileName(Long userId) {
        // 1.获取当前时间的毫秒数
        long currentTimeMillis = System.currentTimeMillis();
        // 2.创建Random对象
        Random random = new Random();
        // 3.随机0-999之间的数字
        Integer randomNum = random.nextInt(999);
        // 4.最终的文件名
        //currentTimeMillis+userId+randomNum
        // %:占位符 03:三位 d:数字 --->如果随机出的数字没有达到三位03，默认自动往前面补0
        String fileName = currentTimeMillis + userId + String.format("%03d", randomNum);
        // 5.返回文件名
        return fileName;
    }
}
