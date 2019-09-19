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

@Table(name = "elzf_rent_detail")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class RentDetail extends BaseModel implements Serializable {

    /**
     * 与房源表关联的外键
     */
    @Column(name = "rent_id")
    private String rentId;

    /**
     * 房源类型
     */
    @Column(name = "rent_type")
    private String rentType;

    /**
     * 房源地址
     */
    @Column(name = "rent_address")
    private String rentAddress;

    /**
     * 房间设施
     */
    @Column(name = "room_facilities")
    private String roomFacilities;

    /**
     * 实景图
     */
    @Column(name = "real_picture")
    private String realPicture;

    /**
     * 房产证
     */
    @Column(name = "house_property_certification")
    private String housePropertyCertification;

    /**
     * 房屋描述
     */
    @Column(name = "house_description")
    private String houseDescription;
}