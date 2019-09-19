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

@Table(name = "el_permission")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Permission extends BaseModel implements Serializable {

    /**
     * 权限名称
     */
    @Column(name = "permission_name")
    private String permissionName;

    /**
     * 权限中文名称
     */
    @Column(name = "permission_chinese_name")
    private String permissionChineseName;

    /**
     * 权限类型
     */
    @Column(name = "permission_type")
    private String permissionType;

    /**
     * 权限描述
     */
    @Column(name = "permission_discribe")
    private String permissionDiscribe;

    /**
     * 父级id
     */
    private String pid;

    /**
     * 是否为叶子节点(1:是，0:不是)
     */
    @Column(name = "is_leaf")
    private String isLeaf;

    /**
     * 菜单地址
     */
    @Column(name = "menu_url")
    private String menuUrl;

    /**
     * 菜单图标
     */
    @Column(name = "menu_icon")
    private String menuIcon;

    /**
     * 状态
     */
    private String status;
}