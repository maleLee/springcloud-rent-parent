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

@Table(name = "elzf_order_detail")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class OrderDetail extends BaseModel implements Serializable {

    /**
     * 租客外键（一对多）
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 房源外键
     */
    @Column(name = "rent_id")
    private String rentId;

    /**
     * 总租金
     */
    private Double total;

    /**
     * 入住时间
     */
    @Column(name = "live_time")
    private Date liveTime;

    /**
     * 付款方式
     */
    @Column(name = "pay_way")
    private String payWay;
}