package com.aaa.lee.rent.page;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/7 21:30
 * @Description
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class PageInfos<T> {

    /**
     * 当前页码
     */
    private Integer pageNum;
    /**
     * 每一页显示的条数
     */
    private Integer pageSize;
    /**
     * 所需要封装的数据
     */
    private T data;

}
