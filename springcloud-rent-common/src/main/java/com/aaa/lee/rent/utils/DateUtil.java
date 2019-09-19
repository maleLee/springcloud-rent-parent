package com.aaa.lee.rent.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期处理工具类
 */
public class DateUtil {

    /**
     * 日期类型 yyyy-MM-dd
     */
    public final static String DATE_TYPE = "yyyy-MM-dd";
    /**
     * 日期时间类型 yyyy-MM-dd HH:mm:ss
     */
    public final static String DATE_TIME_TYPE = "yyyy-MM-dd HH:mm:ss";

    /**
     * 按照yyyy-MM-dd格式转换日期
     *
     * @param date 日期
     * @return
     */
    public static final String formatDate(Object date) {
        if (date == null) {
            return null;
        } else {
            return formatDate(date, DATE_TIME_TYPE);
        }
    }

    /**
     * 将时间转换为字符串（xx天，xx时，xx分，xx秒，大于360天显示日期时间）
     */
    public static String formatDateAgo(long millisecond) {
        StringBuilder sb = new StringBuilder();
        if (millisecond < 1000) {
            sb.append(millisecond).append("毫秒");
        } else {
            Integer ss = 1000;
            Integer mi = ss * 60;
            Integer hh = mi * 60;
            Integer dd = hh * 24;

            Long day = millisecond / dd;
            Long hour = (millisecond - day * dd) / hh;
            Long minute = (millisecond - day * dd - hour * hh) / mi;
            Long second = (millisecond - day * dd - hour * hh - minute * mi) / ss;
            if (day > 365) {
                return DateUtil.formatDate(new Date(millisecond), "yyyy年MM月dd日 HH时mm分ss秒");
            }
            if (day > 0) {
                sb.append(day).append("天");
            }
            if (hour > 0) {
                sb.append(hour).append("小时");
            }
            if (minute > 0) {
                sb.append(minute).append("分钟");
            }
            if (second > 0) {
                sb.append(second).append("秒");
            }
        }
        return sb.toString();
    }


    /**
     * 按照指定格式转换日期
     *
     * @param date       日期
     * @param formatType 格式化类型
     * @return
     */
    public static final String formatDate(Object date, String formatType) {
        if (date == null) {
            return null;
        } else {
            if (StringUtil.isNotEmpty(formatType)) {
                SimpleDateFormat format = new SimpleDateFormat(formatType);
                return format.format(date);
            } else {
                return formatDate(date);
            }
        }
    }

    /**
     * 获取系统当前时间
     *
     * @return
     */
    public static final String getDateNow() {
        return formatDate(new Date());
    }

    /**
     * 获取当前年度
     * @return
     */
    public static int getCurrentYear() {
        return Calendar.getInstance().get(Calendar.YEAR);
    }
}
