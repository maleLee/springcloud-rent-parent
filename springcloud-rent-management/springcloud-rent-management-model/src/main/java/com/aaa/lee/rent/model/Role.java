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

@Table(name = "el_role")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Role extends BaseModel implements Serializable {

    /**
     * 角色名
     */
    @Column(name = "role_name")
    private String roleName;

    /**
     * 角色中文名称
     */
    @Column(name = "role_chinese_name")
    private String roleChineseName;

    /**
     * 角色描述
     */
    @Column(name = "role_describe")
    private String roleDescribe;

    /**
     * 角色状态
     */
    private String status;
}