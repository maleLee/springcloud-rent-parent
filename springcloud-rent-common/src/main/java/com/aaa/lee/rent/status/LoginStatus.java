package com.aaa.lee.rent.status;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/6 16:34
 * @Description
 **/
public enum LoginStatus {

    LOGIN_SUCCESS("200", "登录成功"),
    LOGIN_FAILED("400", "登录失败"),
    USER_EXIST("201", "用户存在"),
    USER_NOT_EXIST("401", "用户不存在"),
    PASSWORD_WRONG("402", "密码错误"),
    USER_LOCKED("403", "账号被锁定"),
    LOGOUT_WRONG("405", "用户退出异常"),
    USER_HAS_MENU("202", "管理员菜单存在"),
    USER_HAS_NO_MENU("406", "管理员菜单不存在");

    LoginStatus(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private String code;
    private String msg;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
