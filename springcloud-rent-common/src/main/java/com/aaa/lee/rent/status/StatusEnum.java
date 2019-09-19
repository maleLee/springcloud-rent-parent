package com.aaa.lee.rent.status;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/8/10 16:06
 * @Description
 *      在枚举的使用中，需要set方法么？
 **/
public enum StatusEnum {

    /**
     * 成功
     * 失败
     * 存在
     * 不存在
     */
    SUCCESS("1", "操作成功"),
    FAILED("2", "操作失败"),
    EXIST("3", "存在"),
    NOT_EXIST("4", "不存在"),
    DICTIONARY_NORMAL("1", "字典正常"),
    DICTIONARY_DELETE("2", "字典被删除");

    StatusEnum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private String code;
    private String msg;

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public String getMsg(String code) {
        for(StatusEnum statusEnum : StatusEnum.values()) {
            if(statusEnum.getCode().equals(code)) {
                return statusEnum.getMsg();
            }
        }
        return "null";
    }

}
