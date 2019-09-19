package com.aaa.lee.rent.service;

import com.aaa.lee.rent.base.BaseService;
import com.aaa.lee.rent.base.ResultData;
import com.aaa.lee.rent.mapper.PermissionMapper;
import com.aaa.lee.rent.mapper.UserMapper;
import com.aaa.lee.rent.model.Permission;
import com.aaa.lee.rent.model.User;
import com.aaa.lee.rent.status.LoginStatus;
import com.aaa.lee.rent.utils.StringUtil;
import com.aaa.lee.rent.vo.TreeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/6 16:27
 * @Description
 **/
@Service
public class LoginService extends BaseService<User> {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public Mapper<User> getMapper() {
        return userMapper;
    }

    /**
     * @author Seven Lee
     * @description
     *      根据用户名查询用户信息
     * @param [username]
     * @date 2019/9/6
     * @return com.aaa.lee.rent.base.ResultData<com.aaa.lee.rent.model.User>
     * @throws 
    **/
    public ResultData<User> selectUserByUsername(String username) {
        ResultData resultData = new ResultData();
        User user = userMapper.selectUserByUsername(username);
        if(null != user && !StringUtil.isEmpty(user.getId())) {
            // 说明数据库中有数据
            resultData.setCode(LoginStatus.USER_EXIST.getCode());
            resultData.setMsg(LoginStatus.USER_EXIST.getMsg());
            resultData.setData(user);
        } else {
            resultData.setCode(LoginStatus.USER_NOT_EXIST.getCode());
            resultData.setMsg(LoginStatus.USER_NOT_EXIST.getMsg());
        }
        return resultData;
    }

    /**
     * @author Seven Lee
     * @description
     *      根据用户名查询菜单信息
     * @param [username]
     * @date 2019/9/19
     * @return com.aaa.lee.rent.base.ResultData
     * @throws
    **/
    public ResultData selectMenuByUsername(String username) {
        ResultData resultData = new ResultData();
        // 必须要是一个父节点
        // 也就是说每一个用户所对应的角色和角色所对应的权限必须要是父节点
        List<TreeVo> treeVoList1 = userMapper.selectMenuByUsername(username);
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<TreeVo> treeVoList = new ArrayList<TreeVo>();
        if(treeVoList1.size() > 0) {
            // 查看是否为叶子结点，如果不是叶子节点，需要进行递归
            Map<String, Object> treeMap = new HashMap<String, Object>();
            for(TreeVo treeVo : treeVoList1) {
                // 查询子节点
                treeVoList.add(treeVo);
                dataMap.put("list", treeVoList);
                List<TreeVo> permissions = selectPermissionLeaf(treeVoList);
                if(permissions.size() > 0) {
                    treeMap.put("list", permissions);
                } else {
                    resultData.setCode(LoginStatus.USER_HAS_NO_MENU.getCode());
                    resultData.setMsg(LoginStatus.USER_HAS_NO_MENU.getMsg());
                }
            }
            resultData.setCode(LoginStatus.USER_HAS_MENU.getCode());
            resultData.setMsg(LoginStatus.USER_HAS_MENU.getMsg());
            resultData.setData(treeMap);
        } else {
            resultData.setCode(LoginStatus.USER_HAS_NO_MENU.getCode());
            resultData.setMsg(LoginStatus.USER_HAS_NO_MENU.getMsg());
        }
        return resultData;
    }

    /**
     * @author Seven Lee
     * @description
     *      递归查询菜单
     * @param [pid]
     * @date 2019/9/19
     * @return java.lang.String
     * @throws 
    **/
    private List<TreeVo> selectPermissionLeaf(List<TreeVo> treeVoList) {
        for (TreeVo treeVo: treeVoList) {
            List<Permission> permissions = permissionMapper.selectPermissionLeafByPid(String.valueOf(treeVo.getId()));
            List<TreeVo> treeVoList1 = new ArrayList<TreeVo>();
            if(permissions.size() > 0) {
                // 假设有两条数据
                // 说明是父节点
                for(Permission pm : permissions) {
                    // 如果第一条数据为叶子结点()
                    if("1".equals(pm.getIsLeaf())) {
                        // 叶子节点
                        // 存入数据
                        TreeVo treeVo1 = new TreeVo();
                        treeVo1.setTitle(pm.getPermissionChineseName());
                        treeVo1.setId(Integer.parseInt(pm.getId()));
                        treeVo1.setIcon(pm.getMenuIcon());
                        treeVo1.setHref(pm.getMenuUrl());
                        if(!treeVoList1.contains(treeVo1)) {
                            treeVoList1.add(treeVo1);
                        }
                        treeVo.setList(treeVoList1);
                    } else {
                        // 第二条数据不为叶子节点
                        selectPermissionLeaf(treeVoList);
                    }
                }
            } else {
                // 说明是叶子节点
                return null;
            }
        }
        return treeVoList;
    }
}
