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

@Table(name = "eldk_repay")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Repay extends BaseModel implements Serializable {

    /**
     * 贷款id
     */
    @Column(name = "loan_id")
    private String loanId;

    /**
     * 贷款人外键
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 还款金额
     */
    private Double repay;

    /**
     * 剩余未还金额
     */
    @Column(name = "rest_repay")
    private Double restRepay;

    /**
     * 还款时间
     */
    @Column(name = "repay_time")
    private Date repayTime;

    /**
     * 贷款状态
     */
    private String status;

}