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

@Table(name = "el_order")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Order extends BaseModel implements Serializable {

    /**
     * 到期时间
     */
    @Column(name = "expiration_time")
    private Date expirationTime;

    /**
     * 订单状态
     */
    private String status;

    /**
     * 订单类型
     */
    @Column(name = "order_type")
    private String orderType;

    /**
     * 付款时间
     */
    @Column(name = "pay_time")
    private Date payTime;

    /**
     * 关联的租房详情id
     */
    @Column(name = "rent_detailid")
    private String rentDetailid;

    /**
     * 关联的贷款表id
     */
    @Column(name = "loan_id")
    private String loanId;
}