package com.jiang.mapper;

import com.jiang.model.User;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Set;

public interface UserMapper extends Mapper<User> {


    //获取用户权限
    Set<String> getPermissions(String username);

    //获取用户角色
    Set<String> getRole(String username);
}