package com.jiang.service;

import com.jiang.model.User;

import java.util.List;
import java.util.Set;

public interface UserService {
	
	//根据用户名查找用户是否存在
	public User findByName(String username);

    //获取用户角色
    Set<String> getRoles(String name);

    //获取用户权限
    Set<String> getPermissions(String name);

}
