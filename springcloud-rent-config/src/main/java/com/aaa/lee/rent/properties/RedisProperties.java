package com.aaa.lee.rent.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/5 10:40
 * @Description
 **/
//@Component
//@ConfigurationProperties(prefix = "spring.redis")
//@PropertySource("classpath:config/redis.properties")
public class RedisProperties {

    private String nodes;
    private Integer maxAttmpts;
    private Integer expire;
    private Integer commandTimeout;

    public String getNodes() {
        return nodes;
    }

    public void setNodes(String nodes) {
        this.nodes = nodes;
    }

    public Integer getMaxAttmpts() {
        return maxAttmpts;
    }

    public void setMaxAttmpts(Integer maxAttmpts) {
        this.maxAttmpts = maxAttmpts;
    }

    public Integer getExpire() {
        return expire;
    }

    public void setExpire(Integer expire) {
        this.expire = expire;
    }

    public Integer getCommandTimeout() {
        return commandTimeout;
    }

    public void setCommandTimeout(Integer commandTimeout) {
        this.commandTimeout = commandTimeout;
    }

}
