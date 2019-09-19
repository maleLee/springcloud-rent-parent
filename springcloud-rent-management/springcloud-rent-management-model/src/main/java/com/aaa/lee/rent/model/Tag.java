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
import java.util.Date;

@Table(name = "elzf_tag")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Tag extends BaseModel implements Serializable {

    /**
     * 标签的key
     */
    private String key;

    /**
     * 标签的值
     */
    private String value;

    /**
     * 可用状态与字典表关联
     */
    private String status;
}