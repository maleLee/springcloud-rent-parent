package com.aaa.lee.rent.base;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/6 15:09
 * @Description
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class BaseModel {

    /**
     * 主键ID
     */
    @NotNull(message = "主键不能为空")
    @Size(max = 256, message = "主键最大不能超过256位")
    @Id
    private String id;
    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private String createTime;
    /**
     * 修改时间
     */
    @Column(name = "update_time")
    private String updateTime;
    /**
     * 冗余字段
     */
    @Size(max = 256, message = "冗余字段不能超过256位")
    private String redundant;

}
