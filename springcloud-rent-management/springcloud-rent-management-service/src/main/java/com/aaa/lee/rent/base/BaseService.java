package com.aaa.lee.rent.base;


import com.aaa.lee.rent.page.PageInfos;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.RowBounds;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/7 20:31
 * @Description
 **/
public abstract class BaseService<T> {

    public abstract Mapper<T> getMapper();
    
    /**
     * @author Seven Lee
     * @description
     *      保存一个实体，null的属性不会保存，会使用数据库默认值
     * @param [entity]
     * @date 2019/9/7
     * @return int
     * @throws 
    **/
    public Integer save(T t) throws Exception {
        return getMapper().insertSelective(t);
    }

    /**
     * @author Seven Lee
     * @description
     *      根据主键更新属性不为null的值
     * @param [t]
     * @date 2019/9/7
     * @return int
     * @throws 
    **/
    public int update(T t) throws Exception {
        return getMapper().updateByPrimaryKeySelective(t);
    }

    /**
     * @author Seven Lee
     * @description
     *      根据主键字段进行删除，方法参数必须包含完整的主键属性
     * @param [key]
     * @date 2019/9/7
     * @return int
     * @throws 
    **/
    public int deleteByPrimaryKey(Object key) throws Exception {
        return getMapper().deleteByPrimaryKey(key);
    }

    /**
     * @author Seven Lee
     * @description
     *      根据实体属性作为条件进行删除，查询条件使用等号
     * @param [t]
     * @date 2019/9/7
     * @return int
     * @throws 
    **/
    public int delete(T t) throws Exception {
        return getMapper().delete(t);
    }

    /**
     * @author Seven Lee
     * @description
     *      根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     * @param [key]
     * @date 2019/9/7
     * @return T
     * @throws 
    **/
    public T get(Object key) {
        return getMapper().selectByPrimaryKey(key);
    }

    /**
     * @author Seven Lee
     * @description
     *      查询全部结果
     * @param []
     * @date 2019/9/7
     * @return java.util.List<T>
     * @throws 
    **/
    public List<T> selectAll() {
        return getMapper().selectAll();
    }

    /**
     * @author Seven Lee
     * @description
     *      根据实体中的属性进行查询，只能有一个返回值，有多个结果是抛出异常，查询条件使用等号
     * @param [t]
     * @date 2019/9/7
     * @return T
     * @throws 
    **/
    public T selectOne(T t) {
        return getMapper().selectOne(t);
    }

    /**
     * @author Seven Lee
     * @description
     *      根据实体中的属性值进行查询(条件查询)
     * @param [t]
     * @date 2019/9/7
     * @return java.util.List<T>
     * @throws 
    **/
    public List<T> selectModel(T t) {
        return getMapper().select(t);
    }

    /**
     * @author Seven Lee
     * @description
     *      根据实体中的属性值进行查询带分页
     * @param [t, pageNum, pageSize]
     * @date 2019/9/7
     * @return java.util.List<T>
     * @throws 
    **/
    public List<T> selectModel(T t, Integer pageNum, Integer pageSize) {
        return getMapper().selectByRowBounds(t, new RowBounds(pageNum, pageSize));
    }

    /**
     * @author Seven Lee
     * @description
     *      查询条数
     * @param [t]
     * @date 2019/9/7
     * @return int
     * @throws 
    **/
    public int selectCount(T t) {
        return getMapper().selectCount(t);
    }

    /**
     * @author Seven Lee
     * @description
     *      根据实体中的属性值进行分页查询，返回PageInfo对象
     * @param [entity, pageNum, pageSize]
     * @date 2019/9/7
     * @return com.github.pagehelper.PageInfo<T>
     * @throws
    **/
    public PageInfo<T> selectPageInfo(PageInfos<T> pageInfos) {
        if (pageInfos.getPageNum() == null) {
            pageInfos.setPageNum(0);
        }
        if (pageInfos.getPageSize() == null) {
            pageInfos.setPageSize(5);
        }
        PageHelper.startPage(pageInfos.getPageNum(), pageInfos.getPageSize());
        List<T> list = this.selectModel(pageInfos.getData());
        PageInfo<T> tPageInfo = new PageInfo<T>(list);
        tPageInfo.setTotal(selectCount(pageInfos.getData()));
        return tPageInfo;
    }


}
