package com.aaa.lee.rent.utils;

import org.springframework.util.DigestUtils;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Random;

/**
 * 字符串工具类
 */
public class StringUtil {
    /**
     * MD5
     * @param str
     * @return
     */
    public static String md5(String str) {
        return DigestUtils.md5DigestAsHex(str.getBytes());
    }

    /**
     * 杀空函数，将"null"和null对象转换为""
     *
     * @param str 输入字符串
     * @return 输出字符串
     */
    public static String killNull(String str) {
        String returnStr;
        if (str == null || "null".equalsIgnoreCase(str)) {
            returnStr = "";
        } else {
            returnStr = str;
        }
        return returnStr;
    }

    /**
     * 去除字符串两边的空格并处理空字符串
     *
     * @param str 输入字符串
     * @return 输出字符串
     */
    public static String trim(String str) {
        String returnStr;
        returnStr = killNull(str);
        returnStr = returnStr.trim();
        return returnStr;
    }

    /**
     * 判断字符串是否为空
     *
     * @param str 输入字符串
     * @return
     */
    public static boolean isEmpty(String str) {
        return str == null || str.trim().equals("");
    }

    /**
     * 判断字符串是否不为空
     *
     * @param str 输入字符串
     * @return
     */
    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    /**
     * 获取指定长度的随机字母和数字组合
     *
     * @param length
     * @return 指定长度的随机字母和数字组合
     */
    public static String getCharAndNum(int length) {
        String str = "";
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            // 输出字母还是数字
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
            // 字符串
            if ("char".equalsIgnoreCase(charOrNum)) {
                // 取得大写字母还是小写字母
                int choice = random.nextInt(2) % 2 == 0 ? 65 : 97;
                str += (char) (choice + random.nextInt(26));
            } else if ("num".equalsIgnoreCase(charOrNum)) { // 数字
                str += String.valueOf(random.nextInt(10));
            }
        }
        return str;
    }

    /**
     * 将byte[]数组转为base64文本
     *
     * @param decByte 编号后的byte数组
     * @return base64文本
     * @throws Exception
     */
    public static final String byteToBase64(byte[] decByte) throws Exception {
        if (decByte == null)
            return "";
        String str = "";
        try {
            str = new sun.misc.BASE64Encoder().encodeBuffer(decByte);
        } catch (Exception e) {
            str = "";
        }
        return str.replace("\r", "").replace("\n", "");
    }

    /**
     * 将 base64文本 转为  byte[]数组
     *
     * @param str base64文本
     * @return byte[]数组
     * @throws Exception
     */
    public static final byte[] base64ToByte(String str) throws Exception {
        if (str == null)
            return null;
        byte[] decByte = null;
        try {
            decByte = new sun.misc.BASE64Decoder().decodeBuffer(str);
        } catch (Exception e) {
            decByte = null;
        }
        return decByte;
    }

    /**
     * 将ErrorStack转化为String.
     */
    public static String getExceptionAsString(Throwable throwable) {
        if (throwable == null) {
            return "";
        }
        StringWriter stringWriter = new StringWriter();
        throwable.printStackTrace(new PrintWriter(stringWriter));
        return stringWriter.toString();
    }
}
