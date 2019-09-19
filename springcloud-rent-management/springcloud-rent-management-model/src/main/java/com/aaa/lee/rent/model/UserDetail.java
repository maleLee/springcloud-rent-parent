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

@Table(name = "el_user_detail")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class UserDetail extends BaseModel implements Serializable {

    @Column(name = "user_id")
    private String userId;

    /**
     * 真实姓名
     */
    @Column(name = "real_name")
    private String realName;

    /**
     * 身份证号
     */
    @Column(name = "id_card")
    private String idCard;

    /**
     * 银行卡号
     */
    @Column(name = "bank_card")
    private String bankCard;

    /**
     * 工作
     */
    private String job;

    /**
     * 联系地址
     */
    private String address;

    /**
     * 头像图片地址
     */
    @Column(name = "header_image")
    private String headerImage;

    /**
     * 身份证正反面地址（图片中间使用,分开）
     */
    @Column(name = "idcard_image")
    private String idcardImage;

    /**
     * 紧急联系人
     */
    @Column(name = "emergency_contact")
    private String emergencyContact;

    /**
     * 紧急联系人电话
     */
    @Column(name = "emergency_contact_phone")
    private String emergencyContactPhone;

    /**
     * 公司名
     */
    @Column(name = "company_name")
    private String companyName;

    /**
     * 公司联系电话
     */
    @Column(name = "company_tel")
    private String companyTel;

    /**
     * 状态
     */
    private String status;
}