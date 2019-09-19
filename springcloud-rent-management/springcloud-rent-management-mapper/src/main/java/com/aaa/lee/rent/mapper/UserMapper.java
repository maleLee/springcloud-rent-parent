package com.aaa.lee.rent.mapper;

import com.aaa.lee.rent.model.Permission;
import com.aaa.lee.rent.model.User;
import com.aaa.lee.rent.vo.TreeVo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

public interface UserMapper extends Mapper<User> {

    User selectUserByUsername(String username);

    List<TreeVo> selectMenuByUsername(String username);

}