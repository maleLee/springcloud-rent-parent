package com.aaa.lee.rent.utils;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.List;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/7/27 9:29
 * @Description
 *      json转换工具类
 **/
public class JSONUtil {

    // 1.定义私有静态常量ObjectMapper(命名规则：所有字母全部大写，单词与单词之间使用_连接)
        // ObjectMapper:就是fastjson包中进行类型转换的工具类
    private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();

    /**
     * @author Seven Lee
     * @description
     *      把对象转换为json字符串
     * @param object
     * @date 2019/7/27
     * @return java.lang.String
     * @throws
     **/
    public static String toJsonString(Object object) {
        try {
            String jsonString = OBJECT_MAPPER.writeValueAsString(object);
            return jsonString;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @author Seven Lee
     * @description
     *      把json转换为指定的对象
     *      <T>:定义了一个类型
     *      T:返回值的类型
     * @param jsonData:传入的json对象
     *        beanType:所需要转换对象的目标类型
     *                  User.class, Book.class
     * @date 2019/7/27
     * @return T
     * @throws
     **/
    public static <T> T toObject(String jsonData, Class<T> beanType) {
        try {
            T t = OBJECT_MAPPER.readValue(jsonData, beanType);
            return t;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @author Seven Lee
     * @description
     *      把Json转换为List集合
     * @param jsonData, beanType
     * @date 2019/7/27
     * @return java.util.List<T>
     * @throws
     **/
    public static <T> List<T> toList(String jsonData, Class<T> beanType) {
        // 1.为List集合添加一个指定的泛型
            // List  User.class ---> 通过constructParametricType方法把List和User合并，也就是说为List指定一个User对象的泛型(List<User>)
        JavaType javaType = OBJECT_MAPPER.getTypeFactory().constructParametricType(List.class, beanType);
        try {
            List<T> list = OBJECT_MAPPER.readValue(jsonData, javaType);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }



}
