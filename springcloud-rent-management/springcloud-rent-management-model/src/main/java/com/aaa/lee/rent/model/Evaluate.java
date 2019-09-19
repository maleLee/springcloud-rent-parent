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

@Table(name = "elzf_evaluate")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Evaluate extends BaseModel implements Serializable {

    /**
     * 租客外键
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 房源外键
     */
    @Column(name = "rent_id")
    private String rentId;

    /**
     * 评价分数
     */
    @Column(name = "evaluate_point")
    private Integer evaluatePoint;

    /**
     * 评价时间
     */
    @Column(name = "evaluate_time")
    private Date evaluateTime;

    /**
     * 评价状态
     */
    @Column(name = "evaluate_status")
    private String evaluateStatus;

    /**
     * 评价的内容
     */
    private String text;
}