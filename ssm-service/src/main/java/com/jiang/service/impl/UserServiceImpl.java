package com.jiang.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.mapper.UserMapper;
import com.jiang.model.User;
import com.jiang.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User findByName(String username) {
		
		return userMapper.selectByPrimaryKey(username);
	}


}
