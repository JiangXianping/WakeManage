package com.jiang.service.impl;



import com.jiang.mapper.UserMapper;
import com.jiang.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.service.UserService;

import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User findByName(String username) {
		return userMapper.selectByPrimaryKey(username);
	}

    @Override
    public Set<String> getRoles(String name) {
        return userMapper.getRole(name);
    }

    @Override
    public Set<String> getPermissions(String name) {
        return userMapper.getPermissions(name);
    }


}
