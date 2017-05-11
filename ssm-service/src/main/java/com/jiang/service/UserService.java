package com.jiang.service;

import java.util.List;

import com.jiang.model.Book;
import com.jiang.model.User;

public interface UserService {
	
	//根据用户名查找用户是否存在
	public User findByName(String username);
	
	
}
