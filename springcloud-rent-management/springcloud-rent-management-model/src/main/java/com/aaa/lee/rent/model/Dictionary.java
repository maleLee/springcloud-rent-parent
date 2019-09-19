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

@Table(name = "el_dictionary")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Dictionary extends BaseModel implements Serializable {
    /**
     * 字典编号
     */
    @Column(name = "dict_code")
    private String dictCode;

    /**
     * 字典名称
     */
    @Column(name = "dict_name")
    private String dictName;

    /**
     * 类型编号
     */
    @Column(name = "dict_type_code")
    private String dictTypeCode;

    /**
     * 字典类型名称
     */
    @Column(name = "dict_type_name")
    private String dictTypeName;

    /**
     * 父级编号
     */
    private String pid;
}