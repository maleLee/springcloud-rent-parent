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

@Table(name = "elzf_rent")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Rent extends BaseModel implements Serializable {

    /**
     * 发布者外键
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 标题
     */
    private String title;

    /**
     * 经度与纬度
     */
    private String trapeze;

    /**
     * 地区
     */
    private String area;

    /**
     * 小区名
     */
    private String community;

    /**
     * 租金
     */
    private Double pay;

    /**
     * 户型
     */
    @Column(name = "house_type")
    private String houseType;

    /**
     * 面积
     */
    @Column(name = "house_size")
    private Double houseSize;

    /**
     * 楼层
     */
    private String floor;

    /**
     * 朝向
     */
    private String orientation;

    /**
     * 押租策略
     */
    @Column(name = "charge_strategy")
    private String chargeStrategy;

    /**
     * 状态
     */
    private String status;
}