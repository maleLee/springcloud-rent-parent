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

@Table(name = "eldk_loan")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Loan extends BaseModel implements Serializable {

    /**
     * 贷款用户的编号
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 贷款金额
     */
    @Column(name = "loan_money")
    private Double loanMoney;

    /**
     * 还款的期数（不和字典表关联）
     */
    @Column(name = "pay_times")
    private Integer payTimes;

    /**
     * 贷款类型（对应数据字典里的贷款类型）
     */
    @Column(name = "rent_type")
    private String rentType;

    /**
     * 贷款时间
     */
    @Column(name = "loan_time")
    private Date loanTime;

    /**
     * 状态
     */
    private String status;
}