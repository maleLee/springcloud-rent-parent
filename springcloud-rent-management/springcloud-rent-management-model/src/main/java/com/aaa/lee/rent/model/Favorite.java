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

@Table(name = "elzf_favorite")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Favorite extends BaseModel implements Serializable {

    /**
     * 收藏人的外键
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 收藏时间
     */
    @Column(name = "favorite_time")
    private Date favoriteTime;

}