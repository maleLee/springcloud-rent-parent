package com.aaa.lee.rent.model;

import com.aaa.lee.rent.base.BaseModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Table(name = "el_log")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Log extends BaseModel implements Serializable {

    /**
     * 用户id
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * ip地址
     */
    private String ip;

    /**
     * 操作内容
     */
    @Column(name = "operational_content")
    private String operationalContent;

    /**
     * 操作类型
     */
    @Column(name = "operational_type")
    private String operationalType;

    /**
     * 操作目标
     */
    @Column(name = "operational_target")
    private String operationalTarget;
}