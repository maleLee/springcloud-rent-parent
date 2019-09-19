package com.aaa.lee.rent.mapper;

import com.aaa.lee.rent.model.Permission;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface PermissionMapper extends Mapper<Permission> {

    List<Permission> selectPermissionLeafByPid(String pid);

}